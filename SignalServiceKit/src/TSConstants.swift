//
// Copyright 2019 Signal Messenger, LLC
// SPDX-License-Identifier: AGPL-3.0-only
//

// MARK: -

@objc
public class TSConstants: NSObject {

    private enum Environment {
        case production, staging
    }
    private static var environment: Environment {
        // You can set "USE_STAGING=1" in your Xcode Scheme. This allows you to
        // prepare a series of commits without accidentally committing the change
        // to the environment.
        #if DEBUG
        if ProcessInfo.processInfo.environment["USE_STAGING"] == "1" {
            return .staging
        }
        #endif

        // If you do want to make a build that will always connect to staging,
        // change this value. (Scheme environment variables are only set when
        // launching via Xcode, so this approach is still quite useful.)
        return .production
    }

    @objc
    public static var isUsingProductionService: Bool {
        return environment == .production
    }

    // Never instantiate this class.
    private override init() {}

    public static let legalTermsUrl = URL(string: "https://signal.org/legal/")!
    public static let donateUrl = URL(string: "https://signal.org/donate/")!
    public static var appStoreUpdateURL = URL(string: "https://itunes.apple.com/us/app/signal-private-messenger/id874139669?mt=8")!

    @objc
    public static var mainServiceWebSocketAPI_identified: String { shared.mainServiceWebSocketAPI_identified }
    @objc
    public static var mainServiceWebSocketAPI_unidentified: String { shared.mainServiceWebSocketAPI_unidentified }
    @objc
    public static var mainServiceURL: String { shared.mainServiceURL }
    @objc
    public static var textSecureCDN0ServerURL: String { shared.textSecureCDN0ServerURL }
    @objc
    public static var textSecureCDN2ServerURL: String { shared.textSecureCDN2ServerURL }
    @objc
    public static var contactDiscoverySGXURL: String { shared.contactDiscoverySGXURL }
    @objc
    public static var contactDiscoveryV2URL: String { shared.contactDiscoveryV2URL }
    @objc
    public static var keyBackupURL: String { shared.keyBackupURL }
    @objc
    public static var storageServiceURL: String { shared.storageServiceURL }
    @objc
    public static var sfuURL: String { shared.sfuURL }
    @objc
    public static var sfuTestURL: String { shared.sfuTestURL }
    @objc
    public static var registrationCaptchaURL: String { shared.registrationCaptchaURL }
    @objc
    public static var challengeCaptchaURL: String { shared.challengeCaptchaURL }
    @objc
    public static var kUDTrustRoot: String { shared.kUDTrustRoot }
    @objc
    public static var updatesURL: String { shared.updatesURL }
    @objc
    public static var updates2URL: String { shared.updates2URL }

    @objc
    public static var censorshipReflectorHost: String { shared.censorshipReflectorHost }

    @objc
    public static var serviceCensorshipPrefix: String { shared.serviceCensorshipPrefix }
    @objc
    public static var cdn0CensorshipPrefix: String { shared.cdn0CensorshipPrefix }
    @objc
    public static var cdn2CensorshipPrefix: String { shared.cdn2CensorshipPrefix }
    @objc
    public static var contactDiscoveryCensorshipPrefix: String { shared.contactDiscoveryCensorshipPrefix }
    @objc
    public static var keyBackupCensorshipPrefix: String { shared.keyBackupCensorshipPrefix }
    @objc
    public static var storageServiceCensorshipPrefix: String { shared.storageServiceCensorshipPrefix }

    @objc
    public static var contactDiscoveryEnclaveName: String { shared.contactDiscoveryMrEnclave.stringValue }
    public static var contactDiscoveryMrEnclave: MrEnclave { shared.contactDiscoveryMrEnclave }
    static var contactDiscoveryV2MrEnclave: MrEnclave { shared.contactDiscoveryV2MrEnclave }

    static var keyBackupEnclave: KeyBackupEnclave { shared.keyBackupEnclave }
    static var keyBackupPreviousEnclaves: [KeyBackupEnclave] { shared.keyBackupPreviousEnclaves }

    @objc
    public static var applicationGroup: String { shared.applicationGroup }

    @objc
    public static var serverPublicParamsBase64: String { shared.serverPublicParamsBase64 }

