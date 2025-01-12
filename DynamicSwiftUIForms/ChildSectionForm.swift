//
//  FormularioNiño.swift
//  DynamicForms
//
//  Created by Javier Calatrava on 11/1/25.
//

import Foundation
import SwiftUI

struct ChildSectionForm: View {
    @Binding var niño: Child
    @EnvironmentObject var viewModel: DynamicFormViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            TextField("Name", text: $niño.name)
            TextField("Surename", text: $niño.surename)
            
            DatePicker("Birthday", selection: $niño.birthdate, displayedComponents: .date)
                .onChange(of: niño.birthdate) { newValue, _ in
                    viewModel.validateAge(niñoId: niño.id, fechaDeNacimiento: newValue)
                    viewModel.validateDate(niñoId: niño.id, fechaDeNacimiento: newValue)
                }
            
            if let esValidoEdad = viewModel.validAge[niño.id], !esValidoEdad {
                Text("Age much be lower than 18.")
                    .foregroundColor(.red)
            }
            
            if let esValidoFecha = viewModel.validDate[niño.id], !esValidoFecha {
                Text("Cannto be future date")
                    .foregroundColor(.red)
            }
        }
    }
}

