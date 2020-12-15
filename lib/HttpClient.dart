import 'dart:async';
import 'dart:collection';

import 'package:http/http.dart' as http;

class HttpClient{

  final apiKey = "621a656f252b4f5eb71989a3cb634ae4";

  var url;
  http.Client? client;

  void open(){
    client = http.Client();
  }

  void close(){
    client?.close();
  }

  Future<http.Response> get(String url, Map<String, String> header) {
    if(client != null){
      return client!.get(url, headers: header);
    }else{
      return http.get(url, headers: header);
    }
  }

  Future<http.Response> post(String url, Map<String, String> header) async{
    if(client != null){
      return await client!.post(url, headers: header);
    }else{
      return await http.post(url, headers: header);
    }
  }

}