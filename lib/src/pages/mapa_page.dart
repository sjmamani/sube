import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:sube/src/utils/constants.dart';
import 'dart:typed_data';
import 'package:sube/src/widgets/app_bar.dart';

class MapaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        FullScreenMap(),
        SubeAppBar(
          height: 100,
          showImage: false,
          title: 'Centros de Carga',
        ),
        Buscador(),
      ],
    );
  }
}

class Buscador extends StatelessWidget {
  const Buscador({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 130, right: 30, left: 30),
      height: 50,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(color: Colors.black12, blurRadius: 10, spreadRadius: 3)
          ]),
      child: TextField(
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            hintText: 'Buscar...',
            border: InputBorder.none,
            suffixIcon: Icon(
              Icons.search,
              color: Colors.grey,
            )),
      ),
    );
  }
}

class FullScreenMap extends StatefulWidget {
  const FullScreenMap({
    Key key,
  }) : super(key: key);

  @override
  _FullScreenMapState createState() => _FullScreenMapState();
}

class _FullScreenMapState extends State<FullScreenMap> {
  MapboxMapController mapController;

  List<LatLng> puntosCarga = [
    LatLng(-34.624646, -58.381890),
    LatLng(-34.625650, -58.382908),
    LatLng(-34.628115, -58.384380)
  ];

  void _onMapCreated(MapboxMapController controller) {
    mapController = controller;
    // _onStyleLoaded();
  }

  void _onStyleLoaded() {
    addImageFromAsset("assetImage", "assets/icons/location_sube.png");
  }

  /// Adds an asset image to the currently displayed style
  Future<void> addImageFromAsset(String name, String assetName) async {
    final ByteData bytes = await rootBundle.load(assetName);
    final Uint8List list = bytes.buffer.asUint8List();
    return mapController.addImage(name, list);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        MapboxMap(
            onStyleLoadedCallback: _onStyleLoaded,
            styleString: 'mapbox://styles/jsmamani/ckdml0x671oq41inxhty9fd6n',
            initialCameraPosition: const CameraPosition(
                target: LatLng(-34.624646, -58.381890), zoom: 15),
            onMapCreated: _onMapCreated),
        Positioned(
          bottom: 20,
          right: 20,
          child: FloatingActionButton(
            onPressed: () {
              mapController.moveCamera(
                CameraUpdate.newLatLngZoom(
                    const LatLng(-34.624646, -58.381890), 15),
              );
              puntosCarga.forEach((puntoCarga) {
                mapController.addSymbol(SymbolOptions(
                    geometry: puntoCarga,
                    iconImage: 'assetImage',
                    iconSize: 4));
              });
            },
            child: Icon(Icons.my_location),
            backgroundColor: kPrimaryColor,
          ),
        )
      ],
    );
  }
}
