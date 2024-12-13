import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'deposit_screen.dart'; // Importa la pantalla DepositScreen

class TransferScreen extends StatefulWidget {
  @override
  _TransferScreenState createState() => _TransferScreenState();
}

class _TransferScreenState extends State<TransferScreen> {
  final _recipientController = TextEditingController();
  final _amountController = TextEditingController();
  final _transferIdController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  // Función para realizar la transferencia y guardar en Realtime Database
  Future<void> _makeTransfer() async {
    if (_formKey.currentState!.validate()) {
      final transferId = _transferIdController.text;
      final recipient = _recipientController.text;
      final amount = _amountController.text;

      // Verifica si los valores son correctos
      print("Transferencia ID: $transferId");
      print("Destinatario: $recipient");
      print("Monto: $amount");

      try {
        // Usar una referencia general para crear el nodo de la transferencia
        DatabaseReference ref = FirebaseDatabase.instance.ref("transfers/$transferId");

        // Guardar los datos de la transferencia en el nodo "transfers/{transferId}"
        await ref.set({
          'recipient': recipient,
          'amount': amount,
          'timestamp': ServerValue.timestamp,
        });

        print("Transferencia guardada exitosamente");

        // Mostrar un mensaje de éxito
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Transferencia realizada')));
      } catch (e) {
        print("Error al guardar la transferencia: $e");

        // Mostrar un mensaje de error
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error al realizar la transferencia')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Transferencias')),
      body: Center( // Usar Center para centrar todo el contenido
        child: SingleChildScrollView( // Permite que la pantalla se desplace si el teclado aparece
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center, // Centra el contenido dentro de Column
                crossAxisAlignment: CrossAxisAlignment.center, // Alinea los widgets al centro
                children: <Widget>[
                  TextFormField(
                    controller: _transferIdController,
                    decoration: InputDecoration(labelText: 'ID de Transferencia'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese un ID';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10), // Espacio entre los campos de texto
                  TextFormField(
                    controller: _recipientController,
                    decoration: InputDecoration(labelText: 'Destinatario'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese el nombre del destinatario';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: _amountController,
                    decoration: InputDecoration(labelText: 'Monto'),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese el monto';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _makeTransfer,
                    child: Text('Realizar Transferencia'),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Navegar a la pantalla DepositScreen
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DepositScreen()),
                      );
                    },
                    child: Text('DEPOSITOS'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
