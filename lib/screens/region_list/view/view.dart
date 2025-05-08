import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:tabibacom_ver1/models/category_model.dart';
import 'package:tabibacom_ver1/models/insurance.dart';
import 'package:tabibacom_ver1/models/region.dart';
import 'package:tabibacom_ver1/screens/doctor_list/cubit/cubit.dart';
import 'package:tabibacom_ver1/screens/doctor_list/doctor_list_page.dart';
import 'package:tabibacom_ver1/screens/region_list/cubit/cubit.dart';

class RegionsPage extends StatelessWidget {
  RegionsPage({super.key,});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegionCubit, RegionState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = RegionCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text('اختر المديريه'),
          ),
          body: ListView.separated(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                if (index == 0) {
                  return InkWell(
                    onTap: () {
                       DoctorCubit.get(context).region = RegionModel(drct_id: 0,drct_name: 'عدن');
                      Get.to(DoctorListPage(
                   
                      ));
                    },
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      child: Text('الكل'),
                    ),
                  );
                } else {
                  return InkWell(
                    onTap: () {
                      DoctorCubit.get(context).region = cubit.list_region[index - 1];
                      Get.to(DoctorListPage(
                       
                      ));
                    },
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      child: Text(cubit.list_region[index - 1].drct_name ?? ''),
                    ),
                  );
                }
              },
              separatorBuilder: (context, index) => Divider(
                    color: Colors.grey.shade200,
                  ),
              itemCount: cubit.list_region.length + 1),
        );
      },
    );
  }
}
