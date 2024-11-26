class User{

  User({
    this.firstName = "",
    this.lastName = "",
    this.phoneNumber = "",
    this.password = "",

  });
  String firstName;
  String lastName;
  String phoneNumber;
  String password;


  factory User.fromJson(Map<String, dynamic> json) => User(
    firstName: json["firstName"],
    lastName: json["lastName"],
    phoneNumber: json["phoneNumber"],
    password: json["password"],

  );

  Map<String, dynamic> toJson() => {
    "firstName": firstName,
    "lastName": lastName,
    "phoneNumber": phoneNumber,
    "password": password,
  };


}
