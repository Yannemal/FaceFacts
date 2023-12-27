//
//  ContentView.swift
//  FaceFacts christmas2023 Livestream Paul Hudson (c)
//
//  Student yannemal on 27DEC2023.
//
import SwiftData
import SwiftUI

struct ContentView: View {
    //DATA:
    @Environment(\.modelContext) var modelContext
    @State private var path = [Person]()
    // ⬆️ for storing and binding path for navigation
    @State private var sortOrder = [SortDescriptor(\Person.name)]
    @State private var searchText = ""
    // ⬆️ for the Predicates in PeopleView
    
    var body: some View {
        // someVIEW:
        
        NavigationStack(path: $path) {
                PeopleView(searchString: searchText, sortOrder: sortOrder)
                .navigationTitle("FaceFacts")
            .navigationDestination(for: Person.self) { person in
                EditPersonView(person: person)
            }
            .toolbar {
                Menu("Sort", systemImage: "arrow.up.arrow.down") {
                    Picker("Sort", selection: $sortOrder) {
                        // use tags to send action to sortOrder
                        Text("Name (A-Z)")
                            .tag([SortDescriptor(\Person.name)])
                        
                        Text("Name (Z-A)")
                            .tag([SortDescriptor(\Person.name, order: .reverse)])
                    }
                }
                
                Button("Add Person", systemImage: "plus", action: addPerson)
            } // end toolbar
            .searchable(text: $searchText)
        }
    } // end VIEW
    
    // METHODS:
    func addPerson() {
        let person = Person(
            name: "",
            emailAddress: "",
            details: ""
        )
        modelContext.insert(person)
        path.append(person)
    }
    

    
} // end ContentView

#Preview {
    ContentView()
}
