import 'package:delivery_app/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomButtonAppBar extends StatelessWidget {
  final void Function()? onPressed;
  final String textbutton;
  final IconData iconData;
  final bool? active;
  const CustomButtonAppBar({super.key,required this.onPressed, required this.iconData, required this.textbutton, required this.active});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            iconData,
            color: active == true? AppColor.primaryColor : Colors.black,
          ),
          Text(
            textbutton,
            style: TextStyle(
              color: active == true ? AppColor.primaryColor : Colors.black
              
            ),
          ),
        ],
      ),
    );
  }
}