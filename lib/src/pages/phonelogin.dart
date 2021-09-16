import 'package:flutter/material.dart';
import 'package:examen_flutter/src/pages/mapa.dart';
import 'package:examen_flutter/src/providers/usuarioInfo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

class loginPhone extends StatefulWidget {
  loginPhone({Key? key}) : super(key: key);

  @override
  _loginPhoneState createState() => _loginPhoneState();
}

class _loginPhoneState extends State<loginPhone> {
  String verId="";
  String phone="";
  bool codeSent = false;
  String _usuario = "";
  FirebaseAuth auth = FirebaseAuth.instance;  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(children: <Widget>[
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
                  hintText: "Ingresa tu numero",
                  icon: Icon(Icons.phone_android_rounded)),
              //maxLength: 100,
              onChanged: (value) {
                setState(() {
                  _usuario = value;
                });
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
                    Navigator.push(context,
                          MaterialPageRoute(builder: (context) => vistaMapa()));
                    // await auth.verifyPhoneNumber(
                    //   phoneNumber: '+44 7123 123 456',
                    //   codeSent: (String verificationId, int? resendToken) async {
                    //     // Update the UI - wait for the user to enter the SMS code
                    //     String smsCode = '123456';

                    //     // Create a PhoneAuthCredential with the code
                    //     AuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode);

                    //     // Sign the user in (or link) with the credential
                    //     await auth.signInWithCredential(credential);
                    //   },
                    // );
                    // await FirebaseAuth.instance.verifyPhoneNumber(
                    //   phoneNumber: '+51 957 697 414',
                    //   verificationCompleted: (PhoneAuthCredential credential) {},
                    //   verificationFailed: (FirebaseAuthException e) {},
                    //   codeSent: (String verificationId, int? resendToken) {},
                    //   codeAutoRetrievalTimeout: (String verificationId) {},
                    //   );
                    // final user = await auth.signInWithPhoneNumber("+51 957 697 414", RecaptchaVerifier());
                    // if (user != null) {
                    //   Navigator.push(context,
                    //       MaterialPageRoute(builder: (context) => vistaMapa()));
                    // }

                    // verificarTelefono();

                  } catch (e) {
                    print(e.toString());
                  }
                },
                child: const Text("Iniciar Sesion"),
              )),
          const SizedBox(height: 4),

        ],),
      ),
    );
  }

  Future<void> verificarTelefono() async{

    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phone, 
      verificationCompleted: (PhoneAuthCredential credential) async{
        await FirebaseAuth.instance.signInWithCredential(credential);
        final snackbar = SnackBar(content: Text("Login Success"));
        ScaffoldMessenger.of(context).showSnackBar(snackbar);
      }, 
      verificationFailed: (FirebaseAuthException e){
        final snackbar = SnackBar(content: Text("${e.message}"));
        ScaffoldMessenger.of(context).showSnackBar(snackbar);
      }, 
      codeSent: (String verificationId, int resendToken){
        setState(() {
          codeSent = true;
          verId = verificationId;
        });
      }, 
      codeAutoRetrievalTimeout: (String verificationId){
        setState(() {
          verId = verificationId;
        });
      }, timeout: Duration(seconds: 60));


  }



}

