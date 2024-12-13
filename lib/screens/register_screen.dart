import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false; // Estado para el cargando

  // Función para registrar un nuevo usuario
  Future<void> _register() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true; // Activar el indicador de carga
      });

      try {
        // Validar si las contraseñas coinciden
        if (_passwordController.text != _confirmPasswordController.text) {
          _showErrorAlert('Las contraseñas no coinciden');
          return;
        }

        // Intentar crear un nuevo usuario con email y contraseña
        final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );

        // Si la creación de cuenta es exitosa, redirigir a la pantalla de inicio de sesión o pantalla principal
        Navigator.pushReplacementNamed(context, '/login');
      } on FirebaseAuthException catch (e) {
        // Manejar los errores de Firebase
        if (e.code == 'weak-password') {
          _showErrorAlert('La contraseña proporcionada es demasiado débil.');
        } else if (e.code == 'email-already-in-use') {
          _showErrorAlert('Ya existe una cuenta con ese correo electrónico.');
        } else {
          _showErrorAlert('Error desconocido: ${e.message}');
        }
      } catch (e) {
        // Capturar errores generales
        _showErrorAlert('Ocurrió un error inesperado.');
      } finally {
        setState(() {
          _isLoading = false; // Desactivar el indicador de carga
        });
      }
    }
  }

  // Mostrar un AlertDialog en caso de error
  void _showErrorAlert(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Error de registro'),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: Text('Aceptar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registrarse'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Título
                Text(
                  'Registrarse',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 40),

                // Campo de correo electrónico
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Correo Electrónico',
                    labelStyle: TextStyle(color: Colors.black),
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 18, horizontal: 20),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese un correo';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),

                // Campo de contraseña
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Contraseña',
                    labelStyle: TextStyle(color: Colors.black),
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 18, horizontal: 20),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese una contraseña';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),

                // Campo de confirmación de contraseña
                TextFormField(
                  controller: _confirmPasswordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Confirmar Contraseña',
                    labelStyle: TextStyle(color: Colors.black),
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 18, horizontal: 20),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor confirme su contraseña';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 30),

                // Botón de registro
                _isLoading
                    ? CircularProgressIndicator() // Muestra un círculo de carga mientras se procesa
                    : ElevatedButton(
                        onPressed: _register,
                        child: Text(
                          'Registrarse',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          iconColor: Colors.blue,
                          minimumSize: Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30), // Bordes redondeados
                          ),
                          elevation: 5, // Sombra para el botón
                          backgroundColor: Colors.blue,
                        ),
                      ),
                SizedBox(height: 20),

                // Opción de iniciar sesión
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '¿Ya tienes cuenta? ',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    TextButton(
                      onPressed: () {
                        // Redirigir a la pantalla de inicio de sesión
                        Navigator.pushReplacementNamed(context, '/login');
                      },
                      child: Text(
                        'Iniciar sesión',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
