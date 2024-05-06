import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:http/retry.dart';
import 'package:http/http.dart' as http;

class ApiService with ChangeNotifier {
  // this is the url to the localhost that exposes the apis
  static const  String apiServer = 'http://localhost:5173';

  //create a http retry client to retry failed connections atleast twice
  final Client _client = RetryClient(Client(),
      retries: 2);



  closeClient(){
    _client.close();
    print('_client closed');
  }
  clientTimeout(){
  }

  returnConnection() {
    return http.Client();
  }
}