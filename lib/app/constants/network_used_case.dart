

enum NetworkUsedCase { loading, error, usernotfound, sucess }

//Api call used case to handle custom messaging
extension NetworkState on NetworkUsedCase {
  int? get keyword {
    switch (this) {
      case NetworkUsedCase.loading:
      return 1;
      case NetworkUsedCase.error:
      return 2;
      case NetworkUsedCase.usernotfound:
      return 3;
      case NetworkUsedCase.sucess:
        return 4;
    }
  }
}
