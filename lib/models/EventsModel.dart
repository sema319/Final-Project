class WorkLogModel {
  final String? date;
  final String? ariveHour;
  final String? exitHour;
  final String? totalHours;
  final String? comments;

  WorkLogModel({
    this.date,
    this.ariveHour,
    this.exitHour,
    this.totalHours,
    this.comments,
  });

  factory WorkLogModel.fromJson(Map<String, dynamic> json) {
    return WorkLogModel(
      date: json['date'],
      ariveHour: json['ariveHour'],
      exitHour: json['exitHour'],
      totalHours: json['totalHours'],
      comments: json['comments'],
    );
  }
}