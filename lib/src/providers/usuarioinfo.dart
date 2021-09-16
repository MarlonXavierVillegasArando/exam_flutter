import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


class UsuarioInfo with ChangeNotifier{ 
  
  String _usuname = "ahora si funciona";

  String get usuname => _usuname;

  void increment(String usuario) {
    _usuname=usuario;
    notifyListeners();
  }
  
}