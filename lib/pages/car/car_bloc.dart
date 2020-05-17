import 'dart:async';

import 'car.dart';
import 'car_api.dart';

class CarBloc {
  final _streamController = StreamController<List<Car>>();

  Stream<List<Car>> get stream => _streamController.stream;

  loadData(String type) async {
    List<Car> cars = await CarApi.getCars(type);

    _streamController.add(cars);
  }

  void dispose() {
    _streamController.close();
  }
}
