import 'player.dart';

class Group {
  int groupSize; //number of people in a group
  String groupName;
  List<Player> playerList; //array of Players

  Group(int myGroupSize, String myGroupName, List<Player> myPlayerList) {
    groupSize = myGroupSize;
    groupName = myGroupName;

    for (int i = 0; i < myPlayerList.length; i++)
      playerList[i] = myPlayerList[i];
  }

  //getters:
  int getGroupSize() {
    return groupSize;
  }

  String getGroupName() {
    return groupName;
  }

  List<Player> getPlayerList() {
    return playerList;
  }

  //setters:
  //adds a player and sets their waiting time to 0
  void addPlayer(int playersToAdd, String position, String imageFilePath) {
    groupSize++;
    playerList.add(Player(position, 0, imageFilePath));
  }

  //sets group name
  void setGroupName(String newGroupName) {
    groupName = newGroupName;
  }
}
