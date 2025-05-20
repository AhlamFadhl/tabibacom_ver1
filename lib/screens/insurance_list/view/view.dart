import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tabibacom_ver1/models/category_model.dart';
import 'package:tabibacom_ver1/models/insurance.dart';
import 'package:tabibacom_ver1/screens/home/cubit/cubit.dart';
import 'package:tabibacom_ver1/screens/region_list/view/view.dart';

class InsuranceListPage extends StatelessWidget {
  CategoryDoc cat;
  List<InsuranceModel> list_insurance;
  InsuranceListPage({required this.cat, required this.list_insurance});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('اختر شركة التأمين'),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) => InkWell(
                onTap: () {
                  Get.to(RegionsPage(
                      insurance: list_insurance[index], cat: cat,list_region: HomeCubit.get(context).list_region,));
                },
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: Text(list_insurance[index].ins_name ?? ''),
                ),
              ),
          separatorBuilder: (context, index) => Divider(
                color: Colors.grey.shade200,
              ),
          itemCount: list_insurance.length),
    );
  }
}
