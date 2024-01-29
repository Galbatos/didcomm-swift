/*
 * Copyright 2024 Gonçalo Frade
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import CryptoKit
import Foundation

struct APV {
    static func calculateAPV(kids: [String]) throws -> Data {
        let sortedKids = kids.sorted().joined(separator: ".")
        guard let kidsData = sortedKids.data(using: .utf8) else {
            assertionFailure("This should never happen")
            return Data()
        }
        let digest = SHA256.hash(data: kidsData)
        return Data(digest)
    }
}
