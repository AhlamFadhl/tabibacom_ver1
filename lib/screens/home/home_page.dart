import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:tabibacom_ver1/screens/category_list/category_list_page.dart';
import 'package:tabibacom_ver1/screens/home/cubit/cubit.dart';
import 'package:tabibacom_ver1/screens/home/cubit/states.dart';
import 'package:tabibacom_ver1/screens/home/widgets/sercice_card.dart';
import 'package:tabibacom_ver1/shared/components/components.dart';
import 'package:tabibacom_ver1/shared/network/end_points.dart';
import 'package:tabibacom_ver1/widgets/my_text.dart';
import 'package:tabibacom_ver1/widgets/sized_box.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = HomeCubit.get(context);
          return SafeArea(
            child: Container(
              color: Colors.grey.shade100,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomSizedBox(
                      height: 4,
                    ),
                    Image.asset(
                      'assets/images/logo_h.png',
                      height: 50,
                    ),
                    CustomSizedBox(
                      height: 10,
                    ),
                   
                    
                    
                    //Card Service
                    Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                    child: InkWell(
                                  onTap: () {
                                    Get.to(
                                      () => CategoryListPage(
                                          list_category: cubit.list_category),
                                    );
                                  },
                                  child: ServiceCard(
                                      title: ' معاينه في العياده',
                                      image:
                                          'assets/images/img_doctor_book.png'),
                                )),
                                Expanded(
                                  child: InkWell(
                                    onTap: () {},
                                    child: ServiceCard(
                                        title: 'استشاره اونلاين',
                                        image:
                                            'assets/images/img_doctor_online2.png'),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: InkWell(
                                    onTap: (){},
                                    child: ServiceCard(
                                        title: 'زياره منزليه',
                                        image:
                                            'assets/images/img_doctor_visit.png'),
                                  ),
                                ),
                                Expanded(
                                   child: InkWell(
                                    onTap: (){},
                                    child: ServiceCard(
                                        title: 'طلب ادويه',
                                        image: 'assets/images/img_medicine.png'),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )),
                    const CustomSizedBox(
                      height: 10,
                    ),
                    ///Search Bar
                     Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                   
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const MyText(
                            'ابحث عن طبيبك',
                            fontSize: 16,
                           
                          ),
                          const CustomSizedBox(
                            height: 5,
                          ),
                          InkWell(
                            onTap: () {
                              Get.to(
                                () => CategoryListPage(
                                    list_category: cubit.list_category),
                              );
                            },
                            child: Container(
                              height:60,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.shade300,
                                      blurRadius: 1,
                                      offset: Offset(0, 0),
                                      spreadRadius: 0)
                                ],
                                color: Colors.white,
                              ),
                              child: const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'ابحث',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14.0,
                                    ),
                                  ),
                                  Icon(
                                    Icons.search,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const CustomSizedBox(
                      height: 10,
                    ),
                    //Cover Image
                      Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      width: double.infinity,
                      height: 130,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: '${PATH_IMG}cover.png',
                        placeholder: (context, url) => Image.asset(
                          'assets/images/cover.png',
                          fit: BoxFit.cover,
                        ),
                        errorWidget: (context, url, error) => Image.asset(
                          'assets/images/cover.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    CustomSizedBox(
                      height: 10,
                    ),
                    
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MyText(
                                'المستشفيات والمراكز الصحيه',
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              
                              ),
                              /*TextButton(
                                onPressed: () {},
                                child: MyText(
                                  'الكل',
                                ),
                              ),*/
                            ],
                          ),
                          CustomSizedBox(
                            height: 10,
                          ),
                          hospitalsBuilder(
                            hospitals: cubit.list_hospital,
                          ),
                        ],
                      ),
                    ),
                    CustomSizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
