import 'package:json_annotation/json_annotation.dart';

part 'data_model.g.dart';

@JsonSerializable()
class DataModel {
  final int count;
  final Links links;
  final List<Data> data;

  DataModel({
    required this.count,
    required this.links,
    required this.data,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) =>
      _$DataModelFromJson(json);

  Map<String, dynamic> toJson() => _$DataModelToJson(this);
}

@JsonSerializable()
class Links {
  final String self;
  final dynamic next;

  Links({
    required this.self,
    required this.next,
  });

  factory Links.fromJson(Map<String, dynamic> json) => _$LinksFromJson(json);

  Map<String, dynamic> toJson() => _$LinksToJson(this);
}

@JsonSerializable()
class Data {
  final int id;
  final int changed;
  final String start;
  final String end;
  final Title title;
  final Description description;
  final Category category;
  final List<Location> locations;
  final Type type;
  final List<dynamic> papers;
  final List<Person> people;
  final int status;
  final int weight;
  final dynamic addons;
  final dynamic parent;
  final String event;

  Data({
    required this.id,
    required this.changed,
    required this.start,
    required this.end,
    required this.title,
    required this.description,
    required this.category,
    required this.locations,
    required this.type,
    required this.papers,
    required this.people,
    required this.status,
    required this.weight,
    required this.addons,
    required this.parent,
    required this.event,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);

  @override
  String toString() {
    return 'Data{ $id: id, $title: title }';
  }
}

@JsonSerializable()
class Title {
  @JsonKey(name: 'pt-br')
  final String? ptBr; // Nullable

  Title({this.ptBr});

  factory Title.fromJson(Map<String, dynamic> json) => _$TitleFromJson(json);

  Map<String, dynamic> toJson() => _$TitleToJson(this);

  @override
  String toString() {
    return 'Title{ $ptBr: ptBr }';
  }
}

@JsonSerializable()
class Description {
  @JsonKey(name: 'pt-br')
  final String? ptBr; // Nullable

  Description({this.ptBr});

  factory Description.fromJson(Map<String, dynamic> json) =>
      _$DescriptionFromJson(json);

  Map<String, dynamic> toJson() => _$DescriptionToJson(this);
}

@JsonSerializable()
class Category {
  final int id;
  final Title title;
  final String? color; // Nullable
  @JsonKey(name: 'background-color')
  final String? backgroundColor; // Nullable

  Category({
    required this.id,
    required this.title,
    this.color,
    this.backgroundColor,
  });

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}

@JsonSerializable()
class Location {
  final int id;
  final Title title;
  final int parent;
  final dynamic map;

  Location({
    required this.id,
    required this.title,
    required this.parent,
    this.map,
  });

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}

@JsonSerializable()
class Type {
  final int id;
  final Title title;

  Type({
    required this.id,
    required this.title,
  });

  factory Type.fromJson(Map<String, dynamic> json) => _$TypeFromJson(json);

  Map<String, dynamic> toJson() => _$TypeToJson(this);
}

@JsonSerializable()
class Person {
  final int id;
  final String? title; // Nullable
  final String name;
  final String? institution; // Nullable
  final Bio bio;
  final String? picture; // Nullable
  final int weight;
  final Role role;
  final String hash;

  Person({
    required this.id,
    this.title,
    required this.name,
    this.institution,
    required this.bio,
    this.picture,
    required this.weight,
    required this.role,
    required this.hash,
  });

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);

  Map<String, dynamic> toJson() => _$PersonToJson(this);
}

@JsonSerializable()
class Bio {
  @JsonKey(name: 'pt-br')
  final String? ptBr; // Nullable

  Bio({this.ptBr});

  factory Bio.fromJson(Map<String, dynamic> json) => _$BioFromJson(json);

  Map<String, dynamic> toJson() => _$BioToJson(this);
}

@JsonSerializable()
class Role {
  final int id;
  final Label label;

  Role({
    required this.id,
    required this.label,
  });

  factory Role.fromJson(Map<String, dynamic> json) => _$RoleFromJson(json);

  Map<String, dynamic> toJson() => _$RoleToJson(this);
}

@JsonSerializable()
class Label {
  @JsonKey(name: 'pt-br')
  final String? ptBr; // Nullable

  Label({this.ptBr});

  factory Label.fromJson(Map<String, dynamic> json) => _$LabelFromJson(json);

