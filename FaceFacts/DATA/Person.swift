//
//  Person.swift
//  FaceFacts christmas2023 Livestream Paul Hudson (c)
//
//  Student yannemal on 27DEC2023.
//

import Foundation
import SwiftData

@Model
class Person {
    
    var name: String
    var emailAddress: String
    var details: String
    
    init(name: String, emailAddress: String, details: String) {
        self.name = name
        self.emailAddress = emailAddress
        self.details = details
    }
    
}
