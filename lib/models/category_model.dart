import 'package:tabibacom_ver1/models/doctor_model.dart';

class CategoryDoc {
  int cat_no;
  String cat_name;
  String cat_image;
  int isopen;
  List<Doctor>? list_doctors;

  CategoryDoc({
    required this.cat_no,
    required this.cat_name,
    required this.cat_image,
    this.isopen = 0,
    this.list_doctors,
  });

  factory CategoryDoc.fromJson(Map<String, dynamic> json) {
    return CategoryDoc(
      cat_no: json['cat_no'],
      cat_name: json['cat_name'],
      cat_image: json['cat_image'],
      list_doctors: json.containsKey('doctors')
          ? ((json['doctors'] as List<dynamic>).map((j) => Doctor.fromJson(j)))
              .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'cat_no': cat_no,
      'cat_name': cat_name,
      'cat_image': cat_image,
    };
  }
}
