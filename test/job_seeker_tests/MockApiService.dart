import 'package:cv_checker/Services/apiService.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/retry.dart';
import 'package:mockito/mockito.dart';

class MockApiService extends Mock implements ApiService {
  @override
  final Client _client = RetryClient(Client(), retries: 2);

  @override
  void closeClient() {
    _client.close();
    print('_client closed');
  }

  @override
  void clientTimeout() {
    // Do nothing
  }

  @override
  Client returnConnection() {
    return _client;
  }
}