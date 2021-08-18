import 'package:clean_app/features/domain/entities/space_media_entity.dart';

class SpaceMediaModel extends SpaceMediaEntity {
  SpaceMediaModel({
    required String explanation,
    required String mediaType,
    required String title,
    required String mediaUrl
  }) : super(explanation: explanation, mediaType: mediaType, title: title, mediaUrl: mediaUrl);

  factory SpaceMediaModel.fromJson(Map<String, dynamic> json) => SpaceMediaModel(
  explanation: json['explanation'],
  mediaType: json['media_type'],
  title: json['title'],
  mediaUrl: json['url']
  );

  Map<String, dynamic> toJson() => {
    'explanation' : explanation,
    'media_type' : mediaType,
    'title' : title,
    'url' : mediaUrl
  };
}
