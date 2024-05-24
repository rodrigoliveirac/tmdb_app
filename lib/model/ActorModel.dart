class ActorModel {
  final int id;
  final String name;
  final String? img;
  final String character;

  ActorModel(
      {required this.id,
      required this.name,
      required this.img,
      required this.character});

  ActorModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int,
        name = json['name'] as String,
        img = json['profile_path'] as String?,
        character = json['character'] as String;
}

class ApiActorResponse {
  final int? id;
  final List<ActorModel>? cast;

  ApiActorResponse.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        cast = (json['cast'] as List<dynamic>?)
            ?.map((entry) => ActorModel.fromJson(entry as Map<String, dynamic>))
            .toList();
}
