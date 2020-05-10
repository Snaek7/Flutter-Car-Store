import 'package:first_app/pages/home_page.dart';
import 'package:first_app/pages/login_api.dart';
import 'package:first_app/pages/user.dart';
import 'package:first_app/utils/api_result.dart';
import 'package:first_app/utils/nav.dart';
import 'package:first_app/widgets/alert.dart';
import 'package:first_app/widgets/app_button.dart';
import 'package:first_app/widgets/app_formText.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final _tLogin = TextEditingController();

  final _tPassword = TextEditingController();

  final _focusPassword = FocusNode();

  bool _showProgress = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Car Store"),
        centerTitle: true,
      ),
      body: _body(),
    );
  }

  _body() {
    return Container(
      child: Form(
        key: _formKey,
        child: Container(
          decoration: BoxDecoration(image: _img()),
          padding: EdgeInsets.all(16),
          child: ListView(
            children: <Widget>[
              Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, .1),
                            blurRadius: 20,
                            offset: Offset(0, 10))
                      ]),
                  child: Column(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: Colors.grey[200]))),
                        child: AppFormText(
                          'Login',
                          '',
                          controller: _tLogin,
                          validator: _validateLogin,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          nextFocus: _focusPassword,
                        ),
                      ),
                      Container(
                        child: AppFormText(
                          'Senha',
                          '',
                          isHidden: true,
                          controller: _tPassword,
                          validator: _validatePassword,
                          keyboardType: TextInputType.number,
                          focusNode: _focusPassword,
                        ),
                      ),
                      SizedBox(height: 2),
                      _showProgress
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : Container(
                              decoration: BoxDecoration(boxShadow: [
                                BoxShadow(
                                    color: Color.fromRGBO(0, 0, 0, .2),
                                    blurRadius: 20,
                                    offset: Offset(0, 10))
                              ]),
                              height: 40,
                              width: 300,
                              child:
                                  AppButton('Login', onPressed: _onClickLogin),
                            ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }

  _img() {
    return DecorationImage(
      image: new AssetImage("assets/images/car.jpg"),
      fit: BoxFit.cover,
    );
  }

  Future<void> _onClickLogin() async {
    String login = _tLogin.text;
    String password = _tPassword.text;

    bool formOk = _formKey.currentState.validate();
    if (!formOk) {
      return;
    }

    setState(() {
      _showProgress = true;
    });

    ApiResponse response = await LoginApi.login(login, password);
    if (response.ok) {
      Usuario user = response.result;
      print("user >> $user");
      push(context, HomePage(), replacement: true);
    } else {
      alert(context, response.msg);
    }

    setState(() {
      _showProgress = false;
    });
  }

  String _validateLogin(String value) {
    if (value.isEmpty) {
      return "Digite o Login";
    }
    return null;
  }

  String _validatePassword(String value) {
    if (value.isEmpty) {
      return "Digite a Senha";
    }
    return null;
  }
}
