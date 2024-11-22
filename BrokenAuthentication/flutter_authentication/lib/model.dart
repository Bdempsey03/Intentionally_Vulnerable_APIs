class User{
  final int userId;

  final String username;

  final bool isAdmin;

  const User({
    required this.userId,
    required this.username,
    required this.isAdmin
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    userId: json['userId'],
    username: json['username'],
    isAdmin: json['isAdmin'],
    );
  
  Map<String, dynamic> toJson() =>{
    "userId" : userId,
    "username" : username,
    "isAdmin" : isAdmin,
  };
}