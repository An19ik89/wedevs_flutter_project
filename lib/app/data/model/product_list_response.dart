// To parse this JSON data, do
//
//     final response = responseFromJson(jsonString?);

import 'dart:convert';

List<ResponseData> responseFromJson(String? str) => List<ResponseData>.from(json.decode(str!).map((x) => ResponseData.fromJson(x)));

String? responseToJson(List<ResponseData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ResponseData {
  ResponseData({
    this.id,
    this.name,
    this.slug,
    this.postAuthor,
    this.permalink,
    this.dateCreated,
    this.dateCreatedGmt,
    this.dateModified,
    this.dateModifiedGmt,
    this.type,
    this.status,
    this.featured,
    this.catalogVisibility,
    this.description,
    this.shortDescription,
    this.sku,
    this.price,
    this.regularPrice,
    this.salePrice,
    this.dateOnSaleFrom,
    this.dateOnSaleFromGmt,
    this.dateOnSaleTo,
    this.dateOnSaleToGmt,
    this.priceHtml,
    this.onSale,
    this.purchasable,
    this.totalSales,
    this.virtual,
    this.downloadable,
    this.downloads,
    this.downloadLimit,
    this.downloadExpiry,
    this.externalUrl,
    this.buttonText,
    this.taxStatus,
    this.taxClass,
    this.manageStock,
    this.stockQuantity,
    this.lowStockAmount,
    this.inStock,
    this.backorders,
    this.backordersAllowed,
    this.backordered,
    this.soldIndividually,
    this.weight,
    this.dimensions,
    this.shippingRequired,
    this.shippingTaxable,
    this.shippingClass,
    this.shippingClassId,
    this.reviewsAllowed,
    this.averageRating,
    this.ratingCount,
    this.relatedIds,
    this.upsellIds,
    this.crossSellIds,
    this.parentId,
    this.purchaseNote,
    this.categories,
    this.tags,
    this.images,
    this.attributes,
    this.defaultAttributes,
    this.variations,
    this.groupedProducts,
    this.menuOrder,
    this.metaData,
    this.store,
    this.links,
  });

  int? id;
  String? name;
  String? slug;
  String? postAuthor;
  String? permalink;
  DateTime? dateCreated;
  DateTime? dateCreatedGmt;
  DateTime? dateModified;
  DateTime? dateModifiedGmt;
  String? type;
  String? status;
  bool? featured;
  String? catalogVisibility;
  String? description;
  String? shortDescription;
  String? sku;
  String? price;
  String? regularPrice;
  String? salePrice;
  dynamic dateOnSaleFrom;
  dynamic dateOnSaleFromGmt;
  dynamic dateOnSaleTo;
  dynamic dateOnSaleToGmt;
  String? priceHtml;
  bool? onSale;
  bool? purchasable;
  int? totalSales;
  bool? virtual;
  bool? downloadable;
  List<Download>? downloads;
  int? downloadLimit;
  int? downloadExpiry;
  String? externalUrl;
  String? buttonText;
  String? taxStatus;
  String? taxClass;
  bool? manageStock;
  int? stockQuantity;
  dynamic lowStockAmount;
  bool? inStock;
  String? backorders;
  bool? backordersAllowed;
  bool? backordered;
  bool? soldIndividually;
  String? weight;
  Dimensions? dimensions;
  bool? shippingRequired;
  bool? shippingTaxable;
  String? shippingClass;
  int? shippingClassId;
  bool? reviewsAllowed;
  String? averageRating;
  int? ratingCount;
  List<int>? relatedIds;
  List<dynamic>? upsellIds;
  List<dynamic>? crossSellIds;
  int? parentId;
  String? purchaseNote;
  List<Category>? categories;
  List<Category>? tags;
  List<ImageResponse>? images;
  List<Attribute>? attributes;
  List<dynamic>? defaultAttributes;
  List<int>? variations;
  List<dynamic>? groupedProducts;
  int? menuOrder;
  List<MetaDatum>? metaData;
  Store? store;
  Links? links;

  factory ResponseData.fromJson(Map<String?, dynamic> json) => ResponseData(
    id: json["id"] ?? null,
    name: json["name"] ?? null,
    slug: json["slug"] ?? null,
    postAuthor: json["post_author"] ?? null,
    permalink: json["permalink"] ?? null,
    dateCreated: json["date_created"] == null ? null : DateTime?.parse(json["date_created"]),
    dateCreatedGmt: json["date_created_gmt"] == null ? null : DateTime?.parse(json["date_created_gmt"]),
    dateModified: json["date_modified"] == null ? null : DateTime?.parse(json["date_modified"]),
    dateModifiedGmt: json["date_modified_gmt"] == null ? null : DateTime?.parse(json["date_modified_gmt"]),
    type: json["type"] ?? null,
    status: json["status"] ?? null,
    featured: json["featured"] ?? null,
    catalogVisibility: json["catalog_visibility"] ?? null,
    description: json["description"] ?? null,
    shortDescription: json["short_description"] ?? null,
    sku: json["sku"] ?? null,
    price: json["price"] ?? null,
    regularPrice: json["regular_price"] ?? null,
    salePrice: json["sale_price"] ?? null,
    dateOnSaleFrom: json["date_on_sale_from"],
    dateOnSaleFromGmt: json["date_on_sale_from_gmt"],
    dateOnSaleTo: json["date_on_sale_to"],
    dateOnSaleToGmt: json["date_on_sale_to_gmt"],
    priceHtml: json["price_html"] ?? null,
    onSale: json["on_sale"] ?? null,
    purchasable: json["purchasable"] ?? null,
    totalSales: json["total_sales"] ?? null,
    virtual: json["virtual"] ?? null,
    downloadable: json["downloadable"] ?? null,
    downloads: json["downloads"] == null ? null : List<Download>.from(json["downloads"].map((x) => Download.fromJson(x))),
    downloadLimit: json["download_limit"] ?? null,
    downloadExpiry: json["download_expiry"] ?? null,
    externalUrl: json["external_url"] ?? null,
    buttonText: json["button_text"] ?? null,
    taxStatus: json["tax_status"] ?? null,
    taxClass: json["tax_class"] ?? null,
    manageStock: json["manage_stock"] ?? null,
    stockQuantity: json["stock_quantity"] ?? null,
    lowStockAmount: json["low_stock_amount"],
    inStock: json["in_stock"] ?? null,
    backorders: json["backorders"] ?? null,
    backordersAllowed: json["backorders_allowed"] ?? null,
    backordered: json["backordered"] ?? null,
    soldIndividually: json["sold_individually"] ?? null,
    weight: json["weight"] ?? null,
    dimensions: json["dimensions"] == null ? null : Dimensions.fromJson(json["dimensions"]),
    shippingRequired: json["shipping_required"] ?? null,
    shippingTaxable: json["shipping_taxable"] ?? null,
    shippingClass: json["shipping_class"] ?? null,
    shippingClassId: json["shipping_class_id"] ?? null,
    reviewsAllowed: json["reviews_allowed"] ?? null,
    averageRating: json["average_rating"] ?? null,
    ratingCount: json["rating_count"] ?? null,
    relatedIds: json["related_ids"] == null ? null : List<int>.from(json["related_ids"].map((x) => x)),
    upsellIds: json["upsell_ids"] == null ? null : List<dynamic>.from(json["upsell_ids"].map((x) => x)),
    crossSellIds: json["cross_sell_ids"] == null ? null : List<dynamic>.from(json["cross_sell_ids"].map((x) => x)),
    parentId: json["parent_id"] ?? null,
    purchaseNote: json["purchase_note"] ?? null,
    categories: json["categories"] == null ? null : List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
    tags: json["tags"] == null ? null : List<Category>.from(json["tags"].map((x) => Category.fromJson(x))),
    images: json["images"] == null ? null : List<ImageResponse>.from(json["images"].map((x) => ImageResponse.fromJson(x))),
    attributes: json["attributes"] == null ? null : List<Attribute>.from(json["attributes"].map((x) => Attribute.fromJson(x))),
    defaultAttributes: json["default_attributes"] == null ? null : List<dynamic>.from(json["default_attributes"].map((x) => x)),
    variations: json["variations"] == null ? null : List<int>.from(json["variations"].map((x) => x)),
    groupedProducts: json["grouped_products"] == null ? null : List<dynamic>.from(json["grouped_products"].map((x) => x)),
    menuOrder: json["menu_order"] ?? null,
    metaData: json["meta_data"] == null ? null : List<MetaDatum>.from(json["meta_data"].map((x) => MetaDatum.fromJson(x))),
    store: json["store"] == null ? null : Store.fromJson(json["store"]),
    links: json["_links"] == null ? null : Links.fromJson(json["_links"]),
  );

  Map<String?, dynamic> toJson() => {
    "id": id ?? null,
    "name": name ?? null,
    "slug": slug ?? null,
    "post_author": postAuthor ?? null,
    "permalink": permalink ?? null,
    "date_created": dateCreated == null ? null : dateCreated?.toIso8601String(),
    "date_created_gmt": dateCreatedGmt == null ? null : dateCreatedGmt?.toIso8601String(),
    "date_modified": dateModified == null ? null : dateModified?.toIso8601String(),
    "date_modified_gmt": dateModifiedGmt == null ? null : dateModifiedGmt?.toIso8601String(),
    "type": type ?? null,
    "status": status ?? null,
    "featured": featured ?? null,
    "catalog_visibility": catalogVisibility ?? null,
    "description": description ?? null,
    "short_description": shortDescription ?? null,
    "sku": sku ?? null,
    "price": price ?? null,
    "regular_price": regularPrice ?? null,
    "sale_price": salePrice ?? null,
    "date_on_sale_from": dateOnSaleFrom,
    "date_on_sale_from_gmt": dateOnSaleFromGmt,
    "date_on_sale_to": dateOnSaleTo,
    "date_on_sale_to_gmt": dateOnSaleToGmt,
    "price_html": priceHtml ?? null,
    "on_sale": onSale ?? null,
    "purchasable": purchasable ?? null,
    "total_sales": totalSales ?? null,
    "virtual": virtual ?? null,
    "downloadable": downloadable ?? null,
    "downloads": downloads == null ? null : List<dynamic>.from(downloads!.map((x) => x.toJson())),
    "download_limit": downloadLimit ?? null,
    "download_expiry": downloadExpiry ?? null,
    "external_url": externalUrl ?? null,
    "button_text": buttonText ?? null,
    "tax_status": taxStatus ?? null,
    "tax_class": taxClass ?? null,
    "manage_stock": manageStock ?? null,
    "stock_quantity": stockQuantity ?? null,
    "low_stock_amount": lowStockAmount,
    "in_stock": inStock ?? null,
    "backorders": backorders ?? null,
    "backorders_allowed": backordersAllowed ?? null,
    "backordered": backordered ?? null,
    "sold_individually": soldIndividually ?? null,
    "weight": weight ?? null,
    "dimensions": dimensions == null ? null : dimensions!.toJson(),
    "shipping_required": shippingRequired ?? null,
    "shipping_taxable": shippingTaxable ?? null,
    "shipping_class": shippingClass ?? null,
    "shipping_class_id": shippingClassId ?? null,
    "reviews_allowed": reviewsAllowed ?? null,
    "average_rating": averageRating ?? null,
    "rating_count": ratingCount ?? null,
    "related_ids": relatedIds == null ? null : List<dynamic>.from(relatedIds!.map((x) => x)),
    "upsell_ids": upsellIds == null ? null : List<dynamic>.from(upsellIds!.map((x) => x)),
    "cross_sell_ids": crossSellIds == null ? null : List<dynamic>.from(crossSellIds!.map((x) => x)),
    "parent_id": parentId ?? null,
    "purchase_note": purchaseNote ?? null,
    "categories": categories == null ? null : List<dynamic>.from(categories!.map((x) => x.toJson())),
    "tags": tags == null ? null : List<dynamic>.from(tags!.map((x) => x.toJson())),
    "images": images == null ? null : List<dynamic>.from(images!.map((x) => x.toJson())),
    "attributes": attributes == null ? null : List<dynamic>.from(attributes!.map((x) => x.toJson())),
    "default_attributes": defaultAttributes == null ? null : List<dynamic>.from(defaultAttributes!.map((x) => x)),
    "variations": variations == null ? null : List<dynamic>.from(variations!.map((x) => x)),
    "grouped_products": groupedProducts == null ? null : List<dynamic>.from(groupedProducts!.map((x) => x)),
    "menu_order": menuOrder ?? null,
    "meta_data": metaData == null ? null : List<dynamic>.from(metaData!.map((x) => x.toJson())),
    "store": store == null ? null : store!.toJson(),
    "_links": links == null ? null : links!.toJson(),
  };
}

class Attribute {
  Attribute({
    this.id,
    this.slug,
    this.name,
    this.position,
    this.visible,
    this.variation,
    this.options,
  });

  int? id;
  String? slug;
  String? name;
  int? position;
  bool? visible;
  bool? variation;
  List<String>? options;

  factory Attribute.fromJson(Map<String?, dynamic> json) => Attribute(
    id: json["id"] ?? null,
    slug: json["slug"] ?? null,
    name: json["name"] ?? null,
    position: json["position"] ?? null,
    visible: json["visible"] ?? null,
    variation: json["variation"] ?? null,
    options: json["options"] == null ? null : List<String>.from(json["options"].map((x) => x)),
  );

  Map<String?, dynamic> toJson() => {
    "id": id ?? null,
    "slug": slug ?? null,
    "name": name ?? null,
    "position": position ?? null,
    "visible": visible ?? null,
    "variation": variation ?? null,
    "options": options == null ? null : List<dynamic>.from(options!.map((x) => x)),
  };
}

class Category {
  Category({
    this.id,
    this.name,
    this.slug,
  });

  int? id;
  String? name;
  String? slug;

  factory Category.fromJson(Map<String?, dynamic> json) => Category(
    id: json["id"] ?? null,
    name: json["name"] ?? null,
    slug: json["slug"] ?? null,
  );

  Map<String?, dynamic> toJson() => {
    "id": id ?? null,
    "name": name ?? null,
    "slug": slug ?? null,
  };
}

class Dimensions {
  Dimensions({
    this.length,
    this.width,
    this.height,
  });

  String? length;
  String? width;
  String? height;

  factory Dimensions.fromJson(Map<String?, dynamic> json) => Dimensions(
    length: json["length"] ?? null,
    width: json["width"] ?? null,
    height: json["height"] ?? null,
  );

  Map<String?, dynamic> toJson() => {
    "length": length ?? null,
    "width": width ?? null,
    "height": height ?? null,
  };
}

class Download {
  Download({
    this.id,
    this.name,
    this.file,
  });

  String? id;
  String? name;
  String? file;

  factory Download.fromJson(Map<String?, dynamic> json) => Download(
    id: json["id"] ?? null,
    name: json["name"] ?? null,
    file: json["file"] ?? null,
  );

  Map<String?, dynamic> toJson() => {
    "id": id ?? null,
    "name": name ?? null,
    "file": file ?? null,
  };
}

class ImageResponse {
  ImageResponse({
    this.id,
    this.dateCreated,
    this.dateCreatedGmt,
    this.dateModified,
    this.dateModifiedGmt,
    this.src,
    this.name,
    this.alt,
    this.position,
  });

  int? id;
  DateTime? dateCreated;
  DateTime? dateCreatedGmt;
  DateTime? dateModified;
  DateTime? dateModifiedGmt;
  String? src;
  String? name;
  String? alt;
  int? position;

  factory ImageResponse.fromJson(Map<String?, dynamic> json) => ImageResponse(
    id: json["id"] ?? null,
    dateCreated: json["date_created"] == null ? null : DateTime?.parse(json["date_created"]),
    dateCreatedGmt: json["date_created_gmt"] == null ? null : DateTime?.parse(json["date_created_gmt"]),
    dateModified: json["date_modified"] == null ? null : DateTime?.parse(json["date_modified"]),
    dateModifiedGmt: json["date_modified_gmt"] == null ? null : DateTime?.parse(json["date_modified_gmt"]),
    src: json["src"] ?? null,
    name: json["name"] ?? null,
    alt: json["alt"] ?? null,
    position: json["position"] ?? null,
  );

  Map<String?, dynamic> toJson() => {
    "id": id ?? null,
    "date_created": dateCreated == null ? null : dateCreated!.toIso8601String(),
    "date_created_gmt": dateCreatedGmt == null ? null : dateCreatedGmt!.toIso8601String(),
    "date_modified": dateModified == null ? null : dateModified!.toIso8601String(),
    "date_modified_gmt": dateModifiedGmt == null ? null : dateModifiedGmt!.toIso8601String(),
    "src": src ?? null,
    "name": name ?? null,
    "alt": alt ?? null,
    "position": position ?? null,
  };
}

class Links {
  Links({
    this.self,
    this.collection,
  });

  List<Collection>? self;
  List<Collection>? collection;

  factory Links.fromJson(Map<String?, dynamic> json) => Links(
    self: json["self"] == null ? null : List<Collection>.from(json["self"].map((x) => Collection.fromJson(x))),
    collection: json["collection"] == null ? null : List<Collection>.from(json["collection"].map((x) => Collection.fromJson(x))),
  );

  Map<String?, dynamic> toJson() => {
    "self": self == null ? null : List<dynamic>.from(self!.map((x) => x.toJson())),
    "collection": collection == null ? null : List<dynamic>.from(collection!.map((x) => x.toJson())),
  };
}

class Collection {
  Collection({
    this.href,
  });

  String? href;

  factory Collection.fromJson(Map<String?, dynamic> json) => Collection(
    href: json["href"] ?? null,
  );

  Map<String?, dynamic> toJson() => {
    "href": href ?? null,
  };
}

class MetaDatum {
  MetaDatum({
    this.id,
    this.key,
    this.value,
  });

  int? id;
  String? key;
  dynamic value;

  factory MetaDatum.fromJson(Map<String?, dynamic> json) => MetaDatum(
    id: json["id"] ?? null,
    key: json["key"] ?? null,
    value: json["value"],
  );

  Map<String?, dynamic> toJson() => {
    "id": id ?? null,
    "key": key ?? null,
    "value": value,
  };
}

class ValueClass {
  ValueClass({
    this.enableWholesale,
    this.price,
    this.quantity,
  });

  String? enableWholesale;
  String? price;
  dynamic quantity;

  factory ValueClass.fromJson(Map<String?, dynamic> json) => ValueClass(
    enableWholesale: json["enable_wholesale"] ?? null,
    price: json["price"] ?? null,
    quantity: json["quantity"],
  );

  Map<String?, dynamic> toJson() => {
    "enable_wholesale": enableWholesale ?? null,
    "price": price ?? null,
    "quantity": quantity,
  };
}

class Store {
  Store({
    this.id,
    this.name,
    this.url,
    this.avatar,
    this.address,
  });

  int? id;
  String? name;
  String? url;
  String? avatar;
  Address? address;

  factory Store.fromJson(Map<String?, dynamic> json) => Store(
    id: json["id"] ?? null,
    name: json["name"] ?? null,
    url: json["url"] ?? null,
    avatar: json["avatar"] ?? null,
    address: json["address"] == null ? null : Address.fromJson(json["address"]),
  );

  Map<String?, dynamic> toJson() => {
    "id": id ?? null,
    "name": name ?? null,
    "url": url ?? null,
    "avatar": avatar ?? null,
    "address": address == null ? null : address!.toJson(),
  };
}

class Address {
  Address({
     this.street1,
     this.street2,
     this.city,
     this.zip,
     this.country,
     this.state,
  });

  String? street1;
  String? street2;
  String? city;
  String? zip;
  String? country;
  String? state;

  factory Address.fromJson(Map<String?, dynamic> json) => Address(
    street1: json["street_1"] ?? null,
    street2: json["street_2"] ?? null,
    city: json["city"] ?? null,
    zip: json["zip"] ?? null,
    country: json["country"] ?? null,
    state: json["state"] ?? null,
  );

  Map<String?, dynamic> toJson() => {
    "street_1": street1 ?? null,
    "street_2": street2 ?? null,
    "city": city ?? null,
    "zip": zip ?? null,
    "country": country ?? null,
    "state": state ?? null,
  };
}
