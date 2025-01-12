//
//  FormularioAdulto.swift
//  DynamicForms
//
//  Created by Javier Calatrava on 11/1/25.
//

import Foundation
import SwiftUI

struct AdultSectionForm: View {
    @Binding var adulto: Adult
    @EnvironmentObject var viewModel: DynamicFormViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            TextField("Name", text: $adulto.name)
                .onChange(of: adulto.name) { newValue, _ in
                    viewModel.validateName(adultoId: adulto.id, nombre: newValue)
                }
            if let isValid = viewModel.validName[adulto.id], !isValid {
                Text("Name cannot be empty.")
                    .foregroundColor(.red)
            }
            
            TextField("Surename", text: $adulto.surename)
            
            TextField("Email", text: $adulto.email)
                .onChange(of: adulto.email) { newValue, _ in
                    viewModel.validateEmail(adultoId: adulto.id, email: newValue)
                }
            if let isValido = viewModel.validEmail[adulto.id], !isValido {
                Text("Not valid email")
                    .foregroundColor(.red)
            }
        }
    }
}
