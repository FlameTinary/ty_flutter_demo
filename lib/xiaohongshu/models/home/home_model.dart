// To parse this JSON data, do
//
//     final xhsHomeModel = xhsHomeModelFromJson(jsonString);

import 'dart:convert';

XhsHomeModel? xhsHomeModelFromJson(String str) =>
    XhsHomeModel.fromJson(json.decode(str));

String xhsHomeModelToJson(XhsHomeModel? data) => json.encode(data!.toJson());

class XhsHomeModel {
  XhsHomeModel({
    this.code,
    this.success,
    this.data,
  });

  int? code;
  bool? success;
  List<Datum?>? data;

  factory XhsHomeModel.fromJson(Map<String, dynamic> json) => XhsHomeModel(
        code: json["code"],
        success: json["success"],
        data: json["data"] == null
            ? []
            : List<Datum?>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "success": success,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x!.toJson())),
      };
}

class Datum {
  Datum({
    this.cursorScore,
    this.recommend,
    this.dislikeOptional,
    this.id,
    this.type,
    this.timestamp,
    this.name,
    this.title,
    this.desc,
    this.displayTitle,
    this.imagesList,
    this.inlikes,
    this.likes,
    this.user,
    this.modelType,
    this.isAds,
    this.isTracking,
    this.debugInfo,
    this.isTrackingUpgrade,
    this.hasMusic,
    this.isTopShowEcoOfficerNote,
    this.videoInfoV2,
    this.adsInfo,
  });

  String? cursorScore;
  Recommend? recommend;
  DislikeOptional? dislikeOptional;
  String? id;
  Type? type;
  int? timestamp;
  String? name;
  String? title;
  String? desc;
  String? displayTitle;
  List<ImagesList?>? imagesList;
  bool? inlikes;
  int? likes;
  User? user;
  ModelType? modelType;
  bool? isAds;
  bool? isTracking;
  DebugInfo? debugInfo;
  bool? isTrackingUpgrade;
  bool? hasMusic;
  bool? isTopShowEcoOfficerNote;
  VideoInfoV2? videoInfoV2;
  AdsInfo? adsInfo;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        cursorScore: json["cursor_score"],
        recommend: Recommend.fromJson(json["recommend"]),
        dislikeOptional: DislikeOptional.fromJson(json["dislike_optional"]),
        id: json["id"],
        type: typeValues.map[json["type"]],
        timestamp: json["timestamp"],
        name: json["name"],
        title: json["title"],
        desc: json["desc"],
        displayTitle: json["display_title"],
        imagesList: json["images_list"] == null
            ? []
            : List<ImagesList?>.from(
                json["images_list"]!.map((x) => ImagesList.fromJson(x))),
        inlikes: json["inlikes"],
        likes: json["likes"],
        user: User.fromJson(json["user"]),
        modelType: modelTypeValues.map[json["model_type"]],
        isAds: json["is_ads"],
        isTracking: json["is_tracking"],
        debugInfo: DebugInfo.fromJson(json["debug_info"]),
        isTrackingUpgrade: json["is_tracking_upgrade"],
        hasMusic: json["has_music"],
        isTopShowEcoOfficerNote: json["is_top_show_eco_officer_note"],
        videoInfoV2: json["video_info_v2"] != null
            ? VideoInfoV2.fromJson(json["video_info_v2"])
            : VideoInfoV2(),
        adsInfo: AdsInfo.fromJson(json["ads_info"]),
      );

  Map<String, dynamic> toJson() => {
        "cursor_score": cursorScore,
        "recommend": recommend!.toJson(),
        "dislike_optional": dislikeOptional!.toJson(),
        "id": id,
        "type": typeValues.reverse![type],
        "timestamp": timestamp,
        "name": name,
        "title": title,
        "desc": desc,
        "display_title": displayTitle,
        "images_list": imagesList == null
            ? []
            : List<dynamic>.from(imagesList!.map((x) => x!.toJson())),
        "inlikes": inlikes,
        "likes": likes,
        "user": user!.toJson(),
        "model_type": modelTypeValues.reverse![modelType],
        "is_ads": isAds,
        "is_tracking": isTracking,
        "debug_info": debugInfo,
        "is_tracking_upgrade": isTrackingUpgrade,
        "has_music": hasMusic,
        "is_top_show_eco_officer_note": isTopShowEcoOfficerNote,
        "video_info_v2": videoInfoV2,
        "ads_info": adsInfo,
      };
}

