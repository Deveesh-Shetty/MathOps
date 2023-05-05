import 'package:calculator/converter/utils/constants.dart';

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

    // For Length Converter
    case 'Astronomical Unit (AU)':
      return ASTRONOMICALUNIT_TO_M;
    case 'Light Year (ly)':
      return LIGHTYEAR_TO_M;
    case 'Parsec (pc)':
      return PARSEC_TO_M;
    case 'Mile (mi)':
      return MILE_TO_M;
    case 'Kilometer (km)':
      return KM_TO_M;
    case 'Meter (m)':
      return M_TO_M;
    case 'Centimeter (cm)':
      return CENTIMETER_TO_M;
    case 'Millimeter (mm)':
      return MILLIMETER_TO_M;
    case 'Micrometer (μm)':
      return MICROMETER_TO_M;
    case 'Nanometer (nm)':
      return NANOMETER_TO_M;
    case 'Angstorm (Å)':
      return ANGSTORM_TO_M;
    case 'Picometer (pm)':
      return PICOMETER_TO_M;
    case 'Yard (yd)':
      return YARD_TO_M;
    case 'Foot (ft)':
      return FOOT_TO_M;
    case 'Inch (in)':
      return INCH_TO_M;

    // For Temperature Converter
    case 'Celsius (°C)':
      return CELSIUS_TO_CELSIUS;
    case 'Fahrenheit (°F)':
      return FAHRENHEIT_TO_CELSIUS;
    case 'Kelvin (K)':
      return KELVIN_TO_CELSIUS;

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
