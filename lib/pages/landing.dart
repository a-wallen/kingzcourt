import 'package:flutter/material.dart';
import 'package:kingzcourt/widgets/drawer.dart';
import 'package:flutter/widgets.dart';
import 'package:kingzcourt/algorithms/matching_algo_ihor.dart';

class LandingPage extends StatefulWidget {
  LandingPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        textTheme: Theme.of(context).textTheme,
        title: Text(widget.title),
      ),
/*      Stack(
        children:[
          Positioned( 
            bottom: 0,
            child: Text('Player name')
          ),

          Positioned(
            left: 0,
            top: 0,
            child: CircleAvatar(
              backgroundImage: NetworkImage('defaultImage')
            )
          ),

          Positioned(
            top: 0,
            right: 0,
            child: Text('Position')
          )
        ],
      ),*/
      drawer: KingzDrawer(),
      /*floatingActionButton: FloatingActionButton(
        onPressed(): { //call matching algo
        child: Text("Button pressed")
        }        
        mini: false,
        elevation: 2, //don't know
        clipBehavior: Clip, //not sure what to do here
        onTap(): {
        }
      ),*/
      // bottomNavigationBar: BottomNavyBar(
      //   mainAxisAlignment: MainAxisAlignment.spaceAround,
      //   selectedIndex: currentIndex,
      //   showElevation: true,
      //   itemCornerRadius: 9.0,
      //   onItemSelected: (index) => setState(() {
      //     currentIndex = index;
      //   }),
      //   items: kingzNavBar,
      // ),
    );
  }
}
