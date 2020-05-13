import 'package:flutter/material.dart';

class CarDetails extends StatelessWidget {
  final int id;
  final String image;
  final String carName;
  CarDetails(this.id, this.image, this.carName);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[buildHero(), Text(carName)],
        ),
      ),
    );
  }

  Center buildHero() {
    return Center(
        child: Hero(
      tag: id,
      child: Center(child: Image.network(image)),
    ));
  }
}
