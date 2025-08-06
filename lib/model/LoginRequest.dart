class LoginRequest {

  LoginRequest({
      this.username, 
      this.password, 
      this.expiresInMins,});

  LoginRequest.fromJson(dynamic json) {
    username = json['username'];
    password = json['password'];
    expiresInMins = json['expiresInMins'];
  }

  String? username;
  String? password;
  num? expiresInMins;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['username'] = username;
    map['password'] = password;
    map['expiresInMins'] = expiresInMins;
    return map;
  }

}