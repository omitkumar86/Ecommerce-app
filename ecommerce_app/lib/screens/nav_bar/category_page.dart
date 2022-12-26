import 'package:ecommerce_app/const/api_link.dart';
import 'package:ecommerce_app/const/style.dart';
import 'package:ecommerce_app/model_class/category_model.dart';
import 'package:ecommerce_app/providers/category_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  void initState() {
    // TODO: implement initState
    Provider.of<CategoryProvider>(context, listen: false).getCategoryData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final categoryList = Provider.of<CategoryProvider>(context).categoryList;
    return Scaffold(
      backgroundColor: Color(0xffF5F5F5).withOpacity(0.6),
      appBar: AppBar(
        title: Text("All Categories"),
        centerTitle: true,
        elevation: 5,
      ),
      body: categoryList.isEmpty
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: EdgeInsets.only(
                left: 10.w,
                right: 10.w,
                top: 10.h,
              ),
              child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 7,
                      childAspectRatio: 0.9
                      // mainAxisExtent: 4,
                      ),
                  itemCount: categoryList.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 5,
                      child: Container(
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  height: 130.h,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          "${imageUrl}${categoryList[index].image}",
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.circular(5)),
                                ),
                                Positioned(
                                    bottom: 5.h,
                                    right: 5.w,
                                    child: CircleAvatar(
                                      backgroundImage: NetworkImage(
                                        "${imageUrl}${categoryList[index].icon}",
                                      ),
                                    )),
                                Positioned(
                                    right: 3.w,
                                    top: 3.h,
                                    child: Card(
                                      elevation: 5,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
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
                                    )),
                              ],
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Container(
                                padding: EdgeInsets.only(left: 5.w, right: 5.w),
                                alignment: Alignment.center,
                                height: 30.h,
                                width: double.infinity,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "${categoryList[index].name}",
                                      style: myStyle(
                                          16.sp, Colors.black, FontWeight.w700),
                                    ),
                                  ],
                                )),
                          ],
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
