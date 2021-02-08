class HomeFeed {
  Featured featured;
  Recent recent;
  Now now;

  HomeFeed({this.featured, this.recent, this.now});

  HomeFeed.fromJson(Map<String, dynamic> json) {
    featured = json['featured'] != null
        ? new Featured.fromJson(json['featured'])
        : null;
    recent =
        json['recent'] != null ? new Recent.fromJson(json['recent']) : null;
    now = json['now'] != null ? new Now.fromJson(json['now']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.featured != null) {
      data['featured'] = this.featured.toJson();
    }
    if (this.recent != null) {
      data['recent'] = this.recent.toJson();
    }
    if (this.now != null) {
      data['now'] = this.now.toJson();
    }
    return data;
  }
}

class Featured {
  List<Session> session;

  Featured({this.session});

  Featured.fromJson(Map<String, dynamic> json) {
    if (json['session'] != null) {
      session = new List<Session>();
      json['session'].forEach((v) {
        session.add(new Session.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.session != null) {
      data['session'] = this.session.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Recent {
  List<Session> session;

  Recent({this.session});

  Recent.fromJson(Map<String, dynamic> json) {
    if (json['session'] != null) {
      session = new List<Session>();
      json['session'].forEach((v) {
        session.add(new Session.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.session != null) {
      data['session'] = this.session.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Now {
  Sessions morning;
  Sessions afternoon;
  Sessions evening;
  Sessions night;

  Now({this.morning, this.afternoon, this.evening, this.night});

  Now.fromJson(Map<String, dynamic> json) {
    morning =
        json['morning'] != null ? new Sessions.fromJson(json['morning']) : null;
    afternoon = json['afternoon'] != null
        ? new Sessions.fromJson(json['afternoon'])
        : null;
    evening =
        json['evening'] != null ? new Sessions.fromJson(json['evening']) : null;
    night = json['night'] != null ? new Sessions.fromJson(json['night']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.morning != null) {
      data['morning'] = this.morning.toJson();
    }
    if (this.afternoon != null) {
      data['afternoon'] = this.afternoon.toJson();
    }
    if (this.evening != null) {
      data['evening'] = this.evening.toJson();
    }
    if (this.night != null) {
      data['night'] = this.night.toJson();
    }
    return data;
  }
}

class Sessions {
  String title;
  List<Session> session;

  Sessions({this.title, this.session});

  Sessions.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    if (json['session'] != null) {
      session = new List<Session>();
      json['session'].forEach((v) {
        session.add(new Session.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    if (this.session != null) {
      data['session'] = this.session.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Session {
  String name;
  String icon;
  String photo;
  String media;

  Session({this.name, this.icon, this.photo, this.media});

  Session.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    icon = json['icon'];
    photo = json['photo'];
    media = json['media'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['icon'] = this.icon;
    data['photo'] = this.photo;
    data['media'] = this.media;
    return data;
  }
}
