import 'package:kingzcourt/classes/Playlist.dart';
import 'package:kingzcourt/classes/player.dart';
import 'package:kingzcourt/classes/team.dart';

//optional: 1 defense specialist
//Input: Playlist
//Output: 2 lists, one for each team

void match5To6(Team team1, Team team2, Playlist playlist) {
  //if teamSize >= 5, do the following:
  Player currentPlayer;
  Player firstPlayer; //to be matched and removed in while loop

  int index = 0;

  for (int i = 0; index < playlist.length; i++) {
    currentPlayer = playlist.elementAt(index);
    if (currentPlayer.getSkipGame() == false) {
      if (i % 2 == 0) {
        if (team1.getPositions().contains(currentPlayer.getPosition())) {
          team1.addPlayer(currentPlayer);
          team1.getPositions().remove(currentPlayer.getPosition());
          playlist.remove(currentPlayer);
        } else if (team2.getPositions().contains(currentPlayer.getPosition())) {
          team2.addPlayer(currentPlayer);
          team2.getPositions().remove(currentPlayer.getPosition());
          playlist.remove(currentPlayer);
        } else {
          index++;
        }
      } else {
        if (team2.getPositions().contains(currentPlayer.getPosition())) {
          team2.addPlayer(currentPlayer);
          team2.getPositions().remove(currentPlayer.getPosition());
          playlist.remove(currentPlayer);
        } else if (team1.getPositions().contains(currentPlayer.getPosition())) {
          team1.addPlayer(currentPlayer);
          team1.getPositions().remove(currentPlayer.getPosition());
          playlist.remove(currentPlayer);
        } else {
          index++;
        }
      }
    }
  }

  while ((!team1.isTeamFull() || !team2.isTeamFull()) && playlist.isNotEmpty) {
    firstPlayer = playlist.first;
    if (team1.isTeamFull() == false) {
      team1.addPlayer(firstPlayer);
      team1.getPositions().remove(team1.getPositions().last);
      playlist.remove(firstPlayer);
    } else if (team2.isTeamFull() == false) {
      team2.addPlayer(firstPlayer);
      team2.getPositions().remove(team2.getPositions().last);
      playlist.remove(firstPlayer);
    }
  }

  for (Player player in playlist) {
    player.increaseWaitingTime();
    player.changeSkipGame();
  }

  //else if teamSize < 5, call match2To4
}

//matches teams for Beach VB, with a team size of 2
void match2(Team team1, Team team2, Playlist playlist) {
  Player currentPlayer; //the player at the current iteration of the for loop
  Player firstPlayer; //the first player in the playlist

  //these lists store the positions at each spot (left/right) for team1 and team2, respectively
  List<String> leftPositionsTeam1 = team1.getPossiblePositionsLeft();
  List<String> rightPositionsTeam1 = team1.getPossiblePositionsRight();
  List<String> leftPositionsTeam2 = team2.getPossiblePositionsLeft();
  List<String> rightPositionsTeam2 = team2.getPossiblePositionsRight();

  for (int i = 0; i < playlist.length; i++) {
    currentPlayer = playlist.elementAt(i);

    //if the player has a position that can take the left spot on team 1, add them there
    if (leftPositionsTeam1.contains(currentPlayer.getPosition())) {
      team1.addPlayer(currentPlayer);
      leftPositionsTeam1.remove(currentPlayer.getPosition());
      playlist.remove(currentPlayer);
    }
    //else if the player has a position that can take the right spot on team 1, add them there
    else if (rightPositionsTeam1.contains(currentPlayer.getPosition())) {
      team1.addPlayer(currentPlayer);
      rightPositionsTeam1.remove(currentPlayer.getPosition());
      playlist.remove(currentPlayer);
    }
    //else if they have a position that can take the left spot on team 2, add them there
    else if (leftPositionsTeam2.contains(currentPlayer.getPosition())) {
      team2.addPlayer(currentPlayer);
      leftPositionsTeam2.remove(currentPlayer);
      playlist.remove(currentPlayer);
    }
    //else if they have a position that can take the right spot on team 2, add them there
    else if (rightPositionsTeam2.contains(currentPlayer.getPosition())) {
      team2.addPlayer(currentPlayer);
      rightPositionsTeam2.remove(currentPlayer);
    }
  }

  while ((!team1.isTeamFull() || !team2.isTeamFull()) && playlist.isNotEmpty) {
    firstPlayer = playlist.first;
    if (leftPositionsTeam1.isNotEmpty) {
      team1.addPlayer(firstPlayer);
      leftPositionsTeam1.remove(firstPlayer);
      playlist.remove(firstPlayer);
    } else if (rightPositionsTeam1.isNotEmpty) {
      team1.addPlayer(firstPlayer);
      rightPositionsTeam1.remove(firstPlayer);
      playlist.remove(firstPlayer);
    } else if (leftPositionsTeam2.isNotEmpty) {
      team2.addPlayer(firstPlayer);
      leftPositionsTeam2.remove(firstPlayer);
      playlist.remove(firstPlayer);
    } else if (rightPositionsTeam2.isNotEmpty) {
      team2.addPlayer(firstPlayer);
      rightPositionsTeam2.remove(firstPlayer);
      playlist.remove(firstPlayer);
    }
  }
}

