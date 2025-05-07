import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tabibacom_ver1/models/category_model.dart';
import 'package:tabibacom_ver1/models/insurance.dart';
import 'package:tabibacom_ver1/models/region.dart';
import 'package:tabibacom_ver1/screens/doctor_list/cubit/cubit.dart';
import 'package:tabibacom_ver1/screens/doctor_list/cubit/states.dart';
import 'package:tabibacom_ver1/screens/home/cubit/cubit.dart';
import 'package:tabibacom_ver1/shared/components/components.dart';

class DoctorListPage extends StatelessWidget {
  CategoryDoc cat;
  RegionModel? region;
  InsuranceModel? insurance;
  DoctorListPage({required this.cat,this.insurance,this.region});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DoctorCubit, DoctorStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit=DoctorCubit.get(context); 
        return Scaffold(
          appBar: AppBar(
            title: Text('اطباء ' + cat!.cat_name)
              
          ),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Expanded(
                  child: doctorsListBuilder(
                      doctors: cubit.list_doctors),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
