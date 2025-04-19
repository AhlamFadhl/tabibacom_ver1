class Users {
  int usr_no;
  String usr_name;
  String usr_phone;
  String? usr_email;
  String usr_pass;
  int usr_google;
  int usr_type; //مريض , دكتور, مساعد دكتور ,اداري , مساعد اداري
  int usr_hsptl;
  int usr_doctor;
  int usr_stop;
  String usr_date_joined;

  Users(
      {required this.usr_no,
      required this.usr_name,
      required this.usr_phone,
      this.usr_email,
      required this.usr_pass,
      this.usr_google = 0,
      this.usr_type = 0,
      this.usr_hsptl = 0,
      this.usr_doctor = 0,
      this.usr_stop = 0,
      this.usr_date_joined = ''});

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
      usr_no: json['usr_no'],
      usr_name: json['usr_name'],
      usr_phone: json['usr_phone'],
      usr_email: json['usr_email'],
      usr_pass: json.containsKey('usr_pass') ? json['usr_pass'] : '',
      usr_google: json['usr_google'],
      usr_type: json['usr_type'],
      usr_hsptl: json['usr_hsptl'],
      usr_doctor: json['usr_doctor'],
      usr_stop: json['usr_stop'] ?? 0,
      usr_date_joined: json['usr_date_joined'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'usr_no': usr_no,
      'usr_name': usr_name,
      'usr_phone': usr_phone,
      'usr_email': usr_email,
      'usr_pass': usr_pass,
      'usr_google': usr_google,
      'usr_type': usr_type,
      'usr_hsptl': usr_hsptl,
      'usr_doctor': usr_doctor,
      'usr_stop': usr_stop,
      'usr_date_joined': usr_date_joined,
    };
  }
}
