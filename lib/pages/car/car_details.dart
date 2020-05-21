import 'package:first_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';

import 'car.dart';
import 'lorem_bloc.dart';

class CarDetails extends StatefulWidget {
  final Car car;

  CarDetails(this.car);

  @override
  _CarDetailsState createState() => _CarDetailsState();
}

class _CarDetailsState extends State<CarDetails> {
  final _textBloc = LoremBloc();

  @override
  void initState() {
    super.initState();
    _textBloc.loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.car.nome),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.place), onPressed: () {}),
          IconButton(icon: Icon(Icons.videocam), onPressed: () {}),
          PopupMenuButton<String>(
              onSelected: (String value) => _clickPopMenu(value),
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(
                    value: 'Editar',
                    child: Text('Editar'),
                  ),
                  PopupMenuItem(
                    value: 'Deletar',
                    child: Text('Deletar'),
                  ),
                  PopupMenuItem(
                    value: 'Share',
                    child: Text('Share'),
                  ),
                ];
              })
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            buildHero(),
            buildFirstRow(),
            Divider(),
            buildColum()
          ],
        ),
      ),
    );
  }

  Row buildFirstRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            text(widget.car.nome, fontSize: 20, bold: true),
            text(widget.car.tipo),
          ],
        ),
        Row(
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.favorite,
                color: Colors.red,
                size: 40,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.share,
                color: Colors.black,
                size: 40,
              ),
              onPressed: () {},
            )
          ],
        )
      ],
    );
  }

  buildColum() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          text(widget.car.descricao, bold: true),
          SizedBox(
            height: 20,
          ),
          StreamBuilder(
            stream: _textBloc.stream,
            builder: (context, snapshot) {
              print(snapshot);
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              }
              return text(snapshot.data, fontSize: 16);
            },
          ),
        ],
      ),
    );
  }

  Hero buildHero() {
    return Hero(
      tag: widget.car.id,
      child: Center(child: Image.network(widget.car.urlFoto)),
    );
  }

  void _clickPopMenu(String value) {
    switch (value) {
      case 'Editar':
        print('Editar');
        break;
      case 'Deletar':
        print('Deletar');
        break;
      case 'Share':
        print('Share');
        break;
      default:
        print('Default');
    }
  }

  @override
  void dispose() {
    super.dispose();
    _textBloc.dispose();
  }
}
