// SPDX-License-Identifier: Apache-2.0

import Foundation
import Hiero

@_cdecl("LLVMFuzzerTestOneInput")
public func fuzzAccountIdFromString(_ start: UnsafePointer<UInt8>, _ count: Int) -> CInt {
    let data = Data(bytes: start, count: count)

    guard let str = String(data: data, encoding: .utf8) else {
        return 0
    }

    // Fuzz AccountId string parsing (e.g. "0.0.1234", aliases, EVM addresses)
    _ = try? AccountId(parsing: str)

    return 0
}
