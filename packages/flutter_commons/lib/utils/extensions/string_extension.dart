extension StringExtension on String {
  String splitForParts({String separator = '', required int size}) {
    if (size <= 0) return this;
    final parts = <String>[];
    for (var i = 0; i < length; i += size) {
      final part = substring(i, i + size > length ? length : i + size);
      parts.add(part);
    }
    return parts.join(separator);
  }

  String removeEndLine() => replaceAll('\n', '');

  String capitalize({String separator = ' '}) {
    if (isEmpty) return this;
    return split(separator)
        .map(
          (word) =>
              word.isNotEmpty
                  ? word[0].toUpperCase() + word.substring(1).toLowerCase()
                  : '',
        )
        .join(separator);
  }
}

extension StringExtensionNull on String? {
  bool get isNullOrEmpty {
    if (this == null) return true;
    if (this?.isEmpty == true) return true;
    return false;
  }

  bool get isNotNullOrEmpty {
    if (this == null) return false;
    if (this?.isEmpty == true) return false;
    return true;
  }
}
