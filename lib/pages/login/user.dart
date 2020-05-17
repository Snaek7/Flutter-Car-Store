import 'package:first_app/utils/prefs.dart';
import 'dart:convert' as convert;

class User {
  int id;
  String login;
  String nome;
  String email;
  String urlFoto;
  String token;
  List<String> roles;

  User(
      {this.id,
      this.login,
      this.nome,
      this.email,
      this.urlFoto,
      this.token,
      this.roles});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    login = json['login'];
    nome = json['nome'];
    email = json['email'];
    urlFoto = json['urlFoto'];
    token = json['token'];
    roles = json['roles'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['login'] = this.login;
    data['nome'] = this.nome;
    data['email'] = this.email;
    data['urlFoto'] = this.urlFoto;
    data['token'] = this.token;
    data['roles'] = this.roles;
    return data;
  }

  void save() {
    Map map = toJson();
    String json = convert.json.encode(map);

    Prefs.setString('prefs.user', json);
  }

  static Future<User> getUser() async {
    String userStr = await Prefs.getString('prefs.user');
    Map json = convert.json.decode(userStr);
    User user = User.fromJson(json);

    return user;
  }

  static void clear() {
    Prefs.setString('prefs.user', "");
  }

  @override
  String toString() {
    return 'User{login: $login, nome: $nome, email: $email, token: $token, roles: $roles}';
  }
}
