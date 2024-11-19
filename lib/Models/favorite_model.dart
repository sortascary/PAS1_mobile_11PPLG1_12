class FavoriteModel {
  int? id;
  int num;
  String title;
  String image;
  String website;
  String facebook;
  String twitter;
  int liked;

  FavoriteModel({
    this.id,
    required this.num,
    required this.title,
    required this.image,
    required this.website,
    required this.facebook,
    required this.twitter,
    required this.liked,
  });

  // Convert a Task object into a Map object
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'num':num,
      'title': title,
      'image': image,
      'website': website,
      'facebook': facebook,
      'twitter': twitter,
      'liked': liked,
    };
  }

  // Convert a Map object into a Task object
  factory FavoriteModel.fromMap(Map<String, dynamic> map) {
    return FavoriteModel(
      id: map['id'],
      num: map['num'],
      title: map['title'],
      image: map['image'],
      website: map['website'],
      facebook: map['facebook'],
      twitter: map['twitter'],
      liked: map['liked'],
    );
  }
}
