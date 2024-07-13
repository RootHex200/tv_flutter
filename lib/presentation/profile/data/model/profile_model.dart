class ProfileModel {
  User? user;
  Loggedin? loggedin;

  ProfileModel({this.user, this.loggedin});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    loggedin = json['loggedin'] != null
        ? new Loggedin.fromJson(json['loggedin'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.loggedin != null) {
      data['loggedin'] = this.loggedin!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  String? image;
  Null? emailVerifiedAt;
  Null? code;
  String? subscriptionId;
  String? isPremium;
  String? isSuspended;
  Null? lastSeen;
  String? createdAt;
  String? updatedAt;

  User(
      {this.id,
      this.name,
      this.email,
      this.image,
      this.emailVerifiedAt,
      this.code,
      this.subscriptionId,
      this.isPremium,
      this.isSuspended,
      this.lastSeen,
      this.createdAt,
      this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    image = json['image'];
    emailVerifiedAt = json['email_verified_at'];
    code = json['code'];
    subscriptionId = json['subscription_id'];
    isPremium = json['isPremium'];
    isSuspended = json['isSuspended'];
    lastSeen = json['last_seen'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['image'] = this.image;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['code'] = this.code;
    data['subscription_id'] = this.subscriptionId;
    data['isPremium'] = this.isPremium;
    data['isSuspended'] = this.isSuspended;
    data['last_seen'] = this.lastSeen;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Loggedin {
  int? id;
  String? userId;
  String? ip;
  Null? device;
  String? lastIn;
  String? createdAt;
  String? updatedAt;
  Null? subscription;

  Loggedin(
      {this.id,
      this.userId,
      this.ip,
      this.device,
      this.lastIn,
      this.createdAt,
      this.updatedAt,
      this.subscription});

  Loggedin.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    ip = json['ip'];
    device = json['device'];
    lastIn = json['last_in'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    subscription = json['subscription'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['ip'] = this.ip;
    data['device'] = this.device;
    data['last_in'] = this.lastIn;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['subscription'] = this.subscription;
    return data;
  }
}
