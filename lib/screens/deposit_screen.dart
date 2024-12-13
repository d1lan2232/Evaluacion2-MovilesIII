import 'dart:convert'; // Para parsear JSON
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // Para hacer peticiones HTTP

class DepositScreen extends StatefulWidget {
  @override
  _DepositScreenState createState() => _DepositScreenState();
}

class _DepositScreenState extends State<DepositScreen> {
  int _selectedIndex = 0;
  List<dynamic> deposits = []; // Lista para almacenar los depósitos

  // Función para obtener los datos desde la URL del JSON
  Future<void> fetchDeposits() async {
    final response = await http.get(Uri.parse('https://jritsqmet.github.io/web-api/depositos.json'));

    if (response.statusCode == 200) {
      // Si la respuesta es exitosa, parseamos el JSON
      setState(() {
        deposits = json.decode(response.body); // Convertimos la respuesta en un List de Map
      });
    } else {
      // Si no se pudo obtener la data
      throw Exception('Error al cargar los datos');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchDeposits(); // Obtener los depósitos cuando la pantalla se cargue
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Depósitos"),
        backgroundColor: Colors.green,
      ),
      body: _pages[_selectedIndex], // Muestra el contenido de la pantalla correspondiente
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Primer botón para hacer un Depósito
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _selectedIndex = 0; // Cambiar a la pantalla de "Nuevo Depósito"
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: _selectedIndex == 0 ? Colors.green : Colors.grey[200], // Cambiar color si está seleccionado
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                shadowColor: Colors.greenAccent,
                elevation: _selectedIndex == 0 ? 8 : 3, // Mayor elevación cuando está seleccionado
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.account_balance_wallet, size: 30, color: _selectedIndex == 0 ? Colors.white : Colors.black), // Icono para "Nuevo Depósito"
                  Text(
                    'Nuevo Depósito',
                    style: TextStyle(
                      color: _selectedIndex == 0 ? Colors.white : Colors.black,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            // Segundo botón para consultar Depósitos
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _selectedIndex = 1; // Cambiar a la pantalla de "Historial de Depósitos"
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: _selectedIndex == 1 ? Colors.green : Colors.grey[200], // Cambiar color si está seleccionado
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                shadowColor: Colors.greenAccent,
                elevation: _selectedIndex == 1 ? 8 : 3, // Mayor elevación cuando está seleccionado
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.history, size: 30, color: _selectedIndex == 1 ? Colors.white : Colors.black), // Icono para "Historial de Depósitos"
                  Text(
                    'Historial',
                    style: TextStyle(
                      color: _selectedIndex == 1 ? Colors.white : Colors.black,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Página de Depósitos
  Widget buildDepositHistoryPage() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.builder(
        itemCount: deposits.length, // El número de elementos en la lista
        itemBuilder: (context, index) {
          final deposit = deposits[index]; // Obtenemos un depósito del JSON

          // Extraemos los valores requeridos
          final monto = deposit['monto'];
          final banco = deposit['banco'];
          final imagen = deposit['detalles']['imagen_comprobante'];

          return Card(
            margin: EdgeInsets.symmetric(vertical: 10),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Image.network(
                    imagen, // Imagen del comprobante
                    width: 50,
                    height: 50,
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        banco, // Banco
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Monto: \$${monto.toStringAsFixed(2)}', // Monto
                        style: TextStyle(fontSize: 14, color: Colors.green),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  // Páginas a mostrar según el índice
  List<Widget> _pages = [
    Center(child: Text('Realiza un nuevo depósito')),
  ];
}

