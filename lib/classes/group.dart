import 'player.dart';

class Group {
  int _gid;
  int _num_players; //number of people in a group
  String _group_name;
  List<Player> _playerList; //array of Players

  //constructor, leaves the player list empty for now so that players can be added
  Group(
    //int myGroupSize,
    String myGroupName,
    /*List<Player> myPlayerList*/
  ) {
    _num_players = 0;
    _group_name = myGroupName;

    //for (int i = 0; i < myPlayerList.length; i++)
    //_playerList[i] = myPlayerList[i];
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    if (_gid != null) map['g_id'] = _gid;
    map['group_name'] = _group_name;
    map['num_players'] = _num_players;
    return map;
  }

  Group.fromMap(Map<String, dynamic> map) {
    this._gid = map['g_id'];
    this._group_name = map['group_name'];
    this._num_players = map['num_players'];
  }

  //getters:
  /*int getGroupSize() {
    return _groupSize;
  }*/

  String getGroupName() {
    return _group_name;
  }

  int getId() {
    return this._gid;
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

  void setId(int id) {
    this._gid = id;
  }

  //sets group name
  void setGroupName(String newGroupName) {
    _group_name = newGroupName;
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
