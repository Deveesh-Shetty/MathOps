// For Weight Converter

// const double KILO_TO_GRAM = 1000;
// const double KILO_TO_POUND = 2.20462262;
// const double KILO_TO_TONNE = 0.001;
const double GRAM_TO_KILO = 0.001;
const double POUND_TO_KILO = 0.45359237;
const double TONNE_TO_KILO = 1000;
const double KILO_TO_KILO = 1;

// For Volume Converter
const double MILILITRE_TO_LITRE = 0.001;
const double GALLON_TO_LITRE = 3.7854;
const double CUBICMETER_TO_LITRE = 1000;
const double CUBICCENTIMETER_TO_LITRE = 0.001;
const double LITRE_TO_LITRE = 1;

// For Memory Converter
// difference between MB-GB, GB-TB,....
const double DIFFERENCE = 1024;
// const double DIFFERENCE = 1000;

// In decimal its 1000 but in binary it is 1024
// This program is taking the binary value
// refer this for more info https://cseducators.stackexchange.com/questions/4425/should-i-teach-that-1-kb-1024-bytes-or-1000-bytes

const double KB_TO_MB = 1 / DIFFERENCE;
const double BYTE_TO_MB = KB_TO_MB / DIFFERENCE;
const double BIT_TO_MB = BYTE_TO_MB / 8;
const double NIBBLE_TO_MB = BYTE_TO_MB / 2;
const double MB_TO_MB = 1;
const double GB_TO_MB = DIFFERENCE;
const double TB_TO_MB = GB_TO_MB * DIFFERENCE;
const double PB_TO_MB = TB_TO_MB * DIFFERENCE;

// For Length Converter

const double LIGHTYEAR_TO_M = 9460730472580800;
const double ASTRONOMICALUNIT_TO_M = 149597870700;
// Parsec should be 30856775814913670 but dart is giving error on that
// but not on the current value which is +2 more than that -_-
const double PARSEC_TO_M = 30856775814913672;
const double MILE_TO_M = 1609.344;
const double KM_TO_M = 1000;
const double M_TO_M = 1;
const double CENTIMETER_TO_M = 0.01;
const double MILLIMETER_TO_M = 0.001;
const double MICROMETER_TO_M = MILLIMETER_TO_M / 1000;
const double NANOMETER_TO_M = MICROMETER_TO_M / 1000;
const double ANGSTORM_TO_M = NANOMETER_TO_M / 10;
const double PICOMETER_TO_M = NANOMETER_TO_M / 1000;
const double YARD_TO_M = 0.9144;
const double FOOT_TO_M = 0.3048;
const double INCH_TO_M = 0.0254;

// For Temperature Converter
const double CELSIUS_TO_CELSIUS = 1;
const double FAHRENHEIT_TO_CELSIUS = 1;
const double KELVIN_TO_CELSIUS = -273.15;
