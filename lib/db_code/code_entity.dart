import 'package:intl/intl.dart';

enum CodeType {
  qrCode,
  barCode,
}

class CodeEntity {
  int id;
  DateTime createTime;
  CodeType type;
  String content;
  int isScan;

  CodeEntity({
    required this.id,
    required this.createTime,
    required this.type,
    required this.content,
    required this.isScan,
  });

  factory CodeEntity.fromJson(Map<String, dynamic> json) {
    return CodeEntity(
      id: json['id'],
      createTime: DateTime.parse(json['createTime']),
      type: CodeType.values[json['type']],
      content: json['content'],
      isScan: json['isScan'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createTime': createTime.toIso8601String(),
      'type': type.index,
      'content': content,
      'isScan': isScan,
    };
  }

  String get timeString {
    return DateFormat('yyyy-MM-dd HH:mm').format(createTime);
  }
}