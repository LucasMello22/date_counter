import 'package:date_counter/page/HomePage.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFB9CCF2),
      body: Stack(
        children: [
          Positioned(
            left: -60,
            top: 650,
            child: CustomPaint(
              size: Size(300, 300),
              painter: EllipsePainter(color: Color.fromRGBO(10, 72, 233, 0.42)),
            ),
          ),
          Positioned(
            left: 206.02,
            top: -116,
            child: CustomPaint(
              size: Size(300, 300),
              painter: EllipsePainter(color: Color.fromRGBO(10, 72, 233, 0.42)),
            ),
          ),
          LoginForm(),
        ],
      ),
    );
  }
}

class EllipsePainter extends CustomPainter {
  final Color color;

  EllipsePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()..color = color;

    final Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);
    canvas.drawOval(rect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _rememberMe = false;
  String _username = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            onChanged: (value) {
              setState(() {
                _username = value;
              });
            },
            style: const TextStyle(color: Colors.black, fontSize: 14.0, fontFamily: 'Mulish'),
            decoration: InputDecoration(
              labelText: 'Login',
              labelStyle: const TextStyle(color: Colors.black),
              fillColor: Colors.white,
              filled: true,
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(10.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          TextField(
            onChanged: (value) {
              setState(() {
                _password = value;
              });
            },
            style: const TextStyle(color: Colors.black),
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Senha',
              labelStyle: const TextStyle(color: Colors.black, fontSize: 14.0, fontFamily: 'Mulish'),
              fillColor: Colors.white,
              filled: true,
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(10.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(
                    value: _rememberMe,
                    onChanged: (value) {
                      setState(() {
                        _rememberMe = value!;
                      });
                    },
                  ),
                  const Text(
                    'Remember-me',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Esqueceu a senha?',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () {
              // Verificar as credenciais
              if (_username == 'admin' && _password == 'admin') {
                // Se as credenciais estiverem corretas, navegue para a HomePage
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              } else {
                // Senão, você pode exibir uma mensagem de erro
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Nome de usuário ou senha incorretos'),
                    duration: Duration(seconds: 3),
                  ),
                );
              }
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.black,
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              minimumSize: const Size(350.0, 50.0),
            ),
            child: const Text('Entrar'),
          ),
        ],
      ),
    );
  }
}

