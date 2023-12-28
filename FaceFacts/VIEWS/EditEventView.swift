//
//  EditEventView.swift
//  FaceFacts
//
//  Created by yann guyt on 28/12/2023.
//

import SwiftUI

struct EditEventView: View {
    //DATA:
    @Bindable var event: Event
    
    
    var body: some View {
        //someVIEW:
        Form {
            TextField ("Name of Event", text: $event.name)
            TextField("Location", text: $event.location)
                .textContentType(.location)
        } //endForm
        .navigationTitle("Edit Event")
        .navigationBarTitleDisplayMode(.inline)
        
    } //end ViewUI
    //METHODS:
    
} //end struct

//#Preview {
//    EditEventView()
//}
