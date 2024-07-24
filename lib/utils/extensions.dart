extension StringExtensions on String {
  String formatCardNumber() {
    if (isEmpty) return this;
    int spacingInterval = 4;
    List<String> parts = [];
    for (int i = 0; i < length; i += spacingInterval) {
      parts.add(substring(i, i + spacingInterval));
    }
    return parts.join(' ');
  }
}
