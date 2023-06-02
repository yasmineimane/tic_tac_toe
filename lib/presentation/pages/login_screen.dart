import 'package:flutter/material.dart';
import 'package:tic_tac_to/presentation/pages/home_page.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
final TextEditingController playerXcontroler = TextEditingController();
final TextEditingController playerOcontroler = TextEditingController();

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[200],
      body: Form(
        key: _formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Enter Players Name',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                controller: playerXcontroler,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  labelStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                  labelText: 'Player X Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "please enter player 1 name";
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                controller: playerOcontroler,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  labelStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                  labelText: 'Player O Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "please enter player 2 name";
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            MaterialButton(
              onPressed: () {
                if (_formkey.currentState!.validate()) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(
                          player1: playerXcontroler.text,
                          player2: playerOcontroler.text),
                    ),
                  );
                }
              },
              color: Colors.purple[300],
              textColor: Colors.white,
              child: const Text('START Game'),
            ),
          ],
        ),
      ),
    );
  }
}
