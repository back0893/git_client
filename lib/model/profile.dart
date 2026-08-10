import 'user.dart';

class Profile{
  User? user; //Github账号信息，结构见"user.json"
  String? token; // 登录用户的token(oauth)或密码
  
  Profile({
    this.user,
    this.token,
  });
  static Profile fromJson(Map<String, dynamic> json){
    return Profile(
      user: json['user'] != null ? User.fromJson(json['user']) : null,
      token: json['token'],
    );
  }
  Map<String, dynamic> toJson(){
    return {
      'user': user?.toJson(),
      'token': token,
    };
  }
}
