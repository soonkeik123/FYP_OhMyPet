import 'package:flutter/material.dart';
import 'package:ohmypet/utils/dimensions.dart';
import 'package:ohmypet/widgets/app_column.dart';
import 'package:ohmypet/widgets/app_icon.dart';
import 'package:ohmypet/widgets/expandable_text_widget.dart';

import '../../utils/colors.dart';
import '../../widgets/big_text.dart';

class ServicePackageDetail extends StatelessWidget {
  const ServicePackageDetail({super.key});

  @override
  Widget build(BuildContext context) {
    print(WidgetsBinding.instance.window.physicalSize.height); //-------------
    print(WidgetsBinding.instance.window.physicalSize.width); //--------------
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
        // Background Image
        Positioned(
          left: 0,
          right: 0,
          child: Container(
            width: double.maxFinite,
            height: Dimensions.servicePckgImgSize,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: AssetImage("assets/images/1.jpg")),
            ),
          ),
        ),
        // Icon Widget on Top
        Positioned(
            top: Dimensions.height45,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.arrow_back_rounded),
                AppIcon(icon: Icons.notifications),
              ],
            )),
        // Introduction of Service Package
        Positioned(
            left: 0,
            right: 0,
            top: Dimensions.servicePckgImgSize - 20,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.only(
                left: Dimensions.width15,
                right: Dimensions.width15,
                top: Dimensions.height20,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(Dimensions.radius30),
                    topLeft: Radius.circular(Dimensions.radius30)),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppColumn(
                    text: "Dog Grooming with Pet Boarding",
                    maxLine: 2,
                  ),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  BigText(text: "Introduce"),
                  SizedBox(
                    height: Dimensions.height10,
                  ),
                  const Expanded(
                    child: SingleChildScrollView(
                      child: ExpandableTextWidget(
                          text:
                              "oqwneken nlelqnwel nqlwelq nqleql2e l nlen lqnlwenlqnw lenqleqdln lqeundlnxoi ndoqnd bbdqli kw odi1oiwhd lqjwbbdliquggw \nliquwdiuqwd \nqiuwhdiqw \nuqwdu qoiwhdiqh \nwduqwdiuqwduig \nqiuwdg."),
                    ),
                  ),
                ],
              ),
            )),
      ]),
      // Button Action Bar
      bottomNavigationBar: Container(
        height: Dimensions.bottomHeightBar,
        padding: EdgeInsets.only(
            top: Dimensions.height10,
            bottom: Dimensions.height10,
            left: Dimensions.width20,
            right: Dimensions.width20),
        decoration: const BoxDecoration(
          color: AppColors.buttonBackgroundColor,
          // borderRadius: BorderRadius.only(
          //   topLeft: Radius.circular(Dimensions.radius20 * 2),
          //   topRight: Radius.circular(Dimensions.radius20 * 2),
          // )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              padding: EdgeInsets.only(
                  top: Dimensions.height15,
                  bottom: Dimensions.height15,
                  left: Dimensions.width15,
                  right: Dimensions.width15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius15),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.remove,
                    color: AppColors.signColor,
                  ),
                  SizedBox(
                    width: Dimensions.width10 / 2,
                  ),
                  BigText(text: "0"),
                  SizedBox(
                    width: Dimensions.width10 / 2,
                  ),
                  const Icon(
                    Icons.add,
                    color: AppColors.signColor,
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                  top: Dimensions.height15,
                  bottom: Dimensions.height15,
                  left: Dimensions.width15,
                  right: Dimensions.width15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white,
              ),
              child: BigText(
                text: "Use Package",
                color: AppColors.signColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
