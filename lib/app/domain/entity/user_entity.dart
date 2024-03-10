class User {
  final int? usrId;
  final String usrEmail;
  final String usrPassword;

  User({
    this.usrId,
    required this.usrEmail,
    required this.usrPassword,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        usrId: json["usrId"],
        usrEmail: json["usrEmail"],
        usrPassword: json["usrPassword"],
      );

  Map<String, dynamic> toJson() => {
        "usrId": usrId,
        "usrEmail": usrEmail,
        "usrPassword": usrPassword,
      };
}