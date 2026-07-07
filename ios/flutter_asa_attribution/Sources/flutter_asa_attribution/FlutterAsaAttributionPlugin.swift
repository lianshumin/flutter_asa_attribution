import Flutter

public class FlutterAsaAttributionPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(
      name: "lianshumin.github.io/flutter_asa_attribution",
      binaryMessenger: registrar.messenger()
    )
    let instance = FlutterAsaAttributionPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "requestAttributionDetails":
      AsaTool.requestAttribution { data, error in
        if let data = data {
          result(data)
        } else {
          let nsError = error as NSError?
          result(
            FlutterError(
              code: "FAILED",
              message: nsError?.localizedFailureReason ?? nsError?.localizedDescription,
              details: nil
            )
          )
        }
      }
    case "attributionToken":
      result(AsaTool.attributionToken())
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
