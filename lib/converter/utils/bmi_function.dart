double calculateBMI(double height, double weight) {
  // Converting to meter since it takes height in centimeter
  double height_in_m = height / 100;

  double bmi = weight / (height_in_m * height_in_m);
  return bmi;
}

String getBMIInfo(double bmi) {
  if (bmi <= 18.5) return 'Underweight';
  if (bmi > 18.5 && bmi <= 25.0) return 'Normal';
  return 'Overweight';
}
