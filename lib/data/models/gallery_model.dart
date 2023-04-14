import 'package:my_gallrey/domain/entities/gallery.dart';

class GalleryModel extends Gallery {
  const GalleryModel(
      {required super.status, required super.images, required super.message});

  factory GalleryModel.fromJson(Map<String, dynamic> json) {
    return GalleryModel(
        status: json["status"],
        message: json["message"],
        images: json["data"]["images"]);
  }
}
