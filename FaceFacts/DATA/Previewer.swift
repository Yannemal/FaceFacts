//
//  Previewer.swift
//  FaceFacts christmas2023 Livestream Paul Hudson (c)
//
//  Student yannemal on 29DEC2023.
//  This is to provide a container of SwiftData for the Canvas / Preview to work with.

import Foundation
import SwiftData

@MainActor
struct Previewer {
    // will work on the main context.
    let container: ModelContainer
    let event: Event
    let person: Person
    
    
    init() throws {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        // this data will not be saved to SSD but cleared as the Preview is reset.
        container = try ModelContainer(for: Person.self, configurations: config)
        //sample data:
        event = Event(name: "HRC London", location: "MayFair")
        person = Person(name: "MauZed", emailAddress: "Mauzed@snailmail.com", details: "", metAt: event)
        
        container.mainContext.insert(person)
    }
    
}

