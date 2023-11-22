import 'package:conductor_app/Business%20Logic/Dashboard/Session/bloc/session_bloc.dart';
import 'package:conductor_app/Presentation/Dashboard/Widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> with TickerProviderStateMixin {
  late final TabController tabController;
  late bool historyPageButton;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    historyPageButton = true;
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    tabController.addListener(() {
      if (tabController.index == 2) {
        setState(() {
          historyPageButton = false;
        });
      } else {
        setState(() {
          historyPageButton = true;
        });
      }
    });
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return MultiBlocProvider(
      providers: [
        BlocProvider<SessionBloc>(create: (_) {
          return SessionBloc();
        }),
      ],
      child: Stack(children: [
        Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            flexibleSpace: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TabBar(controller: tabController, tabs: const <Widget>[
                  Tab(
                    text: 'Home',
                  ),
                  Tab(
                    text: 'Session',
                  ),
                  Tab(
                    text: 'History',
                  )
                ])
              ],
            ),
          ),
          body: TabBarView(
              // physics: const NeverScrollableScrollPhysics(),
              controller: tabController,
              children: const <Widget>[
                Text("Home Screen"),
                Session(),
                Text('History Screen')
              ]),
        ),
        Visibility(
          visible: historyPageButton,
          child: Positioned(
              right: width * 0.05,
              bottom: height * 0.03,
              child: SizedBox(
                height: height * 0.08,
                width: width * 0.5,
                child: Builder(builder: (context) {
                  return FloatingActionButton.extended(onPressed: () {
                    if (BlocProvider.of<SessionBloc>(context).state
                        is InSession) {
                      //implement logic to stop session
                    } else if (BlocProvider.of<SessionBloc>(context).state
                        is NotInSession) {
                      //implement logic to start session
                    }
                  }, label: BlocBuilder<SessionBloc, SessionState>(
                    builder: (context, state) {
                      if (state is LoadingSession) {
                        return const CircularProgressIndicator();
                      } else if (state is NotInSession) {
                        return const Row(
                          children: [
                            Icon(Icons.qr_code_scanner),
                            Text("Scan QR")
                          ],
                        );
                      } else if (state is SessionInitial) {
                        return const Row(
                          children: [
                            Icon(Icons.qr_code_scanner),
                            Text("Scan QR")
                          ],
                        );
                      } else if (state is InSession) {
                        return const Row(
                          children: [
                            Icon(Icons.expand_less),
                            Text("End Journey")
                          ],
                        );
                      } else {
                        return const Row(
                          children: [Icon(Icons.house), Text("Scan QR")],
                        );
                      }
                    },
                  ));
                }),
              )),
        )
      ]),
    );
  }
}
