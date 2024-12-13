import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "BANCO PICHINCHA",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28,
              color: Colors.white,
              letterSpacing: 2, // Espaciado entre letras
            ),
          ),
        ),
        backgroundColor: Colors.black,
        elevation: 10, // Añadido efecto de sombra en el AppBar
      ),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255), // Fondo amarillo para todo el Scaffold
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // Título de la aplicación
            Center(
              child: Text(
                'Bienvenido al Banco Pichincha',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  letterSpacing: 1.5, // Espaciado entre letras
                ),
              ),
            ),
            SizedBox(height: 50),

            // Botón "Iniciar sesión"
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                child: Text(
                  'Iniciar Sesión',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 60),
                  backgroundColor: Colors.blue, // Color de fondo del botón
                  textStyle: TextStyle(fontSize: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30), // Bordes redondeados
                  ),
                  elevation: 8, // Sombra para el botón
                ),
              ),
            ),
            SizedBox(height: 25),
            
            // Botón "Registrarse"
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/register');
                },
                child: Text(
                  'Registrarse',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 60),
                  backgroundColor: Colors.green, // Color de fondo del botón
                  textStyle: TextStyle(fontSize: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30), // Bordes redondeados
                  ),
                  elevation: 8, // Sombra para el botón
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
