import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kavinapp/main.dart';
import 'package:kavinapp/model/homescreen/recipes_model.dart';
import 'package:kavinapp/view/homepage/Home_page.dart';

import '../../core/colorset.dart';

class Detailsscreen extends StatelessWidget {
  const Detailsscreen({super.key, required this.data});

  final Recipe data;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MyApp.h,
          width: MyApp.w,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                ColorState.mainlitercolor,
                ColorState.mainrcolor,
              ])),
          child: Column(
            children: [
              SizedBox(
                height: MyApp.h * .05,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                    onPressed: () {
                      Get.to(HomePage());
                    },
                    icon: Icon(
                      CupertinoIcons.chevron_left_circle_fill,
                      color: ColorState.textoppositecolor,
                    )),
              ),
              Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: MyApp.w * .9,
                      height: MyApp.h * .6,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(MyApp.h * .05),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(MyApp.h * .05),
                        child: CachedNetworkImage(
                          imageUrl: data.image,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Center(
                            child: CircularProgressIndicator(),
                          ),
                          errorWidget: (context, url, error) => Center(
                            child: Icon(Icons.hide_image,
                                color: ColorState.wishlistedcolor),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MyApp.h * .05,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: MyApp.h * .02,
                        right: MyApp.h * .02,
                      ),
                      child: Text(
                        "${data.name}",
                        style: TextStyle(
                            color: ColorState.textoppositecolor,
                            fontWeight: FontWeight.bold,
                            fontSize: MyApp.h * .05),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(MyApp.h * .02),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "ingredients",
                          style: TextStyle(
                              fontSize: MyApp.h * .02,
                              decoration: TextDecoration.underline,
                              decorationColor: ColorState.textoppositecolor,
                              decorationThickness: MyApp.h * .001,
                              overflow: TextOverflow.ellipsis,
                              color: ColorState.textoppositecolor),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: MyApp.h * .02,
                        right: MyApp.h * .02,
                        bottom: MyApp.h * .02,
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: List.generate(
                            data.ingredients.length,
                            (index) => Text(
                              "${index + 1} . ${data.ingredients[index]}",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: ColorState.textoppositecolor,
                                  overflow: TextOverflow.ellipsis,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(MyApp.h * .02),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "instructions",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              decorationColor: ColorState.textoppositecolor,
                              decorationThickness: MyApp.h * .001,
                              fontSize: MyApp.h * .02,
                              overflow: TextOverflow.ellipsis,
                              color: ColorState.textoppositecolor),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: MyApp.h * .02,
                        right: MyApp.h * .02,
                        bottom: MyApp.h * .02,
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: List.generate(
                            data.instructions.length,
                            (index) => Text(
                              "${index + 1} . ${data.instructions[index]}",
                              textAlign: TextAlign.left,
                              maxLines: null,
                              style: TextStyle(
                                  color: ColorState.textoppositecolor,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(MyApp.h * .02),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "description,",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              decorationColor: ColorState.textoppositecolor,
                              decorationThickness: MyApp.h * .001,
                              fontSize: MyApp.h * .02,
                              overflow: TextOverflow.ellipsis,
                              color: ColorState.textoppositecolor),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: MyApp.h * .02,
                        right: MyApp.h * .02,
                        bottom: MyApp.h * .02,
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "description not available",
                          textAlign: TextAlign.left,
                          maxLines: null,
                          style: TextStyle(
                              color: ColorState.textoppositecolor,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
