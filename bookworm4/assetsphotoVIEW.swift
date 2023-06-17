//
//  assetsphotoVIEW.swift
//  bookworm4
//
//  Created by Pegah Tafvizi on 16.06.23.
//

import SwiftUI

struct assetsphotoVIEW: View {
    let asstphotoviewvar : Book
    
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    @State private var showingDeleteAlert = false

    
    
    
    var body: some View {
        ScrollView{
            ZStack(alignment: .bottomTrailing){
                Image(asstphotoviewvar.type ?? "Fantasy")
                    .resizable()
                    .scaledToFit()
                
                Text(asstphotoviewvar.type?.uppercased() ?? "Fantacy")
                    .font(.caption)
                    .fontWeight(.black)
                    .padding(8)
                    .foregroundColor(.white)
                    .background(.black.opacity(0.75))
                    .clipShape(Capsule())
                    .offset(x: -5, y: -5)
    
                
            }
            
            Text(asstphotoviewvar.author ?? "Unknown author")
                .font(.title)
                .foregroundColor(.secondary)

            Text(asstphotoviewvar.review ?? "No review")
                .padding()

           
            
    
            
            
        }
        .navigationTitle(asstphotoviewvar.title ?? "Unknon Book")
        .navigationBarTitleDisplayMode(.inline)
        .alert("Delete the Saved Book ", isPresented: $showingDeleteAlert){
            Button("delete",role: .destructive, action: deletebookfunconeachopenedbook)
            Button("cancel", role: .cancel, action: {})
        }message: {
            Text(" are you sure you wanna delete it ")
        }
        .toolbar {
            Button {
                showingDeleteAlert = true
            } label: {
                Label("Delete this book", systemImage: "trash")
            }
        }

        
        
    }
    
    func deletebookfunconeachopenedbook (){
        moc.delete(asstphotoviewvar)
        
        dismiss()
    }
}

