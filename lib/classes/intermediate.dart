class Intermediate {
  int _pid;
  int _gid;

  Intermediate(this._pid, this._gid);

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    if (_pid != null) map['pid'] = _pid;
    if (_gid != null) map['gid'] = _gid;
    return map;
  }

  Intermediate.fromMap(Map<String, dynamic> map) {
    this._pid = map['pid'];
    this._gid = map['gid'];
  }

  int get pid => _pid;

  set pid(int value) => _pid = value;

  int get gid => _gid;

  set gid(int value) => _gid = value;
}
