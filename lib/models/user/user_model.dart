class UserModel {
  String? id;
  String? name;
  String? username;
  String? lastMessage;
  String? phone;
  String? image;
  String? lastMessageTime;
  bool? isPhoneVerified;
  bool? isOnline;
  int? unreadMessage;
  bool? isRead;

  UserModel(
      {required this.id,
      required this.name,
      required this.lastMessage,
       this.phone,
       this.username,
      this.image,
      this.lastMessageTime,
      this.isOnline,
        this.unreadMessage,
        this.isRead,
      this.isPhoneVerified});

  UserModel.fromJson(Map<String, dynamic> json) {

    id = json['id'];
    name = json['name'];
    username = json['username'];
    lastMessage = json['lastMessage'];
    phone = json['phone'];
    image = json['image'];
    lastMessageTime = json['lastMessageTime'];
    isPhoneVerified = json['isPhoneVerified'];
    isOnline = json['isOnline'];
    unreadMessage = json['unreadMessage'];
    isRead = json['isRead'];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'username': username,
      'lastMessage': lastMessage,
      'phone': phone,
      'image': image,
      'lastMessageTime': lastMessageTime,
      'isPhoneVerified': isPhoneVerified,
      'isOnline': isOnline,
      'unreadMessage': unreadMessage,
      'isRead': isRead,
    };
  }
}
