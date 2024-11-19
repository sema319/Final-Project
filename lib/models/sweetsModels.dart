class Sweets{

  Sweets({
    this.sweetShop = "",
    this.phoneNumber = "",

  });
  String sweetShop;
  String phoneNumber;


  factory Sweets.fromJson(Map<String, dynamic> json) => Sweets(
    sweetShop: json["sweetShop"],
    phoneNumber: json["phoneNumber"],

  );

  Map<String, dynamic> toJson() => {
    "sweetShop": sweetShop,
    "phoneNumber": phoneNumber,
  };


}
