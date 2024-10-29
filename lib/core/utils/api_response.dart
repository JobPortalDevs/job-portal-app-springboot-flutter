class ApiResponse<T> {
  final bool success; // Indicates whether the request was successful
  final String message; // Message associated with the response (success or failure)
  final T? data; // Data returned from the API (nullable)

  ApiResponse({
    required this.success,
    required this.message,
    this.data,
  });

  // Factory method to create an ApiResponse from JSON
  factory ApiResponse.fromJson(Map<String, dynamic> json, T Function(dynamic) create) {
    return ApiResponse<T>(
      success: json['success'],
      message: json['message'],
      data: json['data'] != null ? create(json['data']) : null,
    );
  }

  // Convert ApiResponse to JSON (useful for sending API responses)
  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'data': data,
    };
  }
}
