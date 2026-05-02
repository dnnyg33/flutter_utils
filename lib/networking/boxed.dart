//useful for nullable properties that get used in a `copyWith` method
class Boxed<T> {
  final T value;
  const Boxed.value(this.value);
}
