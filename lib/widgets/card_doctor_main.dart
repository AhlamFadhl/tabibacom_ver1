import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tabibacom_ver1/models/doctor_model.dart';
import 'package:tabibacom_ver1/screens/doctor_profile/doctor_profile.dart';
import 'package:tabibacom_ver1/shared/components/constants.dart';
import 'package:tabibacom_ver1/shared/network/end_points.dart';
import 'package:tabibacom_ver1/shared/styles/colors.dart';
import 'package:tabibacom_ver1/shared/styles/styles.dart';

class CardDoctorMain extends StatelessWidget {
  final Doctor doc;
  const CardDoctorMain({super.key,required this.doc});

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: () {
        Get.to(
          () => DoctorProfile(crrnt_doctor: doc),
        );
      },
      child: Column(
        children: [
          Container(
            width: double.infinity,
            margin: const EdgeInsetsDirectional.only(end: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
              ),
          //  border: Border.all(color: Colors.grey.shade300),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 110,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                    ),
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl:PATH_IMG + doc.doc_image,
                    placeholder: (context, url) => Container(),
                    errorWidget: (context, url, error) => Container(),
                  ),
                ),
                SizedBox(
                  width: 8.0,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                     
                      Text(
                        doctorNaming(doc.doc_naming) +
                            ' ' +
                            doc.doc_first_name +
                            ' ' +
                            doc.doc_last_name,
                        textAlign: TextAlign.start,
                        style: styleText,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        (doc.doc_specialist ?? '').isEmpty?doc.cat_name??'-':doc.doc_specialist??'',
                        textAlign: TextAlign.start,
                        style: styleText_mini_gryed,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        (doc.doc_price??0)>0?doc.doc_price.toString():'السعر غير متاح',
                        style: styleText.copyWith(color: primary2Color,fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        doc.doc_desc,
                        style: styleText,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
           SizedBox(
                  height: 5,
                ),
          Container(
           decoration: BoxDecoration(
             color: primary2Color.withValues(blue: 0.6,alpha: 0.1),
             borderRadius: BorderRadius.circular(4)
           ),
         
            child: Row(
        
              children: [
                Container(
                  height: 50,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                 //   borderRadius: BorderRadius.circular(20),
                  //  border: Border.all(color: Colors.grey.shade300),
                  shape: BoxShape.circle,
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl:PATH_IMG+( doc.hsptl_logo ?? ''),
                    placeholder: (context, url) => Container(),
                    errorWidget: (context, url, error) => Container(),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      doc.hsptl_name ?? '',
                      textAlign: TextAlign.start,
                      style: styleText_mini_colored.copyWith(fontSize: 10),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      doc.hsptl_address ?? '',
                      textAlign: TextAlign.start,
                      style: styleText.copyWith(fontSize: 10),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 1,
            color: Colors.grey.shade300,
          )
        ],
      ),
    );

  }
}