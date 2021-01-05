import 'package:flutter/material.dart';
import 'package:kingzcourt/classes/colors.dart';

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
                  fontFamily: 'SansitaSwashed',
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryDarkColor,
                ),
              ),
              Text(
                "We wanted to make an ease of access app that simulated an open-gym "
                "scenario where teams would be picked based on our algorithm.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: AppColors.primaryDarkColor,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 10.0, 0, 0),
                child: Text(
                  "Project Manager",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 40.0,
                    fontFamily: 'SansitaSwashed',
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryDarkColor,
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  "Alex Wallen",
                  style: TextStyle(
                    fontSize: 25.0,
                    color: AppColors.primaryDarkColor,
                  ),
                ),
                trailing: Image.asset(
                  'assets/Images/Alex.jpg',
                  height: 100,
                  width: 50,
                ),
              ),
              Text(
                "Front-End",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 40.0,
                  fontFamily: 'SansitaSwashed',
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryDarkColor,
                ),
              ),
              ListTile(
                title: Text(
                  "Andrew Varela",
                  style: TextStyle(
                    fontSize: 25.0,
                    color: AppColors.primaryDarkColor,
                  ),
                ),
                trailing: Image.asset(
                  'assets/Images/Andrew.jpg',
                  height: 50,
                  width: 50,
                ),
              ),
              ListTile(
                title: Text(
                  "Katherine Outcalt",
                  style: TextStyle(
                    fontSize: 25.0,
                    color: AppColors.primaryDarkColor,
                  ),
                ),
                trailing: Image.asset(
                  'assets/Images/KatO.jpg',
                  height: 50,
                  width: 50,
                ),
              ),
              ListTile(
                  title: Text(
                    "Ezra Sackstein",
                    style: TextStyle(
                      fontSize: 25.0,
                      color: AppColors.primaryDarkColor,
                    ),
                  ),
                  trailing: Icon(Icons.person, size: 50,),
                  ),
              Text(
                "Back-End",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 40.0,
                  fontFamily: 'SansitaSwashed',
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryDarkColor,
                ),
              ),
              ListTile(
                title: Text(
                  "Bryce Chinn",
                  style: TextStyle(
                    fontSize: 25.0,
                    color: AppColors.primaryDarkColor,
                  ),
                ),
                trailing: Image.asset(
                  'assets/Images/Bryce.jpg',
                  height: 50,
                  width: 50,
                ),
              ),
              ListTile(
                title: Text(
                  "David Stanko",
                  style: TextStyle(
                    fontSize: 25.0,
                    color: AppColors.primaryDarkColor,
                  ),
                ),
                trailing: Image.asset(
                  'assets/Images/David.jpg',
                  height: 50,
                  width: 50,
                ),
              ),
              ListTile(
                title: Text(
                  "Ihor Sherstiuk",
                  style: TextStyle(
                    fontSize: 25.0,
                    color: AppColors.primaryDarkColor,
                  ),
                ),
                trailing: Image.asset(
                  'assets/Images/Ihor.jpg',
                  height: 50,
                  width: 50,
                ),
              ),
              Text(
                "Database",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 40.0,
                  fontFamily: 'SansitaSwashed',
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryDarkColor,
                ),
              ),
              ListTile(
                title: Text(
                  "Hector Herrada",
                  style: TextStyle(
                    fontSize: 25.0,
                    color: AppColors.primaryDarkColor,
                  ),
                ),
                trailing: Image.asset(
                  'assets/Images/Hector.jpg',
                  height: 50,
                  width: 50,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
