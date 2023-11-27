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

enum CrowdedNess { sparselyCrowded, full, overlyCrowded }

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
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) => RadioUpdate(height: height));
                      },
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
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) => PassengerList(height: height));
                  },
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
                  return Stack(children: [
                    FlutterMap(
                      mapController: _animatedMapController.mapController,
                      options: MapOptions(
                        initialZoom: 14,
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
                    ),
                    Positioned(
                        right: 4,
                        top: 4,
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                _animatedMapController.animatedZoomIn();
                              },
                              child: SizedBox(
                                height: height * 0.08,
                                width: width * 0.1,
                                child: Container(
                                  child: Icon(Icons.zoom_in),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                _animatedMapController.animatedZoomOut();
                              },
                              child: SizedBox(
                                height: height * 0.08,
                                width: width * 0.1,
                                child: Container(
                                  child: Icon(Icons.zoom_out),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                _animatedMapController.animateTo(dest: center);
                              },
                              child: SizedBox(
                                height: height * 0.08,
                                width: width * 0.1,
                                child: Container(
                                  child: Icon(Icons.location_on),
                                ),
                              ),
                            ),
                          ],
                        )),
                  ]);
                },
              )),
        )
      ],
    );
  }
}

class RadioUpdate extends StatefulWidget {
  final double height;
  const RadioUpdate({super.key, required this.height});

  @override
  State<RadioUpdate> createState() => _RadioUpdateState();
}

class _RadioUpdateState extends State<RadioUpdate> {
  CrowdedNess? character = CrowdedNess.sparselyCrowded;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).colorScheme.primary,
      iconColor: Theme.of(context).colorScheme.secondary,
      content: SizedBox(
        height: widget.height * 0.32,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: widget.height * 0.05,
              child: Text(
                "Set Availablity",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
            SizedBox(
              height: widget.height * 0.09,
              child: Center(
                child: ListTile(
                    title: Text(
                      "Sparsely Crowded",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    leading: Radio<CrowdedNess>(
                      value: CrowdedNess.sparselyCrowded,
                      fillColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                          return (character == CrowdedNess.sparselyCrowded)
                              ? Theme.of(context)
                                  .colorScheme
                                  .secondary // change this to your desired color for selected state
                              : Colors
                                  .white; // change this to your desired color for unselected state
                        },
                      ),
                      groupValue: character,
                      onChanged: (CrowdedNess? value) {
                        setState(() {
                          character = value;
                        });
                      },
                    )),
              ),
            ),
            SizedBox(
              height: widget.height * 0.09,
              child: Center(
                child: ListTile(
                    title: Text(
                      "Full",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    leading: Radio<CrowdedNess>(
                      fillColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                          return (character == CrowdedNess.full)
                              ? Theme.of(context)
                                  .colorScheme
                                  .secondary // change this to your desired color for selected state
                              : Colors
                                  .white; // change this to your desired color for unselected state
                        },
                      ),
                      value: CrowdedNess.full,
                      groupValue: character,
                      onChanged: (CrowdedNess? value) {
                        setState(() {
                          character = value;
                        });
                      },
                    )),
              ),
            ),
            SizedBox(
              height: widget.height * 0.09,
              child: Center(
                child: ListTile(
                    title: Text(
                      "Overly Crowded",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    leading: Radio<CrowdedNess>(
                      fillColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                          return (character == CrowdedNess.overlyCrowded)
                              ? Theme.of(context)
                                  .colorScheme
                                  .secondary // change this to your desired color for selected state
                              : Colors
                                  .white; // change this to your desired color for unselected state
                        },
                      ),
                      value: CrowdedNess.overlyCrowded,
                      groupValue: character,
                      onChanged: (CrowdedNess? value) {
                        setState(() {
                          character = value;
                        });
                      },
                    )),
              ),
            )
          ],
        ),
      ),
      actions: [
        Center(
            child: FilledButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: FilledButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.secondary),
                child: const Text("Update")))
      ],
    );
  }
}

class PassengerList extends StatefulWidget {
  final double height;
  const PassengerList({super.key, required this.height});

  @override
  State<PassengerList> createState() => _PassengerListState();
}

class _PassengerListState extends State<PassengerList> {
  var list = [
    {'leading': 'A', 'trailing': 'B'},
    {'leading': 'C', 'trailing': 'D'},
    {'leading': 'E', 'trailing': 'F'},
    {'leading': 'G', 'trailing': 'H'},
    {'leading': 'I', 'trailing': 'J'},
  ];

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).colorScheme.primary,
      content: SizedBox(
        width: double.maxFinite,
        height: widget.height * 0.6,
        child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Text(list[index]['leading']!),
              trailing: Text(list[index]['trailing']!),
            );
          },
        ),
      ),
      actions: [
        Center(
            child: FilledButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: FilledButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.secondary),
                child: const Text("Close")))
      ],
    );
  }
}
