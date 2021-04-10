import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pracise_app_2/utlis/routes.dart';

class HomeDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
              currentAccountPicture: new CircleAvatar(
                child: new Text(MyRoutes.username[0],
                    style: new TextStyle(fontSize: 40)),
              ),
              accountName: new Text(
                MyRoutes.username,
                style: GoogleFonts.laila(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              accountEmail: new Text(
                " ${MyRoutes.username}@gmail.com",
                style: GoogleFonts.laila(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              )),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.home,
              color: Theme.of(context).accentColor,
            ),
            onTap: () {
              Navigator.pushNamed(context, MyRoutes.homeRoute);
            },
            title: Text(
              "Home",
              style: GoogleFonts.laila(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).accentColor,
              ),
            ),
          ),
          Divider(
            color: Theme.of(context).accentColor,
          ),
          ListTile(
            leading: new Icon(
              Icons.logout,
              color: Theme.of(context).accentColor,
            ),
            onTap: () {
              Navigator.pushNamed(context, MyRoutes.loginRoute);
            },
            title: new Text(
              "Sign out",
              style: GoogleFonts.laila(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).accentColor,
              ),
            ),
          ),
          Divider(
            color: Theme.of(context).accentColor,
          ),
          ListTile(
            leading: new Icon(
              Icons.settings,
              color: Theme.of(context).accentColor,
            ),
            title: new Text(
              "Settings",
              style: GoogleFonts.laila(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).accentColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
