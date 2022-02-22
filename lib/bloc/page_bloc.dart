import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:sehatdok/models/models.dart';
import 'package:equatable/equatable.dart';

part 'page_event.dart';
part 'page_state.dart';

class PageBloc extends Bloc<PageEvent, PageState> {
  @override
  PageState get initialState => OnInitialPage();

  @override
  Stream<PageState> mapEventToState(
    PageEvent event,
  ) async* {
    if (event is GoToSplashPage) {
      yield OnSplashPage();
    } else if (event is GoToGetStartedPage) {
      yield OnGetStartedPage();
    } else if (event is GoToStartMenu) {
      yield OnStartMenu();
    } else if (event is GoToSignInPage) {
      yield OnSignInPage();
    } else if (event is GoToSignUpPage) {
      yield OnSignUpPage();
    } else if (event is GoToMainPage) {
      yield OnMainPage();
    } else if (event is GoToRegistrationPage) {
      yield OnRegistrationPage(event.registrationData);
    } else if (event is GoToPreferencePage) {
      yield OnPreferencePage(event.registrationData);
    } else if (event is GoToAccountConfirmationPage) {
      yield OnAccountConfirmationPage(event.registrationData);
    } else if (event is GoToMenuPage) {
      yield OnMenuPage();
    } else if (event is GoToDetailPage) {
      yield OnDetailPage();
    } else if (event is GoToSearchPage) {
      yield OnSearchPage();
    } else if (event is GoToEditProfilePage) {
      yield OnEditProfilePage(event.user);
    }
  }
}
