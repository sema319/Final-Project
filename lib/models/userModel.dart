class User{

  User({
    this.firstName = "",
    this.lastName = "",
    this.email = "",
    this.password = "",
    this.phoneNumber = "",

  });
  String firstName;
  String lastName;
  String email;
  String password;
  String phoneNumber;


  factory User.fromJson(Map<String, dynamic> json) => User(
    firstName: json["firstName"],
    lastName: json["lastName"],
    email: json["email"],
    password: json["password"],
    phoneNumber: json["phoneNumber"],

  );

  Map<String, dynamic> toJson() => {
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
    "password": password,
    "phoneNumber": phoneNumber,
  };


}
