import 'package:mobx/mobx.dart';

import 'car.dart';
import 'car_api.dart';

part 'car_model.g.dart';

class CarModel = CarModelBase with _$CarModel;

abstract class CarModelBase with Store {
  @observable
  List<Car> cars;

  @observable
  Exception error;

  @action
  fetch(String type) async {
    try {
      this.cars = await CarApi.getCars(type);
    } catch (e) {
      this.error = e;
    }
  }
}
