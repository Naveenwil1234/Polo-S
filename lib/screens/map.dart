import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

   final String tomTomTileLayerUrl =
      'https://api.tomtom.com/map/1/tile/basic/main/{z}/{x}/{y}.png?key=HeEMGRu4VMIXR1wZKUULS6Ldzft9GbJy';

  @override
  Widget build(BuildContext context) {
      return Scaffold(
      appBar: AppBar(
        title: const Text('TomTom Maps'),
      ),
      body: FlutterMap(
        options: MapOptions(
          center: LatLng(51.5074, -0.1278), // Initial map center coordinates
          zoom: 13.0, // Initial zoom level
          layers: [
            TileLayerWidget(
              urlTemplate: tomTomTileLayerUrl,
              subdomains: ['a', 'b', 'c'],
            ),
          ],
        ),
        children: [],
      ),
    );
  }
}