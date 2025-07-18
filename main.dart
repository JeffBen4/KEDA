import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'KEDA.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KEDA',
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Future<GoogleSignInAccount?> _loginWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      return googleUser;
    } catch (e) {
      print('Error de login: $e');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF6A1B9A),
              Color(0xFFAB47BC),
              Color(0xFFE1BEE7),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo "KEDA"
            SizedBox(
              height: screenHeight * 0.4,
              child: const Center(
                child: Text(
                  'KEDA',
                  style: TextStyle(
                    fontFamily: 'Burbank',
                    fontSize: 100,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 4,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 60),
            // Botón de registrarse con Google
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  var googleUser = await _loginWithGoogle();
                  if (googleUser != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PaginaPrincipal()),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 19,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(Icons.account_circle, color: Colors.black87, size: 32),
                    SizedBox(width: 14),
                    Text(
                      'Registrarse',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 22,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


