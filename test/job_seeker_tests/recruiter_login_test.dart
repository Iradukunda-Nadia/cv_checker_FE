mport 'dart:convert';
import 'dart:convert';

import 'package:cv_checker/Services/apiService.dart';
import 'package:cv_checker/Services/appURLS.dart';
import 'package:cv_checker/Services/jobSeekerService.dart';
import 'package:cv_checker/Services/recruiterService.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:mockito/mockito.dart';

void main() {
  group('JobSeekerService', () {
    late RecruiterService recService;
    late http.Client httpClient;

    setUp(() {
      httpClient = MockClient((request) async {
        if (request.url.path == AppUrl.jobSeekerLogin) {
          return http.Response(json.encode({'message': 'Successful'}), 200);
        }
        return http.Response('Not Found', 404);
      });
      recService = RecruiterService();
    });

    test('login returns successful result when status code is 200', () async {
      final data = {'email': 'j5@gmail.com', 'password': 'Test@123'};
      final result = await recService.login(data);
      expect(result, {'status': true, 'data': result['data']});
    });

    test('login returns error result when status code is not 200', () async {
      final data = {'email': 'r6@gmail.com', 'password': 'Test@123'};
      final result = await recService.login(data);
      expect(result, {'status': false, 'message': result['message']});
    });
  });
}