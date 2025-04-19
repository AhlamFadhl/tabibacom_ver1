class Hospital {
  int hsptl_no;
  String hsptl_name;
  String hsptl_dscr;
  String? hsptl_logo;
  String? hsptl_images;
  String? hsptl_address;
  String? hsptl_email;
  String? hsptl_face;
  String? hsptl_insta;
  String? hsptl_site;
  String? hsptl_phone_whats;
  String? hsptl_phone_call;
  String? hsptl_phone_other;
  String hsptl_date_joined;
  int hsptl_type;

  Hospital({
    required this.hsptl_no,
    required this.hsptl_name,
    required this.hsptl_dscr,
    this.hsptl_logo,
    this.hsptl_images,
    this.hsptl_address,
    this.hsptl_email,
    this.hsptl_face,
    this.hsptl_insta,
    this.hsptl_site,
    this.hsptl_phone_whats,
    this.hsptl_phone_call,
    this.hsptl_phone_other,
    required this.hsptl_date_joined,
    required this.hsptl_type,
  });
  factory Hospital.fromJson(Map<String, dynamic> json) {
    return Hospital(
      hsptl_no: json['hsptl_no'],
      hsptl_name: json['hsptl_name'],
      hsptl_dscr: json['hsptl_dscr'],
      hsptl_logo: json['hsptl_logo'],
      hsptl_images: json['hsptl_images'],
      hsptl_address: json['hsptl_address'],
      hsptl_email: json['hsptl_email'],
      hsptl_face: json['hsptl_face'],
      hsptl_insta: json['hsptl_insta'],
      hsptl_site: json['hsptl_site'],
      hsptl_phone_whats: json['hsptl_phone_whats'],
      hsptl_phone_call: json['hsptl_phone_call'],
      hsptl_phone_other: json['hsptl_phone_other'],
      hsptl_date_joined: json['hsptl_date_joined'],
      hsptl_type: json['hsptl_type'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'hsptl_no': hsptl_no,
      'hsptl_name': hsptl_name,
      'hsptl_dscr': hsptl_dscr,
      'hsptl_logo': hsptl_logo,
      'hsptl_images': hsptl_images,
      'hsptl_address': hsptl_address,
      'hsptl_email': hsptl_email,
      'hsptl_face': hsptl_face,
      'hsptl_insta': hsptl_insta,
      'hsptl_site': hsptl_site,
      'hsptl_phone_whats': hsptl_phone_whats,
      'hsptl_phone_call': hsptl_phone_call,
      'hsptl_phone_other': hsptl_phone_other,
      'hsptl_date_joined': hsptl_date_joined,
      'hsptl_type': hsptl_type,
    };
  }
}
