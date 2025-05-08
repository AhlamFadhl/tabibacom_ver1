import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tabibacom_ver1/models/hospital_types_model.dart';
import 'package:tabibacom_ver1/models/insurance.dart';
import 'package:tabibacom_ver1/models/region.dart';
import 'package:tabibacom_ver1/screens/doctor_list/cubit/cubit.dart';
import 'package:tabibacom_ver1/screens/doctor_list/cubit/states.dart';
import 'package:tabibacom_ver1/screens/doctor_list/widget/filtter_card.dart';
import 'package:tabibacom_ver1/screens/insurance_list/cubit/cubit.dart';
import 'package:tabibacom_ver1/screens/region_list/cubit/cubit.dart';
import 'package:tabibacom_ver1/shared/components/components.dart';
import 'package:tabibacom_ver1/widgets/my_text.dart';
import 'package:tabibacom_ver1/widgets/my_text_formfield_widget.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

class DoctorListPage extends StatelessWidget {
  DoctorListPage();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DoctorCubit, DoctorStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = DoctorCubit.get(context);
        return Scaffold(
          appBar: AppBar(title: Text('اطباء ' + cubit.cat!.cat_name)),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyTextFormField(
                  controller: cubit.controllerSearch,
                  validator: (p0) {},
                  suffexIcon: Icon(Icons.search),
                  placeHolder: 'ابحث عن اسم الطبيب او المركز الطبي',
                ),
                const SizedBox(
                  height: 10,
                ),
                MyText(
                  'تبحث في',
                  fontSize: 12,
                ),
                const SizedBox(
                  height: 4,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Flexible(
                      child: InkWell(
                        onTap: () {
                          showSheetRegion(context);
                        },
                        child: FiltterCard(
                          title: (cubit.region!.drct_id ?? 0) == 0
                              ? 'عدن'
                              : cubit.region!.drct_name ?? '',
                          isSearched: (cubit.region!.drct_id ?? 0) != 0,
                        ),
                      ),
                    ),
                    Flexible(
                      child: InkWell(
                        onTap: () {
                          showSheetInsurance(context);
                        },
                        child: FiltterCard(
                          title: (cubit.insurance!.ins_no ?? 0) == 0
                              ? 'شركه التأمين'
                              : cubit.insurance!.ins_name ?? '',
                          isSearched: (cubit.insurance!.ins_no ?? 0) != 0,
                        ),
                      ),
                    ),
                    Flexible(
                      child: InkWell(
                        onTap: () {
                          showSheetType(context);
                        },
                        child: FiltterCard(
                          title: (cubit.hospitalType != null
                                      ? (cubit.hospitalType!.hstype_no)
                                      : 0) ==
                                  0
                              ? 'نوع المنشأة'
                              : cubit.hospitalType!.hstype_name,
                          isSearched: (cubit.hospitalType != null
                                  ? (cubit.hospitalType!.hstype_no)
                                  : 0) !=
                              0,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: doctorsListBuilder(doctors: cubit.list_doctors),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  showSheetRegion(context) => WoltModalSheet.show(
        context: context,
        pageListBuilder: (bottomSheetContext) => [
          WoltModalSheetPage(
            backgroundColor: Colors.white,
            useSafeArea: true,
            topBarTitle: Text('اختر المنطقه'),
            isTopBarLayerAlwaysVisible: true,
            enableDrag: true,
            child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return InkWell(
                    onTap: () {
                      DoctorCubit.get(context).changeFiltterRegion(
                          RegionModel(drct_id: 0, drct_name: 'عدن'));
                      Navigator.of(bottomSheetContext).pop();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text('الكل'),
                    ),
                  );
                } else {
                  return InkWell(
                    onTap: () {
                      DoctorCubit.get(context).changeFiltterRegion(
                          RegionCubit.get(context).list_region[index - 1]);
                      Navigator.of(bottomSheetContext).pop();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(RegionCubit.get(context)
                              .list_region[index - 1]
                              .drct_name ??
                          ''),
                    ),
                  );
                }
              },
              separatorBuilder: (context, index) => Divider(
                color: Colors.grey.shade200,
              ),
              itemCount: RegionCubit.get(context).list_region.length + 1,
            ),
          ),
        ],
      );

  showSheetInsurance(context) => WoltModalSheet.show(
        context: context,
        pageListBuilder: (bottomSheetContext) => [
          WoltModalSheetPage(
            backgroundColor: Colors.white,
            useSafeArea: true,
            topBarTitle: Text('اختر شركة التأمين'),
            isTopBarLayerAlwaysVisible: true,
            enableDrag: true,
            child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return InkWell(
                    onTap: () {
                      DoctorCubit.get(context).changeFiltterInsurance(
                          InsuranceModel(ins_no: 0, ins_name: 'شركة التأمين'));
                      Navigator.of(bottomSheetContext).pop();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text('الكل'),
                    ),
                  );
                } else {
                  return InkWell(
                    onTap: () {
                      DoctorCubit.get(context).changeFiltterInsurance(
                          InsuranceCubit.get(context).list_insurance[index - 1]);
                      Navigator.of(bottomSheetContext).pop();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(InsuranceCubit.get(context)
                              .list_insurance[index - 1]
                              .ins_name ??
                          ''),
                    ),
                  );
                }
              },
              separatorBuilder: (context, index) => Divider(
                color: Colors.grey.shade200,
              ),
              itemCount: InsuranceCubit.get(context).list_insurance.length + 1,
            ),
          ),
        ],
      );

  showSheetType(context) => WoltModalSheet.show(
        context: context,
        pageListBuilder: (bottomSheetContext) => [
          WoltModalSheetPage(
            backgroundColor: Colors.white,
            useSafeArea: true,
            topBarTitle: Text('اختر نوع المنشأة'),
            isTopBarLayerAlwaysVisible: true,
            enableDrag: true,
            child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return InkWell(
                    onTap: () {
                      DoctorCubit.get(context).changeFiltterType(
                          HospitalTypes(hstype_no: 0, hstype_name: 'نوع المنشأة',hstype_image: ''));
                      Navigator.of(bottomSheetContext).pop();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text('الكل'),
                    ),
                  );
                } else {
                  return InkWell(
                    onTap: () {
                      DoctorCubit.get(context).changeFiltterType(
                          DoctorCubit.get(context).list_types[index - 1]);
                      Navigator.of(bottomSheetContext).pop();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(DoctorCubit.get(context)
                              .list_types[index - 1]
                              .hstype_name),
                    ),
                  );
                }
              },
              separatorBuilder: (context, index) => Divider(
                color: Colors.grey.shade200,
              ),
              itemCount:  DoctorCubit.get(context).list_types.length + 1,
            ),
          ),
        ],
      );



}
