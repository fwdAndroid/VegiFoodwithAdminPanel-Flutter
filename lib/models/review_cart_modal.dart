class ReviewCartModel {
  String cartName;
  String cartImage;
  String cartId;
  int cartPrice;
  int cartQuantity;
  ReviewCartModel(
      {required this.cartId,
      required this.cartName,
      required this.cartImage,
      required this.cartPrice,
      required this.cartQuantity});
}
