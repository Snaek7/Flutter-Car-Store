import 'package:first_app/pages/login/login_page.dart';
import 'package:first_app/pages/login/user.dart';
import 'package:first_app/utils/nav.dart';
import 'package:first_app/utils/prefs.dart';
import 'package:flutter/material.dart';

class DrawerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future<User> future = User.getUser();

    return SafeArea(
      child: Drawer(
        child: ListView(
          children: <Widget>[
            FutureBuilder<User>(
                future: future,
                builder: (context, snapshot) {
                  User user = snapshot.data;

                  return user != null ? _drawerHeader(user) : Container();
                }),
            ListTile(
              leading: Icon(Icons.star),
              title: Text('Favoritos'),
              subtitle: Text('Mais informações...'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                print('drawer tap');
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text('Ajuda'),
              subtitle: Text('Mais informações...'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                print('drawer tap');
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Logout'),
              onTap: () => _onClickLogout(context),
            ),
          ],
        ),
      ),
    );
  }

  UserAccountsDrawerHeader _drawerHeader(User user) {
    return UserAccountsDrawerHeader(
        currentAccountPicture: CircleAvatar(
          backgroundImage: NetworkImage(user.urlFoto),
        ),
        accountName: Text(user.nome),
        accountEmail: Text(user.email));
  }

  _onClickLogout(BuildContext context) {
    User.clear();
    Navigator.pop(context);
    push(context, LoginPage(), replacement: true);
  }
}
