class SettleSelectModel {
  String? id;
  int? count;

  SettleSelectModel(
      {this.id,
        this.count}
      );

  SettleSelectModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['count'] = count;
    return data;
  }
}