class Historymodel {
  final String name;
  final int cases;
  final double percentage;

  Historymodel({
    required this.name,
    required this.cases,
    required this.percentage,
  });

  factory Historymodel.fromJson(Map<String, dynamic> json) {
    return Historymodel(
      name: json['name'] ?? '',
      cases: json['cases'] ?? 0,
      percentage: (json['percentage'] ?? 0).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'cases': cases,
      'percentage': percentage,
    };
  }
}