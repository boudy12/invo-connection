

abstract class ConnectionAppRegisterStates{}

class ConnectionAppRegisterInitialState extends ConnectionAppRegisterStates{}

class ConnectionAppRegisterLoadingState extends ConnectionAppRegisterStates{}

class ConnectionAppRegisterSuccessState extends ConnectionAppRegisterStates{

  // final ConnectionAppUseLoginModel eCommerceAppUseLoginModel;
  //
  // ConnectionAppRegisterSuccessState(this.eCommerceAppUseLoginModel);
}

class ConnectionAppRegisterErrorState extends ConnectionAppRegisterStates{
  final String error;
  ConnectionAppRegisterErrorState(this.error);
}



class ConnectionAppLoginShowPasswordRegisterState extends ConnectionAppRegisterStates{}

class ConnectionAppLoginShowPasswordConfirmState extends ConnectionAppRegisterStates{}
