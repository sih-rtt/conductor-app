import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late final TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        bottom: TabBar(controller: tabController, tabs: const <Widget>[
          Tab(
            text: 'Home',
          ),
          Tab(
            text: 'Session',
          ),
          Tab(
            text: 'History',
          )
        ]),
      ),
      body: TabBarView(controller: tabController, children: const <Widget>[
        Text("Home Screen"),
        Text('Session Screen'),
        Text('History Screen')
      ]),
    );
  }
}
