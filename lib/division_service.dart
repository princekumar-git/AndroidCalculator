/// A service class to handle the division operation.
class DivisionService {
  /// Divides two numbers and returns the result as a string,
  /// handling potential division by zero errors.
  static String divide(double a, double b) {
    if (b == 0) {
      return "Error: Div by zero";
    }
    return (a / b).toStringAsFixed(2);
  }
}