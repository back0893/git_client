import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import './global.dart';
import '../model/user.dart';
import '../model/repo.dart';
import 'package:flutter/material.dart';

class Git {
  // 在网络请求过程中可能会需要使用当前的context信息，比如在请求失败时
  // 打开一个新路由，而打开新路由需要context信息。
  Git([this.context]) {
    _options = Options(extra: {"context": context});
  }

  BuildContext? context;
  late Options _options;
  static Dio dio = new Dio(
    BaseOptions(
      baseUrl: 'https://api.github.com/',
      headers: {
        HttpHeaders.acceptHeader:
            "application/vnd.github.squirrel-girl-preview,"
            "application/vnd.github.symmetra-preview+json",
      },
    ),
  );

  static void init() {
    dio.options.headers[HttpHeaders.authorizationHeader] = Global.profile.token;
  }

    // 登录接口，登录成功后返回用户信息
    Future<User> login(String login, String pwd) async {
      String basic = 'Basic ' + base64.encode(utf8.encode('$login:$pwd'));
      var r = await dio.get(
        "/user",
        options: _options.copyWith(
          headers: {HttpHeaders.authorizationHeader: basic},
          extra: {
            "noCache": true, //本接口禁用缓存
          },
        ),
      );
      //登录成功后更新公共头（authorization），此后的所有请求都会带上用户身份信息
      dio.options.headers[HttpHeaders.authorizationHeader] = basic;
      //更新profile中的token信息
      Global.profile.token = basic;
      return User.fromJson(r.data);
    }

    //获取用户项目列表
    Future<List<Repo>> getRepos({
      Map<String, dynamic>? queryParameters, //query参数，用于接收分页信息
    }) async {
      var r = await dio.get<List>(
        "user/repos",
        queryParameters: queryParameters,
        options: _options,
      );
      return r.data!.map((e) => Repo.fromJson(e)).toList();
    }
}
