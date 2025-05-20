import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tabibacom_ver1/models/category_model.dart';
import 'package:tabibacom_ver1/models/hospital_model.dart';
import 'package:tabibacom_ver1/models/insurance.dart';
import 'package:tabibacom_ver1/screens/hospital_doctors/cubit/cubit.dart';
import 'package:tabibacom_ver1/shared/components/components.dart';
import 'package:tabibacom_ver1/widgets/sized_box.dart';

class HospitalDoctorsPage extends StatelessWidget {
  Hospital hospital;
  List<CategoryDoc> listCats = [];
  List<InsuranceModel> listIns = [];
  HospitalDoctorsPage(
      {super.key,
      required this.hospital,
      required this.listCats,
      required this.listIns});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HospitalDoctorsCubit(
          hospital: hospital,
          list_categories: listCats,
          list_insurance: listIns)
        ..setListData(),
      child: BlocConsumer<HospitalDoctorsCubit, HospitalDoctorsState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = HospitalDoctorsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text('الأطباء'),
            ),
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(8)),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<CategoryDoc>(
                        value: cubit.selectedCat,
                        dropdownColor: Colors.white,
                        icon: const Icon(Icons.arrow_right_rounded),
                        isExpanded: true,
                        onChanged: (CategoryDoc? value) {
                          cubit.getDoctorsByCat(value!);
                        },
                        items: cubit.list_categories
                            .map<DropdownMenuItem<CategoryDoc>>(
                                (CategoryDoc value) {
                          return DropdownMenuItem<CategoryDoc>(
                              value: value,
                              child: Text(
                                value.cat_name,
                                style: TextStyle(color: Colors.grey.shade700),
                              ));
                        }).toList(),
                      ),
                    ),
                  ),
                  CustomSizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(8)),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<InsuranceModel>(
                        value: cubit.selectedInsurance,
                        dropdownColor: Colors.white,
                        icon: const Icon(Icons.arrow_right_rounded),
                        isExpanded: true,
                        onChanged: (InsuranceModel? value) {
                          cubit.getDoctorsByInsurance(value!);
                        },
                        items: cubit.list_insurance
                            .map<DropdownMenuItem<InsuranceModel>>(
                                (InsuranceModel value) {
                          return DropdownMenuItem<InsuranceModel>(
                              value: value,
                              child: Text(
                                value.ins_name ?? '',
                                style: TextStyle(color: Colors.grey.shade700),
                              ));
                        }).toList(),
                      ),
                    ),
                  ),
                  Expanded(
                      child: cubit.isLoading
                          ? Center(child: CircularProgressIndicator())
                          : Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: ListView.separated(
                              shrinkWrap: true,
                                itemBuilder: (context, index) => buildDoctorItem(
                                    cubit.list_doctors[index], context),
                                separatorBuilder: (context, index) => SizedBox(
                                      height: 10,
                                    ),
                                itemCount: cubit.list_doctors.length),
                          ))
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
