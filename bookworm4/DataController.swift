//
//  DataController.swift
//  bookworm4
//
//  Created by Pegah Tafvizi on 15.06.23.
//

import CoreData
import Foundation


class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "booksaving")
    
    
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }
    
    
}
