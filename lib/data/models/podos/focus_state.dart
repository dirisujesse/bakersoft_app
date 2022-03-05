class FocusState {
  bool? hasText;
  bool? isFocused;
  bool? hasError;

  FocusState({this.hasText = false, this.isFocused = false, this.hasError = false,});

  bool operator ==(other) {
    return (other is FocusState) && (other.isFocused == isFocused && other.hasText == hasText && other.hasError == hasError);
  }

  @override
  int get hashCode => super.hashCode;

}
