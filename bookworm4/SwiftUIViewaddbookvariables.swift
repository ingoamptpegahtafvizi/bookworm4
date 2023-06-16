//
//  SwiftUIViewaddbookvariables.swift
//  bookworm4
//
//  Created by Pegah Tafvizi on 15.06.23.
//

import SwiftUI

struct SwiftUIViewaddbookvariables: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss

    
    
    @State private var title = ""
    @State private var author = ""
    @State private var rating = 3
    @State private var review = ""
    @State private var type = ""
    
    let types = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]


    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    TextField("Please enter the name of the book", text: $title)
                
                }
                
                Section{
                    TextField("Please enter the author name", text: $author)
                }
                
                Section{
                    Picker("Enter the rating for the book", selection: $rating){
                        
                        ForEach(0..<7){
                            Text(String($0))
                        }
                    }
                        
                Section{
                    TextField("Whats your review about the book", text: $review)
                            
                }
                    
                Section{
                    Button("Save"){
                        let savebook = Book(context: moc)
                        savebook.id = UUID()
                        savebook.title = title
                        savebook.author = author
                        savebook.rating = Int16(rating)
                        savebook.type = type
                        savebook.review = review

                        try? moc.save()
                        dismiss()
                    }
                        
                }
                        
                        
                    
                }
                
            }
        }
        
    }
}

struct SwiftUIViewaddbookvariables_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIViewaddbookvariables()
    }
}
