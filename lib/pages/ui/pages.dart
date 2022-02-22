import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'dart:math' show Random;

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:random_string/random_string.dart';
import 'package:flutter/gestures.dart';
import 'package:sehatdok/bloc/blocs.dart';
import 'package:sehatdok/pages/ui/berita_kesehatan_page.dart';
import 'package:sehatdok/pages/ui/bmi_page.dart';
import 'package:sehatdok/pages/ui/tips_kesehatan_page.dart';
import 'package:sehatdok/pages/widgets/destination_tile.dart';
import 'package:sehatdok/pages/widgets/facility_item.dart';
import 'package:sehatdok/pages/widgets/guide_tour.dart';
import 'package:sehatdok/pages/widgets/popular_spot.dart';
import 'package:sehatdok/pages/widgets/recommended_tile.dart';
import 'package:sehatdok/pages/widgets/booking_details.dart';
import 'package:sehatdok/shared/shared.dart';
import 'package:sehatdok/services/services.dart';
import 'package:sehatdok/models/models.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flushbar/flushbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ticket_pass_package/ticket_pass.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:syncfusion_flutter_barcodes/barcodes.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:provider/provider.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:path/path.dart';

import 'package:flutter/services.dart';

part 'splash_page.dart';
part 'get_started_page.dart';
part 'sign_in_page.dart';
part 'sign_up_page.dart';
part 'search_page.dart';
part 'booking_page.dart';
part 'account_confirmation_page.dart';
part 'wrapper.dart';
part 'menu_page.dart';
part 'main_page.dart';
part 'edit_profile.dart';
part 'detail_page.dart';
part 'guidetour_page.dart';
part 'success_page.dart';
part 'ticket_page.dart';
part 'webview_page.dart';