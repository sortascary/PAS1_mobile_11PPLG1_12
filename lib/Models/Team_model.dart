class TeamModel{
  final int? id;
  final String image;
  final String Desc;
  final String teamName;
  final String facebook;
  final String website;
  final String twitter;
  final bool liked;

  TeamModel({
    required this.id,
    required this.image,
    required this.Desc,
    required this.teamName,
    required this.facebook,
    required this.website,
    required this.twitter,
    required this.liked,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image': image,
      'Desc': Desc,
      'teamName': teamName,
      'facebook': facebook,
      'website': website,
      'twitter': twitter,
      'liked': liked ? 1 : 0,
    };
  }

  factory TeamModel.fromJson(Map<String, dynamic> json) {
    return TeamModel(
      id: json['id'],
      image: json['image'],
      teamName: json['teamName'],
      facebook: json['facebook'],
      website: json['website'],
      twitter: json['twitter'],
      liked: json['liked'] == 1, 
      Desc: json['Desc'],
    );
  }
}