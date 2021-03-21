class singlePostModel {
  int iD;
  String permalink;
  String metaKeyword;
  String postContent;
  String postDate;
  String postDateGmt;
  String postTitle;
  String reporterImage;
  String reporterName;
  String shortDescription;
  Null imageCaption;
  int hitCount;
  String imageLink;
  String facebookShareImage;

  singlePostModel(
      {this.iD,
        this.permalink,
        this.metaKeyword,
        this.postContent,
        this.postDate,
        this.postDateGmt,
        this.postTitle,
        this.reporterImage,
        this.reporterName,
        this.shortDescription,
        this.imageCaption,
        this.hitCount,
        this.imageLink,
        this.facebookShareImage});

  singlePostModel.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    permalink = json['permalink'];
    metaKeyword = json['meta_keyword'];
    postContent = json['post_content'];
    postDate = json['post_date'];
    postDateGmt = json['post_date_gmt'];
    postTitle = json['post_title'];
    reporterImage = json['reporter_image'];
    reporterName = json['reporter_name'];
    shortDescription = json['short_description'];
    imageCaption = json['image_caption'];
    hitCount = json['hitCount'];
    imageLink = json['image_link'];
    facebookShareImage = json['facebook_share_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['permalink'] = this.permalink;
    data['meta_keyword'] = this.metaKeyword;
    data['post_content'] = this.postContent;
    data['post_date'] = this.postDate;
    data['post_date_gmt'] = this.postDateGmt;
    data['post_title'] = this.postTitle;
    data['reporter_image'] = this.reporterImage;
    data['reporter_name'] = this.reporterName;
    data['short_description'] = this.shortDescription;
    data['image_caption'] = this.imageCaption;
    data['hitCount'] = this.hitCount;
    data['image_link'] = this.imageLink;
    data['facebook_share_image'] = this.facebookShareImage;
    return data;
  }
}
