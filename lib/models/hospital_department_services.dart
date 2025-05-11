class HospitalDepartmentServices {
  int? serv_dep_id;
  int? dep_no;
  String? serv_name;
  String? serv_note;

  HospitalDepartmentServices({
    this.serv_dep_id,
    this.dep_no,
    this.serv_name,
    this.serv_note,
  }); 

  HospitalDepartmentServices.fromJson(Map<String, dynamic> json) {
    serv_dep_id = json['serv_dep_id'];
    dep_no = json['dep_no'];
    serv_name = json['serv_name'];
    serv_note = json['serv_note'];
  } 

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['serv_dep_id'] = this.serv_dep_id;
    data['dep_no'] = this.dep_no;
    data['serv_name'] = this.serv_name;
    data['serv_note'] = this.serv_note;
    return data;
}
}