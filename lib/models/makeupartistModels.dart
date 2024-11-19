class MakeupArtist{

  MakeupArtist({
    this.artistName = "",
    this.phoneNumber = "",

  });
  String artistName;
  String phoneNumber;


  factory MakeupArtist.fromJson(Map<String, dynamic> json) => MakeupArtist(
    artistName: json["artistName"],
    phoneNumber: json["phoneNumber"],

  );

  Map<String, dynamic> toJson() => {
    "artistName": artistName,
    "phoneNumber": phoneNumber,
  };


}

