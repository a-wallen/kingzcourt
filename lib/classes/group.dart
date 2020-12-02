import 'player.dart';

class Group {
  int _groupSize; //number of people in a group
  String _groupName;
  List<Player> _playerList; //array of Players

  Group(int myGroupSize, String myGroupName, List<Player> myPlayerList) {
    _groupSize = myGroupSize;
    _groupName = myGroupName;

    for (int i = 0; i < myPlayerList.length; i++)
      _playerList[i] = myPlayerList[i];
  }

  //getters:
  int getGroupSize() {
    return _groupSize;
  }

  String getGroupName() {
    return _groupName;
  }

  List<Player> getPlayerList() {
    return _playerList;
  }

  //setters:
  //adds a player and sets their waiting time to 0
  void addPlayer(String name, String position, String imageFilePath) {
    _groupSize++;
    _playerList.add(Player(name, position, 0, imageFilePath));
  }

  //sets group name
  void setGroupName(String newGroupName) {
    _groupName = newGroupName;
  }
}
