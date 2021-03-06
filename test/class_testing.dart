import 'package:kingzcourt/classes/player.dart';
import 'package:kingzcourt/classes/team.dart';
import 'package:kingzcourt/classes/group.dart';

void main() {
  //testing Player class:

  Player jane = Player("Jane", "Johnson", "Outside hitter", 0, "default.jpg");
  print(
      "This is player Jane: $jane.getName() + $jane.getPosition() + $jane.getWaitingTime() + $jane.getImageFilePath()\n\n");

  jane.setFirstName("Caitlyn");
  print("Jane's name has been changed to $jane.getName()\n");

  jane.setPosition("Middle");
  print("Jane's position has been changed to $jane.getPosition()\n");

  jane.increaseWaitingTime();
  print(
      "Jane's waiting time has been increased and is now $jane.getWaitingTime()\n");

  jane.playASAP();
  print(
      "Jane wants to play ASAP, so her waiting time has been set to $jane.getWaitingTime()\n");

  jane.setImageFilePath("newImage.jpg");
  print(
      "Jane's image file path for her profile picture has been changed to $jane.getImageFilePath()\n\n");

  //testing equals() method

  Player newJane = Player("Jane", "Wallen", "Outside hitter", 0, "pic.jpg");
  if (newJane.equals(jane))
    print("newJane is equal to jane");
  else
    print("newJane is not equal to jane");

  Player anotherPlayer =
      Player("Jane", "Thompson", "Outside hitter", 0, "aPicture.jpg");
  if (anotherPlayer.equals(jane))
    print("anotherPlayer is equal to jane\n\n");
  else
    print("anotherPlayer is not equal to jane\n\n");

  //testing Group class:
  Group myGroup = Group("Group 1");
  print("Group name: $myGroup.getGroupName()");

  myGroup.addPlayer(jane);
  myGroup.addPlayer(anotherPlayer);
  myGroup.addPlayer(Player("Alex", "Wallen", "Libero", 0, "aPicture.jpg"));
  //print(myGroup.getPlayerList()); //can you print a list in Dart?
  List<Player> playerList = myGroup.getPlayerList();
  for (int i = 0; i < playerList.length; i++) {
    print(playerList[i].getFirstName());
    print(playerList[i].getPosition());
  }

  //testing Team class:
}
