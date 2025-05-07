class CityModel{
  int? cty_id;
  int? cty_country;
  String? cty_name;
  String? cty_dsc;


  CityModel({
    this.cty_id,
    this.cty_country,
    this.cty_name,
    this.cty_dsc,
  }); 

  CityModel.fromJson(Map<String, dynamic> json) {
    cty_id = json['cty_id'];
    cty_country = json['cty_country'];
    cty_name = json['cty_name'];
    cty_dsc = json['cty_dsc'];
  } 

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cty_id'] = this.cty_id;
    data['cty_country'] = this.cty_country;
    data['cty_name'] = this.cty_name;
    data['cty_dsc'] = this.cty_dsc;
    return data;
  }
}