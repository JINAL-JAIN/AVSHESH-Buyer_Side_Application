class Product{
  String phone;
  String email;
  String stubble;
  String quantity;
  String price;
  String location;
  Product(this.phone, this.email, this.stubble, this.quantity,this.price,this.location);
  @override
  String toString() {
    return '{ ${this.phone}, ${this.email}, ${this.stubble}, ${this.quantity}, ${this.price}, ${this.location} }';
  }
}