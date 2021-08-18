import 'package:equatable/equatable.dart';

class SpaceMediaEntity extends Equatable {
  final String explanation;
  final String mediaType;
  final String title;
  final String mediaUrl;


  SpaceMediaEntity({required this.explanation,required this.mediaType,required this.title,required this.mediaUrl});

  @override
  List<Object> get props => throw [
    explanation,
    mediaType,
    title,
    mediaUrl
  ];
}
