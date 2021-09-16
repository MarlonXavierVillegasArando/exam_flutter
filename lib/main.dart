// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _texto = "";
  String _usuario="", _clave="";
  

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
                child: const Text(
                  "Bienvenido",
                  textAlign: TextAlign.center
                  ),
              ),
              const SizedBox(height: 36),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: const Image(
                  image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                  height: 150,
                  ),
              ),
              
              const SizedBox(height: 36),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: new TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(

                    hintText: "Ingresa tu correo",
                    icon: Icon(Icons.account_circle)),
                  //maxLength: 100,
                  onChanged: (value) {
                    setState(() {
                      _texto = value;
                      
                    });
                  },
                ),
              ),

              const SizedBox(height: 36),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: new TextField(
                  obscureText: true,
                  // keyboardType: TextInputType.,
                  decoration: const InputDecoration(
                    hintText: "Ingresa tu Contraseña",
                  icon: Icon(Icons.lock)),
                  //maxLength: 100,
                  onChanged: (value) {
                  },
                ),
              ),
              const SizedBox(height: 24),

              const Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  value: true, 
                  onChanged: null,
                  title: Text("Recordar este usuario?"),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 32.0),
                  child: new ElevatedButton(
                    
                    onPressed: () {
                      
                    },
                    child: const Text("Iniciar Sesion"),
                  )),
              const SizedBox(height: 20),
            ],
          ),
        ));
  }
}