class AdsInfo {
  AdsInfo({
    this.adsId,
    this.isReplaceTitle,
    this.isReplaceUrl,
    this.photoUrl,
    this.tipsOnPic,
    this.titleName,
    this.trackId,
    this.trackUrl,
  });

  String? adsId;
  String? isReplaceTitle;
  String? isReplaceUrl;
  String? photoUrl;
  String? tipsOnPic;
  String? titleName;
  String? trackId;
  String? trackUrl;

  factory AdsInfo.fromJson(Map<String, dynamic>? json) => json != null
      ? AdsInfo(
          adsId: json["ads_id"],
          isReplaceTitle: json["isReplaceTitle"],
          isReplaceUrl: json["isReplaceUrl"],
          photoUrl: json["photoUrl"],
          tipsOnPic: json["tips_on_pic"],
          titleName: json["titleName"],
          trackId: json["track_id"],
          trackUrl: json["track_url"],
        )
      : AdsInfo();

  Map<String, dynamic> toJson() => {
        "ads_id": adsId,
        "isReplaceTitle": isReplaceTitle,
        "isReplaceUrl": isReplaceUrl,
        "photoUrl": photoUrl,
        "tips_on_pic": tipsOnPic,
        "titleName": titleName,
        "track_id": trackId,
        "track_url": trackUrl,
      };
}

class DebugInfo {
  DebugInfo();

  factory DebugInfo.fromJson(Map<String, dynamic>? json) => DebugInfo();

  Map<String, dynamic> toJson() => {};
}

class DislikeOptional {
  DislikeOptional({
    this.followUser,
  });

  bool? followUser;

  factory DislikeOptional.fromJson(Map<String, dynamic> json) =>
      DislikeOptional(
        followUser: json["follow_user"],
      );

  Map<String, dynamic> toJson() => {
        "follow_user": followUser,
      };
}

class ImagesList {
  ImagesList({
    this.fileid,
    this.height,
    this.width,
    this.url,
    this.urlSizeLarge,
    this.original,
    this.urlMultiLevel,
    this.traceId,
  });

  String? fileid;
  int? height;
  int? width;
  String? url;
  String? urlSizeLarge;
  String? original;
  UrlMultiLevel? urlMultiLevel;
  String? traceId;

  factory ImagesList.fromJson(Map<String, dynamic> json) => ImagesList(
        fileid: json["fileid"],
        height: json["height"],
        width: json["width"],
        url: json["url"],
        urlSizeLarge: json["url_size_large"],
        original: json["original"],
        urlMultiLevel: UrlMultiLevel.fromJson(json["url_multi_level"]),
        traceId: json["trace_id"],
      );

  Map<String, dynamic> toJson() => {
        "fileid": fileid,
        "height": height,
        "width": width,
        "url": url,
        "url_size_large": urlSizeLarge,
        "original": original,
        "url_multi_level": urlMultiLevel,
        "trace_id": traceId,
      };
}

class UrlMultiLevel {
  UrlMultiLevel({
    this.low,
    this.medium,
    this.high,
  });

  String? low;
  String? medium;
  String? high;

  factory UrlMultiLevel.fromJson(Map<String, dynamic>? json) => json != null
      ? UrlMultiLevel(
          low: json["low"],
          medium: json["medium"],
          high: json["high"],
        )
      : UrlMultiLevel();

  Map<String, dynamic> toJson() => {
        "low": low,
        "medium": medium,
        "high": high,
      };
}

enum ModelType { NOTE }

