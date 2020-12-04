import 'player.dart';

class Group {
  int _gid;
  int _groupSize; //number of people in a group
  String _groupName;
  List<Player> _playerList; //array of Players

  //constructor, leaves the player list empty for now so that players can be added
  Group(
    //int myGroupSize,
    String myGroupName,
    /*List<Player> myPlayerList*/
  ) {
    _groupSize = 0;
    _groupName = myGroupName;

    //for (int i = 0; i < myPlayerList.length; i++)
    //_playerList[i] = myPlayerList[i];
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    if (_gid != null) map['gid'] = _gid;
    map['groupName'] = _groupName;
    map['groupSize'] = _groupSize;
    return map;
  }

  Group.fromMap(Map<String, dynamic> map) {
    this._gid = map['gid'];
    this._groupName = map['groupName'];
    this._groupSize = map['groupSize'];
  }

  //getters:
  /*int getGroupSize() {
    return _groupSize;
  }*/

  String getGroupName() {
    return _groupName;
  }

  List<Player> getPlayerList() {
    return _playerList;
  }

  //setters:
  //adds a player and sets their waiting time to 0
  void addPlayer(Object o) {
    //_groupSize++;
    Player playerToAdd = o;
    _playerList.add(playerToAdd);
  }

  //sets group name
  void setGroupName(String newGroupName) {
    _groupName = newGroupName;
  }

  void removePlayer(Object o) {
    Player playerToRemove = o;
    _playerList.remove(playerToRemove);
  }

  //not sure how to return the Player list so it can be printed
  /*String toString() {
    return "Group name: $getGroupName() " + "Group size: $getGroupSize()";
  }*/
}
