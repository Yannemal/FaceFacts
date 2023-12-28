//
//  EditPersonView.swift
//  FaceFacts christmas2023 Livestream Paul Hudson (c)
//
//  Student yannemal on 27DEC2023.
//

import SwiftUI
import SwiftData

struct EditPersonView: View {
    //DATA:
    @Environment(\.modelContext) var modelContext
  
    @Bindable var person: Person
    @Binding var navigationPath: NavigationPath
    
    @Query(sort: [
        SortDescriptor(\Event.name),
        SortDescriptor(\Event.location)
                ]) var events: [Event]
    
    var body: some View {
        //someVIEW:
        Form {
            Section {
                TextField("Name", text: $person.name)
                    .textContentType(.name)
    
                TextField("Email address", text: $person.emailAddress)
                    .textContentType(.emailAddress)
                    .textInputAutocapitalization(.never)
            }
            Section("Where did you meet them ?") {
                Picker("Met at", selection: $person.metAt) {
                    Text("Unknown Event")
                        .tag(Optional<Event>.none)
                    
                    if events.isEmpty == false {
                        Divider()
                        
                        ForEach(events) { event in
                            Text(event.name)
                                .tag(Optional(event))
                        }
                    }
                } // end Picker
                
                Button("Add a new event", action: addEvent)
            }
            
            Section("Notes") {
                TextField("details about this person", text: $person.details, axis: .vertical)
                
            }
        } // end Form
        .navigationTitle("Edit Person")
        .navigationBarTitleDisplayMode(.inline)
        .navigationDestination(for: Event.self) { event in
            EditEventView(event: event)
        }
        
    } // end VIEW
    //METHODS:
    func addEvent() {
       let event = Event(name: "", location: "")
        modelContext.insert(event)
        navigationPath.append(event)
        
        
        // again adding == editing so its two-in-one
        // moving up and down the NavStack asa we create new content is made possible w the @binding
    }
    
} // endStruct

//#Preview {
//    EditPersonView()
//}