final modelTypeValues = EnumValues({"note": ModelType.NOTE});

class Recommend {
  Recommend({
    this.desc,
    this.icon,
    this.targetId,
    this.targetName,
    this.trackId,
    this.type,
    this.topicId,
    this.topicName,
    this.categoryId,
    this.categoryName,
    this.predictClickRatio,
    this.isActivateSearch,
    this.videofeedLazyLoadScore,
  });

  String? desc;
  String? icon;
  String? targetId;
  String? targetName;
  String? trackId;
  String? type;
  String? topicId;
  String? topicName;
  String? categoryId;
  String? categoryName;
  double? predictClickRatio;
  bool? isActivateSearch;
  double? videofeedLazyLoadScore;

  factory Recommend.fromJson(Map<String, dynamic> json) => Recommend(
        desc: json["desc"],
        icon: json["icon"],
        targetId: json["target_id"],
        targetName: json["target_name"],
        trackId: json["track_id"],
        type: json["type"],
        topicId: json["topic_id"],
        topicName: json["topic_name"],
        categoryId: json["category_id"],
        categoryName: json["category_name"],
        predictClickRatio: json["predict_click_ratio"],
        isActivateSearch: json["is_activate_search"],
        videofeedLazyLoadScore: json["videofeed_lazy_load_score"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "desc": desc,
        "icon": icon,
        "target_id": targetId,
        "target_name": targetName,
        "track_id": trackId,
        "type": type,
        "topic_id": topicId,
        "topic_name": topicName,
        "category_id": categoryId,
        "category_name": categoryName,
        "predict_click_ratio": predictClickRatio,
        "is_activate_search": isActivateSearch,
        "videofeed_lazy_load_score": videofeedLazyLoadScore,
      };
}

enum Type { NORMAL, VIDEO }

final typeValues = EnumValues({"normal": Type.NORMAL, "video": Type.VIDEO});

class User {
  User({
    this.nickname,
    this.images,
    this.userid,
  });

  String? nickname;
  String? images;
  String? userid;

  factory User.fromJson(Map<String, dynamic> json) => User(
        nickname: json["nickname"],
        images: json["images"],
        userid: json["userid"],
      );

  Map<String, dynamic> toJson() => {
        "nickname": nickname,
        "images": images,
        "userid": userid,
      };
}

class VideoInfoV2 {
  VideoInfoV2({
    this.media,
    this.image,
    this.capa,
    this.consumer,
  });

  Media? media;
  XHSImage? image;
  Capa? capa;
  DebugInfo? consumer;

  factory VideoInfoV2.fromJson(Map<String, dynamic> json) => VideoInfoV2(
        media: Media.fromJson(json["media"]),
        image: XHSImage.fromJson(json["image"]),
        capa: Capa.fromJson(json["capa"]),
        consumer: DebugInfo.fromJson(json["consumer"]),
      );

  Map<String, dynamic> toJson() => {
        "media": media!.toJson(),
        "image": image!.toJson(),
        "capa": capa!.toJson(),
        "consumer": consumer!.toJson(),
      };
}

class Capa {
  Capa({
    this.duration,
    this.frameTs,
    this.isUserSelect,
    this.isUpload,
  });

  int? duration;
  int? frameTs;
  bool? isUserSelect;
  bool? isUpload;

  factory Capa.fromJson(Map<String, dynamic> json) => Capa(
        duration: json["duration"],
        frameTs: json["frame_ts"],
        isUserSelect: json["is_user_select"],
        isUpload: json["is_upload"],
      );

  Map<String, dynamic> toJson() => {
        "duration": duration,
        "frame_ts": frameTs,
        "is_user_select": isUserSelect,
        "is_upload": isUpload,
      };
}

class XHSImage {
  XHSImage({
    this.firstFrame,
    this.thumbnail,
    this.thumbnailDim,
  });

  String? firstFrame;
  String? thumbnail;
  String? thumbnailDim;

