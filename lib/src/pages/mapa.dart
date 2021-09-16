import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class vistaMapa extends StatefulWidget {
  const vistaMapa({ Key? key }) : super(key: key);

  @override
  _vistaMapaState createState() => _vistaMapaState();
}

class _vistaMapaState extends State<vistaMapa> {
  Set<Marker> _marcadores = {};
  LatLng cordenada = LatLng(0,0);
@override
void initState() { 
  super.initState();
  
}

  
  //CollectionReference markers = FirebaseFirestore.instance.collection('coordenadas');
  void _onMapCreated(GoogleMapController mapController){
    setState(() {

      
      FirebaseFirestore.instance
      .collection('coordenadas')
      .get()
      .then((QuerySnapshot querySnapshot) {
          querySnapshot.docs.forEach((doc) {
              _marcadores.add(
                Marker(
                  markerId: MarkerId(doc["usuario"]),
                  position: LatLng(doc["latitud"], doc["longitud"]),
                  infoWindow: InfoWindow(title: doc["usuario"])
                )
              );
              print(doc["usuario"]);
          });
      });

      // _marcadores.add(
      //   Marker(
      //     markerId: MarkerId('value'),
      //     position: LatLng(-18.005915455912902, -70.24159264841127),
      //     infoWindow: InfoWindow(title: "1er Marcador",snippet: "de tal")
          
      //     )
      // );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Marcar Ubicacion")),
      body: GoogleMap(initialCameraPosition: CameraPosition(
                target: LatLng(-18.005187418010443, -70.24179678939687),
                zoom: 16.0,
              ),
              onMapCreated: _onMapCreated,
              markers: _marcadores,
              onLongPress: _handleTap,
            ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 50.0,bottom: 20.0),
        child: FloatingActionButton( 
          
          onPressed: (){
            FirebaseFirestore.instance.collection("coordenadas").add(
        {
          "usuario": "prueba3",
          "latitud": cordenada.latitude,
          "longitud": cordenada.longitude
        }
      );


          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  

  void _handleTap(LatLng punto) {
    setState(() {   
        _marcadores.remove(_marcadores.last);
        _marcadores.add(Marker(
        markerId: MarkerId(punto.toString()),
        position: punto,
        infoWindow: InfoWindow(
          title: 'mi marcador'
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue)
        ));

      cordenada = punto;
      print(punto.toString());
      
      
      
    });
  }
}
