import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:game_tester/proto/create_token_ret.dart';
import 'package:game_tester/proto/result.dart';
import 'package:game_tester/proto/user_info_result.dart';
import 'package:http/http.dart' as http;
import 'package:game_tester/proto/login_ret.dart';
import 'package:http/http.dart';

class Sender {
  static final Sender _singleton = Sender._internal();

  final String _serverAddress = 'api.h5navi.com:4433';
  int _token = -1;
  final Map<String, String> _headers = {
    HttpHeaders.contentTypeHeader: 'application/json',
  };

  factory Sender() {
    return _singleton;
  }

  Sender._internal();

  void updateCookie(http.Response response) {
    String? rawCookie = response.headers['set-cookie'];
    if (rawCookie != null) {
      int index = rawCookie.indexOf(';');
      _headers['cookie'] =
          (index == -1) ? rawCookie : rawCookie.substring(0, index);
    }
  }

  Future<Response> post(Uri url, {Object? body, Encoding? encoding}) async {
    var response = await http.post(
      url,
      headers: _headers,
      body: json.encode(body),
      encoding: encoding,
    );
    updateCookie(response);
    return response;
  }

  Future<Result> postFunc(String func,
      {Map<String, String>? parameters}) async {
    var url = Uri.https(_serverAddress, 'func/0/$_token');
    var body = <String, dynamic>{};
    body['func'] = func;
    body['context'] = parameters ?? {};
    var response = await post(url, body: body);
    var result = Result.fromJson(json.decode(response.body));
    return result;
  }

  Future<LoginRet?> login(
      {required String account, required String password}) async {
    var url = Uri.https(_serverAddress, 'login');
    var response = await post(
      url,
      body: {
        'account': account,
        'password': password,
      },
    );
    var statusCode = response.statusCode;
    var body = response.body;

    if (statusCode != 200) {
      return LoginRet(success: false, msg: 'connect err: $statusCode');
    }

    debugPrint('Response status: $statusCode');
    debugPrint('Response body: $body');

    var loginRet = LoginRet.fromJson(json.decode(body));
    return loginRet;
  }

  Future<bool?> createToken() async {
    var url = Uri.https(_serverAddress, 'create_token/0');
    var response = await post(
      url,
    );
    var statusCode = response.statusCode;
    var body = response.body;

    if (statusCode != 200) {
      // return LoginRet(success: false, msg: 'connect err: $statusCode');
      return false;
    }

    var ret = CreateTokenRet.fromJson(json.decode(body));
    _token = ret.token ?? _token;
    return true;
  }

  Future<UserInfoResult?> getUserInfo() async {
    var result = await postFunc('GetUserInfo');
    var context = UserInfoResult.fromJson(result.context);
    return context;
  }
}
