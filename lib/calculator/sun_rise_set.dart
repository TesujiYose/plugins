import 'dart:math';
import 'package:intl/intl.dart';
import '../main.dart';

void ss(List<String> arguments) {
  print('H${run()}!');
  print(convertTimeToDouble());
}

double convertTimeToDouble() {
  DateTime now = DateTime.now();
  return (now.hour * 60 + now.minute) / 1440;
}

List<dynamic> run() {
  List<dynamic> result = [];

  int year = 2021;
  int month = 11;
  int day = 3;
  int hour = 0;
  int minutes = 0;
  int seconds = 0;

  double colB3 = 48.620611484417076;
  double colB4 = 22.2884384049098;
  double colB5 = 2;
  //hh:mm:ss to
  double colE = 0;

  double colF = dateToJulian(year, month, day, hour, minutes, seconds);
  print('colF: $colF');
  double colG = (colF - 2451545) / 36525;
  print('colG: $colG');
  double colI = (280.46646 + colG * (36000.76983 + colG * 0.0003032)) % 360;

  print('colI: $colI');
  double colJ = 357.52911 + colG * (35999.05029 - 0.0001537 * colG);
  print('colJ: $colJ');
  double colK = 0.016708634 - colG * (0.000042037 + 0.0000001267 * colG);
  print('colK: $colK');
  double colL = sin(degreeToRadian(colJ)) *
          (1.914602 - colG * (0.004817 + 0.000014 * colG)) +
      sin(degreeToRadian(2 * colJ)) * (0.019993 - 0.000101 * colG) +
      sin(degreeToRadian(3 * colJ)) * 0.000289;
  print('colL: $colL');
  double colM = colI + colL;
  print('colM: $colM');
  double colN = colJ + colL;
  print('colN: $colN');
  double colO = (1.000001018 * (1 - colK * colK)) /
      (1 + colK * cos(degreeToRadian(colN)));
  print('colO: $colO');
  double colP =
      colM - 0.00569 - 0.00478 * sin(degreeToRadian(125.04 - 1934.136 * colG));
  print('colP: $colP');

  double colQ = 23 +
      (26 +
              ((21.448 -
                      colG * (46.815 + colG * (0.00059 - colG * 0.001813)))) /
                  60) /
          60;
  print('colQ: $colQ ');

  double colR = colQ + 0.00256 * cos(degreeToRadian(125.04 - 1934.136 * colG));
  print('colR: $colR');
  //TODO: FIX colS
  double colS = radianToDegree(atan2(cos(degreeToRadian(colP)),
      (cos(degreeToRadian(colR)) * sin(degreeToRadian(colP)))));
  print('colS: $colS');

  double colT = radianToDegree(
      asin(sin(degreeToRadian(colR)) * sin(degreeToRadian(colP))));
  print('colT: $colT');

  double colU = tan(degreeToRadian(colR / 2)) * tan(degreeToRadian(colR / 2));
  print('colU: $colU');

  double colV = 4 *
      radianToDegree(colU * sin(2 * degreeToRadian(colI)) -
          2 * colK * sin(degreeToRadian(colJ)) +
          4 *
              colK *
              colU *
              sin(degreeToRadian(colJ)) *
              cos(2 * degreeToRadian(colI)) -
          0.5 * colU * colU * sin(4 * degreeToRadian(colI)) -
          1.25 * colK * colK * sin(2 * degreeToRadian(colJ)));
  print('colV: $colV');

  double colW = radianToDegree(acos(cos(degreeToRadian(90.833)) /
          (cos(degreeToRadian(colB3)) * cos(degreeToRadian(colT))) -
      tan(degreeToRadian(colB3)) * tan(degreeToRadian(colT))));
  print('colW: $colW');

  double colX = (720 - 4 * colB4 - colV + colB5 * 60) / 1440;
  String str_colX = formatDate(colX);
  print('colX: $str_colX');

  double colY = colX - colW * 4 / 1440;
  String str_colY = formatDate(colY);
  result.add(str_colY);
  print('colY: $str_colY');

  double colZ = colX + colW * 4 / 1440;
  String str_colZ = formatDate(colZ);
  result.add(str_colZ);
  print('colZ: $str_colZ');

  double colAA = 8 * colW;
  String str_colAA = '$colAA';
  result.add(str_colAA);
  print('colAA: $colAA');

  double colAB = (colE * 1440 + colV + 4 * colB4 - 60 * colB5) % 1440;
  print('colAB: $colAB');

  double colAC = (colAB / 4 < 0) ? (colAB / 4 + 180) : colAB / 4 - 180;
  print('colAC: $colAC');

  double colAD = radianToDegree(acos(sin(
      degreeToRadian(colB3) * sin(degreeToRadian(colT)) +
          cos(degreeToRadian(colB3)) *
              cos(degreeToRadian(colT)) *
              cos(degreeToRadian(colAC)))));

  print('colAD: $colAD');

  double colAE = 90 - colAD;
  print('colAE: $colAE');

  double colAF = (colAE > 85
          ? 0
          : colAE > 5
              ? (58.1 / tan(degreeToRadian(colAE)) -
                  0.07 / pow(tan(degreeToRadian(colAE)), 3) +
                  0.000086 / pow(tan(degreeToRadian(colAE)), 5))
              : (colAE > -0.575
                  ? 1735 +
                      colAE *
                          (-518.2 +
                              colAE *
                                  (103.4 + colAE * (-12.79 + colAE * 0.711)))
                  : -20.772 / tan(degreeToRadian(colAE)))) /
      3600;
  print('colAF: $colAF');

  double colAG = colAE + colAF;
  print('colAG: $colAG');

  double colAH = colAC > 0
      ? (radianToDegree(acos(
              ((sin(degreeToRadian(colB3)) * cos(degreeToRadian(colAD))) -
                      sin(degreeToRadian(colT))) /
                  (cos(degreeToRadian(colB3)) * sin(degreeToRadian(colAD))))) +
          180 % 360)
      : (540 -
          radianToDegree(acos(((sin(degreeToRadian(colB3)) *
                          cos(degreeToRadian(colAD))) -
                      sin(degreeToRadian(colT))) /
                  (cos(degreeToRadian(colB3)) * sin(degreeToRadian(colAD))))) %
              360);
  print('colAH: $colAH');

  return result;
}

