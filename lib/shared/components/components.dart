import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tabibacom_ver1/models/category_model.dart';
import 'package:tabibacom_ver1/models/doctor_model.dart';
import 'package:tabibacom_ver1/models/hospital_model.dart';
import 'package:tabibacom_ver1/screens/doctor_list/doctor_list_page.dart';
import 'package:tabibacom_ver1/screens/doctor_profile/doctor_profile.dart';
import 'package:tabibacom_ver1/screens/hospital_profile/hospital_profile_page.dart';
import 'package:tabibacom_ver1/screens/insurance_list/view/view.dart';
import 'package:tabibacom_ver1/shared/components/constants.dart';
import 'package:tabibacom_ver1/shared/network/end_points.dart';
import 'package:tabibacom_ver1/shared/styles/colors.dart';
import 'package:tabibacom_ver1/shared/styles/styles.dart';
import 'package:cached_network_image/cached_network_image.dart';

Widget defultIconButton(
        {required Function() onPressed, required IconData icon}) =>
    IconButton(
        icon: CircleAvatar(
          radius: 35,
          backgroundColor: Colors.white.withOpacity(0.3),
          child: Icon(
            icon,
            color: Colors.white,
            size: 20,
          ),
        ),
        onPressed: onPressed);
Widget defaultButton({
  double width = double.infinity,
  Color backgroundColor = primaryColor,
  Color textColor = Colors.white,
  Color borderColor = primaryColor,
  bool isUpperCase = true,
  required Function() function,
  required String text,
  IconData? iconRight,
  IconData? iconLeft,
  bool isShadow = true,
  double height = 60,
  bool isGradient = false,
}) =>
    Container(
      width: width,
      height: height,
      child: MaterialButton(
        onPressed: function,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (iconLeft != null)
              Padding(
                padding: const EdgeInsetsDirectional.only(end: 5),
                child: Icon(
                  iconLeft,
                  color: textColor,
                ),
              ),
            Text(
              isUpperCase ? text.toUpperCase() : text,
              style: TextStyle(color: textColor, fontSize: 12),
            ),
            if (iconRight != null)
              Padding(
                padding: const EdgeInsetsDirectional.only(start: 5),
                child: Icon(
                  iconRight,
                  color: textColor,
                ),
              ),
          ],
        ),
      ),
      decoration: BoxDecoration(
        boxShadow: [
          if (isShadow)
            BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 3,
                spreadRadius: 1,
                offset: Offset(0, 2))
        ],
        borderRadius: BorderRadius.circular(10),
        /*  topLeft: Radius.circular(topLeftradius),
            bottomRight: Radius.circular(bottomRightradius),
            topRight: Radius.circular(topRightradius),
            bottomLeft: Radius.circular(bottomLeftradius)),*/
        border: Border.all(
          color: borderColor,
          width: 1,
        ),
        color: backgroundColor,
        gradient: LinearGradient(
          begin: FractionalOffset.topCenter,
          end: FractionalOffset.bottomCenter,
          colors: [
            isGradient ? primaryColor : backgroundColor,
            isGradient ? secondColor : backgroundColor
          ],
        ),
      ),
    );

Widget defaultTextButton({
  required Function() function,
  required String text,
}) =>
    TextButton(
      onPressed: function,
      child: Text(
        text.toUpperCase(),
      ),
    );
Widget defaultCardSearch() => Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadiusDirectional.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'ابحث هنا',
            style: styleSupTitle,
          ),
          Icon(
            Icons.search,
            color: Colors.white,
          )
        ],
      ),
    );

