class Validation {
  static String? validateEmptyText(String? field, String? value) {
    if (value == null || value.isEmpty) {
      return '$field tidak boleh kosong.';
    }
    return null;
  }
}
