import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:tabibacom_ver1/models/category_model.dart';
import 'package:tabibacom_ver1/screens/doctor_list/cubit/cubit.dart';
import 'package:tabibacom_ver1/screens/doctor_list/doctor_list_page.dart';
import 'package:tabibacom_ver1/screens/insurance_list/view/view.dart';
import 'package:tabibacom_ver1/screens/region_list/view/view.dart';
import 'package:tabibacom_ver1/shared/network/end_points.dart';

class CategoryListPage extends StatelessWidget {
  List<CategoryDoc> list_category;
  CategoryListPage({required this.list_category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('العيادات'),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) =>
                      buildCategory(list_category[index],context),
                  separatorBuilder: (context, index) => SizedBox(
                        height: 10,
                      ),
                  itemCount: list_category.length),
            ],
          ),
        ),
      ),
    );
  }

  buildCategory(CategoryDoc cat, context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 1,
                      offset: Offset(0, 0),
                      spreadRadius: 0)
                ],
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: MaterialButton(
                child: ListTile(
                  leading: Container(
                      width: 40,
                      height: 40,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: BoxDecoration(
                        // color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: '${PATH_IMG}${cat.cat_image}',
                        placeholder: (context, url) => Container(),
                        errorWidget: (context, url, error) => Container(),
                      )),
                  title: Text(
                    cat.cat_name,
                  ),
                ),
                onPressed: () {
                  DoctorCubit.get(context).cat = cat;
                  Get.to(
                    InsuranceListPage(),
                  );
                },
              ),
            ),
          ],
        ),
      );
}
