//
//  Models.swift
//  DynamicForms
//
//  Created by Javier Calatrava on 11/1/25.
//

import Foundation

struct Adult: Identifiable {
    var id = UUID()
    var name: String
    var surename: String
    var email: String
}

struct Child: Identifiable {
    var id = UUID()
    var name: String
    var surename: String
    var birthdate: Date
}

enum SectionType {
    case adult(Adult)
    case child(Child)
}

extension SectionType {
    func getAdult() -> Adult {
        switch self {
        case .adult(let adult):
            return adult
        default:
            fatalError("This is not an adult")
        }
    }

    func getChild() -> Child {
        switch self {
        case .child(let child):
            return child
        default:
            fatalError("This is not a child")
        }
    }
}
