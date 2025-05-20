import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:tabibacom_ver1/models/category_model.dart';
import 'package:tabibacom_ver1/models/insurance.dart';
import 'package:tabibacom_ver1/models/region.dart';
import 'package:tabibacom_ver1/screens/doctor_list/doctor_list_page.dart';


class RegionsPage extends StatelessWidget {
  InsuranceModel insurance;
  CategoryDoc cat;
  List<RegionModel> list_region;
  RegionsPage({super.key, required this.insurance, required this.cat,required this.list_region});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: Text('اختر المديريه'),
          ),
          body: ListView.separated(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      Get.to(DoctorListPage(
                        cat: cat,
                        insurance: insurance,
                        region: list_region[index ],
                      ));
                    },
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      child: Text(list_region[index ].drct_name ?? ''),
                    ),
                  )
                
              ,
              separatorBuilder: (context, index) => Divider(
                    color: Colors.grey.shade200,
                  ),
              itemCount: list_region.length),
        );
      
  }
}
