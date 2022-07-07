enum AuthenticationStatus {
  unknown,
  authenticated,
  unauthenticated,
}

enum SnackBarType {
  info,
  success,
  error,
  warning,
}

enum DataStatus {
  loading,
  success,
  error,
  empty,
}

enum ScreenType {
  small,
  middle,
  big,
}

enum AccountStatus {
  active,
  disable,
}

enum Level {
  staff,
  lead,
  head
}

/// Useful extensions on [DataStatus]
extension FormzSubmissionStatusX on DataStatus {
  /// Indicates whether the form is in the process of being submitted.
  bool get isLoading => this == DataStatus.loading;

  /// Indicates whether the form has been submitted successfully.
  bool get isSuccess => this == DataStatus.success;

  /// Indicates whether the form submission failed.
  bool get isError => this == DataStatus.error;

  /// Indicates whether the form submission has been canceled.
  bool get isEmpty => this == DataStatus.empty;
}
