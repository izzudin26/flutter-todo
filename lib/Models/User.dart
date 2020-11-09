class User {
  String fullName;
  User({this.fullName});

  factory User.fromJson(Map<String, dynamic> json){
    return User(fullName: json['fullname']);
  }

  Map<String, dynamic> toJson() => {
    "fullname": fullName
  };
}