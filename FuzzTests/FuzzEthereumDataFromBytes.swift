// SPDX-License-Identifier: Apache-2.0

import Foundation
import Hiero

@_cdecl("LLVMFuzzerTestOneInput")
public func fuzzEthereumDataFromBytes(_ start: UnsafePointer<UInt8>, _ count: Int) -> CInt {
    let data = Data(bytes: start, count: count)

    // Fuzz EthereumData deserialization (exercises RLP decoding internally)
    _ = try? EthereumData.Legacy.fromBytes(data)
    _ = try? EthereumData.Eip1559.fromBytes(data)

    return 0
}
