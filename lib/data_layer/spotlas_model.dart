class SpotlasModel {
  String? id;
  Caption? caption;
  List<Media>? media;
  String? createdAt;
  Author? author;
  Spot? spot;
  String? url;
  String? error;

  SpotlasModel(
      {this.id, this.caption, this.media, this.createdAt, this.author, this.spot, this.url});

  SpotlasModel.withError(String errorMessage) {
    error = errorMessage;
  }

  SpotlasModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    caption = json['caption'] != null ? Caption.fromJson(json['caption']) : null;
    if (json['media'] != null) {
      media = <Media>[];
      json['media'].forEach((v) {
        media!.add(Media.fromJson(v));
      });
    }
    createdAt = json['created_at'];
    author = json['author'] != null ? Author.fromJson(json['author']) : null;
    spot = json['spot'] != null ? Spot.fromJson(json['spot']) : null;
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (caption != null) {
      data['caption'] = caption!.toJson();
    }
    if (media != null) {
      data['media'] = media!.map((v) => v.toJson()).toList();
    }
    data['created_at'] = createdAt;
    if (author != null) {
      data['author'] = author!.toJson();
    }
    if (spot != null) {
      data['spot'] = spot!.toJson();
    }
    data['url'] = url;
    return data;
  }
}

class Caption {
  String? text;
  List<Tags>? tags;

  Caption({this.text, this.tags});

  Caption.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    if (json['tags'] != null) {
      tags = <Tags>[];
      json['tags'].forEach((v) {
        tags!.add(Tags.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['text'] = text;
    if (tags != null) {
      data['tags'] = tags!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Tags {
  String? id;
  String? tagText;
  String? displayText;
  String? url;
  String? type;

  Tags({this.id, this.tagText, this.displayText, this.url, this.type});

  Tags.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tagText = json['tag_text'];
    displayText = json['display_text'];
    url = json['url'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['tag_text'] = tagText;
    data['display_text'] = displayText;
    data['url'] = url;
    data['type'] = type;
    return data;
  }
}

class Media {
  String? url;
  String? blurHash;
  String? type;

  Media({this.url, this.blurHash, this.type});

  Media.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    blurHash = json['blur_hash'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    data['blur_hash'] = blurHash;
    data['type'] = type;
    return data;
  }
}

class Author {
  String? id;
  String? username;
  String? photoUrl;
  String? fullName;

  Author({this.id, this.username, this.photoUrl, this.fullName});

  Author.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    photoUrl = json['photo_url'];
    fullName = json['full_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['photo_url'] = photoUrl;
    data['full_name'] = fullName;
    return data;
  }
}

class Spot {
  String? id;
  String? name;
  List<Types>? types;
  Logo? logo;
  Location? location;
  bool? isSaved;
  bool? isLiked;

  Spot({this.id, this.name, this.types, this.logo, this.location, this.isSaved, this.isLiked});

  Spot.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['types'] != null) {
      types = <Types>[];
      json['types'].forEach((v) {
        types!.add(Types.fromJson(v));
      });
    }
    logo = json['logo'] != null ? Logo.fromJson(json['logo']) : null;
    location = json['location'] != null ? Location.fromJson(json['location']) : null;
    isSaved = json['is_saved'];
    isLiked = json['is_liked'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    if (types != null) {
      data['types'] = types!.map((v) => v.toJson()).toList();
    }
    if (logo != null) {
      data['logo'] = logo!.toJson();
    }
    if (location != null) {
      data['location'] = location!.toJson();
    }
    data['is_saved'] = isSaved;
    data['is_liked'] = isLiked;
    return data;
  }
}

class Types {
  int? id;
  String? name;
  String? url;

  Types({this.id, this.name, this.url});

  Types.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['url'] = url;
    return data;
  }
}

class Logo {
  String? url;
  String? type;

  Logo({this.url, this.type});

  Logo.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    data['type'] = type;
    return data;
  }
}

class Location {
  String? display;

  Location({this.display});

  Location.fromJson(Map<String, dynamic> json) {
    display = json['display'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['display'] = display;
    return data;
  }
}
