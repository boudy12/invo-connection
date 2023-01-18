abstract class ConnectionAppSearchTasksStates{}

class ConnectionAppSearchTasksInitialStates extends ConnectionAppSearchTasksStates{}

class ConnectionAppSearchTasksLoadingStates extends ConnectionAppSearchTasksStates{}

class ConnectionAppSearchTasksSuccessStates extends ConnectionAppSearchTasksStates{}

class ConnectionAppSearchTasksErrorStates extends ConnectionAppSearchTasksStates{

  final String error;
  ConnectionAppSearchTasksErrorStates(
      this.error,
      );
}

