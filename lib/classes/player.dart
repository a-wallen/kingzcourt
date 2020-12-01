class Player {
  //String rank;
  String position;
  int waitingTime;
  String imageFilePath; //file path to the profile picture

  Player(String myPosition, int myWaitingTime, String myImageFilePath) {
    position = myPosition;
    waitingTime = myWaitingTime;
    imageFilePath = myImageFilePath;
  }
}
