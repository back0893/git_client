import 'user.dart';

class Repo{
  int id;
  String name; //项目名称
  String fullName; //项目完整名称
  User owner; // 项目拥有者，结构见"user.json"
  Repo? parent; // 如果是fork的项目，则此字段表示fork的父项目信息     
  bool private; // 是否私有项目
  String? description; //项目描述
  bool fork; // 该项目是否为fork的项目
  String? language; //该项目的主要编程语言
  int forksCount; // fork了该项目的数量
  int stargazersCount; //该项目的star数量

  Repo({
    required this.id,
    required this.name,
    required this.fullName,
    required this.owner,
    this.parent,
    required this.private,
    this.description,
    required this.fork,
    this.language,
    required this.forksCount,
    required this.stargazersCount,
  });

  static Repo fromJson(Map<String, dynamic> json){
    return Repo(
      id: json['id'],
      name: json['name'],
      fullName: json['full_name'],
      owner: User.fromJson(json['owner']),
      parent: json['parent'] != null ? Repo.fromJson(json['parent']) : null,
      private: json['private'],
      description: json['description'],
      fork: json['fork'],
      language: json['language'],
      forksCount: json['forks_count'],
      stargazersCount: json['stargazers_count'],
    );
  }
}