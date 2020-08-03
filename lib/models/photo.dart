class Photo {
  String id;
  String owner;
  String secret;
  String server;
  int farm;
  String title;
  int isPublic;
  int isFriend;
  int isFamily;
  String urlS;
  int heightS;
  int widthS;

  Photo(
      {this.id,
        this.owner,
        this.secret,
        this.server,
        this.farm,
        this.title,
        this.isPublic,
        this.isFriend,
        this.isFamily,
        this.urlS,
        this.heightS,
        this.widthS});

  Photo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    owner = json['owner'];
    secret = json['secret'];
    server = json['server'];
    farm = json['farm'];
    title = json['title'];
    isPublic = json['ispublic'];
    isFriend = json['isfriend'];
    isFamily = json['isfamily'];
    urlS = json['url_s'];
    heightS = json['height_s'];
    widthS = json['width_s'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['owner'] = this.owner;
    data['secret'] = this.secret;
    data['server'] = this.server;
    data['farm'] = this.farm;
    data['title'] = this.title;
    data['ispublic'] = this.isPublic;
    data['isfriend'] = this.isFriend;
    data['isfamily'] = this.isFamily;
    data['url_s'] = this.urlS;
    data['height_s'] = this.heightS;
    data['width_s'] = this.widthS;
    return data;
  }
}
