import 'package:flutter/material.dart';

class CarDetails extends StatelessWidget {
  int id;
  String image;
  CarDetails(this.id, this.image);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Hero(
        tag: id,
        child: Center(child: Image.network(image)),
      )),
    );
  }
}
