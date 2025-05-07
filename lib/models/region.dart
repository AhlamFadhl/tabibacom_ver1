class RegionModel {
  int? drct_id;
  int? drct_city;
  String? drct_name;
  String? drct_dsc;

  RegionModel({
    this.drct_id,
    this.drct_city,
    this.drct_name,
    this.drct_dsc,
  });
  RegionModel.fromJson(Map<String, dynamic> json) {
    drct_id = json['drct_id'];
    drct_city = json['drct_city'];
    drct_name = json['drct_name'];
    drct_dsc = json['drct_dsc'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['drct_id'] = this.drct_id;
    data['drct_city'] = this.drct_city;
    data['drct_name'] = this.drct_name;
    data['drct_dsc'] = this.drct_dsc;
    return data;
  }
}
