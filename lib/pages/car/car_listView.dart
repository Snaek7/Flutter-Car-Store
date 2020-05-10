import 'package:first_app/utils/nav.dart';
import 'package:flutter/material.dart';

import 'car.dart';
import 'car_api.dart';
import 'car_details.dart';

class CarListView extends StatefulWidget {
  String type;
  CarListView(this.type);

  @override
  _CarListViewState createState() => _CarListViewState();
}

class _CarListViewState extends State<CarListView>
    with AutomaticKeepAliveClientMixin<CarListView> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return _body();
  }

  _body() {
    return FutureBuilder(
        future: CarApi.getCars(widget.type),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
            return Center(
              child: Text(
                'Não possível carregar os dados',
                style: TextStyle(color: Colors.red, fontSize: 22),
              ),
            );
          }

          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          List<Car> cars = snapshot.data;
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
              child: Card(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.network(
                    car.urlFoto ??
                        "https://us.123rf.com/450wm/pavelstasevich/pavelstasevich1811/pavelstasevich181101028/112815904-no-image-available-icon-flat-vector-illustration.jpg?ver=6",
                    width: 250,
                  ),
                  Text(
                    car.nome ?? 'Sem Nome',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(fontSize: 25),
                  ),
                  Text(
                    'Descrição...',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(fontSize: 15),
                  ),
                  ButtonBar(
                    children: <Widget>[
                      FlatButton(
                          onPressed: () =>
                              push(context, CarDetails(car.id, car.urlFoto)),
                          child: const Text('Detalhes')),
                      FlatButton(onPressed: () {}, child: const Text('Share')),
                    ],
                  ),
                ],
              )),
            );
          }),
    );
  }
}
