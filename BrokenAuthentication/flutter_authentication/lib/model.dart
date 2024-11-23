class User{
  final int userId;

  final String username;

  final String password;

  final bool isAdmin;

  const User({
    required this.userId,
    required this.username,
    required this.password,
    required this.isAdmin
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    userId: json['userId'],
    username: json['username'],
    password: json['password'],
    isAdmin: json['isAdmin'],
    );
  
  Map<String, dynamic> toJson() =>{
    "userId" : userId,
    "username" : username,
    "password" : password,
    "isAdmin" : isAdmin,
  };
}