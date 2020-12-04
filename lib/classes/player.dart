class Player {
  //String rank;
  int _pid; // player id (for database)
  String _name; //player name
  String _position;
  String _imageFilePath; //file path to the profile picture
  int _waitingTime; //measured by the number of games waited

  //don't need pid because it's given from database
  Player(String myName, String myPosition, String myImageFilePath) {
    _name = myName;
    _position = myPosition;
    _waitingTime = 0;
    _imageFilePath = myImageFilePath;
  }

  // this method is for the database
  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    if (_pid != null) map['pid'] = _pid;
    map['name'] = _name;
    map['position'] = _position;
    map['imageFilePath'] = _imageFilePath;
    return map;
  }

  // Also for the databse
  Player.fromMap(Map<String, dynamic> map) {
    this._pid = map['pid'];
    this._name = map['name'];
    this._position = map['position'];
    this._imageFilePath = map['imageFilePath'];
  }

  //getters:
  String getName() {
    return _name;
  }

  String getPosition() {
    return _position;
  }

  int getWaitingTime() {
    return _waitingTime;
  }

  String getImageFilePath() {
    return _imageFilePath;
  }

  //setters:
  void setName(String newName) {
    _name = newName;
  }

  void setPosition(String newPosition) {
    _position = newPosition;
  }

  //adds one more game to user's waiting time
  void increaseWaitingTime() {
    _waitingTime++;
  }

  //sets the waiting time to -1 to indicate that the player wants to play ASAP
  void playASAP() {
    _waitingTime = -1;
  }

  void setImageFilePath(String newImageFilePath) {
    _imageFilePath = newImageFilePath;
  }

  //checks if one player is equal to another to avoid the same player being added multiple times
  bool equals(Object o) {
    //if (this._pid == o) return true;
    Player player = o;
    return (this._pid == player._pid);
  }

  //idea: players should have unique names, so when a player is added,
  //they cannot have the same name as an existing player

  /*String toString() {
    return "Player name: $getName " +
        " Player position: $getPosition() " +
        " Waiting time: $getWaitingTime() " +
        " File path to their profile picture: $getImageFilePath() ";
  }*/
}
