class User{

  User({
    this.id;
    this.name;
    this.pone;
    this.note;
  });
  String id;
  String name;
  String phone;
  String note;
  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    phone: json["phone"],
    note: json["note"],

  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "phone": phone,
    "note": note,

  };
}