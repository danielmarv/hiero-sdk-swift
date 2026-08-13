// SPDX-License-Identifier: Apache-2.0

import Foundation
@testable import Hiero

@_cdecl("LLVMFuzzerTestOneInput")
public func fuzzRlpDecode(_ start: UnsafePointer<UInt8>, _ count: Int) -> CInt {
    let data = Data(bytes: start, count: count)

    // Fuzz the RLP decoder by attempting to decode arbitrary data as a value
    let rlp = AnyRlp(raw: data)
    _ = try? rlp.makeRawValue()

    // Also try decoding as a list
    let rlp2 = AnyRlp(raw: data)
    _ = try? rlp2.makeRawList()

    return 0
}

