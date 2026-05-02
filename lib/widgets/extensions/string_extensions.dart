extension StringExtensions on String {}

extension NullableStringExtensions on String? {
  String ifNullOrEmpty(String s) {
    final self = this;
    if (self == null || self.isEmpty) return s;
    return self;
  }
}
