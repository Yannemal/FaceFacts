//
//  FaceFactsApp.swift
//   christmas2023 Livestream Paul Hudson (c)
//
//  Student yannemal on 27DEC2023.
//
import SwiftData
import SwiftUI

@main
struct FaceFactsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Person.self)
    }
}
