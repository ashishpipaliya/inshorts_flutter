import 'data.dart';

/// Represents the top-level response from the InShorts API.
class GlobalResponse {
  /// The container for the actual news data and metadata.
  Data? data;

  /// Indicates if there was an error in the request.
  bool? error;

  /// Message providing additional info about the response or error.
  String? message;

  /// Creates a [GlobalResponse].
  GlobalResponse({this.data, this.error, this.message});

  /// Factory for creating [GlobalResponse] from a JSON map.
  GlobalResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    error = json['error'];
    message = json['message'];
  }

  /// Converts [GlobalResponse] to a JSON map.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['error'] = error;
    data['message'] = message;
    return data;
  }
}
