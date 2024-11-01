//
//  EditDestinationView.swift
//  iTour SwiftData Demo
//
//  Created by Randy McKown on 10/31/24.
//

import SwiftData
import SwiftUI

struct EditDestinationView: View {
    @Bindable var destination: Destination
    @State private var newSightName = ""
    
    var body: some View {
        Form {
            TextField("Name", text: $destination.name)
            TextField("Details", text: $destination.details, axis: .vertical)
            DatePicker("Date", selection: $destination.date)
            
            Section("Priority") {
                Picker("Priority", selection: $destination.priority) {
                    Text("Meh").tag(1)
                    Text("Maybe").tag(2)
                    Text("Must").tag(3)
                }
                .pickerStyle(.segmented)
            }
            
            Section("Sight") {
                ForEach(destination.unwrappedSights) { sight in
                    Text(sight.name)
                }
                
                HStack {
                    TextField("Add a new sight in \(destination.name)", text: $newSightName)
                    Button("Add", action: addSight)
                }
            }
        }
    }
    
    func addSight() {
        guard newSightName.isEmpty == false else {return}
        
        withAnimation {
            let sight = Sight(name: newSightName)
            destination.sights?.append(sight)
            newSightName = ""
        }
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Destination.self, configurations: config)
        let example = Destination(name: "Sample Data", details: "All of the samples data goes here to describe the sample data.")
        return EditDestinationView(destination: example)
            .modelContainer(container)
    }
    catch {
        fatalError("Failed to create sample data")
    }
}
