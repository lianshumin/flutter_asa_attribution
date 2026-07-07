import AdServices
import Foundation

enum AsaTool {
  static func attributionToken() -> String? {
    guard #available(iOS 14.3, *) else {
      NSLog("[FlutterAsaAttribution]: Only support iOS 14.3 and later")
      return nil
    }

    do {
      return try AAAttribution.attributionToken()
    } catch {
      NSLog("[FlutterAsaAttribution]: Failed to retrieve attribution token: %@", error.localizedDescription)
      return nil
    }
  }

  static func requestAttribution(completion: @escaping ([String: Any]?, Error?) -> Void) {
    guard #available(iOS 14.3, *) else {
      completion(nil, attributionError("Only support iOS 14.3 and later"))
      return
    }

    guard let token = attributionToken(), !token.isEmpty else {
      completion(nil, attributionError("Failed to retrieve attribution token"))
      return
    }

    requestAttribution(token: token, completion: completion)
  }

  private static func requestAttribution(
    token: String,
    completion: @escaping ([String: Any]?, Error?) -> Void
  ) {
    guard let url = URL(string: "https://api-adservices.apple.com/api/v1/") else {
      completion(nil, attributionError("Invalid attribution URL"))
      return
    }

    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.addValue("text/plain", forHTTPHeaderField: "Content-Type")
    request.httpBody = token.data(using: .utf8)

    URLSession.shared.dataTask(with: request) { data, _, error in
      if let error = error {
        DispatchQueue.main.async {
          completion(nil, error)
        }
        return
      }

      var result: [String: Any]?
      if let data = data {
        result = try? JSONSerialization.jsonObject(with: data) as? [String: Any]
      }

      DispatchQueue.main.async {
        completion(result ?? [:], nil)
      }
    }.resume()
  }

  private static func attributionError(_ message: String) -> NSError {
    NSError(domain: "app", code: -1, userInfo: [NSLocalizedDescriptionKey: message])
  }
}
