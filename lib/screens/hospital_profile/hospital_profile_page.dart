import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:tabibacom_ver1/models/category_model.dart';
import 'package:tabibacom_ver1/models/doctor_model.dart';
import 'package:tabibacom_ver1/models/hospital_model.dart';
import 'package:tabibacom_ver1/screens/home/cubit/cubit.dart';
import 'package:tabibacom_ver1/screens/hospital_doctors/view.dart';
import 'package:tabibacom_ver1/screens/hospital_profile/cubit/cubit.dart';
import 'package:tabibacom_ver1/shared/network/end_points.dart';
import 'package:tabibacom_ver1/shared/styles/styles.dart';
import 'package:tabibacom_ver1/widgets/my_border.dart';
import 'package:tabibacom_ver1/widgets/my_button.dart';

class HospitalProfilePage extends StatelessWidget {
  Hospital hospital;
  HospitalProfilePage({required this.hospital});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HospitalProfileCubit()
        ..getAllDepartments(hospital.hsptl_no)
        ..getAllCategories(hospital.hsptl_no)
        ..getAllInsurance(hospital.hsptl_no),
      child: BlocConsumer<HospitalProfileCubit, HospitalProfileState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = HospitalProfileCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(hospital.hsptl_name),
            ),
            body: Padding(
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(mainAxisSize: MainAxisSize.max, children: [
                  MyBorder(
                    radius: 10,
                    width: double.infinity,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: CachedNetworkImage(
                            width: double.infinity,
                            fit: BoxFit.cover,
                            imageUrl: '$PATH_IMG${hospital.hsptl_logo ?? ''}',
                            placeholder: (context, url) => Container(),
                            errorWidget: (context, url, error) => Container(),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          hospital.hsptl_name,
                          textAlign: TextAlign.center,
                          style: styleText_mini_colored.copyWith(fontSize: 20),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          hospital.hsptl_address ?? '',
                          textAlign: TextAlign.center,
                          style: styleText.copyWith(
                              fontSize: 14, color: Colors.grey.shade600),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        MyButton(
                          title: 'احجز موعد الأن ',
                          onTap: () {
                            Get.to(HospitalDoctorsPage(
                              hospital: hospital,
                              listCats: cubit.list_categories,
                              listIns: cubit.list_insurance,
                            ));
                          },
                          width: MediaQuery.of(context).size.width * 0.5,
                        ),
                        Container(
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey.shade200,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      // color: Colors.white,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Column(children: [
                                    Text(
                                      'التخصصات',
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 14),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      '${hospital.count_cat} تخصص',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14),
                                    ),
                                  ]),
                                ),
                              ),
                              SizedBox(height: 20, child: VerticalDivider()),
                              Expanded(
                                child: Container(
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      // color: Colors.white,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Column(children: [
                                    Text(
                                      'الأطباء',
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 14),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      '${hospital.count_doc} طبيب',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14),
                                    ),
                                  ]),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  MyBorder(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'عن ال${hospital.hstype_name} ',
                          style: styleHeadline,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          hospital.hsptl_dscr,
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  MyBorder(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'اقسام ال${hospital.hstype_name}',
                          style: styleHeadline,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ConditionalBuilder(
                            condition: cubit.list_departments.isNotEmpty,
                            builder: (context) => GridView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, // 2 columns
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10,
                                ),
                                shrinkWrap: true,
                                itemBuilder: (context, index) => InkWell(
                                      onTap: () {},
                                      child: MyBorder(
                                        padding: const EdgeInsets.all(10),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            CachedNetworkImage(
                                              imageUrl:
                                                  '$PATH_IMG_GROUP${cubit.list_departments[index].dep_image}',
                                              height: 35,
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              cubit.list_departments[index]
                                                      .dep_title ??
                                                  '',
                                            ),
                                            SizedBox(
                                              height: 4,
                                            ),
                                            Text(
                                              cubit.list_departments[index]
                                                      .dep_note ??
                                                  '',
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                itemCount: cubit.list_departments.length),
                            fallback: (context) =>
                                Center(child: CircularProgressIndicator())),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  )
                  /* ConditionalBuilder(
                      condition: state is HospitalProfileLoading,
                      builder: (context) => CircularProgressIndicator(),
                      fallback: (context) {
                        return ListView.separated(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) =>
                                buildCategory(cubit.list_categories[index]),
                            separatorBuilder: (context, index) => Divider(),
                            itemCount: cubit.list_categories.length);
                      }),*/
                ]),
              ),
            ),
          );
        },
      ),
    );
  }

  buildCategory(CategoryDoc cat) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey.shade300),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: MaterialButton(
                child: ListTile(
                  leading: Container(
                      width: 40,
                      height: 40,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: cat.cat_image,
                        placeholder: (context, url) => Container(),
                        errorWidget: (context, url, error) => Container(),
                      )),
                  title: Text(
                    cat.cat_name,
                  ),
                ),
                onPressed: () {},
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
                child: ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) =>
                        buildDoctors(cat.list_doctors![index]),
                    separatorBuilder: (context, index) => SizedBox(height: 10),
                    itemCount: cat.list_doctors!.length)),
          ],
        ),
      );
  buildDoctors(Doctor doc) => Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Container(
              height: 70,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(0),
                  topLeft: Radius.circular(20),
                ),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: doc.doc_image,
                placeholder: (context, url) => Container(),
                errorWidget: (context, url, error) => Container(),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  doc.doc_first_name + ' ' + doc.doc_last_name,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  doc.doc_specialist!,
                  style: styleSupTitle,
                ),
              ],
            ),
          ],
        ),
      );
}
