// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CarModel on CarModelBase, Store {
  final _$carsAtom = Atom(name: 'CarModelBase.cars');

  @override
  List<Car> get cars {
    _$carsAtom.reportRead();
    return super.cars;
  }

  @override
  set cars(List<Car> value) {
    _$carsAtom.reportWrite(value, super.cars, () {
      super.cars = value;
    });
  }

  final _$errorAtom = Atom(name: 'CarModelBase.error');

  @override
  Exception get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(Exception value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  final _$fetchAsyncAction = AsyncAction('CarModelBase.fetch');

  @override
  Future fetch(String type) {
    return _$fetchAsyncAction.run(() => super.fetch(type));
  }

  @override
  String toString() {
    return '''
cars: ${cars},
error: ${error}
    ''';
  }
}