    private static var shared: TSConstantsProtocol {
        switch environment {
        case .production:
            return TSConstantsProduction()
        case .staging:
            return TSConstantsStaging()
        }
    }
}

// MARK: -

private protocol TSConstantsProtocol: AnyObject {
    var mainServiceWebSocketAPI_identified: String { get }
    var mainServiceWebSocketAPI_unidentified: String { get }
    var mainServiceURL: String { get }
    var textSecureCDN0ServerURL: String { get }
    var textSecureCDN2ServerURL: String { get }
    var contactDiscoverySGXURL: String { get }
    var contactDiscoveryV2URL: String { get }
    var keyBackupURL: String { get }
    var storageServiceURL: String { get }
    var sfuURL: String { get }
    var sfuTestURL: String { get }
    var registrationCaptchaURL: String { get }
    var challengeCaptchaURL: String { get }
    var kUDTrustRoot: String { get }
    var updatesURL: String { get }
    var updates2URL: String { get }

    var censorshipReflectorHost: String { get }

    var serviceCensorshipPrefix: String { get }
    var cdn0CensorshipPrefix: String { get }
    var cdn2CensorshipPrefix: String { get }
    var contactDiscoveryCensorshipPrefix: String { get }
    var keyBackupCensorshipPrefix: String { get }
    var storageServiceCensorshipPrefix: String { get }

    // SGX Backed Contact Discovery
    var contactDiscoveryMrEnclave: MrEnclave { get }
    var contactDiscoveryV2MrEnclave: MrEnclave { get }

    var keyBackupEnclave: KeyBackupEnclave { get }
    var keyBackupPreviousEnclaves: [KeyBackupEnclave] { get }

    var applicationGroup: String { get }

    var serverPublicParamsBase64: String { get }
}

public struct KeyBackupEnclave: Equatable {
    let name: String
    let mrenclave: MrEnclave
    let serviceId: String
}

public struct MrEnclave: Equatable {
    public let dataValue: Data
    public let stringValue: String

    init(_ stringValue: StaticString) {
        self.stringValue = stringValue.withUTF8Buffer { String(decoding: $0, as: UTF8.self) }
        // This is a constant -- it should never fail to parse.
        self.dataValue = Data.data(fromHex: self.stringValue)!
        // All of our MrEnclave values are currently 32 bytes.
        owsAssert(self.dataValue.count == 32)
    }

    public static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.dataValue == rhs.dataValue
    }
}

// MARK: - Production

private class TSConstantsProduction: TSConstantsProtocol {

    public let mainServiceWebSocketAPI_identified = "wss://chat.linkmessenger.me/v1/websocket/"
    public let mainServiceWebSocketAPI_unidentified = "wss://chat.linkmessenger.me/v1/websocket/"
    public let mainServiceURL = "https://chat.linkmessenger.me/"
    public let textSecureCDN0ServerURL = "https://cdn-aws.linkmessenger.me"
    public let textSecureCDN2ServerURL = "https://cdn-gcp.linkmessenger.me"
    public let contactDiscoverySGXURL = "https://cds.linkmessenger.me"
    public let contactDiscoveryV2URL = "wss://cds.linkmessenger.me"
    public let keyBackupURL = "https://api.linkmessenger.me"
    public let storageServiceURL = "https://stg.linkmessenger.me"
    public let sfuURL = "https://sfu.linkmessenger.me"
    public let sfuTestURL = "https://sfu.linkmessenger.me"
    public let registrationCaptchaURL = "https://updates.linkmessenger.me/registration/generate.html"
    public let challengeCaptchaURL = "https://updates.linkmessenger.me/challenge/generate.html"
    public let kUDTrustRoot = "BbZ54gjdnxB0L39NHJSzTaO3J5q4MYjQ6pHccGylMbw2"
    public let updatesURL = "https://updates.signal.org"
    public let updates2URL = "https://updates2.signal.org"

    public let censorshipReflectorHost = "europe-west1-signal-cdn-reflector.cloudfunctions.net"

    public let serviceCensorshipPrefix = "service"
    public let cdn0CensorshipPrefix = "cdn"
    public let cdn2CensorshipPrefix = "cdn2"
    public let contactDiscoveryCensorshipPrefix = "directory"
    public let keyBackupCensorshipPrefix = "backup"
    public let storageServiceCensorshipPrefix = "storage"

