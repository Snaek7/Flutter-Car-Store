import 'package:first_app/pages/car/car_listView.dart';
import 'package:first_app/pages/car/car_model.dart';
import 'package:first_app/utils/text_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'car.dart';

class CarPage extends StatefulWidget {
  final String type;
  CarPage(this.type);
  @override
  _CarPageState createState() => _CarPageState();
}

class _CarPageState extends State<CarPage>
    with AutomaticKeepAliveClientMixin<CarPage> {
  List<Car> cars;

  // final _bloc = CarBloc();

  final _model = CarModel();

  String get type => widget.type;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _model.fetch(type);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    // Stram builder for study purpose

    // return StreamBuilder(
    //     stream: _bloc.stream,
    //     builder: (context, snapshot) {
    //       if (snapshot.hasError) {
    //         print(snapshot.error);
    //         return TextError('Não possível carregar os dados');
    //       }

    //       if (!snapshot.hasData) {
    //         return Center(child: CircularProgressIndicator());
    //       }

    //       List<Car> cars = snapshot.data;
    //       return _listView(cars);
    //     });

    return Observer(builder: (context) {
      List<Car> cars = _model.cars;
      if (_model.error != null) {
        print(_model.error);
        return TextError('Não possível carregar os dados');
      }

      if (_model.cars == null) {
        return Center(child: CircularProgressIndicator());
      }

      return CarListView(cars);
    });
  }
}
