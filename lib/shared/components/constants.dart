import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:tabibacom_ver1/models/category_model.dart';
import 'package:tabibacom_ver1/shared/network/local/cache_helper.dart';
import 'package:tabibacom_ver1/shared/styles/colors.dart';

const String KeyUserNo = 'key_usrno';
const String KeyUserName = 'key_usrname';
const String KeyUserPhone = 'key_usrphone';
bool isLogin = true;
void signOut(context) {
  CacheHelper.removeData(
    key: 'token',
  ).then((value) {
    if (value) {
      navigateAndFinish(context, Container() // ShopLoginScreen(),
          );
    }
  });
}

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

void navigateAndFinish(
  context,
  widget,
) =>
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
      (route) {
        return false;
      },
    );

void showToast({
  required String text,
  required ToastStates state,
}) =>
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: chooseToastColor(state),
      textColor: Colors.white,
      fontSize: 16.0,
    );

// enum
enum RecoredStatus { COMPLETE, REVIEW, ALL }

enum ToastStates { SUCCESS, ERROR, WARNING }

String doctorNaming(int no_name) {
  if (no_name == 1)
    return 'دكتور/';
  else if (no_name == 2)
    return 'كوتش/';
  else
    return 'دكتور/';
}

Color chooseToastColor(ToastStates state) {
  Color color;

  switch (state) {
    case ToastStates.SUCCESS:
      color = sucsessColor;
      break;
    case ToastStates.ERROR:
      color = textErrorColor;
      break;
    case ToastStates.WARNING:
      color = warringColor;
      break;
  }

  return color;
}

void printFullText(String text) {
  final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}

String getDayName(int dayno) {
  if (dayno == 1)
    return 'السبت';
  else if (dayno == 2)
    return 'الأحد';
  else if (dayno == 3)
    return 'الأثنين';
  else if (dayno == 4)
    return 'الثلاثاء';
  else if (dayno == 5)
    return 'الأربعاء';
  else if (dayno == 6)
    return 'الخميس';
  else if (dayno == 7)
    return 'الجمعه';
  else
    return '';
}

convertIntToTime(int time) {}
String durationToString(int minutes) {
  var d = Duration(minutes: minutes);
  List<String> parts = d.toString().split(':');
  return '${parts[0].padLeft(2, '0')}:${parts[1].padLeft(2, '0')}';
}

List<DateTime> getDaysInBetween(DateTime startDate, DateTime endDate) {
  final daysToGenerate = endDate.difference(startDate).inDays + 1;
  return List.generate(daysToGenerate, (i) => startDate.add(Duration(days: i)));
}

DateTime getDateTime(DateTime date, int min) {
  //'${date.year}-${date.month}-${date.day} 00:00:00'

  return (DateTime.parse(
          '${date.year}-${NumberFormat('00').format(date.month)}-${NumberFormat('00').format(date.day)} 00:00:00'))
      .add(Duration(minutes: min));
}

////
////Catogrey
List<CategoryDoc> list_category = [
  CategoryDoc(
    cat_no: 1,
    cat_name: 'الباطنية',
    cat_image:
        'https://www.kezmed.com/wp-content/uploads/heart-health-2001.jpg',
  ),
  CategoryDoc(
    cat_no: 2,
    cat_name: 'القلب و اوعية دموية',
    cat_image:
        'https://www.kezmed.com/wp-content/uploads/heart-health-2001.jpg',
  ),
  CategoryDoc(
    cat_no: 3,
    cat_name: 'العظام',
    cat_image:
        'https://www.kezmed.com/wp-content/uploads/heart-health-2001.jpg',
  ),
  CategoryDoc(
    cat_no: 4,
    cat_name: 'باطني كلى',
    cat_image:
        'https://www.kezmed.com/wp-content/uploads/heart-health-2001.jpg',
  ),
  CategoryDoc(
    cat_no: 5,
    cat_name: 'باطني صدر',
    cat_image: '',
  ),
  CategoryDoc(
    cat_no: 6,
    cat_name: 'باطني اورام',
    cat_image: '',
  ),
  CategoryDoc(
    cat_no: 7,
    cat_name: 'مخ واعصاب',
    cat_image: '',
  ),
  CategoryDoc(
    cat_no: 8,
    cat_name: 'مخ واعصاب اطفال',
    cat_image: '',
  ),
  CategoryDoc(
    cat_no: 9,
    cat_name: 'الجلد',
    cat_image: '',
  ),
  CategoryDoc(
    cat_no: 10,
    cat_name: 'امراض نفسية',
    cat_image: '',
  ),
  CategoryDoc(
    cat_no: 11,
    cat_name: 'روماتيزم وامراض مناعية',
    cat_image: '',
  ),
  CategoryDoc(
    cat_no: 12,
    cat_name: 'موجات صوتية',
    cat_image: '',
  ),
  CategoryDoc(
    cat_no: 13,
    cat_name: 'نساءو توليد',
    cat_image: '',
  ),
  CategoryDoc(
    cat_no: 14,
    cat_name: 'الجراحة',
    cat_image: '',
  ),
  CategoryDoc(
    cat_no: 15,
    cat_name: 'أنف وأذن وحنجرة',
    cat_image: '',
  ),
  CategoryDoc(
    cat_no: 16,
    cat_name: 'الأسنان',
    cat_image: '',
  ),
  CategoryDoc(
    cat_no: 17,
    cat_name: 'الأطفال وحديثي الولادة',
    cat_image: '',
  ),
  CategoryDoc(
    cat_no: 18,
    cat_name: 'مسالك بولية',
    cat_image: '',
  ),
  CategoryDoc(
    cat_no: 19,
    cat_name: 'غدد صماءوسكر',
    cat_image: '',
  ),
  CategoryDoc(
    cat_no: 20,
    cat_name: 'ذكورة وعقم',
    cat_image: '',
  ),
  CategoryDoc(
    cat_no: 21,
    cat_name: 'تجميل',
    cat_image: '',
  ),
  CategoryDoc(
    cat_no: 22,
    cat_name: 'تغذية',
    cat_image: '',
  ),
];
/////
///Hospitals

//////
