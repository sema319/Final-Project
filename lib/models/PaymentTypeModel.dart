class PaymentsType{

  PaymentsType({
    this.visa = "",
    this.ApplePay = "",
    this.Bit = "",

  });
  String visa;
  String ApplePay;
  String Bit;


  factory PaymentsType.fromJson(Map<String, dynamic> json) => PaymentsType(
    visa: json["visa"],
    ApplePay: json["ApplePay"],
    Bit: json["Bit"],

  );

  Map<String, dynamic> toJson() => {
    "visa": visa,
    "ApplePay": ApplePay,
    "Bit": Bit,
  };



}
