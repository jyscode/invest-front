
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const ACCESS_TOKEN_KEY = 'ACCESS_TOKEN';
const LOGIN_ACCESS_KEY = 'LOGIN_ACCESS';
const LOGIN_REFRESH_KEY = 'LOGIN_REFRESH';
const EXPIRE_DATE = 'EXPIRE_DATE';
const TR_ID = 'FHKST01010100';
const TR_DAY = 'FHKST01010400';
const TR_ACCOUNT = 'TTTC8434R';
const TR_ASK = 'FHKST01010200';

final secureStorageProvider = Provider((ref) => FlutterSecureStorage());