/*void match2To4(Team team1, Team team2, Playlist playlist) {
  Player currentPlayer;
  Player firstPlayer; //to be matched and removed in while loop

  //these lists store the positions at each spot (left/right/middle) for team1 and team2, respectively
  List<String> team1LeftPositions = team1.getPossiblePositionsLeft();
  List<String> team1MidPositions = team1.getPossiblePositionsMiddle();
  List<String> team1RightPositions = team1.getPossiblePositionsRight();

  List<String> team2LeftPositions = team2.getPossiblePositionsLeft();
  List<String> team2MidPositions = team2.getPossiblePositionsMiddle();
  List<String> team2RightPositions = team2.getPossiblePositionsRight();

  int index = 0;

  //...matching goes here...
  for (int i = 0; index < playlist.length; i++) {
    currentPlayer = playlist.elementAt(index);
    if (currentPlayer.getSkipGame() == false) {
      if (i % 2 == 0) {
        if (team1LeftPositions.contains(currentPlayer.getPosition())) {
          team1.addPlayer(currentPlayer);
          team1LeftPositions.remove(currentPlayer.getPosition());
          playlist.remove(currentPlayer);
        } else if (team2LeftPositions.contains(currentPlayer.getPosition())) {
          team2.addPlayer(currentPlayer);
          team2LeftPositions.remove(currentPlayer.getPosition());
          playlist.remove(currentPlayer);
        } else {
          index++;
        }
      } else {
        if (team2LeftPositions.contains(currentPlayer.getPosition())) {
          team2.addPlayer(currentPlayer);
          team2LeftPositions.remove(currentPlayer.getPosition());
          playlist.remove(currentPlayer);
        } else if (team1LeftPositions.contains(currentPlayer.getPosition())) {
          team1.addPlayer(currentPlayer);
          team1LeftPositions.remove(currentPlayer.getPosition());
          playlist.remove(currentPlayer);
        } else {
          index++;
        }
      }
    }
  }

  while (!team1LeftPositions.isEmpty) {}

  while ((!team1.isTeamFull() || !team2.isTeamFull()) && playlist.isNotEmpty) {
    firstPlayer = playlist.first;
    if (team1.isTeamFull() == false) {
      team1.addPlayer(firstPlayer);
      team1.getPositions().remove(team1.getPositions().last);
      playlist.remove(firstPlayer);
    } else if (team2.isTeamFull() == false) {
      team2.addPlayer(firstPlayer);
      team2.getPositions().remove(team2.getPositions().last);
      playlist.remove(firstPlayer);
    }
  }

  for (Player player in playlist) {
    player.increaseWaitingTime();
    player.changeSkipGame();
  }
}*/
