import 'package:tabibacom_ver1/models/appointment_model.dart';
import 'package:tabibacom_ver1/models/doctors_hospital_model.dart';

class Doctor {
  int doc_no;
  String doc_first_name;
  String doc_last_name;
  String? doc_specialist;
  String doc_image;
  String doc_desc;
  String? doc_expirence;
  String? doc_images;

  int cat_no;
  int doc_naming;
  int? doc_phone_exist;
  int? doc_text_exist;
  int doc_user;
  int doc_gender;
  String doc_birth_day;

  String doc_date_joined;

//////
  String? cat_name;
  dynamic? doc_price;
  int? avg_time;
  String? doc_note;
  List<Doctors_Hospital>? lstHospital;
  List<Appointment>? lstAppointment;

  //hospital
  int? hsptl_no;
  String? hsptl_name;
  String? hsptl_logo;
  String? hsptl_address;

  Doctor({
    required this.doc_no,
    this.doc_first_name = '',
    this.doc_last_name = '',
    this.doc_image = '',
    this.doc_desc = '',
    this.doc_expirence,
    this.doc_specialist, //الاختصاص
    this.doc_images,
    required this.cat_no,
    this.avg_time,
    this.doc_naming = 1,
    this.doc_phone_exist,
    this.doc_text_exist,
    this.lstHospital,
    this.lstAppointment,
    required this.doc_date_joined,
    required this.doc_user,
    this.doc_gender = 0,
    required this.doc_birth_day,
    /////cat
    this.cat_name,
    this.doc_price,
    this.hsptl_no,
    this.doc_note,
    ////hospital
    this.hsptl_name,
    this.hsptl_address,
    this.hsptl_logo,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      doc_no: json['doc_no'],
      doc_first_name: json['doc_first_name'],
      doc_last_name: json['doc_last_name'],
      doc_image: json['doc_image'],
      doc_desc: json['doc_desc'],
      doc_expirence: json['doc_expirence'],
      doc_images: json['doc_images'],
      doc_specialist: json['doc_specialist'],
      cat_no: json['cat_no'],
      doc_naming: json['doc_naming'] ?? 1,
      doc_phone_exist: json['doc_phone_exist'] ?? 0,
      doc_text_exist: json['doc_text_exist'] ?? 0,
      lstHospital: json['lstHospital'],
      doc_date_joined: json['doc_date_joined'],
      doc_user: json['doc_user'],
      doc_gender: json['doc_gender'],
      doc_birth_day: json['doc_birth_day'],
///////////////
      cat_name: json['cat_name'],
      doc_price: json['doc_price'],
      avg_time: json['avg_time'] ?? 0,
      hsptl_no: json['hsptl_no'],
      doc_note: json['doc_note'],

      /////hospital
      hsptl_name: json['hsptl_name'],
      hsptl_logo: json['hsptl_logo'],
      hsptl_address: json['hsptl_address'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'doc_no': doc_no,
      'doc_desc': doc_desc,
      'doc_expirence': doc_expirence,
      'doc_images': doc_images,
      'doc_first_name': doc_first_name,
      'doc_last_name': doc_last_name,
      'doc_image': doc_image,
      'doc_specialist': doc_specialist,
      'cat_no': cat_no,
      'doc_naming': doc_naming,

      'doc_phone_exist': doc_phone_exist,
      'doc_text_exist': doc_text_exist,
      'doc_date_joined': doc_date_joined,
      'doc_user': doc_user,
      'doc_gender': doc_gender,
      'doc_birth_day': doc_birth_day,
      //////
      'cat_name': cat_name,
      'doc_price': doc_price,
      'avg_time': avg_time,
      'hsptl_no': hsptl_no,
      'doc_note': doc_note,

      ////ospital
      'hsptl_name': hsptl_name,
      'hsptl_address': hsptl_address,
      'hsptl_logo': hsptl_logo,
    };
  }
}
