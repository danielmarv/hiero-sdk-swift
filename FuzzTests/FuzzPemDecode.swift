// SPDX-License-Identifier: Apache-2.0

import Foundation
import Hiero

@_cdecl("LLVMFuzzerTestOneInput")
public func fuzzPemDecode(_ start: UnsafePointer<UInt8>, _ count: Int) -> CInt {
    let data = Data(bytes: start, count: count)

    guard let str = String(data: data, encoding: .utf8) else {
        return 0
    }

    // Fuzz PEM parsing by attempting to parse a private key from arbitrary strings
    _ = try? PrivateKey.fromPem(str)

    return 0
}
