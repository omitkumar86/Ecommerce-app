import 'package:ecommerce_app/const/style.dart';
import 'package:ecommerce_app/providers/order_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jiffy/jiffy.dart';
import 'package:provider/provider.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  void initState() {
    // TODO: implement initState
    Provider.of<OrderProvider>(context, listen: false).getAllOrderData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final orderList = Provider.of<OrderProvider>(context).orderList;

    return Scaffold(
      backgroundColor: Color(0xffF5F5F5).withOpacity(0.6),
      appBar: AppBar(
        title: Text("My Order"),
        centerTitle: true,
        elevation: 5,
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 5.h),
        child: ListView.separated(
            itemBuilder: (context, index) {
              var clr = orderList[index].orderStatus!.orderStatusCategory!.id;
              var discountPrice = orderList[index].discount;
              var vat = orderList[index].vAT;
              return Card(
                color: Color(0xffFAE5D3),
                elevation: 8,
                child: Container(
                  height: 215.h,
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: 8.h, left: 8.w, right: 8.w, bottom: 8.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "User ID: #${orderList[index].user!.id}",
                              style:
                                  myStyle(18.sp, Colors.black, FontWeight.w700),
                            ),
                            Text(
                              "User Name: ${orderList[index].user!.name}",
                              style:
                                  myStyle(18.sp, Colors.black, FontWeight.w700),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.calendar_month_outlined,
                              color: Colors.deepOrange,
                              size: 18.sp,
                            ),
                            Text(
                              " Order Date: ",
                              style:
                                  myStyle(18.sp, Colors.black, FontWeight.w700),
                            ),
                            Text(
                              "${Jiffy(orderList[index].orderDateAndTime).format("MMMM do yyyy")}",
                              style:
                                  myStyle(18.sp, Colors.black, FontWeight.w600),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.timelapse_outlined,
                              color: Colors.deepOrange,
                              size: 18.sp,
                            ),
                            Text(
                              " Order Time: ",
                              style:
                                  myStyle(18.sp, Colors.black, FontWeight.w700),
                            ),
                            Text(
                              "${Jiffy(orderList[index].orderDateAndTime).format("h:mm:ss a")}",
                              style:
                                  myStyle(18.sp, Colors.black, FontWeight.w600),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Order ID: ",
                              style:
                                  myStyle(18.sp, Colors.black, FontWeight.w700),
                            ),
                            Text(
                              "#${orderList[index].id}",
                              style:
                                  myStyle(18.sp, Colors.black, FontWeight.w600),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Quantity: ",
                              style:
                                  myStyle(18.sp, Colors.black, FontWeight.w700),
                            ),
                            Text(
                              "${orderList[index].quantity}",
                              style:
                                  myStyle(18.sp, Colors.black, FontWeight.w600),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Price: ",
                              style:
                                  myStyle(18.sp, Colors.black, FontWeight.w700),
                            ),
                            Text(
                              "${orderList[index].price} ৳",
                              style:
                                  myStyle(18.sp, Colors.black, FontWeight.w600),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Discount Price: ",
                              style:
                                  myStyle(18.sp, Colors.black, FontWeight.w700),
                            ),
                            discountPrice == null
                                ? Text(
                                    "0 ৳",
                                    style: myStyle(
                                        18.sp, Colors.black, FontWeight.w600),
                                  )
                                : Text(
                                    "${orderList[index].discount} ৳",
                                    style: myStyle(
                                        18.sp, Colors.black, FontWeight.w600),
                                  ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "VAT+: ",
                              style:
                                  myStyle(18.sp, Colors.black, FontWeight.w700),
                            ),
                            vat == null
                                ? Text(
                                    "0 ৳",
                                    style: myStyle(
                                        18.sp, Colors.black, FontWeight.w600),
                                  )
                                : Text(
                                    "${orderList[index].vAT} ৳",
                                    style: myStyle(
                                        18.sp, Colors.black, FontWeight.w600),
                                  ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Order Status: ",
                              style:
                                  myStyle(18.sp, Colors.black, FontWeight.w700),
                            ),
                            Text(
                              "${orderList[index].orderStatus!.orderStatusCategory!.name} ",
                              style: myStyle(
                                  18,
                                  clr == 1
                                      ? Color(0xffFF0000)
                                      : clr == 2
                                          ? Color(0xff0000FF)
                                          : Color(0xff008000),
                                  FontWeight.w600),
                            ),
                            Icon(
                              clr == 1
                                  ? Icons.delivery_dining_outlined
                                  : clr == 2
                                      ? Icons.store_mall_directory_outlined
                                      : Icons.check_circle_outline_sharp,
                              size: 20.sp,
                              color: clr == 1
                                  ? Color(0xffFF0000)
                                  : clr == 2
                                      ? Color(0xff0000FF)
                                      : Color(0xff008000),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => SizedBox(
                  height: 10.h,
                ),
            itemCount: orderList.length),
      ),
    );
  }
}
