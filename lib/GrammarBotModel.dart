// To parse this JSON data, do
//
//     final grammarBotModel = grammarBotModelFromJson(jsonString);

import 'dart:convert';

GrammarBotModel grammarBotModelFromJson(String str) => GrammarBotModel.fromJson(json.decode(str));

String grammarBotModelToJson(GrammarBotModel data) => json.encode(data.toJson());

class GrammarBotModel {
  GrammarBotModel({
    this.software,
    this.warnings,
    this.language,
    this.matches,
  });

  Software software;
  Warnings warnings;
  Language language;
  List<Match> matches;

  factory GrammarBotModel.fromJson(Map<String, dynamic> json) => GrammarBotModel(
    software: Software.fromJson(json["software"]),
    warnings: Warnings.fromJson(json["warnings"]),
    language: Language.fromJson(json["language"]),
    matches: List<Match>.from(json["matches"].map((x) => Match.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "software": software.toJson(),
    "warnings": warnings.toJson(),
    "language": language.toJson(),
    "matches": List<dynamic>.from(matches.map((x) => x.toJson())),
  };
}

class Language {
  Language({
    this.name,
    this.code,
    this.detectedLanguage,
  });

  String name;
  String code;
  DetectedLanguage detectedLanguage;

  factory Language.fromJson(Map<String, dynamic> json) => Language(
    name: json["name"],
    code: json["code"],
    detectedLanguage: DetectedLanguage.fromJson(json["detectedLanguage"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "code": code,
    "detectedLanguage": detectedLanguage.toJson(),
  };
}

class DetectedLanguage {
  DetectedLanguage({
    this.name,
    this.code,
  });

  String name;
  String code;

  factory DetectedLanguage.fromJson(Map<String, dynamic> json) => DetectedLanguage(
    name: json["name"],
    code: json["code"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "code": code,
  };
}

class Match {
  Match({
    this.message,
    this.shortMessage,
    this.replacements,
    this.offset,
    this.length,
    this.context,
    this.sentence,
    this.type,
    this.rule,
  });

  String message;
  String shortMessage;
  List<Replacement> replacements;
  int offset;
  int length;
  Context context;
  String sentence;
  Type type;
  Rule rule;

  factory Match.fromJson(Map<String, dynamic> json) => Match(
    message: json["message"],
    shortMessage: json["shortMessage"],
    replacements: List<Replacement>.from(json["replacements"].map((x) => Replacement.fromJson(x))),
    offset: json["offset"],
    length: json["length"],
    context: Context.fromJson(json["context"]),
    sentence: json["sentence"],
    type: Type.fromJson(json["type"]),
    rule: Rule.fromJson(json["rule"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "shortMessage": shortMessage,
    "replacements": List<dynamic>.from(replacements.map((x) => x.toJson())),
    "offset": offset,
    "length": length,
    "context": context.toJson(),
    "sentence": sentence,
    "type": type.toJson(),
    "rule": rule.toJson(),
  };
}

class Context {
  Context({
    this.text,
    this.offset,
    this.length,
  });

  String text;
  int offset;
  int length;

  factory Context.fromJson(Map<String, dynamic> json) => Context(
    text: json["text"],
    offset: json["offset"],
    length: json["length"],
  );

  Map<String, dynamic> toJson() => {
    "text": text,
    "offset": offset,
    "length": length,
  };
}

class Replacement {
  Replacement({
    this.value,
  });

  String value;

  factory Replacement.fromJson(Map<String, dynamic> json) => Replacement(
    value: json["value"],
  );

  Map<String, dynamic> toJson() => {
    "value": value,
  };
}

class Rule {
  Rule({
    this.id,
    this.description,
    this.issueType,
    this.category,
  });

  String id;
  String description;
  String issueType;
  Category category;

  factory Rule.fromJson(Map<String, dynamic> json) => Rule(
    id: json["id"],
    description: json["description"],
    issueType: json["issueType"],
    category: Category.fromJson(json["category"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "description": description,
    "issueType": issueType,
    "category": category.toJson(),
  };
}

class Category {
  Category({
    this.id,
    this.name,
  });

  String id;
  String name;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}

class Type {
  Type({
    this.typeName,
  });

  String typeName;

  factory Type.fromJson(Map<String, dynamic> json) => Type(
    typeName: json["typeName"],
  );

  Map<String, dynamic> toJson() => {
    "typeName": typeName,
  };
}

class Software {
  Software({
    this.name,
    this.version,
    this.apiVersion,
    this.premium,
    this.premiumHint,
    this.status,
  });

  String name;
  String version;
  int apiVersion;
  bool premium;
  String premiumHint;
  String status;

  factory Software.fromJson(Map<String, dynamic> json) => Software(
    name: json["name"],
    version: json["version"],
    apiVersion: json["apiVersion"],
    premium: json["premium"],
    premiumHint: json["premiumHint"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "version": version,
    "apiVersion": apiVersion,
    "premium": premium,
    "premiumHint": premiumHint,
    "status": status,
  };
}

class Warnings {
  Warnings({
    this.incompleteResults,
  });

  bool incompleteResults;

  factory Warnings.fromJson(Map<String, dynamic> json) => Warnings(
    incompleteResults: json["incompleteResults"],
  );

  Map<String, dynamic> toJson() => {
    "incompleteResults": incompleteResults,
  };
}
