import 'package:first_app/pages/login_page.dart';
import 'package:first_app/utils/nav.dart';
import 'package:flutter/material.dart';

class DrawerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://cdn2.iconfinder.com/data/icons/ios-7-icons/50/user_male2-512.png"),
                ),
                accountName: Text('Emerson'),
                accountEmail: Text('Emersonfa14@gmail.com')),
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

  _onClickLogout(BuildContext context) {
    Navigator.pop(context);
    push(context, LoginPage(), replacement: true);
  }
}
