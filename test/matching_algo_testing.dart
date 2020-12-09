import 'package:kingzcourt/classes/Playlist.dart';
import 'package:kingzcourt/classes/player.dart';
import 'package:kingzcourt/classes/team_ihor.dart';
import 'package:kingzcourt/algorithms/matching_algo_ihor.dart';

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
    Player("Thomas", "Lastname", "S", 0, "path/path"),
    Player("Jane", "Alastname", "OH", 0, "path/path"),
    Player("Rudy", "AnotherLastname", "DS", 0, "path/path"),
    Player("David", "Stanko", "M", 0, "path/path"),
    Player("Jonas", "Lastname", "S", 0, "path/path"),
    Player("Kylie", "Lastname", "OP", 0, "path/path"),
    Player("Christine", "Johnson", "S", 0, "path/path"),
    Player("Zachary", "Jones", "M", 0, "path/path"),
    Player("Amanda", "Carr", "DS", 0, "path/path"),
    Player("Tina", "Lastname", "DS", 0, "path/path")
  ];
  playlist.addAll(players);
  Team team1 = Team("Team 1", 6);
  Team team2 = Team("Team 2", 6);

  Team team3 = Team("Team 3", 5);
  Team team4 = Team("Team 4", 5);

  Team team5 = Team("Team 5", 2);
  Team team6 = Team("Team 6", 2);

  algorithm(team1, team2, playlist);

  for (Player player in team1.getPlayersOnTeam()) {
    print(player);
  }
  print("---" * 10);

  for (Player player in team2.getPlayersOnTeam()) {
    print(player);
  }

  /*match5To6(team3, team4, playlist);

  for (Player player in team3.getPlayersOnTeam()) {
    print(player);
  }
  print("---" * 10);

  for (Player player in team4.getPlayersOnTeam()) {
    print(player);
  }

  match2(team5, team6, playlist);

  for (Player player in team5.getPlayersOnTeam()) {
    print(player);
  }
  print("---" * 10);

  for (Player player in team6.getPlayersOnTeam()) {
    print(player);
  }*/
}
