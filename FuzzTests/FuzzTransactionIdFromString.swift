// SPDX-License-Identifier: Apache-2.0

import Foundation
import Hiero

@_cdecl("LLVMFuzzerTestOneInput")
public func fuzzTransactionIdFromString(_ start: UnsafePointer<UInt8>, _ count: Int) -> CInt {
    let data = Data(bytes: start, count: count)

    guard let str = String(data: data, encoding: .utf8) else {
        return 0
    }

    // Fuzz TransactionId string parsing (e.g. "0.0.1234@1234567890.123456789")
    _ = try? TransactionId.fromString(str)

    return 0
}
