import 'package:flutter/material.dart';
// import '../services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'home.dart';
import 'register.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();

  // @override
  // _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _auth = FirebaseAuth.instance;
  // final AuthService _auth = AuthService();

  String email = '';
  String password = '';
  final _formKey = GlobalKey<FormState>();
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      appBar: AppBar(
        title: const Text('Login COVID-19 Tracker'),
        actions: <Widget>[
          // FlatButton.icon(
          TextButton.icon(
              onPressed: () {
                // print('Register');
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Register()));
              },
              icon: const Icon(Icons.person),
              label:const  Text('Register'))
        ],
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
              // const SizedBox(height: 20,),
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
                    val!.length < 8 ? 'Enter a valid password 8+ Chars' : null,
                obscureText: true,
              ),
              // const SizedBox(height: 40,),
              // RaisedButton(
              ElevatedButton(
                child: const Text(
                  'Sign In',
                  style: TextStyle(color: Colors.white),
                ),
                // color: Colors.pink,
                onPressed: () async {
                  // if (_formKey.currentState!.validate()) {
                  //   print('Ok!!!!!!');
                  //   print(email);
                  //   print(password);
                  //   // dynamic result = await
                  //   _auth.signInAnom();
                  //   dynamic result =
                  //       await _auth.signInWithEmailAndPassword(email, password);
                  //   if (result == null) {
                  //     print('error SignIn!!!');
                  //     setState(() {
                  //       error = 'Error SignIn!!!';
                  //     });
                  //   } else {
                  //     print('Sign In Ok !');
                  //     print(result.uid);
                  //     Navigator.push(context,
                  //         MaterialPageRoute(builder: (context) => Home()));
                  //   }
                  // }

                  try {
                    await _auth.signInWithEmailAndPassword(
                        email: email, password: password);
                    await Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const Home()),
                    );
                  } on FirebaseAuthException catch (e) {
                    showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        title: const Text(' Ops! Login Failed'),
                        content: Text('${e.message}'),
                      ),
                    );
                  }
                },
              ),
              // const SizedBox(height: 12.0),
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
