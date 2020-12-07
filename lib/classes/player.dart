class Player {
  //String rank;
  int _pid; // player id (for database)
  String _last_name; //player name
  String _first_name; //player name
  String _position;
  String _imageFilePath; //file path to the profile picture
  bool _skipGame = false; //whether player wants to skip a game

  int _waitingTime; //measured by the number of games waited

  Player(String myFirstName, String myLastName, String myPosition,
      int myWaitingTime, String myImageFilePath) {
    this._first_name = myFirstName;
    this._last_name = myLastName;
    this._position = myPosition;
    this._waitingTime = myWaitingTime;
    this._imageFilePath = myImageFilePath;
  }

  // this method is for the database
  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    if (_pid != null) map['p_id'] = _pid;
    map['first_name'] = _first_name;
    map['last_name'] = _last_name;
    map['position'] = _position;
    map['imageFilePath'] = _imageFilePath;
    return map;
  }

  // Also for the databse
  Player.fromMap(Map<String, dynamic> map) {
    this._pid = map['p_id'];
    this._first_name = map['first_name'];
    this._last_name = map['last_name'];
    this._position = map['position'];
    this._imageFilePath = map['imageFilePath'];
  }

  //getters:
  String getFirstName() {
    return this._first_name;
  }

  String getLastName() {
    return this._last_name;
  }

  String getPosition() {
    return this._position;
  }

  int getWaitingTime() {
    return this._waitingTime;
  }

  int getId() {
    return this._pid;
  }

  String getImageFilePath() {
    return this._imageFilePath;
  }

  bool getSkipGame() {
    return this._skipGame;
  }

  //setters:
  void setFirstName(String newName) {
    _first_name = newName;
  }

  void setLastName(String newName) {
    _last_name = newName;
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

  void changeSkipGame() {
    _skipGame = !_skipGame;
  }

  //checks if one player is equal to another to avoid the same player being added multiple times
  bool equals(Object o) {
    if (this == o) return true;
    Player player = o;
    return (player._first_name == this._first_name &&
        player._last_name == this._last_name &&
        player._position == this._position &&
        player._waitingTime == this._waitingTime &&
        player._imageFilePath == this._imageFilePath);
  }

  //idea: players should have unique names, so when a player is added,
  //they cannot have the same name as an existing player

  @override
  String toString() {
    return 'Player id: ${this._pid} ' +
        'Player name: $_first_name $_last_name ' +
        ' Player position: $_position ' +
        ' Waiting time: $_waitingTime ' +
        ' File path to their profile picture: $_imageFilePath ';
  }
}