    public var contactDiscoveryMrEnclave = MrEnclave("5282dd8af2448dbf3881d1631d92c63b8fc9a5f48f6e234e16e3a561619aaca9")
    public let contactDiscoveryV2MrEnclave = MrEnclave("5282dd8af2448dbf3881d1631d92c63b8fc9a5f48f6e234e16e3a561619aaca9")

    public let keyBackupEnclave = KeyBackupEnclave(
        name: "4332fba9c5451d65534c934a9641d8450d09f0df74fed1b1c64281eca2e7e51f",
        mrenclave: MrEnclave("4332fba9c5451d65534c934a9641d8450d09f0df74fed1b1c64281eca2e7e51f"),
        serviceId: "4d028bafb203c815979080e32720b5ab6b0f2ff93ea2bb67dab79ffa3bd3db1b"
    )

    // An array of previously used enclaves that we should try and restore
    // key material from during registration. These must be ordered from
    // newest to oldest, so we check the latest enclaves for backups before
    // checking earlier enclaves.
    public let keyBackupPreviousEnclaves: [KeyBackupEnclave] = [
        // Add the current `keyBackupEnclave` value here when replacing it.
        KeyBackupEnclave(
            name: "4332fba9c5451d65534c934a9641d8450d09f0df74fed1b1c64281eca2e7e51f",
            mrenclave: MrEnclave("4332fba9c5451d65534c934a9641d8450d09f0df74fed1b1c64281eca2e7e51f"),
            serviceId: "4d028bafb203c815979080e32720b5ab6b0f2ff93ea2bb67dab79ffa3bd3db1b"
        )
    ]
    public let applicationGroup = "group." + Bundle.main.bundleIdPrefix + ".linkm.me"

    // We need to discard all profile key credentials if these values ever change.
    // See: GroupsV2Impl.verifyServerPublicParams(...)
    public let serverPublicParamsBase64 = "APypRQinqnc88qLDaKas7UBynNEFBXInGfEgdKrkYJh9uM2v4MNClJu75BLFuER+uvtvSXwNZ3Z5wU01HpB4YxY+Qzu7fbOcvM3x6Jp2Syp0inKCK3HRXQqClmDygHEXOMhTAfNeslVfpfDyUacaHFMq1LUTvQRGatYPKsDjwRpsNrrfsxCrrxdMCJMhJgeVLS4MRMYL7UNhsHF8Arn75y4+NMyvOLO7JzSrOwoqWBCIyzBSFyUjOFBhVfIBpKPidHwT8+ASPhMWbItEiKTSl2RFpFGVN1h7aRLvA+j2Umc5ZtdxcqgTQtSDS5aPo2oydt3Fb7NhvdKqIvyH/SnSnFTaiZmKecD5R2y+ajIp4C+APW38kHQYVHUBrua0ehCeK2qvrItuTy0NuUvmPREZIxemZHVnBU3SWy2UDdV36G1GEGaKrOS8oPyHqSfTLDwibkyezS2zy3AtxbiCiQR4I3SsNYEFvsHwe8o3vQ+PLr/XX6+ocWwChDzPRqryLUxuGfJcu0gtmDFcLHFUEOZlLdh+SG7gppkjNdRbDywvIvdW"
}

// MARK: - Staging

private class TSConstantsStaging: TSConstantsProtocol {

    public let mainServiceWebSocketAPI_identified = "wss://chat.staging.signal.org/v1/websocket/"
    public let mainServiceWebSocketAPI_unidentified = "wss://ud-chat.staging.signal.org/v1/websocket/"
    public let mainServiceURL = "https://chat.staging.signal.org/"
    public let textSecureCDN0ServerURL = "https://cdn-staging.signal.org"
    public let textSecureCDN2ServerURL = "https://cdn2-staging.signal.org"
    public let contactDiscoverySGXURL = "https://api-staging.directory.signal.org"
    public let contactDiscoveryV2URL = "wss://cdsi.staging.signal.org"
    public let keyBackupURL = "https://api-staging.backup.signal.org"
    public let storageServiceURL = "https://storage-staging.signal.org"
    public let sfuURL = "https://sfu.staging.voip.signal.org"
    public let registrationCaptchaURL = "https://signalcaptchas.org/staging/registration/generate.html"
    public let challengeCaptchaURL = "https://signalcaptchas.org/staging/challenge/generate.html"
    // There's no separate test SFU for staging.
    public let sfuTestURL = "https://sfu.test.voip.signal.org"
    public let kUDTrustRoot = "BbqY1DzohE4NUZoVF+L18oUPrK3kILllLEJh2UnPSsEx"
    // There's no separate updates endpoint for staging.
    public let updatesURL = "https://updates.signal.org"
    public let updates2URL = "https://updates2.signal.org"