Widget defaultBarcode() => Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadiusDirectional.circular(10),
      ),
      child: Icon(Icons.code),
    );

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  ValueChanged<String>? onSubmit,
  ValueChanged<String>? onChange,
  Function()? onTap,
  bool isPassword = false,
  required FormFieldValidator validate,
  required String hinttxt,
  IconData? prefix,
  IconData? suffix,
  Function()? suffixPressed,
  bool isClickable = true,
  bool filled = false,
  int? maxline = 1,
}) =>
    TextFormField(
      maxLines: maxline,
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      enabled: isClickable,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      onTap: onTap,
      validator: validate,
      decoration: InputDecoration(
        hintText: hinttxt,
        hintStyle: TextStyle(color: Colors.grey.shade300),
        filled: filled,
        fillColor: textErrorColor,
        errorStyle: styleError,
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: suffixPressed,
                icon: Icon(
                  suffix,
                ),
              )
            : null,
        border: enableBorderTextFeild(),
        enabledBorder: enableBorderTextFeild(),
        focusedBorder: enableBorderTextFeild(),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              color: textErrorColor,
              width: 1,
            )),
      ),
    );
OutlineInputBorder enableBorderTextFeild() => OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
    borderSide: BorderSide(
      color: secondColor,
      width: 1,
    ));
OutlineInputBorder errorBorderTextFeild() => OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
    borderSide: BorderSide(
      color: textErrorColor,
      width: 1,
    ));
Widget buildCategoryItem(CategoryDoc cat, context) => InkWell(
      onTap: () {
        Get.to(() => InsuranceListPage(
        cat: cat,
            ));
      },
      child: Container(
        height: 100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  //  color: Colors.grey.shade100,
                  //  borderRadius: BorderRadius.circular(50.0),
                  ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: '${PATH_IMG}${cat.cat_image}',
                placeholder: (context, url) => Container(),
                errorWidget: (context, url, error) => Container(),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Container(
              width: 100,
              padding: const EdgeInsets.only(right: 5),
              child: Text(
                cat.cat_name,
                textAlign: TextAlign.center,
              style: TextStyle(fontSize: 13),
              ),
            ),
          ],
        ),
      ),
    );
Widget buildDoctorItem(Doctor doc, context) => InkWell(
      onTap: () {
        Get.to(
          DoctorProfile(crrnt_doctor: doc),
        );
      },
      child: Container(
        decoration: BoxDecoration(
       /*   borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
          border: Border.all(color: Colors.grey.shade200),*/
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 150,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                    ),
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl:PATH_IMG+ doc.doc_image,
                    placeholder: (context, url) => Container(),
                    errorWidget: (context, url, error) => Container(),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: primaryColor.withOpacity(0.5),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5),
                      topLeft: Radius.circular(5),
                    ),
                  ),
                  padding: const EdgeInsets.all(3),
                  child: Icon(
                    Icons.favorite,
                    size: 15,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 8.0,
            ),
            Container(
              width: 150,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    doc.cat_name ?? '',
                    textAlign: TextAlign.start,
                    style: styleText_mini_colored,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    doctorNaming(0) +
                        ' ' +
                        doc.doc_first_name +
                        ' ' +
                        doc.doc_last_name,
                    textAlign: TextAlign.start,
                    style: styleText,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    doc.doc_specialist ?? '',
                    textAlign: TextAlign.start,
                    style: styleText_mini_gryed,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    doc.doc_price.toString(),
                    style: styleText.copyWith(color: primary2Color,fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
            
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl:PATH_IMG+( doc.hsptl_logo ?? ''),
                          placeholder: (context, url) => Container(),
                          errorWidget: (context, url, error) => Container(),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        doc.hsptl_name ?? '',
                        textAlign: TextAlign.start,
                        style: styleText.copyWith(fontSize: 10),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );

Widget buildHospitalItem(Hospital hsptl, context) => InkWell(
      onTap: () {
        Get.to(() => HospitalProfilePage(hospital: hsptl));
      },
      child: Container(
        height: 150,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: primaryColor.withOpacity(0.2),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(50.0),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl:(PATH_IMG+ (hsptl.hsptl_logo ?? '')),
                placeholder: (context, url) => Container(),
                errorWidget: (context, url, error) => Container(),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Container(
              width: 100,
              padding: const EdgeInsets.only(right: 5),
              child: Text(
                hsptl.hsptl_name,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );

Widget categoriesBuilder({
  required List<CategoryDoc> categories,
}) =>
    Container(
    height: 100,
      child: ConditionalBuilder(
        condition: categories.length > 0,
        builder: (context) => Container(
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return buildCategoryItem(categories[index], context);
            },
            separatorBuilder: (context, index) => SizedBox(
              width: 5,
            ),
            itemCount: categories.length,
          ),
        ),
        fallback: (context) => Container(),
      ),
    );

Widget hospitalsBuilder({
  required List<Hospital> hospitals,
}) =>
    Container(
      height: 150,
      child: ConditionalBuilder(
        condition: hospitals.length > 0,
        builder: (context) => Container(
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return buildHospitalItem(hospitals[index], context);
            },
            separatorBuilder: (context, index) => SizedBox(
              width: 10,
            ),
            itemCount: hospitals.length,
          ),
        ),
        fallback: (context) => Container(),
      ),
    );

