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
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          textTheme: Theme.of(context).textTheme,
          title: Text("About"),
        ),
        body: Row(
          children: <Widget>[
            Text(
              "Our Mission",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 10.0,
                color: AppColors.primaryDarkColor,
              ),
            ),
            Text(
              "We wanted to make an ease of access app that simulated an open-gym"
              "scenario where teams would be picked based on our algorithm.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 5.0,
                color: AppColors.primaryDarkColor,
              ),
            ),
            Text(
              "Project Manager",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 10.0,
                color: AppColors.primaryDarkColor,
              ),
            ),
            Text(
              "Alex Wallen",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 5.0,
                color: AppColors.primaryDarkColor,
              ),
            ),
            Text(
              "Front-End",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 10.0,
                color: AppColors.primaryDarkColor,
              ),
            ),
            Text(
              "Andrew Varela",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 5.0,
                color: AppColors.primaryDarkColor,
              ),
            ),
            Text(
              "Katherine Outcalt",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 5.0,
                color: AppColors.primaryDarkColor,
              ),
            ),
            Text(
              "Ezra Sackstein",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 5.0,
                color: AppColors.primaryDarkColor,
              ),
            ),
            Text(
              "Back-End",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 10.0,
                color: AppColors.primaryDarkColor,
              ),
            ),
            Text(
              "Bryce Chinn",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 5.0,
                color: AppColors.primaryDarkColor,
              ),
            ),
            Text(
              "David Stanko",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 5.0,
                color: AppColors.primaryDarkColor,
              ),
            ),
            Text(
              "Ihor Sherstiuk",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 5.0,
                color: AppColors.primaryDarkColor,
              ),
            ),
            Text(
              "DataBases",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 10.0,
                color: AppColors.primaryDarkColor,
              ),
            ),
            Text(
              "Alex Wallen",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 5.0,
                color: AppColors.primaryDarkColor,
              ),
            ),
            Text(
              "Hector Herrada",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 5.0,
                color: AppColors.primaryDarkColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
