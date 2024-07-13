class SubscriptionModel {
  String? message;
  List<Subscriptions>? subscriptions;

  SubscriptionModel({this.message, this.subscriptions});

  SubscriptionModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['subscriptions'] != null) {
      subscriptions = <Subscriptions>[];
      json['subscriptions'].forEach((v) {
        subscriptions!.add(Subscriptions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (subscriptions != null) {
      data['subscriptions'] =
          subscriptions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Subscriptions {
  int? id;
  String? name;
  String? amount;
  String? maxUser;
  String? type;
  String? duration;
  String? createdAt;
  String? updatedAt;

  Subscriptions(
      {this.id,
      this.name,
      this.amount,
      this.maxUser,
      this.type,
      this.duration,
      this.createdAt,
      this.updatedAt});

  Subscriptions.fromJson(Map<String, dynamic> json) {
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['amount'] = amount;
    data['max_user'] = maxUser;
    data['type'] = type;
    data['duration'] = duration;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
