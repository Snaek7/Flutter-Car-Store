import 'package:first_app/pages/car/car_api.dart';
import 'package:first_app/pages/car/car_page.dart';
import 'package:first_app/utils/prefs.dart';
import 'package:first_app/widgets/app_drawer.dart';
import 'package:flutter/material.dart';

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
    _initTabs();
  }

  _initTabs() async {
    _tabController = TabController(length: 3, vsync: this);

    _tabController.index = await Prefs.getInt('tabIdx');

    _tabController.addListener(() {
      Prefs.setInt('tabIdx', _tabController.index);
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
        body: _tabController == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : TabBarView(controller: _tabController, children: [
                CarPage(CarType.classicos),
                CarPage(CarType.esportivos),
                CarPage(CarType.luxo)
              ]),
        drawer: DrawerList());
  }
}
