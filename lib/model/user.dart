class User {
  String login;
  String avatarUrl;
  String type;
  String? name;
  String? company;
  String? blog;
  String? location;
  String? email;
  bool? hireable;
  String? bio;
  int publicRepos;
  int followers;
  int following;
  String createdAt;
  String updatedAt;

  User({
    required this.login,
    required this.avatarUrl,
    required this.type,
    this.name,
    this.company,
    this.blog,
    this.location,
    this.email,
    this.hireable,
    this.bio,
    required this.publicRepos,
    required this.followers,
    required this.following,
    required this.createdAt,
    required this.updatedAt,
  });

  static User fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'login': final String login,
        'avatar_url': final String avatarUrl,
        'type': final String type,
        'public_repos': final int publicRepos,
        'followers': final int followers,
        'following': final int following,
        'created_at': final String createdAt,
        'updated_at': final String updatedAt,
      }=>
        User(
          login: login,
          avatarUrl: avatarUrl,
          type: type,
          publicRepos: publicRepos,
          followers: followers,
          following: following,
          createdAt: createdAt,
          updatedAt: updatedAt,
          name: json['name'] as String?,
          company: json['company'] as String?,
          blog: json['blog'] as String?,
          location: json['location'] as String?,
          email: json['email'] as String?,
          hireable: json['hireable'] as bool?,
          bio: json['bio'] as String?,
        ),
        {
        'login': final String login,
        'avatar_url': final String avatarUrl,
        'type': final String type,
      }=>
        User(
          login: login,
          avatarUrl: avatarUrl,
          type: type,
          publicRepos: 0,
          followers: 0,
          following: 0,
          createdAt: '',
          updatedAt: '',
          name: json['name'] as String?,
          company: json['company'] as String?,
          blog: json['blog'] as String?,
          location: json['location'] as String?,
          email: json['email'] as String?,
          hireable: json['hireable'] as bool?,
          bio: json['bio'] as String?,
        ),
      _ => throw Exception('Invalid JSON: missing required fields'),  
    };
  }
  Map<String, dynamic> toJson(){
    return {
      'login': login,
      'avatar_url': avatarUrl,
      'type': type,
      'name': name,
      'company': company,
      'blog': blog,
      'location': location,
      'email': email,
      'hireable': hireable,
      'bio': bio,
      'public_repos': publicRepos,
      'followers': followers,
      'following': following,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}

