class BusinessModel{

  BusinessModel({
    this.businessID = "",
    this.businessName = "",
    this.address = "",
    this.phone1 = "",
    this.phone2 = "",
    // this.capacity = 0,
    // this.price = 0,
    // this.businessTypeID = 0,

  });
  String businessID;
  String businessName;
  String address;
  String phone1;
  String phone2;
  // int capacity;
  // int price;
  // int businessTypeID;


  /*factory BusinessModel.fromJson(Map<String, dynamic> json) => BusinessModel(
      businessID: json["businessID"],
      businessName: json["businessName"],
      address: json["address"],
      phone1: json["phone1"],
      phone2: json["phone2"],
      capacity: json["capacity"],
      price: json["price"],
      businessTypeID: json["businessTypeID"],
  );*/


  // [{"businessID":1,"businessName":"lalune","address":"baqa","phone1":"0463333223","phone2":"0521231231","capacity":300,"price":4000,"businessTypeID":6,"imageURL":""},{"businessID":2,"businessName":"alnor","address":"baqa","phone1":"0463333223","phone2":"0521231231","capacity":500,"price":4500,"businessTypeID":6,"imageURL":""},{"businessID":3,"businessName":"fruits shop","address":"jatt","phone1":"055555","phone2":"","capacity":0,"price":0,"businessTypeID":3,"imageURL":""}]


  factory BusinessModel.fromJson(Map<String, dynamic> json) {
    return BusinessModel(
      businessID: json['businessID'],
      businessName: json["businessName"],
      address: json["address"],
      phone1: json["phone1"],
      phone2: json["phone2"],
      // capacity: json["capcity"],
      // price: json["price"],
      // businessTypeID: json["businessTypeID"]
    );
  }



  Map<String, dynamic> toJson() => {
    "businessID": businessID,
    "businessName": businessName,
    "address": address,
    "phone1": phone1,
    "phone2": phone2,
    // "capacity": capacity,
    // "price": price,
    // "businessTypeID": businessTypeID,

  };






}
