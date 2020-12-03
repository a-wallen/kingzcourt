class Intermediate {
  String _pid;
  String _gid;

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

  String get pid => _pid;

  set pid(String value) => _pid = value;

  String get gid => _gid;

  set gid(String value) => _gid = value;
}
