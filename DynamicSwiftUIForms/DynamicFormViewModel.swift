//
//  PersonasViewModel.swift
//  DynamicForms
//
//  Created by Javier Calatrava on 11/1/25.
//

import Foundation
import SwiftUI

class DynamicFormViewModel: ObservableObject {
    @Published var persons: [SectionType]
    
    @Published var validAge: [UUID: Bool] = [:]
    @Published var validDate: [UUID: Bool] = [:]
    @Published var validEmail: [UUID: Bool] = [:]
    @Published var validName: [UUID: Bool] = [:]
    
    init(persons: [SectionType]) {
        self.persons = persons
    }

    func validateAge(niñoId: UUID, fechaDeNacimiento: Date) {
        let edad = calculateAge(fechaDeNacimiento: fechaDeNacimiento)
        validAge[niñoId] = edad < 18
    }
    
    func validateDate(niñoId: UUID, fechaDeNacimiento: Date) {
        let fechaFutura = fechaDeNacimiento > Date()
        validDate[niñoId] = !fechaFutura
    }

    func validateEmail(adultoId: UUID, email: String) {
        let regex = "[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", regex)
        validEmail[adultoId] = emailPredicate.evaluate(with: email)
    }

    func validateName(adultoId: UUID, nombre: String) {
        validName[adultoId] = !nombre.isEmpty
    }
    
    private func calculateAge(fechaDeNacimiento: Date) -> Int {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year], from: fechaDeNacimiento, to: Date())
        return components.year ?? 0
    }
}
