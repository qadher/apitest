import 'dart:convert';

RestaurantModel restaurantModelFromJson(String str) =>
    RestaurantModel.fromJson(json.decode(str));

String restaurantModelToJson(RestaurantModel data) =>
    json.encode(data.toJson());

class RestaurantModel {
  String? sts;
  String? msg;
  int? cartcount;
  Shop? shop;
  Category? category;
  List<Products>? products;

  RestaurantModel(
      {this.sts,
      this.msg,
      this.cartcount,
      this.shop,
      this.category,
      this.products});

  RestaurantModel.fromJson(Map<String, dynamic> json) {
    sts = json['sts'];
    msg = json['msg'];
    cartcount = json['cartcount'];
    shop = json['shop'] != null ? new Shop.fromJson(json['shop']) : null;
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sts'] = this.sts;
    data['msg'] = this.msg;
    data['cartcount'] = this.cartcount;
    if (this.shop != null) {
      data['shop'] = this.shop!.toJson();
    }
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Shop {
  int? id;
  String? name;
  String? ownerName;
  String? slugName;
  String? type;
  int? serviceType;
  double? rating;
  String? email;
  String? mobile;
  String? phone;
  String? password;
  String? desc;
  String? notes;
  String? gstNo;
  String? licence;
  String? aadhar;
  int? openTime;
  int? closeTime;
  String? hours;
  String? deliveryTime;
  int? deliveryCharge;
  String? payoutOptions;
  String? verifiedStore;
  String? promoted;
  String? paymentDetails;
  String? address;
  String? pincode;
  String? city;
  int? district;
  int? state;
  int? country;
  int? agentId;
  int? franchiseId;
  int? franchiseCommession;
  int? adminCommession;
  String? status;
  String? hasTax;
  int? taxValue;
  String? logo;
  String? banner;
  String? photo;
  String? sign;
  String? latitude;
  String? longitude;
  String? createdAt;
  String? updatedAt;

  Shop(
      {this.id,
      this.name,
      this.ownerName,
      this.slugName,
      this.type,
      this.serviceType,
      this.rating,
      this.email,
      this.mobile,
      this.phone,
      this.password,
      this.desc,
      this.notes,
      this.gstNo,
      this.licence,
      this.aadhar,
      this.openTime,
      this.closeTime,
      this.hours,
      this.deliveryTime,
      this.deliveryCharge,
      this.payoutOptions,
      this.verifiedStore,
      this.promoted,
      this.paymentDetails,
      this.address,
      this.pincode,
      this.city,
      this.district,
      this.state,
      this.country,
      this.agentId,
      this.franchiseId,
      this.franchiseCommession,
      this.adminCommession,
      this.status,
      this.hasTax,
      this.taxValue,
      this.logo,
      this.banner,
      this.photo,
      this.sign,
      this.latitude,
      this.longitude,
      this.createdAt,
      this.updatedAt});

  Shop.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    ownerName = json['owner_name'];
    slugName = json['slug_name'];
    type = json['type'];
    serviceType = json['service_type'];
    rating = json['rating'];
    email = json['email'];
    mobile = json['mobile'];
    phone = json['phone'];
    password = json['password'];
    desc = json['desc'];
    notes = json['notes'];
    gstNo = json['gst_no'];
    licence = json['licence'];
    aadhar = json['aadhar'];
    openTime = json['open_time'];
    closeTime = json['close_time'];
    hours = json['hours'];
    deliveryTime = json['delivery_time'];
    deliveryCharge = json['delivery_charge'];
    payoutOptions = json['payout_options'];
    verifiedStore = json['verified_store'];
    promoted = json['promoted'];
    paymentDetails = json['payment_details'];
    address = json['address'];
    pincode = json['pincode'];
    city = json['city'];
    district = json['district'];
    state = json['state'];
    country = json['country'];
    agentId = json['agent_id'];
    franchiseId = json['franchise_id'];
    franchiseCommession = json['franchise_commession'];
    adminCommession = json['admin_commession'];
    status = json['status'];
    hasTax = json['has_tax'];
    taxValue = json['tax_value'];
    logo = json['logo'];
    banner = json['banner'];
    photo = json['photo'];
    sign = json['sign'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['owner_name'] = this.ownerName;
    data['slug_name'] = this.slugName;
    data['type'] = this.type;
    data['service_type'] = this.serviceType;
    data['rating'] = this.rating;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['phone'] = this.phone;
    data['password'] = this.password;
    data['desc'] = this.desc;
    data['notes'] = this.notes;
    data['gst_no'] = this.gstNo;
    data['licence'] = this.licence;
    data['aadhar'] = this.aadhar;
    data['open_time'] = this.openTime;
    data['close_time'] = this.closeTime;
    data['hours'] = this.hours;
    data['delivery_time'] = this.deliveryTime;
    data['delivery_charge'] = this.deliveryCharge;
    data['payout_options'] = this.payoutOptions;
    data['verified_store'] = this.verifiedStore;
    data['promoted'] = this.promoted;
    data['payment_details'] = this.paymentDetails;
    data['address'] = this.address;
    data['pincode'] = this.pincode;
    data['city'] = this.city;
    data['district'] = this.district;
    data['state'] = this.state;
    data['country'] = this.country;
    data['agent_id'] = this.agentId;
    data['franchise_id'] = this.franchiseId;
    data['franchise_commession'] = this.franchiseCommession;
    data['admin_commession'] = this.adminCommession;
    data['status'] = this.status;
    data['has_tax'] = this.hasTax;
    data['tax_value'] = this.taxValue;
    data['logo'] = this.logo;
    data['banner'] = this.banner;
    data['photo'] = this.photo;
    data['sign'] = this.sign;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Category {
  String? s4;
  String? s11;
  String? s12;
  String? s18;
  String? s19;

  Category({this.s4, this.s11, this.s12, this.s18, this.s19});

  Category.fromJson(Map<String, dynamic> json) {
    s4 = json['4'];
    s11 = json['11'];
    s12 = json['12'];
    s18 = json['18'];
    s19 = json['19'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['4'] = this.s4;
    data['11'] = this.s11;
    data['12'] = this.s12;
    data['18'] = this.s18;
    data['19'] = this.s19;
    return data;
  }
}

class Products {
  int? id;
  int? catId;
  String? shopType;
  int? shopId;
  String? type;
  String? name;
  int? price;
  int? offerprice;
  String? status;
  String? image;
  String? hasUnits;
  List<Units>? units;

  Products(
      {this.id,
      this.catId,
      this.shopType,
      this.shopId,
      this.type,
      this.name,
      this.price,
      this.offerprice,
      this.status,
      this.image,
      this.hasUnits,
      this.units});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    catId = json['cat_id'];
    shopType = json['shop_type'];
    shopId = json['shop_id'];
    type = json['type'];
    name = json['name'];
    price = json['price'];
    offerprice = json['offerprice'];
    status = json['status'];
    image = json['image'];
    hasUnits = json['has_units'];
    if (json['units'] != null) {
      units = <Units>[];
      json['units'].forEach((v) {
        units!.add(new Units.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['cat_id'] = this.catId;
    data['shop_type'] = this.shopType;
    data['shop_id'] = this.shopId;
    data['type'] = this.type;
    data['name'] = this.name;
    data['price'] = this.price;
    data['offerprice'] = this.offerprice;
    data['status'] = this.status;
    data['image'] = this.image;
    data['has_units'] = this.hasUnits;
    if (this.units != null) {
      data['units'] = this.units!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Units {
  int? id;
  int? productId;
  String? name;
  int? price;
  int? offerprice;
  int? dispOrder;
  String? status;

  Units(
      {this.id,
      this.productId,
      this.name,
      this.price,
      this.offerprice,
      this.dispOrder,
      this.status});

  Units.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    name = json['name'];
    price = json['price'];
    offerprice = json['offerprice'];
    dispOrder = json['disp_order'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['name'] = this.name;
    data['price'] = this.price;
    data['offerprice'] = this.offerprice;
    data['disp_order'] = this.dispOrder;
    data['status'] = this.status;
    return data;
  }
}