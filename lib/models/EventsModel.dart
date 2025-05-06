class EventModel {


  EventModel({
    this.date = "",
    this.eventID = "",
    this.bussID = "",

  });

  String date;
  String eventID;
  String bussID;


  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      date: json['date'],
      eventID: json['eventID'],
      bussID: json['businessName'],

    );
  }





  Map<String, dynamic> toJson() => {
    "date": date,
    "eventID": eventID,
    "bussID": bussID,
  };
}