class DJ{

  DJ({
    this.djName = "",
    this.phoneNumber = "",

  });
  String djName;
  String phoneNumber;


  factory DJ.fromJson(Map<String, dynamic> json) => DJ(
    djName: json["djName"],
    phoneNumber: json["phoneNumber"],

  );

  Map<String, dynamic> toJson() => {
    "djName": djName,
    "phoneNumber": phoneNumber,
  };


}


