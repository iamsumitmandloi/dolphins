class AutoGenerate {
  AutoGenerate({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    this.promotedAt,
    required this.width,
    required this.height,
    required this.color,
    required this.blurHash,
    required this.description,
    required this.altDescription,
    required this.urls,
    required this.links,
    required this.categories,
    required this.likes,
    required this.likedByUser,
    required this.currentUserCollections,
    this.sponsorship,
    required this.topicSubmissions,
    required this.user,
    required this.exif,
    required this.location,
    required this.views,
    required this.downloads,
  });
  late final String? id;
  late final String? createdAt;
  late final String? updatedAt;
  late final String? promotedAt;
  late final int? width;
  late final int? height;
  late final String? color;
  late final String? blurHash;
  late final String? description;
  late final String? altDescription;
  late final Urls? urls;
  late final Links? links;
  late final List<dynamic>? categories;
  late final int? likes;
  late final bool? likedByUser;
  late final List<dynamic>? currentUserCollections;
  late final String? sponsorship;
  late final TopicSubmissions? topicSubmissions;
  late final User? user;
  late final Exif? exif;
  late final Location? location;
  late final int? views;
  late final int? downloads;

  AutoGenerate.fromJson(Map<String, dynamic> json){
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    promotedAt = null;
    width = json['width'];
    height = json['height'];
    color = json['color'];
    blurHash = json['blur_hash'];
    description = json['description'];
    altDescription = json['alt_description'];
    urls = Urls.fromJson(json['urls']);
    links = Links.fromJson(json['links']);
    categories = List.castFrom<dynamic, dynamic>(json['categories']);
    likes = json['likes'];
    likedByUser = json['liked_by_user'];
    // currentUserCollections = List.castFrom<dynamic, dynamic>(json['current_user_collections']);
    // sponsorship = null;
    // topicSubmissions = TopicSubmissions.fromJson(json['topic_submissions']);
    // user = User.fromJson(json['user']??[]);
    // exif = Exif.fromJson(json['exif']??[]);
    // location = Location.fromJson(json['location']);
    // views = json['views'];
    // downloads = json['downloads'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['promoted_at'] = promotedAt;
    _data['width'] = width;
    _data['height'] = height;
    _data['color'] = color;
    _data['blur_hash'] = blurHash;
    _data['description'] = description;
    _data['alt_description'] = altDescription;
    _data['urls'] = urls!.toJson();
    _data['links'] = links!.toJson();
    _data['categories'] = categories;
    _data['likes'] = likes;
    _data['liked_by_user'] = likedByUser;
    // _data['current_user_collections'] = currentUserCollections;
    // _data['sponsorship'] = sponsorship;
    // _data['topic_submissions'] = topicSubmissions!.toJson();
    // _data['user'] = user!.toJson();
    // _data['exif'] = exif!.toJson();
    // _data['location'] = location!.toJson();
    // _data['views'] = views;
    // _data['downloads'] = downloads;
    return _data;
  }
}

class Urls {
  Urls({
    required this.raw,
    required this.full,
    required this.regular,
    required this.small,
    required this.thumb,
    required this.smallS3,
  });
  late final String raw;
  late final String full;
  late final String regular;
  late final String small;
  late final String thumb;
  late final String smallS3;

  Urls.fromJson(Map<String, dynamic> json){
    raw = json['raw'];
    full = json['full'];
    regular = json['regular'];
    small = json['small'];
    thumb = json['thumb'];
    smallS3 = json['small_s3'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['raw'] = raw;
    _data['full'] = full;
    _data['regular'] = regular;
    _data['small'] = small;
    _data['thumb'] = thumb;
    _data['small_s3'] = smallS3;
    return _data;
  }
}

class Links {
  Links({
    required this.self,
    required this.html,
    required this.download,
    required this.downloadLocation,
  });
  late final String self;
  late final String html;
  late final String download;
  late final String downloadLocation;

  Links.fromJson(Map<String, dynamic> json){
    self = json['self'];
    html = json['html'];
    download = json['download']??'';
    downloadLocation = json['download_location']??"";
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['self'] = self;
    _data['html'] = html;
    _data['download'] = download;
    _data['download_location'] = downloadLocation;
    return _data;
  }
}

class TopicSubmissions {
  TopicSubmissions();

  TopicSubmissions.fromJson(Map json);

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    return _data;
  }
}

class User {
  User({
    required this.id,
    required this.updatedAt,
    required this.username,
    required this.name,
    required this.firstName,
    this.lastName,
    required this.twitterUsername,
    required this.portfolioUrl,
    required this.bio,
    required this.location,
    required this.links,
    required this.profileImage,
    required this.instagramUsername,
    required this.totalCollections,
    required this.totalLikes,
    required this.totalPhotos,
    required this.acceptedTos,
    required this.forHire,
    required this.social,
  });
  late final String? id;
  late final String? updatedAt;
  late final String? username;
  late final String? name;
  late final String? firstName;
  late final String? lastName;
  late final String? twitterUsername;
  late final String? portfolioUrl;
  late final String? bio;
  late final String? location;
  late final Links? links;
  late final ProfileImage? profileImage;
  late final String? instagramUsername;
  late final int? totalCollections;
  late final int? totalLikes;
  late final int? totalPhotos;
  late final bool? acceptedTos;
  late final bool? forHire;
  late final Social? social;

