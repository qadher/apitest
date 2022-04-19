import 'dart:convert';

Cart restaurantModelFromJson(String str) =>
    Cart.fromJson(json.decode(str));

String restaurantModelToJson(Cart data) =>
    json.encode(data.toJson());

class Cart {
  String? sts;
  String? msg;
  List<Null>? cart;
  int? deliveryCharge;
  int? hasTax;
  int? taxValue;

  Cart(
      {this.sts,
      this.msg,
      this.cart,
      this.deliveryCharge,
      this.hasTax,
      this.taxValue});

  Cart.fromJson(Map<String, dynamic> json) {
    sts = json['sts'];
    msg = json['msg'];
    cart = <Null>[];
    // if (json['cart'] != null) {
    //   cart = <Null>[];
    //   json['cart'].forEach((v) {
    //     cart!.add(new Null.fromJson(v));
    //   });
    // }
    deliveryCharge = json['delivery_charge'];
    hasTax = json['has_tax'];
    taxValue = json['tax_value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sts'] = this.sts;
    data['msg'] = this.msg;
    data['cart'] = this.cart;
    // if (this.cart != null) {
    //   data['cart'] = this.cart!.map((v) => v.toJson()).toList();
    // }
    data['delivery_charge'] = this.deliveryCharge;
    data['has_tax'] = this.hasTax;
    data['tax_value'] = this.taxValue;
    return data;
  }
}
