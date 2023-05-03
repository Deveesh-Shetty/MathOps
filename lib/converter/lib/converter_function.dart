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

    // For Volume Converter
    case 'Litre (l)':
      return LITRE_TO_LITRE;
    case 'millilitre (ml)':
      return MILILITRE_TO_LITRE;
    case 'cubic meter (m3)':
      return CUBICMETER_TO_LITRE;
    case 'cubic centimeter (cm3)':
      return CUBICCENTIMETER_TO_LITRE;
    case 'gallon (g)':
      return GALLON_TO_LITRE;

    // For Memory Converter
    case 'PetaByte (PB)':
      return PB_TO_MB;
    case 'TeraByte (TB)':
      return TB_TO_MB;
    case 'GigaByte (GB)':
      return GB_TO_MB;
    case 'MegaByte (MB)':
      return MB_TO_MB;
    case 'KiloByte (KB)':
      return KB_TO_MB;
    case 'Byte (B)':
      return BYTE_TO_MB;
    case 'Nibble (n)':
      return NIBBLE_TO_MB;
    case 'Bit (b)':
      return BIT_TO_MB;

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
  double fromUnitValueInReferenceUnit =
      fromValue * unitConversionValue(fromUnit);

  // If the toUnit is the referenceUnit then return that only
  if (toUnit == referenceUnit) {
    return fromUnitValueInReferenceUnit.toString();
  }

  // If it is something other than referenceUnit:
  // First get the conversion value, then divde
  // the conversion value from fromUnitValueInReferenceUnit and return it.
  double toUnitConversionValue =
      fromUnitValueInReferenceUnit / unitConversionValue(toUnit);
  return toUnitConversionValue.toString();
}
