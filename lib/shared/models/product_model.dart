class ProductModel {
  final String title;
  final String subtitle;
  final bool status;
  final String price;
  final String sales;
  final String salesSummary;
  final String views;
  final String likes;

  ProductModel(this.title, this.subtitle, this.status, this.price, this.sales,
      this.salesSummary, this.views, this.likes);
}

class ProductSummaryModel {
  final String week;
  final String total;
  final String views;
  final String likes;
  final String comments;

  ProductSummaryModel(
      this.week, this.total, this.views, this.likes, this.comments);
}
