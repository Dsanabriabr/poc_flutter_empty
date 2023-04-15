import 'package:equatable/equatable.dart';

class RequestData extends Equatable {
  const RequestData(this.heroName, this.villainName, this.contextStory, this.moralStory);

  final String heroName;
  final String villainName;
  final String contextStory;
  final String moralStory;

  @override
  List<Object> get props => [heroName, villainName, contextStory, moralStory];

  factory RequestData.fromJson(Map<String, dynamic> json) {
    return RequestData(json['heroName'], json['villainName'], json['contextStory'], json['moralStory']);
  }

  Map<String, dynamic> convertMap() {
    return {
      'heroName': heroName,
      'villainName': villainName,
      'contextStory': contextStory,
      'moralStory': moralStory,
    };
  }
}