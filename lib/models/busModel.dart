class BusModel{

  BusModel({
    this.BussID = "",
    this.BussName = "",
    this.BussTypeID = "",
    this.BussAddress = "",


  });
  String BussID;
  String BussName;
  String BussTypeID;
  String BussAddress;


  factory BusModel.fromJson(Map<String, dynamic> json) => BusModel(
    BussID: json["BussID"],
    BussName: json["BussName"],
    BussTypeID: json["BussTypeID"],
    BussAddress: json["BussAddress"]
  );

  Map<String, dynamic> toJson() => {
    "BussID": BussID,
    "BussName": BussName,
    "BussTypeID": BussTypeID,
    "BussAddress": BussAddress,
  };


}
