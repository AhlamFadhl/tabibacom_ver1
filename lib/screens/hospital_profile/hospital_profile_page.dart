import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tabibacom_ver1/models/category_model.dart';
import 'package:tabibacom_ver1/models/doctor_model.dart';
import 'package:tabibacom_ver1/models/hospital_model.dart';
import 'package:tabibacom_ver1/screens/hospital_profile/cubit/hospital_profile_cubit.dart';
import 'package:tabibacom_ver1/shared/styles/colors.dart';
import 'package:tabibacom_ver1/shared/styles/styles.dart';

class HospitalProfilePage extends StatelessWidget {
  Hospital hospital;
  HospitalProfilePage({required this.hospital});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          HospitalProfileCubit()..getAllCategories(hospital.hsptl_no),
      child: BlocConsumer<HospitalProfileCubit, HospitalProfileState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = HospitalProfileCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(hospital.hsptl_name),
            ),
            body: Container(
              child: SingleChildScrollView(
                child: Column(mainAxisSize: MainAxisSize.max, children: [
                  Container(
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
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: Colors.grey.shade300),
                          ),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl: hospital.hsptl_logo ?? '',
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
                          style: styleText.copyWith(fontSize: 14),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Spacer(),
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            // color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(children: [
                          Row(
                            children: [
                              Icon(
                                Icons.health_and_safety_rounded,
                                color: primaryColor,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text('التخصصات'),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '2',
                          ),
                        ]),
                      ),
                      Spacer(),
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            // color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(children: [
                          Row(
                            children: [
                              Icon(
                                Icons.health_and_safety_rounded,
                                color: primaryColor,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text('الأطباء'),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '2',
                          ),
                        ]),
                      ),
                      Spacer(),
                    ],
                  ),
                  Divider(),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'نبذه عن ' + hospital.hsptl_name,
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
                  ConditionalBuilder(
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
                      }),
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
