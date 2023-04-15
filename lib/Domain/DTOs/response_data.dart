import 'package:equatable/equatable.dart';

class ResponseData extends Equatable {
  const ResponseData(this.story);

  final String story;

  @override
  List<Object> get props => [story];

  factory ResponseData.fromJson(Map<String, dynamic> json) {
    return ResponseData(json['story']);
  }
}