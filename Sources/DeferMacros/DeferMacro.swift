import SwiftCompilerPlugin
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros

public struct LogExitMacro: CodeItemMacro {
    public static func expansion(
        of node: some FreestandingMacroExpansionSyntax,
        in context: some MacroExpansionContext
    ) -> [CodeBlockItemSyntax] {
        return [ "defer { print(\"exiting function \\(#function)\") }"
               ]
    }
}

@main
struct DeferPlugin: CompilerPlugin {
    let providingMacros: [Macro.Type] = [
        LogExitMacro.self,
    ]
}
