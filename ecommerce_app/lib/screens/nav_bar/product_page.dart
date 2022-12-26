import 'package:ecommerce_app/const/api_link.dart';
import 'package:ecommerce_app/const/style.dart';
import 'package:ecommerce_app/providers/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  void initState() {
    // TODO: implement initState
    Provider.of<ProductProvider>(context, listen: false).getProductData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final productList = Provider.of<ProductProvider>(context).productList;
    return Scaffold(
      backgroundColor: Color(0xffF5F5F5).withOpacity(0.6),
      appBar: AppBar(
        title: Text("All Products"),
        centerTitle: true,
        elevation: 5,
      ),
      body: productList.isEmpty
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: EdgeInsets.only(
                left: 8.w,
                right: 8.w,
                top: 8.h,
              ),
              child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 5.w,
                      mainAxisSpacing: 4.h,
                      childAspectRatio: 0.55.h
                      // mainAxisExtent: 4,
                      ),
                  itemCount: productList.length,
                  itemBuilder: (context, index) {
                    var savePrice = productList[index].price![0].fixedValue;
                    var percentPrice = productList[index].price![0].percentOf;
                    var stockItem = productList[index].isAvailable;

                    return Card(
                      elevation: 7,
                      child: Container(
                        child: Padding(
                          padding: EdgeInsets.only(top: 8.h),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    height: 25.h,
                                    width: 85.w,
                                    decoration: BoxDecoration(
                                        color: Color(0xff000080),
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(10.r),
                                            bottomRight:
                                                Radius.circular(10.r))),
                                    child: savePrice == null
                                        ? Text(
                                            "Save: 0 ৳",
                                            style: myStyle(14.sp, Colors.white,
                                                FontWeight.w600),
                                          )
                                        : Text(
                                            "Save: ${productList[index].price![0].fixedValue} ৳",
                                            style: myStyle(14.sp, Colors.white,
                                                FontWeight.w600),
                                          ),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    height: 25.h,
                                    width: 50.w,
                                    decoration: BoxDecoration(
                                        color: Color(0xff000080),
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10.r),
                                            bottomLeft: Radius.circular(10.r))),
                                    child: percentPrice == null
                                        ? Text(
                                            "0 %",
                                            style: myStyle(14.sp, Colors.white,
                                                FontWeight.w600),
                                          )
                                        : Text(
                                            "${productList[index].price![0].percentOf} %",
                                            style: myStyle(14.sp, Colors.white,
                                                FontWeight.w600),
                                          ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Container(
                                height: 95.h,
                                width: 80.w,
                                decoration: BoxDecoration(
                                    color: Colors.orange,
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        "${imageUrl}${productList[index].image}",
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.circular(5)),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Text(
                                "${productList[index].name}",
                                style: myStyle(
                                    16.sp, Colors.black, FontWeight.w700),
                              ),
                              Divider(
                                thickness: 2.h,
                                indent: 12.w,
                                endIndent: 12.w,
                                color: Colors.deepOrange,
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 12.w),
                                width: double.infinity,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "Original Price: ",
                                          style: myStyle(13.sp, Colors.black,
                                              FontWeight.w700),
                                        ),
                                        Text(
                                          "${productList[index].price![0].originalPrice} ৳",
                                          style: myStyle(
                                              13.sp,
                                              Color(0xff008000),
                                              FontWeight.w700),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Discounted Price: ",
                                          style: myStyle(13.sp, Colors.black,
                                              FontWeight.w700),
                                        ),
                                        Text(
                                          "${productList[index].price![0].discountedPrice} ৳",
                                          style: myStyle(
                                              13.sp,
                                              Color(0xff000080),
                                              FontWeight.w700),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Discounted Type: ",
                                          style: myStyle(13.sp, Colors.black,
                                              FontWeight.w700),
                                        ),
                                        Text(
                                          "${productList[index].price![0].discountType}",
                                          style: myStyle(
                                              13.sp,
                                              Color(0xffFF0000),
                                              FontWeight.w700),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Stock: ",
                                          style: myStyle(13.sp, Colors.black,
                                              FontWeight.w700),
                                        ),
                                        Text(
                                          "${productList[index].stockItems![0].quantity}",
                                          style: myStyle(
                                              13.sp,
                                              Color(0xff008000),
                                              FontWeight.w700),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Available: ",
                                          style: myStyle(13.sp, Colors.black,
                                              FontWeight.w700),
                                        ),
                                        stockItem == 0
                                            ? Text(
                                                "Stock Out",
                                                style: myStyle(
                                                    13.sp,
                                                    Color(0xffFF0000),
                                                    FontWeight.w700),
                                              )
                                            : Text(
                                                "In Stock",
                                                style: myStyle(
                                                    13.sp,
                                                    Color(0xff008000),
                                                    FontWeight.w700),
                                              ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 8.h,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(right: 10.w),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          InkWell(
                                            onTap: () {},
                                            child: Icon(
                                              Icons.edit,
                                              color: Colors.black54,
                                              size: 22.sp,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10.w,
                                          ),
                                          InkWell(
                                            onTap: () {},
                                            child: Icon(
                                              Icons.delete,
                                              color: Colors.red,
                                              size: 22.sp,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
