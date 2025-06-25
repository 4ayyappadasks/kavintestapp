import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:kavinapp/controller/home/homecontroller.dart';
import 'package:get/get.dart';
import 'package:kavinapp/core/colorset.dart';
import 'package:kavinapp/main.dart';
import 'package:kavinapp/view/detailspage/detailsscreen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Homecontroller homecontroller = Get.put(Homecontroller());
    return Scaffold(
      body: Obx(
        () => homecontroller.apierror.value
            ? Center(
                child: Text("error in api !"),
              )
            : Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                      ColorState.mainlitercolor,
                      ColorState.mainrcolor,
                    ])),
                child: Center(
                  child: Obx(() => homecontroller.apiloading.value
                      ? CircularProgressIndicator()
                      : CarouselSlider(
                          options: CarouselOptions(
                            height: MyApp.h * .6,
                            enlargeCenterPage: true,
                          ),
                          items: homecontroller.recipes?.recipes.map((i) {
                            return Builder(
                              builder: (BuildContext context) {
                                return GestureDetector(
                                  onTap: () {
                                    (homecontroller.apierror.value == false &&
                                            homecontroller.apiloading.value ==
                                                false)
                                        ? Get.to(Detailsscreen(data: i),
                                            transition:
                                                Transition.circularReveal)
                                        : null;
                                  },
                                  child: Column(
                                    children: [
                                      Text(
                                        i.name,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: ColorState.textoppositecolor,
                                            fontSize: MyApp.h * .05,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Expanded(
                                        child: Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 5.0),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                MyApp.h * .05),
                                          ),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                                MyApp.h * .05),
                                            child: CachedNetworkImage(
                                              imageUrl: i.image,
                                              fit: BoxFit.cover,
                                              placeholder: (context, url) =>
                                                  Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              ),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      Center(
                                                child: Icon(Icons.hide_image,
                                                    color: ColorState
                                                        .wishlistedcolor),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Column(
                                        children: List.generate(
                                          i.ingredients.length > 2 ? 2 : 1,
                                          (index) => Text(
                                            i.ingredients[index],
                                            textAlign: TextAlign.center,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                color: ColorState
                                                    .textoppositecolor),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              },
                            );
                          }).toList(),
                        )),
                ),
              ),
      ),
    );
  }
}