Widget doctorsBuilder({
  required List<Doctor> doctors,
}) =>
    Container(
      height: 145,
      child: ConditionalBuilder(
        condition: doctors.length > 0,
        builder: (context) => Container(
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return buildDoctorItem(doctors[index], context);
            },
            separatorBuilder: (context, index) => SizedBox(
              width: 10,
            ),
            itemCount: doctors.length,
          ),
        ),
        fallback: (context) => Container(),
      ),
    );

Widget buildCurve({required Widget child, double height = 220}) => ClipPath(
    clipper: CurveClipper(),
    child: Container(
      padding: const EdgeInsetsDirectional.only(start: 20, end: 20),
      width: double.infinity,
      height: height,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment(-1.0, -1.0),
              end: Alignment(-1.0, 1),
              colors: [
            secondColor,
            primaryColor,
          ])),
      child: child,
    ));

Widget myDivider({Color color = lightColor}) => Padding(
      padding: const EdgeInsetsDirectional.only(
        start: 0.0,
      ),
      child: Container(
        width: double.infinity,
        height: 1.0,
        color: color,
      ),
    );
Widget buildDoctorItem_Main(Doctor doc, bool profile) => InkWell(
      onTap: () {
        Get.to(
          () => DoctorProfile(crrnt_doctor: doc),
        );
      },
      child: Column(
        children: [
          Container(
            width: double.infinity,
            margin: const EdgeInsetsDirectional.only(end: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
              ),
          //  border: Border.all(color: Colors.grey.shade300),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 150,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                    ),
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl:PATH_IMG+ doc.doc_image,
                    placeholder: (context, url) => Container(),
                    errorWidget: (context, url, error) => Container(),
                  ),
                ),
                SizedBox(
                  width: 8.0,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        doc.cat_name ?? '',
                        textAlign: TextAlign.start,
                        style: styleText_mini_colored,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        doctorNaming(0) +
                            ' ' +
                            doc.doc_first_name +
                            ' ' +
                            doc.doc_last_name,
                        textAlign: TextAlign.start,
                        style: styleText,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        doc.doc_specialist ?? '',
                        textAlign: TextAlign.start,
                        style: styleText_mini_gryed,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        doc.doc_price.toString(),
                        style: styleText.copyWith(color: primary2Color,fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        doc.doc_desc,
                        style: styleText,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Container(
                height: 50,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
               //   borderRadius: BorderRadius.circular(20),
                //  border: Border.all(color: Colors.grey.shade300),
                shape: BoxShape.circle,
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl:PATH_IMG+( doc.hsptl_logo ?? ''),
                  placeholder: (context, url) => Container(),
                  errorWidget: (context, url, error) => Container(),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    doc.hsptl_name ?? '',
                    textAlign: TextAlign.start,
                    style: styleText_mini_colored.copyWith(fontSize: 10),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    doc.hsptl_address ?? '',
                    textAlign: TextAlign.start,
                    style: styleText.copyWith(fontSize: 10),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ],
              ),
            ],
          ),
          Container(
            width: double.infinity,
            height: 1,
            color: Colors.grey.shade300,
          )
        ],
      ),
    );