  factory XHSImage.fromJson(Map<String, dynamic> json) => XHSImage(
        firstFrame: json["first_frame"],
        thumbnail: json["thumbnail"],
        thumbnailDim: json["thumbnail_dim"],
      );

  Map<String, dynamic> toJson() => {
        "first_frame": firstFrame,
        "thumbnail": thumbnail,
        "thumbnail_dim": thumbnailDim,
      };
}

class Media {
  Media({
    this.stream,
    this.video,
    this.videoId,
  });

  Map<String, List<Stream?>?>? stream;
  Video? video;
  String? videoId;

  factory Media.fromJson(Map<String, dynamic> json) => Media(
        stream: Map.from(json["stream"]!).map((k, v) =>
            MapEntry<String, List<Stream?>?>(
                k,
                v == null
                    ? []
                    : List<Stream?>.from(v!.map((x) => Stream.fromJson(x))))),
        video: Video.fromJson(json["video"]),
        videoId: json["video_id"],
      );

  Map<String, dynamic> toJson() => {
        "stream": Map.from(stream!).map((k, v) => MapEntry<String, dynamic>(k,
            v == null ? [] : List<dynamic>.from(v!.map((x) => x!.toJson())))),
        "video": video!.toJson(),
        "video_id": videoId,
      };
}

class Stream {
  Stream({
    this.audioBitrate,
    this.audioChannels,
    this.audioCodec,
    this.audioDuration,
    this.avgBitrate,
    this.backupUrls,
    this.defaultStream,
    this.duration,
    this.format,
    this.fps,
    this.hdrType,
    this.height,
    this.masterUrl,
    this.psnr,
    this.qualityType,
    this.rotate,
    this.size,
    this.ssim,
    this.streamDesc,
    this.streamType,
    this.videoBitrate,
    this.videoCodec,
    this.videoDuration,
    this.vmaf,
    this.volume,
    this.weight,
    this.width,
    this.vqa,
  });

  int? audioBitrate;
  int? audioChannels;
  AudioCodec? audioCodec;
  int? audioDuration;
  int? avgBitrate;
  List<String?>? backupUrls;
  int? defaultStream;
  int? duration;
  Format? format;
  int? fps;
  int? hdrType;
  int? height;
  String? masterUrl;
  double? psnr;
  QualityType? qualityType;
  int? rotate;
  int? size;
  double? ssim;
  String? streamDesc;
  int? streamType;
  int? videoBitrate;
  VideoCodec? videoCodec;
  int? videoDuration;
  int? vmaf;
  int? volume;
  int? weight;
  int? width;
  Vqa? vqa;

  factory Stream.fromJson(Map<String, dynamic> json) => Stream(
        audioBitrate: json["audio_bitrate"],
        audioChannels: json["audio_channels"],
        audioCodec: audioCodecValues.map[json["audio_codec"]],
        audioDuration: json["audio_duration"],
        avgBitrate: json["avg_bitrate"],
        backupUrls: json["backup_urls"] == null
            ? []
            : List<String?>.from(json["backup_urls"]!.map((x) => x)),
        defaultStream: json["default_stream"],
        duration: json["duration"],
        format: formatValues.map[json["format"]],
        fps: json["fps"],
        hdrType: json["hdr_type"],
        height: json["height"],
        masterUrl: json["master_url"],
        psnr: json["psnr"].toDouble(),
        qualityType: qualityTypeValues.map[json["quality_type"]],
        rotate: json["rotate"],
        size: json["size"],
        ssim: json["ssim"].toDouble(),
        streamDesc: json["stream_desc"],
        streamType: json["stream_type"],
        videoBitrate: json["video_bitrate"],
        videoCodec: videoCodecValues.map[json["video_codec"]],
        videoDuration: json["video_duration"],
        vmaf: json["vmaf"],
        volume: json["volume"],
        weight: json["weight"],
        width: json["width"],
        vqa: Vqa.fromJson(json["vqa"]),
      );

