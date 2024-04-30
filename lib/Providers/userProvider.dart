import 'package:cv_checker/Classes/cvClass.dart';
import 'package:flutter/foundation.dart';

class UserProvider with ChangeNotifier {

  CV _cv = CV();
  CV get cv => _cv;

  void setCV(CV currentCV) {
    _cv = currentCV;
    notifyListeners();
  }
  void setPersonalInfo(info) {
    _cv.name = info['name'];
    _cv.phone = info['phone'];
    _cv.email = info['email'];
    _cv.dob = info['dob'];
    notifyListeners();
  }
  void setWorkExperience(info) {
    _cv.experience ??= [];
    _cv.experience!.add(info);
    notifyListeners();
  }
  void setEducation(info) {
    _cv.education ??= [];
    _cv.education!.add(info);
    notifyListeners();
  }
  void setSkills(info) {
    _cv.skills = info.split(",");
    notifyListeners();
  }

  void setJobInterest(info) {
    _cv.jobInterest = info;
    notifyListeners();
  }
  void setExpertiseLevel(info) {
    _cv.jobInterest = info;
    notifyListeners();
  }

}