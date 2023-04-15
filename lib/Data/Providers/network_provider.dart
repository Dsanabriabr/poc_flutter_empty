import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:result_dart/result_dart.dart';

enum HTTPMethods { get, post, put }

class NetworkProvider {
  final _header = <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
  };
  final Encoding _encoding = utf8;

  Future<http.Response> _postRequest(String url, Map<String, dynamic>? body) {
    return http.post(Uri.parse(url),
        headers: _header, body: jsonEncode(body), encoding: _encoding);
  }

  Future<http.Response> _putRequest(String url, Map<String, dynamic>? body) {
    return http.put(Uri.parse(url),
        headers: _header, body: jsonEncode(body), encoding: _encoding);
  }

  Future<http.Response> _getRequest(String url) {
    return http.get(Uri.parse(url), headers: _header);
  }

  Future<http.Response> _methodSwitch(
      HTTPMethods method, String url, Map<String, dynamic>? body) {
    switch (method) {
      case HTTPMethods.get:
        return _getRequest(url);
      case HTTPMethods.post:
        return _postRequest(url, body);
      case HTTPMethods.put:
        return _putRequest(url, body);
    }
  }

  AsyncResult<http.Response, Exception> _doRequest(
      HTTPMethods method, String url, Map<String, dynamic>? body) async {
    await _methodSwitch(method, url, body).then((response) {
      if (response.statusCode == 201 || response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body)["data"];
        return Success(data);
      } else {
        final errorCode = response.statusCode;
        throw Exception('Error code = $errorCode. Request Fail.');
      }
    }).whenComplete(() {
      print("$method Request to $url complete.");
    });
    return Failure(Exception('Request incomplete.'));
  }

  Future<Result<String, Exception>> request(HTTPMethods method, String url,
      Map<String, dynamic>? body) async {
    final response = await _doRequest(method, url, body);
    response.fold((success) {
      return Success(response);
    }, (error) {
      return Failure(response);
    });
    return Failure(Exception('Error Request.'));
  }
}