import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

const kPrimaryColor = Color(0xff100B20);
const kTranstionDuration = Duration(milliseconds: 250);
const kGtSectraFine = 'GT Sectra Fine';
const kFeaturedBox = 'featured_books';
const kNewestBox = 'newest_books';

String get kApiKey => dotenv.env['GOOGLE_BOOKS_API_KEY'] ?? '';
