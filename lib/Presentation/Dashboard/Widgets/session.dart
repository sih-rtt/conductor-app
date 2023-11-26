import 'package:conductor_app/Business%20Logic/Dashboard/Map/bloc/map_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_animations/flutter_map_animations.dart';
import 'package:latlong2/latlong.dart';

class Session extends StatefulWidget {
  const Session({super.key});

  @override
  State<Session> createState() => _SessionState();
}

class _SessionState extends State<Session> with TickerProviderStateMixin {
  late final _animatedMapController = AnimatedMapController(vsync: this);
  final markers = ValueNotifier<List<AnimatedMarker>>([]);
  final center = const LatLng(12.9719, 77.5937);

  @override
  void dispose() {
    _animatedMapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    final double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        SizedBox(
          height: height * 0.025,
        ),
        SizedBox(
          width: width * 0.9,
          child: Card(
            color: Theme.of(context).colorScheme.primary,
            child: Container(
              height: height * 0.25,
              padding: const EdgeInsets.only(left: 24, right: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Bus Details",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Bus Id",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        Text(
                          "12312",
                          style: Theme.of(context).textTheme.bodyLarge,
                        )
                      ]),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Bus Type",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        Text(
                          "Your MOM",
                          style: Theme.of(context).textTheme.bodyLarge,
                        )
                      ]),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Bus Number",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        Text(
                          "12312",
                          style: Theme.of(context).textTheme.bodyLarge,
                        )
                      ])
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: height * 0.025,
        ),
        SizedBox(
          width: width * 0.9,
          height: height * 0.08,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                  width: width * 0.43,
                  height: height * 0.08,
                  child: FilledButton(
                      onPressed: () {},
                      child: Center(
                        child: Text(
                          "Update Availablity",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ))),
              SizedBox(
                width: width * 0.43,
                height: height * 0.08,
                child: FilledButton(
                  onPressed: () {},
                  child: Text(
                    "View Passengers",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(height: height * 0.025),
        ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          child: SizedBox(
              width: width * 0.9,
              height: height * 0.45,
              child: ValueListenableBuilder<List<AnimatedMarker>>(
                valueListenable: markers,
                builder: (context, markers, _) {
                  return FlutterMap(
                    mapController: _animatedMapController.mapController,
                    options: MapOptions(
                      initialZoom: 14,
                      backgroundColor: const Color.fromARGB(0, 0, 0, 18),
                      initialCenter: center,
                      onTap: (_, point) {},
                    ),
                    children: [
                      BlocProvider(
                        create: (context) => MapBloc()..add(Mapfetch()),
                        child: BlocBuilder<MapBloc, MapState>(
                          builder: (context, state) {
                            if (state is MapLoading) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            } else if (state is MapLoaded) {
                              return TileLayer(
                                urlTemplate:
                                    'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                                userAgentPackageName: 'com.example.app',
                              );
                            } else {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }
                          },
                        ),
                      ),
                      AnimatedMarkerLayer(markers: markers),
                    ],
                  );
                },
              )),
        )
      ],
    );
  }
}
