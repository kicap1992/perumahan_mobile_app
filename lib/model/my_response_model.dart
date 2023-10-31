class MyResponseModel {
  bool? res;
  String? message;
  dynamic data;

  MyResponseModel({this.res, this.message, this.data});

  MyResponseModel.fromJson(Map<String, dynamic> json) {
    res = json['res'];
    message = json['message'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['res'] = res;
    data['message'] = message;
    data['data'] = this.data;
    return data;
  }
}
