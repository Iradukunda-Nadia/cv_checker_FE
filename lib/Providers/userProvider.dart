import 'dart:async';

import 'package:cv_checker/Classes/cvClass.dart';
import 'package:cv_checker/Classes/jobClass.dart';
import 'package:cv_checker/Classes/userClass.dart';
import 'package:cv_checker/Services/cvService.dart';
import 'package:cv_checker/Services/jobSeekerService.dart';
import 'package:flutter/foundation.dart';

class UserProvider with ChangeNotifier {

  CV _cv = CV();
  CV get cv => _cv;

  User _user = new User();
  User get user => _user;


  List<Job> jobResults = [];
  bool fetchingJobs = false;

  void setUser(userData) {
    _user.role = userData["role"];
    _user.fullName = userData["fullName"];
    _user.id = userData["id"];
    _user.email = userData["email"];
    notifyListeners();
  }

  void cleartUser() {
    _user= User();
  }



  void setCV(CV currentCV) {
    _cv = currentCV;
    notifyListeners();
  }
  void setPersonalInfo(info) {
    _cv.jobSeekerName = info['name'];
    _cv.email = info['email'];
    notifyListeners();
  }
  void setWorkExperience(info) async{
    await CvService().saveExperience(info);
    _cv.experience ??= [];
    _cv.experience!.add(info);

    notifyListeners();
  }
  void setEducation( cxt, info) async{
    _cv.education ??= [];
    _cv.education!.add(info);
    notifyListeners();
    await CvService().saveEducation(info);
    await CvService().createCV(cxt);
  }
  void setSkills(info) {
    _cv.skills = info.split(",");
    notifyListeners();
  }

  Future<void> createSkills(info) async {
    await CvService().saveSkills(info);
  }

  void setJobInterest(info) {
    _cv.jobSector = info;
    notifyListeners();
  }
  void setExpertiseLevel(info) {
    _cv.experienceLevel = info;
    notifyListeners();
  }


}