import 'player.dart';
class Group{
  int groupSize; //number of people in a group
  String groupName;
  List playerList[] = new Player[groupSize]; //array of Players

  Group(int myGroupSize, String myGroupName, Player[] myPlayerList){
    groupSize = myGroupSize;
    groupName = myGroupName;
    
    for(int i = 0; i < myPlayerList.size(); i++)
      playerList[i] = myPlayerList[i];
  }
}