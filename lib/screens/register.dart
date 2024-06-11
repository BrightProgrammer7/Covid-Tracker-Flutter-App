import 'package:flutter/material.dart';
// import '../services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();

  // @override
  // _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String email = '';
  String password = '';
  final _formKey = GlobalKey<FormState>();

  final _auth = FirebaseAuth.instance;
  // final AuthService _auth = AuthService();

  String error = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[50],
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text('Register COVID-19 Tracker'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Image.asset('../../assets/images/covid.png'),
              const SizedBox(
                height: 50.0,
              ),
              TextFormField(
                decoration: const InputDecoration(
                    hintText: 'email',
                    prefixIcon: Icon(Icons.person),
                    fillColor: Colors.white,
                    filled: true),
                onChanged: (val) {
                  setState(() {
                    email = val;
                  });
                },
                validator: (val) => val!.isEmpty ? 'Enter a valid email' : null,
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: const InputDecoration(
                    hintText: 'password',
                    prefixIcon: Icon(Icons.lock),
                    fillColor: Colors.white,
                    filled: true),
                onChanged: (val) {
                  setState(() {
                    password = val;
                  });
                },
                validator: (val) =>
                    val!.length < 6 ? 'Enter a valid password 6+ Chars' : null,
                obscureText: true,
              ),
              const SizedBox(
                height: 40,
              ),
              // RaisedButton(
              ElevatedButton(
                child: const Text(
                  'Sign Up',
                  style: TextStyle(color: Colors.white),
                ),
                // color: Colors.amber,
                onPressed: () async {
                  // if (_formKey.currentState!.validate()) {
                  //   print('Ok!!!!!!');
                  //   print(email);
                  //   print(password);
                  //   dynamic result = await _auth.registerWithEmailAndPassword(
                  //       email, password);
                  //   if (result == null) {
                  //     setState(() {
                  //       error = 'Please enter a valid email';
                  //     });
                  //   } else {
                  //     Navigator.pop(context);
                  //   }
                  // }
                  try {
                    await _auth.createUserWithEmailAndPassword(
                        email: email, password: password);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: Colors.blueGrey,
                        content: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Sucessfully Register. You Can Login Now!'),
                        ),
                        duration: Duration(seconds: 5),
                      ),
                    );
                  } on FirebaseAuthException catch (e) {
                    showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        title: const Text(' Ops! Registration Failed'),
                        content: Text('${e.message}'),
                      ),
                    );
                  }
                },
              ),
              const SizedBox(height: 12.0),
              Text(
                error,
                style: const TextStyle(color: Colors.red, fontSize: 14.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}
