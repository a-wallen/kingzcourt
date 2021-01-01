import 'package:kingzcourt/classes/player.dart';

class Team {
  String _teamName;
  int _teamSize; //2-6 players
  List<Player> _playerList; //list of Players on the Team

  List<Object> _positions;

  Team(String myTeamName, int myTeamSize) {
    _teamName = myTeamName;

    updateTeamSize(myTeamSize);

    _playerList = List(); //makes an empty list, leaving it empty for now
  }

  //getters:
  String getTeamName() {
    return _teamName;
  }

  List<Player> getPlayersOnTeam() {
    return _playerList;
  }

  List<Object> getPositions() {
    return _positions;
  }

  int get teamSize => _teamSize;

  void removePosition(String position) {
    if (_teamSize == 5 || _teamSize == 6) {
      _positions.remove(position);
      return;
    } else {
      for (Object o in _positions) {
        if (o.runtimeType != String) {
          if ((o as List<String>).contains(position)) {
            _positions.remove(o);
            return;
          }
        } else if ((o as String) == position) {
          _positions.remove(o);
          return;
        }
      }
    }
  }

  bool isPositionAvailiable(String position) {
    bool isAvailiable = false;
    if (_teamSize == 5 || _teamSize == 6) {
      return _positions.contains(position);
    } else {
      for (Object o in _positions) {
        if (o.runtimeType != String) {
          if ((o as List<String>).contains(position)) {
            isAvailiable = true;
            return isAvailiable;
          }
        } else {
          if ((o as String) == position) {
            isAvailiable = true;
            return isAvailiable;
          }
        }
      }
    }
    return isAvailiable;
  }

  bool isTeamFull() {
    return _positions.isEmpty;
  }

  bool isNotEmpty() {
    return _playerList.isNotEmpty;
  }

  void updateTeamSize(int newTeamSize) {
    _teamSize = newTeamSize;

    switch (newTeamSize) {
      case 2:
        _positions = [
          ['OH', 'L'],
          ['OP', 'M', 'S']
        ];
        break;
      case 3:
        _positions = [
          ['L', 'OH'],
          'S',
          ['OP', 'M']
        ];
        break;
      case 4:
        _positions = [
          'OH',
          'OP',
          'S',
          ['M', 'L']
        ];
        break;
      case 5:
        _positions = ['OH', 'OP', 'S', 'M', 'L'];
        break;
      case 6:
        _positions = ['OH', 'OH', 'OP', 'S', 'M', 'L'];
        break;
      default:
        _positions = ['OH', 'OH', 'OP', 'S', 'M', 'L'];
        break;
    }
  }

  //clears team when done playing, but still keeps number of positions
  void clearTeam() {
    _playerList.clear();
    updateTeamSize(_teamSize);
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

  //not sure how to return the player list so it can be printed
  /*
  String toString() {
    return "Team name: $getTeamName() " + "Team size: $_playerList.size";
  }*/
}