    public let censorshipReflectorHost = "europe-west1-signal-cdn-reflector.cloudfunctions.net"

    public let serviceCensorshipPrefix = "service-staging"
    public let cdn0CensorshipPrefix = "cdn-staging"
    public let cdn2CensorshipPrefix = "cdn2-staging"
    public let contactDiscoveryCensorshipPrefix = "directory-staging"
    public let keyBackupCensorshipPrefix = "backup-staging"
    public let storageServiceCensorshipPrefix = "storage-staging"

    // CDS uses the same EnclaveName and MrEnclave
    public var contactDiscoveryMrEnclave = MrEnclave("74778bb0f93ae1f78c26e67152bab0bbeb693cd56d1bb9b4e9244157acc58081")
    public let contactDiscoveryV2MrEnclave = MrEnclave("ef4787a56a154ac6d009138cac17155acd23cfe4329281252365dd7c252e7fbf")

    public let keyBackupEnclave = KeyBackupEnclave(
        name: "39963b736823d5780be96ab174869a9499d56d66497aa8f9b2244f777ebc366b",
        mrenclave: MrEnclave("45627094b2ea4a66f4cf0b182858a8dcf4b8479122c3820fe7fd0551a6d4cf5c"),
        serviceId: "9dbc6855c198e04f21b5cc35df839fdcd51b53658454dfa3f817afefaffc95ef"
    )

    // An array of previously used enclaves that we should try and restore
    // key material from during registration. These must be ordered from
    // newest to oldest, so we check the latest enclaves for backups before
    // checking earlier enclaves.
    public let keyBackupPreviousEnclaves: [KeyBackupEnclave] = [
        // Add the current `keyBackupEnclave` value here when replacing it.
        KeyBackupEnclave(
            name: "dd6f66d397d9e8cf6ec6db238e59a7be078dd50e9715427b9c89b409ffe53f99",
            mrenclave: MrEnclave("ee19f1965b1eefa3dc4204eb70c04f397755f771b8c1909d080c04dad2a6a9ba"),
            serviceId: "4200003414528c151e2dccafbc87aa6d3d66a5eb8f8c05979a6e97cb33cd493a"
        )
    ]

    public let applicationGroup = "group." + Bundle.main.bundleIdPrefix + ".signal.group.staging"

    // We need to discard all profile key credentials if these values ever change.
    // See: GroupsV2Impl.verifyServerPublicParams(...)
    public let serverPublicParamsBase64 = "ABSY21VckQcbSXVNCGRYJcfWHiAMZmpTtTELcDmxgdFbtp/bWsSxZdMKzfCp8rvIs8ocCU3B37fT3r4Mi5qAemeGeR2X+/YmOGR5ofui7tD5mDQfstAI9i+4WpMtIe8KC3wU5w3Inq3uNWVmoGtpKndsNfwJrCg0Hd9zmObhypUnSkfYn2ooMOOnBpfdanRtrvetZUayDMSC5iSRcXKpdlukrpzzsCIvEwjwQlJYVPOQPj4V0F4UXXBdHSLK05uoPBCQG8G9rYIGedYsClJXnbrgGYG3eMTG5hnx4X4ntARBgELuMWWUEEfSK0mjXg+/2lPmWcTZWR9nkqgQQP0tbzuiPm74H2wMO4u1Wafe+UwyIlIT9L7KLS19Aw8r4sPrXZSSsOZ6s7M1+rTJN0bI5CKY2PX29y5Ok3jSWufIKcgKOnWoP67d5b2du2ZVJjpjfibNIHbT/cegy/sBLoFwtHogVYUewANUAXIaMPyCLRArsKhfJ5wBtTminG/PAvuBdJ70Z/bXVPf8TVsR292zQ65xwvWTejROW6AZX6aqucUj"
}
