class ProfileModel {
  User? user;
  String? subscriptionName;
  String? linkedDevice;
  // Loggedin? loggedin;

  ProfileModel(
      {this.user, this.subscriptionName, this.linkedDevice});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    subscriptionName = json['subscription_name'];
    linkedDevice = json['linked_device'];
    // loggedin = json['loggedin'] != null
    //     ? new Loggedin.fromJson(json['loggedin'])
    //     : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['subscription_name'] = this.subscriptionName;
    data['linked_device'] = this.linkedDevice;
    // if (this.loggedin != null) {
    //   data['loggedin'] = this.loggedin!.toJson();
    // }
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  String? image;
  String? code;
  String? subscriptionId;
  String? isPremium;
  String? isSuspended;

  String? createdAt;
  String? updatedAt;
  Subscription? subscription;

  User(
      {this.id,
      this.name,
      this.email,
      this.image,
      this.code,
      this.subscriptionId,
      this.isPremium,
      this.isSuspended,
      this.createdAt,
      this.updatedAt,
      this.subscription});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    image = json['image'];
    code = json['code'];
    subscriptionId = json['subscription_id'];
    isPremium = json['isPremium'];
    isSuspended = json['isSuspended'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    subscription = json['subscription'] != null
        ? new Subscription.fromJson(json['subscription'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['image'] = this.image;
    data['code'] = this.code;
    data['subscription_id'] = this.subscriptionId;
    data['isPremium'] = this.isPremium;
    data['isSuspended'] = this.isSuspended;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.subscription != null) {
      data['subscription'] = this.subscription!.toJson();
    }
    return data;
  }
}

class Subscription {
  int? id;
  String? name;
  String? amount;
  String? maxUser;
  String? type;
  String? duration;
  String? createdAt;
  String? updatedAt;

  Subscription(
      {this.id,
      this.name,
      this.amount,
      this.maxUser,
      this.type,
      this.duration,
      this.createdAt,
      this.updatedAt});

  Subscription.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    amount = json['amount'];
    maxUser = json['max_user'];
    type = json['type'];
    duration = json['duration'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['amount'] = this.amount;
    data['max_user'] = this.maxUser;
    data['type'] = this.type;
    data['duration'] = this.duration;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

// class Loggedin {
//   int? id;
//   String? userId;
//   String? ip;

//   String? lastIn;
//   String? createdAt;
//   String? updatedAt;

//   Loggedin(
//       {this.id,
//       this.userId,
//       this.ip,

//       this.lastIn,
//       this.createdAt,
//       this.updatedAt});

//   Loggedin.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     userId = json['user_id'];
//     ip = json['ip'];

//     lastIn = json['last_in'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['user_id'] = this.userId;
//     data['ip'] = this.ip;
//     data['last_in'] = this.lastIn;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     return data;
//   }
// }