Widget buildDoctorItem_Top(Doctor doc) => Container(
      /*decoration:
          BoxDecoration(border: Border.all(color: Colors.grey.shade300)),*/
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            margin: const EdgeInsetsDirectional.only(end: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 150,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                    ),
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl:PATH_IMG+ doc.doc_image,
                    placeholder: (context, url) => Container(),
                    errorWidget: (context, url, error) => Container(),
                  ),
                ),
                SizedBox(
                  width: 8.0,
                ),
                Expanded(
                  child: Container(
                    height: 150,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          doc.cat_name ?? '',
                          textAlign: TextAlign.start,
                          style: styleText_mini_colored.copyWith(fontSize: 13),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          doctorNaming(0) +
                              ' ' +
                              doc.doc_first_name +
                              ' ' +
                              doc.doc_last_name,
                          textAlign: TextAlign.start,
                          style: styleText.copyWith(fontSize: 16),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          doc.doc_specialist ?? '',
                          textAlign: TextAlign.start,
                          style: styleText_mini_gryed.copyWith(fontSize: 16),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            width: double.infinity,
            height: 1,
            color: Colors.grey.shade300,
          ),
          Row(
            children: [
              Container(
                height: 60,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                    topLeft: Radius.circular(0),
                  ),
                 // border: Border.all(color: Colors.grey.shade300),
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl:PATH_IMG+( doc.hsptl_logo ?? ''),
                  placeholder: (context, url) => Container(),
                  errorWidget: (context, url, error) => Container(),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    doc.hsptl_name ?? '',
                    textAlign: TextAlign.start,
                    style: styleText_mini_colored.copyWith(fontSize: 13),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    doc.hsptl_address ?? '',
                    textAlign: TextAlign.start,
                    style: styleText,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ],
              ),
            ],
          ),
          Container(
            width: double.infinity,
            height: 1,
            color: Colors.grey.shade300,
          )
        ],
      ),
    );

Widget doctorsListBuilder({
  required List<Doctor> doctors,
}) =>
    ConditionalBuilder(
      condition: doctors.length > 0,
      builder: (context) => Container(
        child: ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return buildDoctorItem_Main(doctors[index], false);
          },
          separatorBuilder: (context, index) => SizedBox(
            height: 10,
          ),
          itemCount: doctors.length,
        ),
      ),
      fallback: (context) => Container(),
    );

Widget buildItemBlackList() => InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            SizedBox(
              width: 20,
            ),
            Text(
              'xxxxxxxxxx xxxxxxx xxxxx xxxxxx',
              style: styleSupTitle,
            ),
          ],
        ),
      ),
    );

Widget buildItemNotification({required int index}) => InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: index % 2 != 0 ? Colors.grey.shade100 : Colors.white,
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 2),
                color: index % 2 != 0 ? lightColor : Colors.white,
                blurRadius: 3,
                spreadRadius: 1),
          ],
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: lightColor,
              child: Image.asset('assets/images/alart.png'),
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              'تم اصدار العدد',
              style: styleSupTitle,
            ),
            Spacer(),
            Text(
              'منذ ٥ دقائق',
              style: styleSupTitle.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );

Widget buildItemAttachment() => InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 2),
                color: lightColor,
                blurRadius: 3,
                spreadRadius: 1),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 100,
              height: 50,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: CachedNetworkImage(
                imageUrl: "http://via.placeholder.com/350x150",
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Text(
                'الجهة الاماميه من البطاقة الشخصية',
                style: styleSupTitle,
              ),
            ),
            Row(
              children: [
                InkWell(
                  onTap: () {},
                  child: Image.asset(
                    'assets/images/downlaod.svg',
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                InkWell(
                  onTap: () {},
                  child: Image.asset(
                    'assets/images/Show.svg',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );

Widget buildRowInfo({required String title, required String value}) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          title,
          style: styleHeadline1.copyWith(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          value,
          style: styleSupTitle,
        ),
      ],
    );
Widget buildItemsInformation(List<Widget> children) => InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 2),
                color: lightColor,
                blurRadius: 5,
                spreadRadius: 1),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children,
        ),
      ),
    );

