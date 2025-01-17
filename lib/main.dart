import 'package:evaluacion2/screens/deposit_screen.dart';
import 'package:evaluacion2/screens/login_screen.dart';
import 'package:evaluacion2/screens/register_screen.dart';
import 'package:evaluacion2/screens/transfer_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart'; // Tu pantalla de bienvenida
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();  // Inicialización de Firebase
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mi Banco',
      home: WelcomeScreen(),  // Pantalla inicial
      routes: {
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/transfer': (context) => TransferScreen(),
        '/deposit': (context) => DepositScreen(),
      },
    );
  }
}
