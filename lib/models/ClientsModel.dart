class Clients{

  Clients({
    this.clientID = "",
    this.clientName = "",
    this.phoneNumber = "",
    this.email = "",

  });
  String clientID;
  String clientName;
  String phoneNumber;
  String email;


  factory Clients.fromJson(Map<String, dynamic> json) => Clients(
    clientID: json["clientID"],
    clientName: json["clientName"],
    phoneNumber: json["phoneNumber"],
    email: json["email"],

  );

  Map<String, dynamic> toJson() => {
    "clientID": clientID,
    "clientName": clientName,
    "phoneNumber": phoneNumber,
    "email": email,
  };

  void addValue(String newclientID, String newclientName, String newemail, String newphoneNumber)
  {
    clientID = newclientID;
    clientName = newclientName;
    email = newemail;
    phoneNumber = newphoneNumber;

  }

}
