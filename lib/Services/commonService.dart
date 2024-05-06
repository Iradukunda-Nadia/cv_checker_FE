import 'package:cv_checker/Authentication/LoginSignup.dart';
import 'package:cv_checker/Providers/userProvider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CommonService {
  int gender(g){
    if(g == 'Male'){
      return 0;
    }
    else if (g == "Female"){
      return 1;
    }
    else {
      return 2;
    }
  }

  String genderString (g){
    if(g == 0){
      return 'Male';
    }
    else if (g == 1){
      return "Female";
    }
    else {
      return "Other";
    }
  }

  String dateShort(d){
    var date = DateFormat('yyyy-MM-dd').format(DateTime.parse(d));
    return date.toString();
  }

  String dateLong(d){
    DateTime date = DateTime.parse(d);
    return date.toIso8601String();
  }

  int experience(e){
    if(e == "Entry-level"){
      return 0;
    }
    else if (e == "Mid-level"){
      return 1;
    }
    else {
      return 2;
    }
  }

  String experienceString (e){
    if(e == 0){
      return "Entry-level";
    }
    else if (e == 1){
      return "Mid-level";
    }
    else {
      return "Expert";
    }
  }

  int getEducationLevelInt (e){
    if(e.toString().toLowerCase().contains("phd")){
      return 2;
    }
    else if (e.toString().toLowerCase().contains("masters")){
      return 1;
    }
    else {
      return 0;
    }
  }

  String getEducationLevelString (e){
    if(e==2){
      return "PHD";
    }
    else if (e==1){
      return "Masters";
    }
    else {
      return "Bachelors";
    }
  }

  showSnack(context, txt){
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(txt),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          margin: EdgeInsets.only(
              bottom: MediaQuery.of(context).size.height - 100,
              right: 20,
              left: 20),
        ));
  }

  logout(cxt){
    var user = Provider.of<UserProvider>(cxt, listen: false);
    user.cleartUser();
    Navigator.of(cxt).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context)
        => LoginSignup()),
            (Route<dynamic> route) => false);
  }

}