import 'player.dart';
//import 'group.dart';

class Team {
  static const int TEAM_SIZE = 6; //a constant for the team size
  String _teamName;
  List<Player> _playerList; //array of Players on the Team

  //constructor, leave the player list empty for now
  Team(String myTeamName /*, List<Player> myPlayerList*/) {
    _teamName = myTeamName;
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

  //setters:
  void setTeamName(String newTeamName) {
    _teamName = newTeamName;
  }

  void addPlayer(String name, String position, String imageFilePath) {
    _playerList.add(Player(name, position, 0, imageFilePath));
  }

  void removePlayer(Object o) {
    Player playerToRemove = o;
    _playerList.remove(playerToRemove);
  }

  //not sure how to return the player list so it can be printed
  /*
  String toString() {
    return "Team name: $getTeamName() " + "Team size: $_playerList.size";
  }*/
}