double dateToJulian(
    int year, int month, int day, int hour, int minutes, int seconds) {
  final julianEpoch = DateTime.utc(-4713, 11, 24, 12, 0, 0);
  double julianDay(DateTime date) =>
      date.difference(julianEpoch).inSeconds / Duration.secondsPerDay;

  return julianDay(DateTime.utc(year, month, day, hour, minutes, seconds));
}

double degreeToRadian(double degree) {
  return degree * pi / 180;
}

double radianToDegree(double radian) {
  return radian * 180 / pi;
}

const gsDateBase = 2209161600 / 86400;
const gsDateFactor = 86400000;

double dateToGsheets(DateTime dateTime, {bool localTime = true}) {
  final offset = dateTime.millisecondsSinceEpoch / gsDateFactor;
  final shift = localTime ? dateTime.timeZoneOffset.inHours / 24 : 0;
  return gsDateBase + offset + shift;
}

DateTime dateFromGsheets(String value, {bool localTime = true}) {
  final date = double.tryParse(value);
  if (date == null) return DateTime(0);
  final millis = (date - gsDateBase) * gsDateFactor;
  return DateTime.fromMillisecondsSinceEpoch(millis.toInt(), isUtc: localTime);
}

String formatDate(double colX) {
  final DateFormat formatter = DateFormat('HH:m:s');
  final String formatted = formatter.format(dateFromGsheets(colX.toString()));
  return formatted;
}
