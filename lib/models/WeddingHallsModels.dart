class WeddingHalls{

  WeddingHalls({
    this.hallName = "",
    this.phoneNumber = "",
    this.capacity = "",
    this.location = "",
    this.price = 0,

  });
  String hallName;
  String phoneNumber;
  String capacity;
  String location;
  int price;


  factory WeddingHalls.fromJson(Map<String, dynamic> json) => WeddingHalls(
    hallName: json["hallName"],
    phoneNumber: json["PhoneNumber"],
    capacity: json["capacity"],
    location: json["location"],
    price: json["price"],

  );

  Map<String, dynamic> toJson() => {
    "hallName": hallName,
    "phoneNumber": phoneNumber,
    "capacity": capacity,
    "location": location,
    "price": price,
  };


}
