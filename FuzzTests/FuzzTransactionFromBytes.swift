// SPDX-License-Identifier: Apache-2.0

import Foundation
import Hiero

@_cdecl("LLVMFuzzerTestOneInput")
public func fuzzTransactionFromBytes(_ start: UnsafePointer<UInt8>, _ count: Int) -> CInt {
    let data = Data(bytes: start, count: count)

    // Fuzz Transaction.fromBytes with arbitrary protobuf data
    _ = try? Transaction.fromBytes(data)

    return 0
}
