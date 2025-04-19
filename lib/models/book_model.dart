import 'package:tabibacom_ver1/models/doctor_model.dart';
import 'package:tabibacom_ver1/models/hospital_model.dart';

class BookModel {
  int book_no;
  int doc_no;
  int hsptl_no;
  int usr_no;
  int book_for_you;
  int ptn_no;
  String pt_name;
  String pt_phone;
  dynamic book_price;
  String book_date;
  String book_time;
  String book_note;
  int book_state;
  String date_enter;

  Doctor? doctor;
  Hospital? hospital;

  BookModel({
    required this.book_no,
    required this.doc_no,
    required this.hsptl_no,
    required this.usr_no,
    required this.book_for_you,
    required this.ptn_no,
    required this.pt_name,
    required this.pt_phone,
    required this.book_price,
    required this.book_date,
    required this.book_time,
    this.book_note = '',
    this.book_state = 1,
    required this.date_enter,
    this.doctor,
    this.hospital,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      book_no: json['book_no'],
      doc_no: json['doc_no'],
      hsptl_no: json['hsptl_no'],
      usr_no: json['usr_no'],
      book_for_you: json['book_for_you'],
      ptn_no: json['ptn_no'],
      pt_name: json['pt_name'],
      pt_phone: json['pt_phone'],
      book_price: json['book_price'],
      book_date: json['book_date'],
      book_time: json['book_time'],
      book_note: json['book_note'],
      book_state: json['book_state'],
      date_enter: json['date_enter'],
      doctor: json.containsKey('doc_first_name') ? Doctor.fromJson(json) : null,
      hospital: json.containsKey('hsptl_name') ? Hospital.fromJson(json) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'book_no': book_no,
      'doc_no': doc_no,
      'hsptl_no': hsptl_no,
      'usr_no': usr_no,
      'book_for_you': book_for_you,
      'ptn_no': ptn_no,
      'pt_name': pt_name,
      'pt_phone': pt_phone,
      'book_price': book_price,
      'book_date': book_date,
      'book_time': book_time,
      'book_note': book_note,
      'book_state': book_state,
      'date_enter': date_enter,
    };
  }
}
