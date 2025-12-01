class LearningItem {
  final String image;
  final String title;
  final String description;
  final String video;

  LearningItem({
    required this.image,
    required this.title,
    required this.description,
    required this.video,
  });


  factory LearningItem.fromMap(Map<String, dynamic> map) {
    return LearningItem(
      image: map['image'] ?? '',
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      video: map['video'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'title': title,
      'description': description,
      'video': video,
    };
  }
}
