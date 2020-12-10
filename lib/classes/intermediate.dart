class Intermediate {
  int _pid;
  int _gid;

  Intermediate(this._pid, this._gid);

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    if (_pid != null) map['p_id'] = _pid;
    if (_gid != null) map['g_id'] = _gid;
    return map;
  }

  Intermediate.fromMap(Map<String, dynamic> map) {
    this._pid = map['p_id'];
    this._gid = map['g_id'];
  }

  String toString() {
    return 'group_id: ${this._gid}. player_id: ${this._pid}';
  }

  int get pid => _pid;

  set pid(int value) => _pid = value;

  int get gid => _gid;

  set gid(int value) => _gid = value;
}
