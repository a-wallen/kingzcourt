import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kingzcourt/classes/colors.dart';
import 'package:kingzcourt/pages/playerlibrary.dart';
import 'package:kingzcourt/utility/theme.dart';
import 'package:kingzcourt/widgets/drawer.dart';
import '../database/databaseHelper.dart';
import '../classes/player.dart';

class PlayerIcon extends StatefulWidget {
  Player player;
  CircleBorder border = CircleBorder();

