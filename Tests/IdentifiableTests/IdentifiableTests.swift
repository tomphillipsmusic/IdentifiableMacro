import SwiftSyntaxMacros
import SwiftSyntaxMacrosTestSupport
import XCTest

// Macro implementations build for the host, so the corresponding module is not available when cross-compiling. Cross-compiled tests may still make use of the macro itself in end-to-end tests.
#if canImport(IdentifiableMacros)
import IdentifiableMacros

let testMacros: [String: Macro.Type] = [
    "identifiable": IdentifiableMacro.self
]
#endif

final class IdentifiableTests: XCTestCase {
    
    func testIdentifiableMacro() throws {
        #if canImport(IdentifiableMacros)
        assertMacroExpansion(
            """
            @identifiable
            struct Person {
                let name: String
            }
            """,
            expandedSource: """
            struct Person {
                let name: String
            
                let uuid = UUID()
            }
            
            extension Person: Identifiable {
                var id: UUID {
                    self.uuid
                }
            }
            """,
            macros: testMacros
        )
        #else
        throw XCTSkip("macros are only supported when running tests for the host platform")
        #endif
    }
}