  Map<String, dynamic> toJson() => _$LabelToJson(this);
}

/* class ActivityModel {
  int? count;
  Links? links;
  List<Data>? data;

  ActivityModel({this.count, this.links, this.data});

  ActivityModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    links = json['links'] != null ? Links.fromJson(json['links']) : null;
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['count'] = this.count;
    if (this.links != null) {
      data['links'] = this.links!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Links {
  String? self;
  String? next;

  Links({this.self, this.next});

  Links.fromJson(Map<String, dynamic> json) {
    self = json['self'];
    next = json['next'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['self'] = this.self;
    data['next'] = this.next;
    return data;
  }
}

class Data {
  int? id;
  int? changed;
  String? start;
  String? end;
  Title? title;
  Title? description;
  Category? category;
  List<Locations>? locations;
  Type? type;
  List<String>? papers;
  List<People>? people;
  int? status;
  int? weight;
  String? addons;
  int? parent;
  String? event;

  Data(
      {this.id,
      this.changed,
      this.start,
      this.end,
      this.title,
      this.description,
      this.category,
      this.locations,
      this.type,
      this.papers,
      this.people,
      this.status,
      this.weight,
      this.addons,
      this.parent,
      this.event});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    changed = json['changed'];
    start = json['start'];
    end = json['end'];
    title = json['title'] != null ? Title.fromJson(json['title']) : null;
    description = json['description'] != null
        ? Title.fromJson(json['description'])
        : null;
    category =
        json['category'] != null ? Category.fromJson(json['category']) : null;
    if (json['locations'] != null) {
      locations = <Locations>[];
      json['locations'].forEach((v) {
        locations!.add(Locations.fromJson(v));
      });
    }
    type = json['type'] != null ? Type.fromJson(json['type']) : null;
    papers = json['papers'].cast<String>();
    if (json['people'] != null) {
      people = <People>[];
      json['people'].forEach((v) {
        people!.add(People.fromJson(v));
      });
    }
    status = json['status'];
    weight = json['weight'];
    addons = json['addons'];
    parent = json['parent'];
    event = json['event'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['changed'] = this.changed;
    data['start'] = this.start;
    data['end'] = this.end;
    if (this.title != null) {
      data['title'] = this.title!.toJson();
    }
    if (this.description != null) {
      data['description'] = this.description!.toJson();
    }
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    if (this.locations != null) {
      data['locations'] = this.locations!.map((v) => v.toJson()).toList();
    }
    if (this.type != null) {
      data['type'] = this.type!.toJson();
    }
    data['papers'] = this.papers;
    if (this.people != null) {
      data['people'] = this.people!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    data['weight'] = this.weight;
    data['addons'] = this.addons;
    data['parent'] = this.parent;
    data['event'] = this.event;
    return data;
  }
}

class Title {
  String? ptBr;

  Title({this.ptBr});

  Title.fromJson(Map<String, dynamic> json) {
    ptBr = json['pt-br'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['pt-br'] = this.ptBr;
    return data;
  }
}

class Category {
  int? id;
  Title? title;
  String? color;
  String? backgroundColor;

  Category({this.id, this.title, this.color, this.backgroundColor});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'] != null ? Title.fromJson(json['title']) : null;
    color = json['color'];
    backgroundColor = json['background-color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    if (this.title != null) {
      data['title'] = this.title!.toJson();
    }
    data['color'] = this.color;
    data['background-color'] = this.backgroundColor;
    return data;
  }
}

class Locations {
  int? id;
  Title? title;
  int? parent;
  Null? map;

  Locations({this.id, this.title, this.parent, this.map});

  Locations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'] != null ? Title.fromJson(json['title']) : null;
    parent = json['parent'];
    map = json['map'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    if (this.title != null) {
      data['title'] = this.title!.toJson();
    }
    data['parent'] = this.parent;
    data['map'] = this.map;
    return data;
  }
}

class Type {
  int? id;
  Title? title;

  Type({this.id, this.title});

  Type.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'] != null ? Title.fromJson(json['title']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    if (this.title != null) {
      data['title'] = this.title!.toJson();
    }
    return data;
  }
}

class People {
  int? id;
  String? title;
  String? name;
  String? institution;
  Title? bio;
  String? picture;
  int? weight;
  Role? role;
  String? hash;

  People(
      {this.id,
      this.title,
      this.name,
      this.institution,
      this.bio,
      this.picture,
      this.weight,
      this.role,
      this.hash});

  People.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    name = json['name'];
    institution = json['institution'];
    bio = json['bio'] != null ? Title.fromJson(json['bio']) : null;
    picture = json['picture'];
    weight = json['weight'];
    role = json['role'] != null ? Role.fromJson(json['role']) : null;
    hash = json['hash'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['name'] = this.name;
    data['institution'] = this.institution;
    if (this.bio != null) {
      data['bio'] = this.bio!.toJson();
    }
    data['picture'] = this.picture;
    data['weight'] = this.weight;
    if (this.role != null) {
      data['role'] = this.role!.toJson();
    }
    data['hash'] = this.hash;
    return data;
  }
}

class Role {
  int? id;
  Title? label;

  Role({this.id, this.label});

  Role.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    label = json['label'] != null ? Title.fromJson(json['label']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    if (this.label != null) {
      data['label'] = this.label!.toJson();
    }
    return data;
  }
}
 */

