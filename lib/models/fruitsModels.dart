class fruits{

  fruits({
    this.sweetShop = "",
    this.phoneNumber = "",

  });
  String sweetShop;
  String phoneNumber;


  factory fruits.fromJson(Map<String, dynamic> json) => fruits(
    sweetShop: json["sweetShop"],
    phoneNumber: json["phoneNumber"],

  );

  Map<String, dynamic> toJson() => {
    "sweetShop": sweetShop,
    "phoneNumber": phoneNumber,
  };


}

