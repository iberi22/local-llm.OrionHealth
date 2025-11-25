import 'package:isar/isar.dart';

part 'health_report.g.dart';

@collection
class HealthReport {
  Id id = Isar.autoIncrement;

  DateTime? generatedAt;

  String? title;

  String? content; // Markdown content

  HealthReport({
    this.generatedAt,
    this.title,
    this.content,
  });
}
