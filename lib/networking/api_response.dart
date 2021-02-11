class ApiResponse<T> {
  Status status;

  T data;

  String message;

  ApiResponse.loading(this.message) : status = Status.LOADING;

  ApiResponse.loadingrefresh(this.message) : status = Status.LOADINGREFRESH;

  ApiResponse.completed(this.data) : status = Status.COMPLETED;

  ApiResponse.error(this.message) : status = Status.ERROR;

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }
}

enum Status { LOADING, LOADINGREFRESH, COMPLETED, ERROR }
