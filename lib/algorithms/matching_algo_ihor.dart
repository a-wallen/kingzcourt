import 'package:kingzcourt/classes/Playlist.dart';
import 'package:kingzcourt/classes/player.dart';
import 'package:kingzcourt/classes/team_ihor.dart';

//optional: 1 defense specialist
//Input: Playlist
//Output: 2 lists, one for each team

void algorithm(Team team1, Team team2, Playlist playlist) {
  Player currentPlayer;
  Player firstPlayer; //to be matched and removed in while loop

  //TODO Make check if playlist is less then teams size;
  if (playlist.length < team1.teamSize + team2.teamSize) {
    print('ALERT_' * 5);
  }

  int index;
  int curNumberWaited;
  int curCheckPlayer = playlist.first.getWaitingTime();

  while (!team1.isTeamFull() || !team2.isTeamFull()) {
    index = 0;
    curNumberWaited = playlist.numberOfPlayersByWaitingTime(curCheckPlayer);

    for (int i = 0; index < curNumberWaited; i++) {
      currentPlayer = playlist.elementAt(index);
      if (currentPlayer.getSkipGame() == false) {
        if (i % 2 == 0) {
          if (team1.isPositionAvailiable(currentPlayer.getPosition())) {
            team1.addPlayer(currentPlayer);
            team1.removePosition(currentPlayer.getPosition());
            playlist.remove(currentPlayer);
            curNumberWaited--;
          } else if (team2.isPositionAvailiable(currentPlayer.getPosition())) {
            team2.addPlayer(currentPlayer);
            team2.removePosition(currentPlayer.getPosition());
            playlist.remove(currentPlayer);
            curNumberWaited--;
          } else {
            index++;
          }
        } else {
          if (team2.isPositionAvailiable(currentPlayer.getPosition())) {
            team2.addPlayer(currentPlayer);
            team2.removePosition(currentPlayer.getPosition());
            playlist.remove(currentPlayer);
            curNumberWaited--;
          } else if (team1.isPositionAvailiable(currentPlayer.getPosition())) {
            team1.addPlayer(currentPlayer);
            team1.removePosition(currentPlayer.getPosition());
            playlist.remove(currentPlayer);
            curNumberWaited--;
          } else {
            index++;
          }
        }
      }
    }

    while (
        curNumberWaited != 0 && (!team1.isTeamFull() || !team2.isTeamFull())) {
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
    curCheckPlayer--;
  }

  // while ((!team1.isTeamFull() || !team2.isTeamFull()) && playlist.isNotEmpty) {
  //   firstPlayer = playlist.first;
  //   if (team1.isTeamFull() == false) {
  //     team1.addPlayer(firstPlayer);
  //     team1.getPositions().remove(team1.getPositions().last);
  //     playlist.remove(firstPlayer);
  //   } else if (team2.isTeamFull() == false) {
  //     team2.addPlayer(firstPlayer);
  //     team2.getPositions().remove(team2.getPositions().last);
  //     playlist.remove(firstPlayer);
  //   }
  // }

  for (Player player in playlist) {
    player.increaseWaitingTime();
    player.changeSkipGame();
  }
}
