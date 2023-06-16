//
//  bookworm4App.swift
//  bookworm4
//
//  Created by Pegah Tafvizi on 15.06.23.
//

import SwiftUI

@main
struct bookworm4App: App {
    
    @StateObject private var dataController = DataController()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
