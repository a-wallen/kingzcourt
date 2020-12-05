import 'package:kingzcourt/classes/Playlist.dart';
import 'package:kingzcourt/classes/player.dart';
import 'package:kingzcourt/classes/team.dart';
import '../test/matching_algo_testing.dart';

List<String> positions = ["OH", "OH", "L", "OP", "M", "S"];
const int TEAM_SIZE = 6;
//optional: 1 defense specialist
//Input: Playlist
//Output: 2 lists, one for each team

//List<Player> nextPlayers;

void algorithm(Team team1, Team team2, Playlist playlist) {
  Player currentPlayer;
  Player firstPlayer; //to be matched and removed in while loop
  //playlist.add(Player("Alex", "Wallen", "L", 0, "filePath"));

  List<Player> staticPlaylist = playlist.convertToList();

  for (int i = 0; i < staticPlaylist.length; i++) {
    currentPlayer = staticPlaylist[i];
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
        }
      }
    }
  }

  while ((team1.isTeamFull() == false) || (team2.isTeamFull() == false)) {
    if (playlist.first == null) print('null');
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
}
