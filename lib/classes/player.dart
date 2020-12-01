class Player {
  //String rank;
  String position;
  int waitingTime; //measured by the number of games waited
  String imageFilePath; //file path to the profile picture

  Player(String myPosition, int myWaitingTime, String myImageFilePath) {
    position = myPosition;
    waitingTime = myWaitingTime;
    imageFilePath = myImageFilePath;
  }

  //getters:
  String getPosition() {
    return position;
  }

  int getWaitingTime() {
    return waitingTime;
  }

  String getImageFilePath() {
    return imageFilePath;
  }

  //setters:
  void setPosition(String newPosition) {
    position = newPosition;
  }

  //adds one more game to user's waiting time
  void increaseWaitingTime() {
    waitingTime++;
  }

  //sets the waiting time to -1 to indicate that the player wants to play ASAP
  void playASAP() {
    waitingTime = -1;
  }

  void setImageFilePath(String newImageFilePath) {
    imageFilePath = newImageFilePath;
  }
}
