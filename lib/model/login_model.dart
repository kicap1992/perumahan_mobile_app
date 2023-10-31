class LoginDataModel {
  LoginDetailModel? value;
  String? level;

  LoginDataModel({this.value, this.level});

  LoginDataModel.fromJson(Map<String, dynamic> json) {
    value =
        json['value'] != null ? LoginDetailModel.fromJson(json['value']) : null;
    level = json['level'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (value != null) {
      data['value'] = value!.toJson();
    }
    data['level'] = level;
    return data;
  }
}

class LoginDetailModel {
  String? idLogin;
  String? username;
  String? password;
  String? idAdmin;
  String? idMandor;
  String? idRumah;
  String? level;

  LoginDetailModel(
      {this.idLogin,
      this.username,
      this.password,
      this.idAdmin,
      this.idMandor,
      this.idRumah,
      this.level});

  LoginDetailModel.fromJson(Map<String, dynamic> json) {
    idLogin = json['id_login'];
    username = json['username'];
    password = json['password'];
    idAdmin = json['id_admin'];
    idMandor = json['id_mandor'];
    idRumah = json['id_rumah'];
    level = json['level'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_login'] = idLogin;
    data['username'] = username;
    data['password'] = password;
    data['id_admin'] = idAdmin;
    data['id_mandor'] = idMandor;
    data['id_rumah'] = idRumah;
    data['level'] = level;
    return data;
  }
}
