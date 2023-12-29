//
//  PeopleView.swift
//  FaceFacts
//
//  Created by yann guyt on 27/12/2023.
//
import SwiftData
import SwiftUI

struct PeopleView: View {
    //DATA:
    @Environment(\.modelContext) var modelContext

    @Query var people: [Person]
    
    var body: some View {
        //someVIEW
        List{
            ForEach(people) { person in
                NavigationLink(value: person) {
                    Text(person.name)
                }
            }
            .onDelete(perform: deletePeople)
        } // end List
       
    } // end someView UI
    //METHODS:
    
    init(searchString: String = "", sortOrder: [SortDescriptor<Person>] = []) {
        _people = Query(filter: #Predicate { person in
            if searchString.isEmpty {
                true
            } else {
                person.name.localizedStandardContains(searchString)
                || person.emailAddress.localizedStandardContains(searchString)
                || person.details.localizedStandardContains(searchString)
            }
        }, sort: sortOrder)
    }

    func deletePeople(at offsets: IndexSet) {
        for offset in offsets {
            let person = people[offset]
            modelContext.delete(person)
        }
    }
    
    
} //end View

#Preview {
    do {
        let previewer = try Previewer()
        
        return PeopleView()
            .modelContainer(previewer.container)
    } catch {
        return Text("Failed to create preview: \(error.localizedDescription)")
    }
}
