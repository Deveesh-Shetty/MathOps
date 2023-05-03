import 'package:calculator/converter/constants/constants.dart';

double unitConversionValue(String unit) {
  switch (unit) {
    // For Weight Converter
    case 'Pound (lbs)':
      return POUND_TO_KILO;
    case 'Kilogram (kg)':
      return KILO_TO_KILO;
    case 'Gram (g)':
      return GRAM_TO_KILO;
    case 'Tonne (t)':
      return TONNE_TO_KILO;

    // For Volume Conveter

    
    default:
      return -1;
  }
}

String convertUnit(
  double fromValue,
  String fromUnit,
  String toUnit,
  String referenceUnit,
) {
  // If both the units are same
  if (fromUnit == toUnit) {
    return fromValue.toString();
  }

  // Converting the fromValue to Standard Unit to ease the conversion
  double fromUnitInReference = fromValue * unitConversionValue(fromUnit);

  // If the toUnit is Kilogram then return that only
  if (toUnit == referenceUnit) {
    return fromUnitInReference.toString();
  }

  // If it is something other than Kilogram
  // Basically first it gets the conversion value then it divides
  // the conversion value with the fromUnitInReference which is calculated
  // It became easy to convert because the program.
  double toUnitConversionValue =
      fromUnitInReference / unitConversionValue(toUnit);
  return toUnitConversionValue.toString();
}
