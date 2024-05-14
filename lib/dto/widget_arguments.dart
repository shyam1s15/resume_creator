class WidgetArguments {
  final String type;
  final String? title;
  final String? imageUrl;
  final Function()? onPressed;

  WidgetArguments({required this.type, required this.title, this.imageUrl, this.onPressed});
}
