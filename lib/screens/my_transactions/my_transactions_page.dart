import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tabibacom_ver1/models/book_model.dart';
import 'package:tabibacom_ver1/screens/my_transactions/cubit/my_transaction_cubit.dart';
import 'package:tabibacom_ver1/screens/signin/signin_page.dart';
import 'package:tabibacom_ver1/shared/components/components.dart';
import 'package:tabibacom_ver1/shared/cubit/cubit.dart';
import 'package:tabibacom_ver1/shared/styles/colors.dart';
import 'package:tabibacom_ver1/shared/styles/styles.dart';

class MyTransactionsPage extends StatelessWidget {
  const MyTransactionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          MyTransactionCubit()..getLastBooks(AppCubit.get(context).usrNo),
      child: BlocConsumer<MyTransactionCubit, MyTransactionState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = MyTransactionCubit.get(context);
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: ConditionalBuilder(
              builder: (context) => Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
Image.asset('assets/images/manwithcomputer.png',height: 200,),
Text('سجل دخول , واحجز طبيبكم بسهوله'),
SizedBox(height: 20,),
                      //AA
                      defaultButton(
                          function: () {
                            Get.to(
                              () => SignInPage(),
                            )!
                                .then((value) {
                              cubit.getLastBooks(AppCubit.get(context).usrNo);
                            });
                          },
                          text: 'تسجيل الدخول'),
                    ],
                  )),
              condition: AppCubit.get(context).usrNo == 0,
              fallback: (context) => ConditionalBuilder(
                condition: state is MyTransactionLoading,
                builder: (context) =>
                    Center(child: CircularProgressIndicator()),
                fallback: (context) {
                  return SingleChildScrollView(
                    child: ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) =>
                            buildItemBookCard(cubit.list_book[index]),
                        separatorBuilder: (context, index) => SizedBox(
                              height: 10,
                            ),
                        itemCount: cubit.list_book.length),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }

  buildItemBookCard(BookModel book) => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadiusDirectional.circular(10),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadiusDirectional.only(
                  topEnd: Radius.circular(10),
                  topStart: Radius.circular(10),
                ),
              ),
              child: Row(
                children: [
                  Text(
                    'حجز موعد',
                    style: styleText_w,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    DateFormat.yMMMEd().format(DateTime.parse(book.book_date)),
                    style: styleText_w,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    DateFormat.jm().format(
                        DateTime.parse(book.book_date + ' ' + book.book_time)),
                    style: styleText_w,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                ],
              ),
            ),
            if (book.doctor != null)
              Container(
                child: Row(
                  children: [
                    Container(
                      height: 100,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(0),
                          topLeft: Radius.circular(20),
                        ),
                      ),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: book.doctor!.doc_image,
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
                            book.doctor!.cat_name ?? '',
                            textAlign: TextAlign.start,
                            style: styleText_mini_colored,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            book.doctor!.doc_first_name +
                                ' ' +
                                book.doctor!.doc_last_name,
                            textAlign: TextAlign.start,
                            style: styleText,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            book.doctor!.doc_specialist ?? '',
                            textAlign: TextAlign.start,
                            style: styleText_mini_gryed,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            book.book_price.toString(),
                            style: styleText,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            Container(
              width: double.infinity,
              height: 1,
              color: Colors.grey.shade300,
            ),
            if (book.hospital != null)
              Container(
                child: Row(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: book.hospital!.hsptl_logo ?? '',
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
                          book.hospital!.hsptl_name,
                          textAlign: TextAlign.start,
                          style: styleText_mini_colored.copyWith(fontSize: 10),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          book.hospital!.hsptl_address ?? '',
                          textAlign: TextAlign.start,
                          style: styleText.copyWith(fontSize: 10),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ],
                ),
              )
          ],
        ),
      );
}
