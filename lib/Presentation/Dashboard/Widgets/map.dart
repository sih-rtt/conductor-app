import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_animations/flutter_map_animations.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:latlong2/latlong.dart';

class MapFull extends StatefulWidget {
  const MapFull({super.key});

  @override
  State<MapFull> createState() => _MapFullState();
}

class _MapFullState extends State<MapFull> with TickerProviderStateMixin {
  late final _animatedMapController = AnimatedMapController(vsync: this);
  final markers = ValueNotifier<List<AnimatedMarker>>([]);
  final center = const LatLng(12.9719, 77.5937);
  late double height_map;
  late double width_map;
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    height_map = height * 0.45;

    final double width = MediaQuery.of(context).size.width;
    width_map = width * 0.9;
    return Scaffold(
      body: SafeArea(
        child: Hero(
          tag: 'Map',
          child: SizedBox(
            height: height,
            width: width,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              child: SizedBox(
                  child: ValueListenableBuilder<List<AnimatedMarker>>(
                valueListenable: markers,
                builder: (context, markers, _) {
                  return Stack(children: [
                    FlutterMap(
                      mapController: _animatedMapController.mapController,
                      options: MapOptions(
                        initialZoom: 14,
                        initialCenter: center,
                        onTap: (_, point) {},
                      ),
                      children: [
                        TileLayer(
                          urlTemplate:
                              'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                          userAgentPackageName: 'com.example.app',
                        ),
                        AnimatedMarkerLayer(
                          markers: markers,
                        ),
                        CurrentLocationLayer(
                          followOnLocationUpdate: FollowOnLocationUpdate.always,
                          turnOnHeadingUpdate: TurnOnHeadingUpdate.never,
                          style: const LocationMarkerStyle(
                            marker: DefaultLocationMarker(
                              child: Icon(
                                Icons.navigation,
                                color: Colors.white,
                              ),
                            ),
                            markerSize: const Size(40, 40),
                            markerDirection: MarkerDirection.heading,
                          ),
                        )
                      ],
                    ),
                    Positioned(
                        right: 4,
                        top: 4,
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: SizedBox(
                                height: height * 0.08,
                                width: width * 0.1,
                                child: const Icon(Icons.open_in_full),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                _animatedMapController.animatedZoomIn();
                              },
                              child: SizedBox(
                                height: height * 0.08,
                                width: width * 0.1,
                                child: const Icon(Icons.zoom_in),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                _animatedMapController.animatedZoomOut();
                              },
                              child: SizedBox(
                                height: height * 0.08,
                                width: width * 0.1,
                                child: const Icon(Icons.zoom_out),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                _animatedMapController.animateTo(dest: center);
                              },
                              child: SizedBox(
                                height: height * 0.08,
                                width: width * 0.1,
                                child: const Icon(Icons.location_on),
                              ),
                            ),
                          ],
                        )),
                  ]);
                },
              )),
            ),
          ),
        ),
      ),
    );
  }
}