  Map<String, dynamic> toJson() => {
        "audio_bitrate": audioBitrate,
        "audio_channels": audioChannels,
        "audio_codec": audioCodecValues.reverse![audioCodec],
        "audio_duration": audioDuration,
        "avg_bitrate": avgBitrate,
        "backup_urls": backupUrls == null
            ? []
            : List<dynamic>.from(backupUrls!.map((x) => x)),
        "default_stream": defaultStream,
        "duration": duration,
        "format": formatValues.reverse![format],
        "fps": fps,
        "hdr_type": hdrType,
        "height": height,
        "master_url": masterUrl,
        "psnr": psnr,
        "quality_type": qualityTypeValues.reverse![qualityType],
        "rotate": rotate,
        "size": size,
        "ssim": ssim,
        "stream_desc": streamDesc,
        "stream_type": streamType,
        "video_bitrate": videoBitrate,
        "video_codec": videoCodecValues.reverse![videoCodec],
        "video_duration": videoDuration,
        "vmaf": vmaf,
        "volume": volume,
        "weight": weight,
        "width": width,
        "vqa": vqa,
      };
}

enum AudioCodec { AAC }

final audioCodecValues = EnumValues({"aac": AudioCodec.AAC});

enum Format { MP4 }

final formatValues = EnumValues({"mp4": Format.MP4});

enum QualityType { HD, FHD }

final qualityTypeValues =
    EnumValues({"FHD": QualityType.FHD, "HD": QualityType.HD});

enum VideoCodec { H264, HEVC }

final videoCodecValues =
    EnumValues({"h264": VideoCodec.H264, "hevc": VideoCodec.HEVC});

class Vqa {
  Vqa({
    this.score,
    this.std,
  });

  double? score;
  double? std;

  factory Vqa.fromJson(Map<String, dynamic>? json) => json != null
      ? Vqa(
          score: json["score"].toDouble(),
          std: json["std"].toDouble(),
        )
      : Vqa();

  Map<String, dynamic> toJson() => {
        "score": score,
        "std": std,
      };
}

class Video {
  Video({
    this.bizId,
    this.bizName,
    this.bound,
    this.drmType,
    this.duration,
    this.hdrType,
    this.height,
    this.md5,
    this.streamTypes,
    this.width,
  });

  String? bizId;
  int? bizName;
  List<Bound?>? bound;
  int? drmType;
  int? duration;
  int? hdrType;
  int? height;
  String? md5;
  List<int?>? streamTypes;
  int? width;

  factory Video.fromJson(Map<String, dynamic> json) => Video(
        bizId: json["biz_id"],
        bizName: json["biz_name"],
        bound: json["bound"] == null
            ? []
            : List<Bound?>.from(json["bound"]!.map((x) => Bound.fromJson(x))),
        drmType: json["drm_type"],
        duration: json["duration"],
        hdrType: json["hdr_type"],
        height: json["height"],
        md5: json["md5"],
        streamTypes: json["stream_types"] == null
            ? []
            : List<int?>.from(json["stream_types"]!.map((x) => x)),
        width: json["width"],
      );

  Map<String, dynamic> toJson() => {
        "biz_id": bizId,
        "biz_name": bizName,
        "bound": bound == null
            ? []
            : List<dynamic>.from(bound!.map((x) => x!.toJson())),
        "drm_type": drmType,
        "duration": duration,
        "hdr_type": hdrType,
        "height": height,
        "md5": md5,
        "stream_types": streamTypes == null
            ? []
            : List<dynamic>.from(streamTypes!.map((x) => x)),
        "width": width,
      };
}

class Bound {
  Bound({
    this.h,
    this.w,
    this.x,
    this.y,
  });

  int? h;
  int? w;
  int? x;
  int? y;

  factory Bound.fromJson(Map<String, dynamic> json) => Bound(
        h: json["h"],
        w: json["w"],
        x: json["x"],
        y: json["y"],
      );

  Map<String, dynamic> toJson() => {
        "h": h,
        "w": w,
        "x": x,
        "y": y,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    reverseMap ??= map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
