import 'package:first_app/pages/car/car_bloc.dart';
import 'package:first_app/pages/car/car_model.dart';
import 'package:first_app/utils/nav.dart';
import 'package:first_app/utils/text_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'car.dart';
import 'car_details.dart';

class CarListView extends StatefulWidget {
  String type;
  CarListView(this.type);
  @override
  _CarListViewState createState() => _CarListViewState();
}

class _CarListViewState extends State<CarListView>
    with AutomaticKeepAliveClientMixin<CarListView> {
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

      return _listView(cars);
    });
  }

  Container _listView(List<Car> cars) {
    return Container(
      padding: EdgeInsets.all(16),
      child: ListView.builder(
          itemCount: cars.length,
          itemBuilder: (context, index) {
            Car car = cars[index];

            return Hero(
              tag: car.id,
              child: Container(
                height: 170,
                child: Card(
                    child: Container(
                  // decoration: BoxDecoration(
                  //   image: DecorationImage(
                  //     image: AssetImage("assets/images/car-bg.png"),
                  //     fit: BoxFit.fill,
                  //   ),
                  // ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Container(
                              width: 150,
                              child: Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Text(
                                  car.nome ?? 'Sem Nome',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ),
                            Container(
                              width: 120,
                              child: Text(
                                'Descrição...',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style:
                                    TextStyle(fontSize: 12, color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: <Widget>[
                          Flexible(
                            child: Container(
                              margin: EdgeInsets.only(top: 20),
                              child: Image.network(
                                car.urlFoto ??
                                    "https://us.123rf.com/450wm/pavelstasevich/pavelstasevich1811/pavelstasevich181101028/112815904-no-image-available-icon-flat-vector-illustration.jpg?ver=6",
                                width: 150,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 60, top: 12),
                            child: ButtonBar(
                              children: <Widget>[
                                FlatButton(
                                    onPressed: () =>
                                        push(context, CarDetails(car)),
                                    child: const Text('Detalhes')),
                                FlatButton(
                                    onPressed: () {},
                                    child: const Text('Share')),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )),
              ),
            );
          }),
    );
  }

// stream for study purpose
  // @override
  // void dispose() {
  //   super.dispose();
  //   _bloc.dispose();
  // }
}
