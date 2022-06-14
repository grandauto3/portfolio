import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:json_annotation/json_annotation.dart';

part 'portfolio_data.g.dart';

@JsonSerializable()
class PortfolioData {
  PortfolioData({
    required this.text,
    this.imagePaths = const [],
    this.images = const [],
  });

  String text;
  List<String> imagePaths;
  @JsonKey(ignore: true)
  List<Image> images;

  static Future<PortfolioData> getData(String jsonPath) async {
    String jsonString;

    try {
      jsonString = await rootBundle.loadString(jsonPath);
    } catch (e) {
      jsonString = await rootBundle.loadString('assets/' + jsonPath);
    }

    final tmpData = PortfolioData.fromJson(jsonDecode(jsonString));

    Iterable<Image> _getImages(List<String> paths) sync* {
      for (var item in paths) {
        yield Image.asset(item);
      }
    }

    return PortfolioData(
        text: tmpData.text, images: List.from(_getImages(tmpData.imagePaths)));
  }

  factory PortfolioData.fromJson(Map<String, dynamic> json) =>
      _$PortfolioDataFromJson(json);

  Map<String, dynamic> toJson() => _$PortfolioDataToJson(this);
}
