import 'package:flutter/material.dart';
import 'package:flutter_mvvm_provider/res/color.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final bool loading;
  final bool inverse;
  final VoidCallback onPress;
  const RoundButton(
      {Key? key,
      required this.title,
      required this.onPress,
      this.inverse = false,
      this.loading = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: 50,
        width: 400,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            border: Border.all(
              width: inverse ? 2 : 0,
              color: AppColors.primaryColor,
            ),
            color: inverse
                ? AppColors.whiteColor.withOpacity(0.5)
                : AppColors.primaryColor,
            borderRadius: BorderRadius.circular(10)),
        child: loading
            ? const CircularProgressIndicator(
                color: AppColors.whiteColor,
              )
            : Text(
                title,
                style: TextStyle(
                  color:
                      inverse ? AppColors.primaryColor : AppColors.whiteColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
      ),
    );
  }
}
