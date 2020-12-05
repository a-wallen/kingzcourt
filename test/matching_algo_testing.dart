import 'package:kingzcourt/classes/Playlist.dart';
import 'package:kingzcourt/classes/player.dart';
import 'package:kingzcourt/classes/team.dart';
import '../algorithms/matching_algo.dart';

void main() {
  Playlist playlist = Playlist();
  List<Player> players = [
    Player("Alex", "Wallen", "OH", 0, "path/path"),
    Player("Kat", "Outcalt", "OP", 0, "path/path"),
    Player("Andrew", "Varela", "DS", 0, "path/path"),
    Player("Ezra", "Sackstein", "S", 0, "path/path"),
    Player("Hector", "Herrada", "OH", 0, "path/path"),
    Player("Ihor", "Sherstiuk", "M", 0, "path/path"),
    Player("Bryce", "Chinn", "M", 0, "path/path"),
    Player("Kainalu", "Lastname", "S", 0, "path/path"),
    Player("Lokene", "Lastname", "DS", 0, "path/path"),
    Player("Kiran", "Lastname", "OH", 0, "path/path"),
    Player("Cole", "Lastname", "M", 0, "path/path"),
    Player("Mitchell", "Lastname", "OP", 0, "path/path"),
    Player("Ethan", "Lastname", "OP", 0, "path/path"),
    Player("Evan", "Lastname2", "DS", 0, "path/path"),
    Player("Jameson", "Lastname3", "S", 0, "path/path"),
    Player("Madison", "Lastname4", "S", 0, "path/path"),
    Player("Riley", "Lastname5", "S", 0, "path/path"),
    Player("Dax", "Lastname6", "S", 0, "path/path"),
    Player("Kyle", "Lastname7", "OH", 0, "path/path"),
    Player("Kristen", "Lastname8", "S", 0, "path/path"),
  ];
  playlist.addAll(players);
  Team team1 = Team("Team 1");
  Team team2 = Team("Team 2");

  algorithm(team1, team2, playlist);

  print(team1.getPlayersOnTeam());
  print(team2.getPlayersOnTeam());
}
