class ProfileModel {
  int? id;
  String? name;
  String? email;
  String? contact;
  String? image;
  BillingAddress? billingAddress;

  ProfileModel(
      {this.id,
      this.name,
      this.email,
      this.contact,
      this.image,
      this.billingAddress});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    contact = json['contact'];
    image = json['image'];
    billingAddress = json['billing_address'] != null
        ? new BillingAddress.fromJson(json['billing_address'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['contact'] = this.contact;
    data['image'] = this.image;
    if (this.billingAddress != null) {
      data['billing_address'] = this.billingAddress!.toJson();
    }
    return data;
  }
}

class BillingAddress {
  String? contact;
  String? area;
  String? appartment;
  String? house;
  String? road;
  String? city;
  String? district;
  String? zipCode;

  BillingAddress(
      {this.contact,
      this.area,
      this.appartment,
      this.house,
      this.road,
      this.city,
      this.district,
      this.zipCode});

  BillingAddress.fromJson(Map<String, dynamic> json) {
    contact = json['contact'];
    area = json['area'];
    appartment = json['appartment'];
    house = json['house'];
    road = json['road'];
    city = json['city'];
    district = json['district'];
    zipCode = json['zip_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['contact'] = this.contact;
    data['area'] = this.area;
    data['appartment'] = this.appartment;
    data['house'] = this.house;
    data['road'] = this.road;
    data['city'] = this.city;
    data['district'] = this.district;
    data['zip_code'] = this.zipCode;
    return data;
  }
}
