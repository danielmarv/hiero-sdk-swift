// SPDX-License-Identifier: Apache-2.0

import Foundation
import Hiero

@_cdecl("LLVMFuzzerTestOneInput")
public func fuzzPublicKeyFromBytes(_ start: UnsafePointer<UInt8>, _ count: Int) -> CInt {
    let data = Data(bytes: start, count: count)

    // Fuzz PublicKey deserialization
    _ = try? PublicKey.fromBytes(data)

    return 0
}
