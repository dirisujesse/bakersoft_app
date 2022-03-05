class SelectionData<T> {
  final T selection;
  final String label;

  const SelectionData({required this.selection, required this.label});

  bool operator ==(other) {
    return other is SelectionData && label == other.label;
  }

  @override
  int get hashCode => super.hashCode;

}
