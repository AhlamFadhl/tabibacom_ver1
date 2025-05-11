import 'package:tabibacom_ver1/models/hospital_department_services.dart';

class HospitalDepartments {
  int? dep_no;
  int? hsptl_no;
  String? dep_title;
  String? dep_note;
  int? is_category;
  String? dep_image;
  String? dep_date_created;
  int? dep_user_created;
  List<HospitalDepartmentServices>? services;

  HospitalDepartments({
    this.dep_no,
    this.hsptl_no,
    this.dep_title,
    this.dep_note,
    this.is_category,
    this.dep_image,
    this.dep_date_created,
    this.dep_user_created,
  });

  HospitalDepartments.fromJson(Map<String, dynamic> json) {
    dep_no = json['dep_no'];
    hsptl_no = json['hsptl_no'];
    dep_title = json['dep_title'];
    dep_note = json['dep_note'];
    is_category = json['is_category'];
    dep_image = json['dep_image'];
    dep_date_created = json['dep_date_created'];
    dep_user_created = json['dep_user_created'];
    services = json['services'] != null
        ? (json['services'] as List)
            .map((i) => HospitalDepartmentServices.fromJson(i))
            .toList()
        : [];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dep_no'] = this.dep_no;
    data['hsptl_no'] = this.hsptl_no;
    data['dep_title'] = this.dep_title;
    data['dep_note'] = this.dep_note;
    data['is_category'] = this.is_category;
    data['dep_image'] = this.dep_image;
    data['dep_date_created'] = this.dep_date_created;
    data['dep_user_created'] = this.dep_user_created;
    data['services'] = this.services != null
        ? this.services!.map((v) => v.toJson()).toList()
        : null;
    return data;
  }
}
