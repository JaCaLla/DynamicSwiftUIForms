//
//  DynamicFormView.swift
//  DynamicForms
//
//  Created by Javier Calatrava on 11/1/25.
//

import Foundation
import SwiftUI

struct DynamicFormView: View {
    @StateObject var viewModel: DynamicFormViewModel

    var body: some View {
        Form {
            ForEach(Array(viewModel.persons.enumerated()), id: \.offset) { index, persona in
                Section {
                    if let adultoBinding = adultBinding(for: index) {
                        AdultSectionForm(adulto: adultoBinding)
                            .environmentObject(viewModel)
                    }
                    if let niñoBinding = childBinding(for: index) {
                        ChildSectionForm(niño: niñoBinding)
                            .environmentObject(viewModel)
                    }
                }
            }
        }
    }

    private func adultBinding(for index: Int) -> Binding<Adult>? {
        guard case .adult(let adult) = viewModel.persons[index] else { return nil }
        return Binding<Adult>(
            get: { adult },
            set: { newAdult in viewModel.persons[index] = .adult(newAdult) }
        )
    }

    private func childBinding(for index: Int) -> Binding<Child>? {
        guard case .child(let child) = viewModel.persons[index] else { return nil }
        return Binding<Child>(
            get: { child },
            set: { newChild in viewModel.persons[index] = .child(newChild) }
        )
    }
}

