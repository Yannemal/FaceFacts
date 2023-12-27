//
//  EditPersonView.swift
//  FaceFacts christmas2023 Livestream Paul Hudson (c)
//
//  Student yannemal on 27DEC2023.
//

import SwiftUI

struct EditPersonView: View {
    //DATA:
 
    @Bindable var person: Person
    
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
            
            Section("Notes") {
                TextField("details about this person", text: $person.details, axis: .vertical)
                
            }
        } // end Form
        .navigationTitle("Edit Person")
        .navigationBarTitleDisplayMode(.inline)
        
    } // end VIEW
    //METHODS:
    
    
}

//#Preview {
//    EditPersonView()
//}
