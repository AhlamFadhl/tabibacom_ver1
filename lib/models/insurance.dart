class InsuranceModel {
  int? ins_no;
  String? ins_name;
  String? ins_address;
  String? ins_phone;
  String? ins_whats;
  String? ins_tel;
  String? ins_email;
  String? ins_image;
  String? ins_from_no;
  String? ins_to_no;
  String? ins_created_date;

   InsuranceModel({
    this.ins_no,
    this.ins_name,
    this.ins_address,
    this.ins_phone,
    this.ins_whats,
    this.ins_tel,
    this.ins_email,
    this.ins_image,
    this.ins_from_no,
    this.ins_to_no,
    this.ins_created_date,
  });

  InsuranceModel.fromJson(Map<String, dynamic> json) {
    ins_no = json['ins_no'];
    ins_name = json['ins_name'];
    ins_address = json['ins_address'];
    ins_phone = json['ins_phone'];
    ins_whats = json['ins_whats'];
    ins_tel = json['ins_tel'];
    ins_email = json['ins_email'];
    ins_image = json['ins_image'];
    ins_from_no = json['ins_from_no'];
    ins_to_no = json['ins_to_no'];
    ins_created_date = json['ins_created_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ins_no'] = this.ins_no;
    data['ins_name'] = this.ins_name;
    data['ins_address'] = this.ins_address;
    data['ins_phone'] = this.ins_phone;
    data['ins_whats'] = this.ins_whats;
    data['ins_tel'] = this.ins_tel;
    data['ins_email'] = this.ins_email;
    data['ins_image'] = this.ins_image;
    data['ins_from_no'] = this.ins_from_no;
    data['ins_to_no'] = this.ins_to_no;
    data['ins_created_date'] = this.ins_created_date;
    return data;
  }
}