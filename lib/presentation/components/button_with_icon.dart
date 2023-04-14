import 'package:flutter/material.dart';
import 'package:my_gallrey/core/utils/resources/color_manager.dart';

class CustomButtonWithIcon extends StatelessWidget {
  const CustomButtonWithIcon({Key? key, required this.iconName, required this.text,required this.onTap}) : super(key: key);
  final String iconName;
  final String text;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap:onTap ,
      child: Container(
        decoration: BoxDecoration(
          color: ColorManager.white,
          borderRadius: BorderRadius.circular(20)
        ),
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            Image(image: AssetImage(iconName)),
            SizedBox(width: 20,),
            Text(text,style: TextStyle(fontSize: 15,color: ColorManager.grey1),)
          ],
        ),
      ),
    );
  }
}
