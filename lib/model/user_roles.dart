class UserRole {
 
  final int roleId;
  final int userId;

  UserRole({
 
    required this.roleId,
    required this.userId,
  });

  factory UserRole.fromJson(Map<String, dynamic> json) {
    return UserRole(
    
      roleId: json['roleId'],
      userId: json['userId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'roleId': roleId,
      'userId': userId,
    };
  }
}
