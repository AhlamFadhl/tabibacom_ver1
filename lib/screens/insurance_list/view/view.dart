import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:tabibacom_ver1/models/category_model.dart';
import 'package:tabibacom_ver1/models/insurance.dart';
import 'package:tabibacom_ver1/screens/doctor_list/cubit/cubit.dart';
import 'package:tabibacom_ver1/screens/doctor_list/doctor_list_page.dart';
import 'package:tabibacom_ver1/screens/insurance_list/cubit/cubit.dart';
import 'package:tabibacom_ver1/screens/region_list/view/view.dart';

class InsuranceListPage extends StatelessWidget {
  CategoryDoc cat;
  InsuranceListPage({required this.cat});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<InsuranceCubit, InsuranceState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = InsuranceCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text('اختر شركة التأمين'),
          ),
          body: ListView.separated(
              itemBuilder: (context, index) {
                if (index == 0) {
                  return InkWell(
                    onTap: () {
                      Get.to(
                        RegionsPage(
                          insurance: InsuranceModel(ins_no: 0, ins_name: ''),
                          cat: cat,
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      child: const Text('لا اريد اختيار تأمين'),
                    ),
                  );
                } else {
                  // Return the insurance name from the list
                  return InkWell(
                    onTap: () {
                      Get.to(RegionsPage(
                          insurance: cubit.list_insurance[index - 1],
                          cat: cat));
                    },
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      child:
                          Text(cubit.list_insurance[index - 1].ins_name ?? ''),
                    ),
                  );
                }
              },
              separatorBuilder: (context, index) => Divider(
                    color: Colors.grey.shade200,
                  ),
              itemCount: cubit.list_insurance.length + 1),
        );
      },
    );
  }
}
