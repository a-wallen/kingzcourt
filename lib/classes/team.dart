import 'player.dart';
//import 'group.dart';

class Team {
  //static const int TEAM_SIZE = 6; //a constant for the team size
  String _teamName;
  List<Player> _playerList; //array of Players on the Team
  List<String> _positions;

  //constructor, leave the player list empty for now
  Team(String myTeamName /*, List<Player> myPlayerList*/) {
    _teamName = myTeamName;
    _positions = ["OH", "OH", "L", "OP", "M", "S"];
    _playerList = List(); //makes an empty list
    /*for (int i = 0; i < TEAM_SIZE; i++) {
      _playerList[i] = myPlayerList[i];
    }*/
  }

  //getters:
  String getTeamName() {
    return _teamName;
  }

  List<Player> getPlayersOnTeam() {
    return _playerList;
  }

  List<String> getPositions() {
    return _positions;
  }

  //setters:
  void setTeamName(String newTeamName) {
    _teamName = newTeamName;
  }

  void addPlayer(Object o) {
    Player player = o;
    _playerList.add(player);
  }

  void removePlayer(Object o) {
    Player playerToRemove = o;
    _playerList.remove(playerToRemove);
  }

  bool isTeamFull() {
    return _positions.isEmpty;
  }

  //not sure how to return the player list so it can be printed
  /*
  String toString() {
    return "Team name: $getTeamName() " + "Team size: $_playerList.size";
  }*/
}