  User.fromJson(Map<String, dynamic> json){
    id = json['id'];
    updatedAt = json['updated_at'];
    username = json['username'];
    name = json['name'];
    firstName = json['first_name'];
    lastName = null;
    twitterUsername = json['twitter_username']??'';
    portfolioUrl = json['portfolio_url']??'';
    bio = json['bio']??'';
    location = json['location']??'';
    links = Links.fromJson(json['links']);
    profileImage = ProfileImage.fromJson(json['profile_image']??[]);
    instagramUsername = json['instagram_username']??'';
    totalCollections = json['total_collections']??'';
    totalLikes = json['total_likes']??'';
    totalPhotos = json['total_photos']??'';
    acceptedTos = json['accepted_tos']??'';
    forHire = json['for_hire']??'';
    social = Social.fromJson(json['social']??[]);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['updated_at'] = updatedAt;
    _data['username'] = username;
    _data['name'] = name;
    _data['first_name'] = firstName;
    _data['last_name'] = lastName;
    _data['twitter_username'] = twitterUsername;
    _data['portfolio_url'] = portfolioUrl;
    _data['bio'] = bio;
    _data['location'] = location;
    _data['links'] = links!.toJson();
    _data['profile_image'] = profileImage!.toJson();
    _data['instagram_username'] = instagramUsername;
    _data['total_collections'] = totalCollections;
    _data['total_likes'] = totalLikes;
    _data['total_photos'] = totalPhotos;
    _data['accepted_tos'] = acceptedTos;
    _data['for_hire'] = forHire;
    _data['social'] = social!.toJson();
    return _data;
  }
}

class ProfileImage {
  ProfileImage({
    required this.small,
    required this.medium,
    required this.large,
  });
  late final String small;
  late final String medium;
  late final String large;

  ProfileImage.fromJson(Map<String, dynamic> json){
    small = json['small'];
    medium = json['medium'];
    large = json['large'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['small'] = small;
    _data['medium'] = medium;
    _data['large'] = large;
    return _data;
  }
}

class Social {
  Social({
     this.instagramUsername,
     this.portfolioUrl,
     this.twitterUsername,
    this.paypalEmail,
  });
  late final String? instagramUsername;
  late final String? portfolioUrl;
  late final String? twitterUsername;
  late final String? paypalEmail;

  Social.fromJson(Map<String, dynamic> json){
    instagramUsername = json['instagram_username']??'';
    portfolioUrl = json['portfolio_url']??"";
    twitterUsername = json['twitter_username']??'';
    paypalEmail = '';
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['instagram_username'] = instagramUsername;
    _data['portfolio_url'] = portfolioUrl;
    _data['twitter_username'] = twitterUsername;
    _data['paypal_email'] = paypalEmail;
    return _data;
  }
}

class Exif {
  Exif({
    required this.make,
    required this.model,
    required this.name,
    required this.exposureTime,
    required this.aperture,
    required this.focalLength,
    required this.iso,
  });
  late final String make;
  late final String model;
  late final String name;
  late final String exposureTime;
  late final String aperture;
  late final String focalLength;
  late final int iso;

  Exif.fromJson(Map<String, dynamic> json){
    make = json['make'];
    model = json['model'];
    name = json['name'];
    exposureTime = json['exposure_time']??"";
    aperture = json['aperture']??"";
    focalLength = json['focal_length'];
    iso = json['iso'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['make'] = make;
    _data['model'] = model;
    _data['name'] = name;
    _data['exposure_time'] = exposureTime;
    _data['aperture'] = aperture;
    _data['focal_length'] = focalLength;
    _data['iso'] = iso;
    return _data;
  }
}

class Location {
  Location({
    this.title,
    this.name,
    this.city,
    this.country,
    required this.position,
  });
  late final Null title;
  late final Null name;
  late final Null city;
  late final Null country;
  late final Position position;

  Location.fromJson(Map<String, dynamic> json){
    title = null;
    name = null;
    city = null;
    country = null;
    position = Position.fromJson(json['position']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['title'] = title;
    _data['name'] = name;
    _data['city'] = city;
    _data['country'] = country;
    _data['position'] = position.toJson();
    return _data;
  }
}

class Position {
  Position({
    this.latitude,
    this.longitude,
  });
  late final Null latitude;
  late final Null longitude;

  Position.fromJson(Map<String, dynamic> json){
    latitude = null;
    longitude = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['latitude'] = latitude;
    _data['longitude'] = longitude;
    return _data;
  }
}