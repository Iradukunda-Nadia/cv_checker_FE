import 'dart:io';

class AppUrl {
  static String testURL = "/api/login";
  static String jobSeekerLogin = "/api/user/v1/users/jobseeker/login";
  static String jobSeekerSignup = "/api/user/v1/users/jobseeker/signup";
  static String recruiterLogin = "/api/user/v1/users/recruiter/login";
  static String recruiterSignup = "/api/user/v1/users/recruiter/signup";
  static String cvCreate = "/api/user/v1/users/cv/create";
  static String educationQ = "/api/user/v1/users/educationQualification/create";
  static String pQ = "/api/user/v1/users/professionalQualification/create";
  static String experience = "/api/user/v1/users/experience/create";
  static String skills = "/api/user/v1/users/skill/create";
  static String createJob = "/api/user/v1/users/jobPosting/create";
  static String getJobs = "/api/user/v1/users/jobPosting";
  static String getCV = "/api/user/v1/users/jobseeker/cv";
  static String getCandidates = "/api/user/v1/users/jobseeker";
}