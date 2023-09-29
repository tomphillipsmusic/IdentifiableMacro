import Identifiable
import Foundation
import SwiftUI

@Identifiable 
struct Person {
    let name: String
}

struct PeopleView: View {
    let people = [
        Person(name: "Tom"),
        Person(name: "Ty"),
        Person(name: "Zoe"),
    ]
    var body: some View {
        ForEach(people) {
            Text($0.name)
        }
    }
}

#Preview {
    PeopleView()
}
