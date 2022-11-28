//
// Copyright 2021 Signal Messenger, LLC.
// SPDX-License-Identifier: AGPL-3.0-only
//

import Foundation
import SignalFfi

public class PniCredential: ByteArray {
  public required init(contents: [UInt8]) throws {
    try super.init(contents, checkValid: signal_pni_credential_check_valid_contents)
  }
}
