class Decorations{

  Decorations({
    this.decorationshopName = "",
    this.phoneNumber = "",

  });
  String decorationshopName;
  String phoneNumber;


  factory Decorations.fromJson(Map<String, dynamic> json) => Decorations(
    decorationshopName: json["decorationshopName"],
    phoneNumber: json["phoneNumber"],

  );

  Map<String, dynamic> toJson() => {
    "decorationshopName": decorationshopName,
    "phoneNumber": phoneNumber,
  };


}



