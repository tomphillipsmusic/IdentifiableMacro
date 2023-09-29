@attached(member, names: named(uuid))
@attached(extension, conformances: Identifiable, names: named(id))
public macro Identifiable() = #externalMacro(module: "IdentifiableMacros", type: "IdentifiableMacro")
