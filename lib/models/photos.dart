import 'package:pagination/models/photo.dart';

class Photos {
  int page;
  int pages;
  int perPage;
  int total;
  List<Photo> photo;

  Photos({this.page, this.pages, this.perPage, this.total, this.photo});

  Photos.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    pages = json['pages'];
    perPage = json['perpage'];
    total = json['total'];
    if (json['photo'] != null) {
      photo = new List<Photo>();
      json['photo'].forEach((v) {
        photo.add(new Photo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    data['pages'] = this.pages;
    data['perpage'] = this.perPage;
    data['total'] = this.total;
    if (this.photo != null) {
      data['photo'] = this.photo.map((v) => v.toJson()).toList();
    }
    return data;
  }
}