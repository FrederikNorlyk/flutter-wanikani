class Reading {
  final String _text;
  late final bool _isPrimary;

  Reading(this._text, { required bool isPrimary }) {
    _isPrimary = isPrimary;
  }

  String get text {
    return _text;
  }

  bool get isPrimary {
    return _isPrimary;
  }
}