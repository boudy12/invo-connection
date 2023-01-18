abstract class ConnectionAppSearchUserStates{}

class ConnectionAppSearchUserInitialStates extends ConnectionAppSearchUserStates{}

class ConnectionAppSearchUserLoadingStates extends ConnectionAppSearchUserStates{}

class ConnectionAppSearchUserSuccessStates extends ConnectionAppSearchUserStates{}

class ConnectionAppSearchUserErrorStates extends ConnectionAppSearchUserStates{

  final String error;
  ConnectionAppSearchUserErrorStates(
      this.error,
      );
}

