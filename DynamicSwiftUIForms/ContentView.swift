//
//  ContentView.swift
//  DynamicSwiftUIForms
//
//  Created by Javier Calatrava on 12/1/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = DynamicFormViewModel(persons: [
        .adult(Adult(name: "Juan", surename: "Pérez", email: "juan.perez@example.com")),
        .child(Child(name: "Carlos", surename: "Gomez", birthdate: Date(timeIntervalSince1970: 1452596356))),
        .adult(Adult(name: "Ana", surename: "Lopez", email: "ana.lopez@example.com"))
    ])
    
    var body: some View {
        DynamicFormView(viewModel: viewModel)
    }
}

#Preview {
    ContentView()
}
