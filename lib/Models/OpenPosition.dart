class OpenPosition {
  final String imageUrl;
  final String positionName;
  final String salaryRange;
  final List<String> technologies;
  final String description;
  final String companyDescription;

  OpenPosition({
    required this.imageUrl,
    required this.positionName,
    required this.salaryRange,
    required this.technologies,
    required this.description,
    required this.companyDescription,
  });

  factory OpenPosition.fromJson(Map<String, dynamic> json) => OpenPosition(
    imageUrl: json['imageUrl'],
    positionName: json['positionName'],
    salaryRange: json['salaryRange'],
    technologies: json['technologies']?.cast<String>() ?? [],
    description: json['description'],
    companyDescription: json['companyDescription'],
  );
}
