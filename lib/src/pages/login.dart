// ignore_for_file: prefer_const_constructors, unnecessary_null_comparison

import 'package:examen_flutter/src/pages/mapa.dart';
import 'package:examen_flutter/src/pages/phonelogin.dart';
import 'package:examen_flutter/src/providers/usuarioInfo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class loginPage extends StatefulWidget {
  loginPage({Key? key}) : super(key: key);

  @override
  _loginPageState createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  String _usuario = "", _clave = "";

  bool telef = false;

  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: ListView(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const SizedBox(height: 36),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Bienvenido", textAlign: TextAlign.center),
          ),
          const SizedBox(height: 36),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: const Image(
              image: NetworkImage(
                  'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
              height: 150,
            ),
          ),
          const SizedBox(height: 36),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                  hintText: "Ingresa tu correo",
                  icon: Icon(Icons.account_circle)),
              //maxLength: 100,
              onChanged: (value) {
                setState(() {
                  _usuario = value;
                });
              },
            ),
          ),
          const SizedBox(height: 36),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: TextField(
              obscureText: true,
              // keyboardType: TextInputType.,
              decoration: const InputDecoration(
                  hintText: "Ingresa tu Contraseña", icon: Icon(Icons.lock)),
              //maxLength: 100,
              onChanged: (value) {
                _clave = value;
              },
            ),
          ),
          const SizedBox(height: 20),
          Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 32.0),
              child: ElevatedButton(
                onPressed: () async {
                  try {
                    final user = await auth.signInWithEmailAndPassword(
                        email: _usuario, password: _clave);
                    if (user != null) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => vistaMapa()));
                    }
                  } catch (e) {
                    print(e.toString());
                  }
                },
                child: const Text("Iniciar Sesion"),
              )),
          const SizedBox(height: 4),
          Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 32.0),
              child: ElevatedButton.icon(
                style: ButtonStyle(),
                icon: Icon(
                  Icons.android,
                  color: Colors.white,
                  size: 24.0,
                ),
                label: Text('Ingresar por Google'),
                onPressed: () {
                  print('Pressed');
                }
              )
              ),
          const SizedBox(height: 4),
          Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 32.0),
              child: ElevatedButton.icon(
                style: ButtonStyle(),
                icon: Icon(
                  Icons.phone,
                  color: Colors.white,
                  size: 24.0,
                ),
                label: Text('Ingresar por Telefono'),
                onPressed: () {
                  Navigator.push(context,
                          MaterialPageRoute(builder: (context) => loginPhone()));
                }
              )
              ),
              
        ],
      ),
    ));
  }
}