Widget buildItemMyRecored({required int index, context}) => InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 0),
                color: Colors.grey.shade200,
                spreadRadius: 1,
                blurRadius: 2),
          ],
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'السبيل للسفريات',
                      style: styleHeadline1,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        'رقم المعاملة : 78678',
                        style: styleError,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    decoration: BoxDecoration(
                      color: lightColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsetsDirectional.only(end: 20),
                            child: defaultButton(
                                function: () {},
                                text: ((index + 1) % 2 != 0)
                                    ? 'قيد المراجعه'
                                    : 'مكتمل',
                                isShadow: false,
                                textColor: ((index + 1) % 2 != 0)
                                    ? warringColor
                                    : secondColor,
                                height: 30,
                                borderColor: ((index + 1) % 2 != 0)
                                    ? warringColor
                                    : secondColor,
                                backgroundColor: lightColor),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.calendar_month_outlined,
                                  color: secondColor,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  '2023/01/01',
                                  style: styleHeadline1,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    child: VerticalDivider(
                      color: secondColor,
                      thickness: 1,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            myDivider(),
            SizedBox(
              height: 10,
            ),
            Container(
              child: ((index + 1) % 2 != 0)
                  ? Row(
                      children: [
                        Image.asset('assets/images/stopwatch.svg'),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Text(
                            'data',
                            style: styleWarring,
                            maxLines: 2,
                          ),
                        ),
                      ],
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: defaultButton(
                          function: () {
                            // navigateTo(context, DetailsRecordPage());
                          },
                          text: 'تفاصيل السجل',
                          isShadow: false,
                          textColor: secondColor,
                          backgroundColor: Colors.white,
                          height: 40),
                    ),
            )
          ],
        ),
      ),
    );

Widget buildServiceCardItem(
        {required String title,
        required String svgImage,
        bool isSoon = false,
        double height = 140}) =>
    Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 7),
                color: isSoon ? lightColor : Colors.grey.shade300,
                blurRadius: isSoon ? 5 : 10,
                spreadRadius: isSoon ? 0 : 3)
          ]),
      child: Stack(
        children: [
          /*if (!isSoon)
            SvgPicture.asset(
              'assets/images/Path 1.svg',
              alignment: Alignment.center,
              fit: BoxFit.none,
              height: height,
            ),*/
          Container(
            padding: const EdgeInsetsDirectional.only(start: 20, bottom: 20),
            width: double.infinity,
            height: height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: FractionalOffset.centerRight,
                end: FractionalOffset.centerLeft,
                colors: [
                  !isSoon ? secondColor : lightColor,
                  !isSoon ? primaryColor : lightColor
                ],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(svgImage),
                SizedBox(
                  height: 20,
                ),
                Text(
                  title,
                  style: isSoon
                      ? styleSupTitle.copyWith(color: secondColor)
                      : styleSupTitle.copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
          if (isSoon)
            Container(
                margin: const EdgeInsetsDirectional.only(start: 10),
                padding: const EdgeInsetsDirectional.only(
                    end: 20, start: 20, top: 10, bottom: 10),
                decoration: BoxDecoration(
                    color: textErrorColor,
                    borderRadius: BorderRadiusDirectional.only(
                        bottomEnd: Radius.circular(20),
                        bottomStart: Radius.circular(20))),
                child: Text(
                  'قريباً',
                  style: styleError,
                ))
        ],
      ),
    );
buildProfileImage({
  required String url,
  double radius = 40,
}) =>
    CircleAvatar(
      radius: radius,
      backgroundColor: lightColor.withOpacity(0.3),
      child: CircleAvatar(
        backgroundColor: Colors.white.withOpacity(0.5),
        radius: radius - 5,
        backgroundImage: NetworkImage(
          url,
        ),
        child: CircleAvatar(
          radius: radius - 10,
          backgroundColor: Colors.black45.withOpacity(0.1),
        ),
      ),
    );

class CurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    int curveHeight = 40;
    Offset controlPoint = Offset(size.width / 2, size.height + curveHeight);
    Offset endPoint = Offset(size.width, size.height - curveHeight);

    Path path = Path()
      ..lineTo(0, size.height - curveHeight)
      ..quadraticBezierTo(
          controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy)
      ..lineTo(size.width, 0)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
