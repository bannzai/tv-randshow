// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

File _$FileFromJson(Map<String, dynamic> json) {
  return File(
    tvshows: (json['tvshows'] as List)
        ?.map((e) => e == null
            ? null
            : TvshowDetails.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$FileToJson(File instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('tvshows', instance.tvshows);
  return val;
}
