import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:math';

class ShowSimpleMap extends StatefulWidget {
  ShowSimpleMap({Key key}) : super(key: key);

  @override
  _ShowSimpleMapState createState() => _ShowSimpleMapState();
}

class _ShowSimpleMapState extends State<ShowSimpleMap> {
  
  GoogleMapController mapController;
  final LatLng _center = const LatLng(-20.3484, 57.5522);
  static LatLng marker1Pos = const LatLng(-20.16871565333981, 57.50199063213433);
  static LatLng marker2Pos = const LatLng(-20.09654765243014, 57.55931355425341);
  static LatLng marker3Pos = const LatLng(-20.191598849643885, 57.71914988123909);
  static LatLng marker4Pos = const LatLng(-20.278113445125072, 57.47645122356892);
  static LatLng marker5Pos = const LatLng(-20.40435911762334, 57.593035696588046);
  static LatLng circle1Pos = const LatLng(-20.24317986531728, 57.4882877542566);
  
  Set<Circle> _circles = Set.from([Circle(
    circleId: CircleId("0"),
    center: circle1Pos ,
    radius: 5000,
    fillColor: Colors.redAccent.withOpacity(0.5),
    strokeWidth: 1,
    strokeColor: Colors.red
  )]);

  Map<MarkerId, Marker> dynmarkers = <MarkerId, Marker>{};  

  final String _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random _rnd = Random();

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
    length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

  void _onMapCreated(GoogleMapController controller){
    mapController = controller;
  }
  
  @override
  Widget build(BuildContext context) {

    final MarkerId marker1Id = MarkerId("Dr AG Jeetoo Hospital (Civil)");
    Marker jeetoomarker = Marker(
      markerId: marker1Id,
      position: marker1Pos,
      infoWindow: InfoWindow(title:"Dr AG Jeetoo Hospital (Civil)",snippet: "COVID-19 Testing centre" ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed)
    );    
    dynmarkers[marker1Id] = jeetoomarker;

    final MarkerId marker2Id = MarkerId("SSR Hospital");
    Marker ssrmarker = Marker(
      markerId: marker2Id,
      position: marker2Pos,
      infoWindow: InfoWindow(title:"Sir Seewoosagur Ramgoolam National Hospital",snippet: "COVID-19 Testing centre" ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed)
    );
    dynmarkers[marker2Id] = ssrmarker;

    final MarkerId marker3Id = MarkerId("Flacq Hospital");
    Marker flacqmarker = Marker(
      markerId: marker3Id,
      position: marker3Pos,
      infoWindow: InfoWindow(title:"Flacq Hospital",snippet: "COVID-19 Testing centre" ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed)
    );
    dynmarkers[marker3Id] = flacqmarker;

    final MarkerId marker4Id = MarkerId("Victoria Hospital");
    Marker victoriamarker = Marker(
      markerId: marker4Id,
      position: marker4Pos,
      infoWindow: InfoWindow(title:"Victoria Hospital",snippet: "COVID-19 Testing centre" ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed)
    );
    dynmarkers[marker4Id] = victoriamarker;

    final MarkerId marker5Id = MarkerId("Jawaharlal Nehru Hospital");
    Marker jnmarker = Marker(
      markerId: marker5Id,
      position: marker5Pos,
      infoWindow: InfoWindow(title:"Jawaharlal Nehru Hospital",snippet: "COVID-19 Testing centre" ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed)
    );
    dynmarkers[marker5Id] = jnmarker;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        centerTitle: true,
        title: Text("Maps")
      ),

      body: GoogleMap(
        markers: Set<Marker>.of(dynmarkers.values),//{ jeetoomarker , ssrnmarker , flacqmarker , victoriamarker , jnmarker },
        mapType: MapType.hybrid,
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(target: _center,zoom: 10.0),
        circles: _circles,
        compassEnabled: true,
        tiltGesturesEnabled: true,
        onLongPress: (latlang){
          setState(() 
          {
            final MarkerId markerId = MarkerId("temporary_marker_" + getRandomString(10));
            Marker marker = Marker(
              markerId: markerId,
              draggable: true,
              position: latlang, //With this parameter you automatically obtain latitude and longitude
              infoWindow: InfoWindow(
                  title: "Added marker",
                  snippet: 'Someone who tested positive was previously here.',   
              ),
              icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
            );          
            dynmarkers[markerId] = marker;
          });          
        },        
      ), 

      floatingActionButton: FloatingActionButton.extended(
          onPressed: _goToDiagnosis,
          label: Text("Diagnosis"),
          icon: Icon(Icons.coronavirus_rounded),
          backgroundColor: Colors.green.withOpacity(0.7) ,
          
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      
    );
  }

  Future<void> _goToDiagnosis() async{}  

}
