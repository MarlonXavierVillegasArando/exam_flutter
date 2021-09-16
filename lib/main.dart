import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:examen_flutter/src/pages/login.dart';
import 'package:examen_flutter/src/pages/mapa.dart';
import 'package:examen_flutter/src/providers/usuarioinfo.dart';

Future firebaseinicicaion() async{
  FirebaseApp initialization = await Firebase.initializeApp();
  return initialization;
}


Future firebaseUsuario() async{
  final usuario = await FirebaseAuth.instance.currentUser.email;
  return usuario;
}

void main()
{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(PuntosMapa());
}


class PuntosMapa extends StatelessWidget {
  const PuntosMapa({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Puntos Mapa',
      home: FutureBuilder(future: firebaseinicicaion(),
      builder: (context, snapshot)
      {
        if (snapshot.connectionState == ConnectionState.done) {
          return loginPage();
        } else {
          return CircularProgressIndicator();
        }
      },),
    );
  }
}
