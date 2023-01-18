


abstract class ConnectionAppLoginStates{}

class ConnectionAppLoginInitialState extends ConnectionAppLoginStates{}

class ConnectionAppLoginLoadingState extends ConnectionAppLoginStates{}

class ConnectionAppLoginSuccessState extends ConnectionAppLoginStates{

  // final ConnectionAppUseLoginModel eCommerceAppUseLoginModel;
  //
  // ConnectionAppLoginSuccessState(this.eCommerceAppUseLoginModel);
}

class ConnectionAppLoginErrorState extends ConnectionAppLoginStates{
  final String error;
  ConnectionAppLoginErrorState(this.error);
}

class ConnectionAppLoginShowPasswordLoginState extends ConnectionAppLoginStates{}
