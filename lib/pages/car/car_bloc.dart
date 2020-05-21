import 'package:first_app/utils/simple_bloc.dart';

import 'car.dart';
import 'car_api.dart';

class CarBloc extends SimpleBloc<List<Car>> {
  loadData(String type) async {
    try {
      List<Car> cars = await CarApi.getCars(type);
      add(cars);
    } catch (e) {
      addError(e);
    }
  }
}
