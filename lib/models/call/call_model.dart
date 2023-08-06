class CallModel {
  String? id;
  String? name;
  String? phone;
  String? image;
  String? lastCallTime;
  bool? isReceived;

  CallModel(
      {required this.id,
        required this.name,
        this.phone,
        this.image,
        this.lastCallTime,
        this.isReceived,
        });

  CallModel.fromJson(Map<String, dynamic> json) {

    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    image = json['image'];
    lastCallTime = json['lastCallTime'];
    isReceived = json['isReceived'];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
      'image': image,
      'lastCallTime': lastCallTime,
      'isReceived': isReceived,
    };
  }
}
