class NewsModel {
  final String id;
  final String title;
  final String description;
  final String subTitle;
  final String categoryName;
  final String imageUrl;
  final String uploadTime;

  NewsModel({
    required this.id,
    required this.title,
    required this.description,
    required this.subTitle,
    required this.categoryName,
    required this.imageUrl,
    required this.uploadTime,
  });

  factory NewsModel.fromMap(Map<String, String> map) {
    return NewsModel(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      subTitle: map['subTitle'] ?? '',
      categoryName: map['categoryName'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      uploadTime: map["uploadTime"] ?? '',
    );
  }

  Map<String, String> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'subTitle': subTitle,
      'categoryName': categoryName,
      'imageUrl': imageUrl,
      "uploadTime": uploadTime,
    };
  }
}
