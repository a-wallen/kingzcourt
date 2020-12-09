import 'player.dart';

class Team {
  String _teamName;
  int _teamSize; //2-6 players
  List<Player> _playerList; //list of Players on the Team

  //for team sizes 2-4, where there are multiple indoor positions that can fill a certain position:
  List<String>
      _possiblePositionsLeft; //possible indoor positions that can play on the left
  List<String>
      _possiblePositionsMiddle; //possible indoor positions that can play in the middle
  List<String>
      _possiblePositionsRight; //possible indoor positions that can play on the right

  List<String>
      _positions; //for team sizes 5-6, where there are no "choices" of possible positions

  Team(String myTeamName, int myTeamSize) {
    _teamName = myTeamName;
    _teamSize = myTeamSize;
    if (_teamSize == 2) {
      _possiblePositionsLeft = ["OH", "L"];
      _possiblePositionsMiddle = [];
      _possiblePositionsRight = ["OP", "M", "S"];
    } else if (_teamSize == 3) {
      _possiblePositionsLeft = ["OH", "L"];
      _possiblePositionsMiddle = ["S"];
      _possiblePositionsRight = ["OP", "M"];
    } else if (_teamSize == 4) {
      _possiblePositionsLeft = ["OH"];
      _possiblePositionsMiddle = ["S", "M", "L"];
      _possiblePositionsRight = ["OP"];
    } else if (_teamSize == 5) {
      _positions = ["OH", "L", "OP", "M", "S"];
    } else if (_teamSize == 6) {
      _positions = ["OH", "OH", "L", "OP", "M", "S"];
    }
    _playerList = List(); //makes an empty list, leaving it empty for now
  }

  //getters:
  String getTeamName() {
    return _teamName;
  }

  List<Player> getPlayersOnTeam() {
    return _playerList;
  }

  //for team sizes 5-6
  List<String> getPositions() {
    return _positions;
  }

  //the following three are for team sizes 2-4:
  List<String> getPossiblePositionsLeft() {
    return _possiblePositionsLeft;
  }

  List<String> getPossiblePositionsRight() {
    return _possiblePositionsRight;
  }

  List<String> getPossiblePositionsMiddle() {
    return _possiblePositionsMiddle;
  }

  //precondition: 2 <= _teamSize <= 6
  bool isTeamFull() {
    if ((_teamSize == 5) || (_teamSize == 6)) {
      return _positions.isEmpty;
    } else {
      //all three lists must be empty for the team to be full
      return (_possiblePositionsLeft.isEmpty &&
          _possiblePositionsMiddle.isEmpty &&
          _possiblePositionsRight.isEmpty);
    }
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

  //clears a team when the team is done playing
  void clearTeam(Object o) {
    Team team = o;
    for (int i = 0; i < team._teamSize; i++) {
      team.removePlayer(i);
    }
  }

  //not sure how to return the player list so it can be printed
  /*
  String toString() {
    return "Team name: $getTeamName() " + "Team size: $_playerList.size";
  }*/
}
