import 'dart:convert' as convert;

import 'package:first_app/pages/car/car.dart';
import 'package:first_app/pages/login/user.dart';
import 'package:http/http.dart' as http;

class CarType {
  static final String classicos = "classicos";
  static final String esportivos = "esportivos";
  static final String luxo = "luxo";
}

class CarApi {
  static Future<List<Car>> getCars(String type) async {
    var url = 'http://carros-springboot.herokuapp.com/api/v2/carros/tipo/$type';

    User user = await User.getUser();

    Map<String, String> headers = {
      "Content-Type": "application/json",
      "authorization": "Bearer ${user.token}"
    };

    print("GET > $url");

    var response = await http.get(url, headers: headers);
    String json = response.body;

    List list = convert.json.decode(json);

    return list.map<Car>((map) => Car.fromJson(map)).toList();

    // final cars = List<Car>();
    // for (Map map in list) {
    //   Car car = Car.fromJson(map);
    //   cars.add(car);
    // }
  }
}
