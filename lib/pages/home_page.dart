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
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            title: Text("Carros"),
            centerTitle: true,
            bottom: TabBar(tabs: [
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
          body: TabBarView(children: [
            CarListView(CarType.classicos),
            CarListView(CarType.esportivos),
            CarListView(CarType.luxo)
          ]),
          drawer: DrawerList()),
    );
  }
}
