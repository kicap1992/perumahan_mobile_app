import 'package:perumahan_bew/app/app.locator.dart';

import '../services/other_function.dart';

class RumahDetailModel {
  RumahModel? rumahModel;
  List<ProgressModel>? progressModel;

  RumahDetailModel({this.rumahModel, this.progressModel});

  RumahDetailModel.fromJson(Map<String, dynamic> json) {
    rumahModel =
        json['rumah'] != null ? RumahModel.fromJson(json['rumah']) : null;
    if (json['progress'] != null) {
      progressModel = <ProgressModel>[];
      json['progress'].forEach((v) {
        progressModel!.add(ProgressModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (rumahModel != null) {
      data['rumah'] = rumahModel!.toJson();
    }
    if (progressModel != null) {
      data['progress'] = progressModel!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RumahModel {
  final myFunction = locator<MyFunction>();
  String? id;
  String? pemilik;
  String? tanggalPembelian;
  String? noTelpon;
  String? harga;
  String? cicilan;
  String? img;

  RumahModel(
      {this.id,
      this.pemilik,
      this.tanggalPembelian,
      this.noTelpon,
      this.harga,
      this.cicilan,
      this.img});

  RumahModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pemilik = json['pemilik'];
    tanggalPembelian = myFunction.convertDateTime(json['tanggal_pembelian']);
    noTelpon = json['no_telpon'];
    harga = json['harga'];
    cicilan = json['cicilan'];
    img = json['img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['pemilik'] = pemilik;
    data['tanggal_pembelian'] = tanggalPembelian;
    data['no_telpon'] = noTelpon;
    data['harga'] = harga;
    data['cicilan'] = cicilan;
    data['img'] = img;
    return data;
  }
}

class ProgressModel {
  final myFunction = locator<MyFunction>();
  String? idProgress;
  String? ket;
  String? img;
  String? createdAt;
  String? idRumah;
  String? idMandor;
  String? nama;
  String? noTelpon;
  int? no;
  String? type;

  ProgressModel(
      {this.idProgress,
      this.ket,
      this.img,
      this.createdAt,
      this.idRumah,
      this.idMandor,
      this.nama,
      this.noTelpon,
      this.no,
      this.type});

  ProgressModel.fromJson(Map<String, dynamic> json) {
    idProgress = json['id_progress'];
    ket = json['ket'];
    img = json['img'];
    createdAt = myFunction.convertDateTime(json['created_at']);
    idRumah = json['id_rumah'];
    idMandor = json['id_mandor'];
    nama = json['nama'];
    noTelpon = json['no_telpon'];
    no = json['no'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_progress'] = idProgress;
    data['ket'] = ket;
    data['img'] = img;
    data['created_at'] = createdAt;
    data['id_rumah'] = idRumah;
    data['id_mandor'] = idMandor;
    data['nama'] = nama;
    data['no_telpon'] = noTelpon;
    data['no'] = no;
    data['type'] = type;
    return data;
  }
}

class MandorModel {
  String? idMandor;
  String? nama;
  String? noTelpon;

  MandorModel({this.idMandor, this.nama, this.noTelpon});

  MandorModel.fromJson(Map<String, dynamic> json) {
    idMandor = json['id_mandor'];
    nama = json['nama'];
    noTelpon = json['no_telpon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_mandor'] = idMandor;
    data['nama'] = nama;
    data['no_telpon'] = noTelpon;
    return data;
  }
}
