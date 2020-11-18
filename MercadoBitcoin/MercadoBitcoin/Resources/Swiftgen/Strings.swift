// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name
internal enum Strings {

  internal enum Alert {
    internal enum Error {
      /// Ok!
      internal static let action = Strings.tr("Localizable", "alert.error.action")
      /// Check your internet connection.
      internal static let networkDescription = Strings.tr("Localizable", "alert.error.networkDescription")
      /// Try again.
      internal static let othersDescription = Strings.tr("Localizable", "alert.error.othersDescription")
      /// Error has occurred!
      internal static let title = Strings.tr("Localizable", "alert.error.title")
    }
  }

  internal enum CoinDetail {
    /// Detail
    internal static let navigationTitle = Strings.tr("Localizable", "coinDetail.navigationTitle")
    internal enum Title {
      /// Final Date:
      internal static let endDate = Strings.tr("Localizable", "coinDetail.title.endDate")
      /// ID:
      internal static let id = Strings.tr("Localizable", "coinDetail.title.id")
      /// Name:
      internal static let name = Strings.tr("Localizable", "coinDetail.title.name")
      /// Inicial Date:
      internal static let startDate = Strings.tr("Localizable", "coinDetail.title.startDate")
      /// Volume at day:
      internal static let volumeDay = Strings.tr("Localizable", "coinDetail.title.volumeDay")
      /// Volume at hour:
      internal static let volumeHour = Strings.tr("Localizable", "coinDetail.title.volumeHour")
      /// Volume at month:
      internal static let volumeMonth = Strings.tr("Localizable", "coinDetail.title.volumeMonth")
    }
  }

  internal enum CoinList {
    /// Overview
    internal static let navigationTitle = Strings.tr("Localizable", "coinList.navigationTitle")
    internal enum Cell {
      /// Show detail
      internal static let showDetail = Strings.tr("Localizable", "coinList.cell.showDetail")
    }
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name

// MARK: - Implementation Details

extension Strings {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    Bundle(for: BundleToken.self)
  }()
}
// swiftlint:enable convenience_type
