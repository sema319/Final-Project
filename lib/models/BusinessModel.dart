class BusinessModel{

  BusinessModel({
    this.businessID = "",
    this.businessName = "",
    this.address = "",
    this.phone1 = "",
    this.phone2 = "",
    this.capacity = 0,
    this.price = 0,
    this.businessTypeID = 0,
    this.imageURL = "",
  });
  String businessID;
  String businessName;
  String address;
  String phone1;
  String phone2;
  int capacity;
  int price;
  int businessTypeID;
  String imageURL;

  
  factory BusinessModel.fromJson(Map<String, dynamic> json) {
    return BusinessModel(
      businessID: json['businessID'],
      businessName: json["businessName"],
      address: json["address"],
      phone1: json["phone1"],
      phone2: json["phone2"],
      capacity: json["capacity"],
      price: json["price"],
      businessTypeID: json["businessTypeID"],
        imageURL: json["imageURL"]

    );
  }



  Map<String, dynamic> toJson() => {
    "businessID": businessID,
    "businessName": businessName,
    "address": address,
    "phone1": phone1,
    "phone2": phone2,
    "capacity": capacity,
    "price": price,
    "businessTypeID": businessTypeID,
    "imageURL": imageURL,

  };






}
