import 'package:flutter/material.dart';
import 'package:kingzcourt/classes/colors.dart';
import 'package:kingzcourt/widgets/drawer.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        textTheme: Theme.of(context).textTheme,
        title: Text("About"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Our Mission",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 40.0,
                  color: AppColors.primaryDarkColor,
                ),
              ),
              Text(
                "We wanted to make an ease of access app that simulated an open-gym"
                "scenario where teams would be picked based on our algorithm.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: AppColors.primaryDarkColor,
                ),
              ),
              Text(
                "Project Manager",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 40.0,
                  color: AppColors.primaryDarkColor,
                ),
              ),
              Text(
                "Alex Wallen",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: AppColors.primaryDarkColor,
                ),
              ),
              Image.asset(
                'assets/images/Alex.jpg',
                height: 50,
                width: 50,
              ),
              Text(
                "Front-End",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 40.0,
                  color: AppColors.primaryDarkColor,
                ),
              ),
              Text(
                "Andrew Varela",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: AppColors.primaryDarkColor,
                ),
              ),
              Image.asset(
                'assets/images/Andrew.jpg',
                height: 50,
                width: 50,
              ),
              Text(
                "Katherine Outcalt",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: AppColors.primaryDarkColor,
                ),
              ),
              Image.asset(
                'assets/images/KatO.jpg',
                height: 50,
                width: 50,
              ),
              Text(
                "Ezra Sackstein",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: AppColors.primaryDarkColor,
                ),
              ),
              Text(
                "Back-End",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 40.0,
                  color: AppColors.primaryDarkColor,
                ),
              ),
              ListTile(
                title: Text(
                  "Bryce Chinn",
                  // textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25.0,
                    color: AppColors.primaryDarkColor,
                  ),
                ),
                trailing: Image.asset(
                  'assets/images/Bryce.jpg',
                  height: 50,
                  width: 50,
                ),
              ),
              ListTile(
                title: Text(
                  "David Stanko",
                  //textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25.0,
                    color: AppColors.primaryDarkColor,
                  ),
                ),
                trailing: Image.asset(
                  'assets/images/David.jpg',
                  height: 50,
                  width: 50,
                ),
              ),
              ListTile(
                title: Text(
                  "Ihor Sherstiuk",
                  // textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25.0,
                    color: AppColors.primaryDarkColor,
                  ),
                ),
                trailing: Image.asset(
                  'assets/images/Ihor.jpg',
                  height: 50,
                  width: 50,
                ),
              ),
              Text(
                "Databases",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 40.0,
                  color: AppColors.primaryDarkColor,
                ),
              ),
              Text(
                "Hector Herrada",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: AppColors.primaryDarkColor,
                ),
              ),
              Image.asset(
                'assets/images/Hector.jpg',
                height: 50,
                width: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
