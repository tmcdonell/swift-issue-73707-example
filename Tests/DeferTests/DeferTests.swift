import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros
import SwiftSyntaxMacrosTestSupport
import XCTest

// Macro implementations build for the host, so the corresponding module is not available when cross-compiling. Cross-compiled tests may still make use of the macro itself in end-to-end tests.
#if canImport(DeferMacros)
import DeferMacros

let testMacros: [String: Macro.Type] = [
    "logExit": LogExitMacro.self,
]
#endif

final class DeferTests: XCTestCase {
    func testMacro() throws {
        #if canImport(DeferMacros)
        assertMacroExpansion(
            """
            #logExit
            """,
            expandedSource: """
            defer {
                print("exiting function \\(#function)")
            }
            """,
            macros: testMacros
        )
        #else
        throw XCTSkip("macros are only supported when running tests for the host platform")
        #endif
    }
}
