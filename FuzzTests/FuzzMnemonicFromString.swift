// SPDX-License-Identifier: Apache-2.0

import Foundation
import Hiero

@_cdecl("LLVMFuzzerTestOneInput")
public func fuzzMnemonicFromString(_ start: UnsafePointer<UInt8>, _ count: Int) -> CInt {
    let data = Data(bytes: start, count: count)

    guard let str = String(data: data, encoding: .utf8) else {
        return 0
    }

    // Fuzz Mnemonic word parsing and validation
    _ = try? Mnemonic.fromString(str)

    return 0
}
