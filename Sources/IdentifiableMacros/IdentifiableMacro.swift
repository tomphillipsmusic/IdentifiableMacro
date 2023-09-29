import SwiftCompilerPlugin
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros

public struct IdentifiableMacro: MemberMacro, ExtensionMacro {
    public static func expansion(
        of node: SwiftSyntax.AttributeSyntax,
        providingMembersOf declaration: some SwiftSyntax.DeclGroupSyntax,
        in context: some SwiftSyntaxMacros.MacroExpansionContext
    ) throws -> [SwiftSyntax.DeclSyntax] {
        return ["let uuid = UUID()"]
    }
    
    public static func expansion(
        of node: SwiftSyntax.AttributeSyntax,
        attachedTo declaration: some SwiftSyntax.DeclGroupSyntax,
        providingExtensionsOf type: some SwiftSyntax.TypeSyntaxProtocol, 
        conformingTo protocols: [SwiftSyntax.TypeSyntax],
        in context: some SwiftSyntaxMacros.MacroExpansionContext
    ) throws -> [SwiftSyntax.ExtensionDeclSyntax] {
        let identifiableExtension: DeclSyntax =
        """
        extension \(type.trimmed): Identifiable {
            var id: UUID { self.uuid }
        }
        """
        
        guard let extensionDeclaration = identifiableExtension.as(ExtensionDeclSyntax.self) else {
            return []
        }
        
        return [extensionDeclaration]
    }
}

@main
struct IdentifiablePlugin: CompilerPlugin {
    let providingMacros: [Macro.Type] = [
        IdentifiableMacro.self
    ]
}
