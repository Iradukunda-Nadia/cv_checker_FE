import 'package:cv_checker/AppUtils/appColors.dart';
import 'package:flutter/material.dart';


class FetchingLoader extends StatelessWidget {
  const FetchingLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Center(
        child: CircleAvatar(
          radius: 15,
          backgroundColor: Colors.white,
          child: Container(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(
              strokeWidth: 1.5,
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryColor),
            ),
          )
        ),
      ),
    );
  }
}