enum FireTodoRequestState {
  initial,
  loading,
  success,
  error;

  bool get isInitial => this == FireTodoRequestState.initial;
  bool get isLoading => this == FireTodoRequestState.loading;
  bool get isSuccess => this == FireTodoRequestState.success;
  bool get isError => this == FireTodoRequestState.error;
}
