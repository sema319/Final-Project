class PaymentsType{

  PaymentsType({
    this.sweetShop = "",
    this.phoneNumber = "",

  });
  String sweetShop;
  String phoneNumber;


  factory PaymentsType.fromJson(Map<String, dynamic> json) => PaymentsType(
    sweetShop: json["sweetShop"],
    phoneNumber: json["phoneNumber"],

  );

  Map<String, dynamic> toJson() => {
    "sweetShop": sweetShop,
    "phoneNumber": phoneNumber,
  };


}
