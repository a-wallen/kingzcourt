import 'package:kingzcourt/classes/Playlist.dart';
import 'package:kingzcourt/classes/player.dart';
import 'package:kingzcourt/classes/team.dart';
import '../test/matching_algo_testing.dart';
import 'dart:math';

List<String> positions = ["OH", "OH", "L", "OP", "M", "S"];
const int TEAM_SIZE = 6;
//optional: 1 defense specialist
//Input: Playlist
//Output: 2 lists, one for each team

//List<Player> nextPlayers;

void algorithm(Team team1, Team team2, Playlist playlist) {
  //Team team1 = Team("Team 1");
  //Team team2 = Team("Team 2");

  List<String> positionsTeam1 = positions; //positions for Team 1.
  List<String> positionsTeam2 = positions;

  //int randNum;

  Player currentPlayer;
  Player firstPlayer; //to be matched and removed in while loop
  //playlist.add(Player("Alex", "Wallen", "L", 0, "filePath"));

  for (int i = 0; i < playlist.length; i++) {
    currentPlayer = playlist.elementAt(i);
    if (currentPlayer.getSkipGame() == false) {
      if (positionsTeam1.contains(currentPlayer.getPosition())) {
        team1.addPlayer(currentPlayer);
        positionsTeam1.remove(currentPlayer.getPosition());
        playlist.remove(currentPlayer);
      } else if (positionsTeam2.contains(currentPlayer.getPosition())) {
        team2.addPlayer(currentPlayer);
        positionsTeam2.remove(currentPlayer.getPosition());
        playlist.remove(currentPlayer);
      }
    }
  }

  while ((team1.isTeamFull() == false) || (team2.isTeamFull() == false)) {
    firstPlayer = playlist.first;
    if (team1.isTeamFull() == false) {
      team1.addPlayer(firstPlayer);
      playlist.remove(firstPlayer);
    } else if (team2.isTeamFull() == false) {
      team2.addPlayer(firstPlayer);
      playlist.remove(firstPlayer);
    }
  }
}
