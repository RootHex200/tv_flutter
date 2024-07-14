class ProfileModel {
  User? user;
  Loggedin? loggedin;

  ProfileModel({this.user, this.loggedin});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    loggedin = json['loggedin'] != null
        ? Loggedin.fromJson(json['loggedin'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (loggedin != null) {
      data['loggedin'] = loggedin!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  String? image;
  String? emailVerifiedAt;
  String? code;
  String? subscriptionId;
  String? isPremium;
  String? isSuspended;
  String? lastSeen;
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
    emailVerifiedAt = json['email_verified_at']??"";
    code = json['code']==null?"":json["code"];
    subscriptionId = json['subscription_id'];
    isPremium = json['isPremium'];
    isSuspended = json['isSuspended'];
    lastSeen = json['last_seen'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['image'] = image;
    data['email_verified_at'] = emailVerifiedAt;
    data['code'] = code;
    data['subscription_id'] = subscriptionId;
    data['isPremium'] = isPremium;
    data['isSuspended'] = isSuspended;
    data['last_seen'] = lastSeen;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Loggedin {
  int? id;
  String? userId;
  String? ip;
  // void device;
  String? lastIn;
  String? createdAt;
  String? updatedAt;
  // void subscription;

  Loggedin(
      {this.id,
      this.userId,
      this.ip,
      // this.device,
      this.lastIn,
      this.createdAt,
      // this.updatedAt,
      // this.subscription
      });

  Loggedin.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    ip = json['ip'];
    // device = json['device'];
    lastIn = json['last_in'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    // subscription = json['subscription'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['ip'] = ip;
    // data['device'] = device;
    data['last_in'] = lastIn;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    // data['subscription'] = subscription;
    return data;
  }
}
