// SPDX-License-Identifier: Apache-2.0

import Foundation
import Hiero

@_cdecl("LLVMFuzzerTestOneInput")
public func fuzzPrivateKeyFromBytes(_ start: UnsafePointer<UInt8>, _ count: Int) -> CInt {
    let data = Data(bytes: start, count: count)

    // Fuzz PrivateKey DER/raw byte deserialization
    _ = try? PrivateKey.fromBytes(data)

    return 0
}
