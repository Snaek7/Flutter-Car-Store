import 'package:first_app/pages/car/car_api.dart';
import 'package:first_app/widgets/app_drawer.dart';
import 'package:flutter/material.dart';

import 'car/car_listView.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin<HomePage> {
  TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 3, vsync: this);

    _tabController.index = 1;

    _tabController.addListener(() {
      print("Tab ${_tabController.index}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Carros"),
          centerTitle: true,
          bottom: TabBar(controller: _tabController, tabs: [
            Tab(
              text: "Clássicos",
            ),
            Tab(
              text: "Esportivos",
            ),
            Tab(
              text: "Luxo",
            )
          ]),
        ),
        body: TabBarView(controller: _tabController, children: [
          CarListView(CarType.classicos),
          CarListView(CarType.esportivos),
          CarListView(CarType.luxo)
        ]),
        drawer: DrawerList());
  }
}
