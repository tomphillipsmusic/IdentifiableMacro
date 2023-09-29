@attached(member, names: named(uuid))
@attached(extension, conformances: Identifiable, names: named(id))
public macro UUIDIdentifiable() = #externalMacro(module: "IdentifiableMacros", type: "IdentifiableMacro")
