import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Carros"),
        centerTitle: true,
      ),
      body: _body(),
    );
  }

  _body() {
    return Center(
      child: Text(
        'Emerson',
        style: TextStyle(fontSize: 22),
      ),
    );
  }
}
