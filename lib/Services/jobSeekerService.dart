import 'dart:async';
import 'dart:convert';
import 'package:cv_checker/Classes/jobClass.dart';
import 'package:cv_checker/Services/apiService.dart';
import 'package:cv_checker/Services/appURLS.dart';
import 'package:flutter/material.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:http/http.dart' as http;


class JobSeekerService {
  Future<Map<String, dynamic>> login(data) async {
    var result;
    try {
      final response = await http.post(
          Uri.parse(ApiService.apiServer + AppUrl.jobSeekerLogin),
          body: json.encode(data),
          headers: {
            "Access-Control-Allow-Origin": "*",
            'Content-Type': 'application/json',
            'Accept': '*/*'
          });
      print(response.statusCode);
      if (response.statusCode == 200) {
        print(response.body);
        result = {'status': true, 'data': json.decode(response.body)};
      } else {
        print(response.body);
        result = {'status': false, 'message': json.decode(response.body)};
        Sentry.captureException('Error logging in Job seeker: ${result}');
      }
      return result;
    }
    catch (SocketException) {
      print(SocketException);
      result = {'status': false, 'message': SocketException};
      /*Sentry.captureException('Error logging in Job seeker: ${SocketException}');*/
      return result;
    }
  }

  Future<Map<String, dynamic>> signUp(data) async {
    var result;

    final response = await http.post(
        Uri.parse(ApiService.apiServer + AppUrl.jobSeekerSignup),
        body: json.encode(data),
        headers: {
          'Content-Type': 'application/json',
        });
    print(response.statusCode);
    if (response.statusCode == 200) {
      print(response.body);
      result = {'status': true, 'data': json.decode(response.body)};
    } else {
      print(response.body);
      result = {'status': false, 'message': json.decode(response.body)};
      Sentry.captureException('Error Signing up Job seeker: ${result}');
    }
    return result;
  }

  Future<dynamic> getJobs() async {
    Map<String, dynamic> result;
    var jobsList = [];

    final response = await http.get(
        Uri.parse(ApiService.apiServer + AppUrl.getJobs),
        headers: {
          'Content-Type': 'application/json',
        });
    print(response.statusCode);
    if (response.statusCode == 200) {
      result = {
        'status': true,
        'data': json.decode(response.body)['data']["jobPostingList"]
      };
      jobsList = List<Job>.from(json.decode(response.body)['data']
      ["jobPostingList"].map((results) => Job.fromJson
        (results)).toList());
      print('Job list: $jobsList');

      return jobsList;
    } else {
      print(response.body);
      result = {'status': false, 'message': json.decode(response.body)};
      Sentry.captureException('Error Signing up Job seeker: ${result}');
      return jobsList;
    }
  }
}