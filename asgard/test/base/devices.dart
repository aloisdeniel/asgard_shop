import 'package:flutter/widgets.dart';

const neutralTestDevices = <String, MediaQueryData>{
  'small-portrait': MediaQueryData(
    devicePixelRatio: 2.0,
    size: Size(190, 400),
  ),
  'small-landscape': MediaQueryData(
    devicePixelRatio: 2.0,
    size: Size(400, 190),
  ),
  'medium-portrait': MediaQueryData(
    devicePixelRatio: 2.0,
    size: Size(320, 780),
  ),
  'medium-landscape': MediaQueryData(
    devicePixelRatio: 2.0,
    size: Size(780, 320),
  ),
  'large-portrait': MediaQueryData(
    devicePixelRatio: 2.0,
    size: Size(540, 1280),
  ),
  'large-landscape': MediaQueryData(
    devicePixelRatio: 2.0,
    size: Size(1280, 540),
  ),
};

const iOSTestDevices = <String, MediaQueryData>{
  'iPhone13-portrait': MediaQueryData(
    devicePixelRatio: 2.0,
    size: Size(390, 844),
    padding: EdgeInsets.only(
      top: 47.0,
      bottom: 34,
    ),
  ),
  'iPhone13-landscape': MediaQueryData(
    devicePixelRatio: 2.0,
    size: Size(844, 390),
    padding: EdgeInsets.only(
      left: 47.0,
      right: 47.0,
    ),
  ),
};
const testDevices = <String, Map<String, MediaQueryData>>{
  'neutral': neutralTestDevices,
  'ios': iOSTestDevices,
};
