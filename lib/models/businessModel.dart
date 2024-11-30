class BusinessModel{

  BusinessModel({
    this.businessID = "",
    this.businessName = "",
    this.address = "",
    this.phone1 = "",
    this.phone2 = "",
    this.capcity = 0,
    this.price = 0,
    this.businessTypeID = 0,

  });
  String businessID;
  String businessName;
  String address;
  String phone1;
  String phone2;
  int capcity;
  int price;
  int businessTypeID;


  factory BusinessModel.fromJson(Map<String, dynamic> json) => BusinessModel(
      businessID: json["businessID"],
      businessName: json["businessName"],
      address: json["address"],
      phone1: json["phone1"],
      phone2: json["phone2"],
      capcity: json["capcity"],
      price: json["price"],
      businessTypeID: json["businessTypeID"],

  );

  Map<String, dynamic> toJson() => {
    "businessID": businessID,
    "businessName": businessName,
    "address": address,
    "phone1": phone1,
    "phone2": phone2,
    "capcity": capcity,
    "price": price,
    "businessTypeID": businessTypeID,

  };


}
