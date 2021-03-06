import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kingzcourt/classes/colors.dart';

import 'package:kingzcourt/pages/playerlibrary.dart';
import 'package:kingzcourt/pages/grouplibrary.dart';
import 'package:kingzcourt/pages/aboutinfo.dart';

class KingzDrawer extends StatefulWidget {
  @override
  _KingzDrawerState createState() => _KingzDrawerState();
}

class _KingzDrawerState extends State<KingzDrawer> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context),
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: AppColors.primaryDarkColor,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    "assets/Images/drawer_header.jpeg",
                  ),
                ),
              ),
              child: Text(
                "Court Royale",
                style: Theme.of(context).textTheme.title,
              ),
            ),
            ListTile(
                leading: Icon(Icons.person),
                title: Text(
                  "Player Library",
                  style: Theme.of(context).textTheme.title,
                ),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PlayerLibraryPage()))),
            Divider(
              thickness: 1,
              height: 10,
            ),
            ListTile(
                leading: Icon(Icons.group_sharp),
                title: Text(
                  "Group Library",
                  style: Theme.of(context).textTheme.title,
                ),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => GroupLibraryPage(false)))),
            Divider(
              thickness: 1,
              height: 10,
            ),
            ListTile(
                leading: Icon(Icons.info_sharp),
                title: Text(
                  "About",
                  style: Theme.of(context).textTheme.title,
                ),
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AboutPage()))),
            Divider(
              thickness: 1,
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
