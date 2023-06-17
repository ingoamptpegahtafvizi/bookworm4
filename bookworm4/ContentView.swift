//
//  ContentView.swift
//  bookworm4
//
//  Created by Pegah Tafvizi on 15.06.23.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var moc
    
    
    @FetchRequest(sortDescriptors: [
        SortDescriptor(\.title),
        SortDescriptor(\.author)
    ]) var varbooks: FetchedResults<Book>
    
    
    @State private var showingAddScreen = false
    
    
    
    var body: some View {
        NavigationView {
            List{
                ForEach(varbooks){ee in
                    NavigationLink{
                        assetsphotoVIEW(asstphotoviewvar: ee)
                    }label: {
                        HStack{
                            newfrontvieworganization(intnewfrontview: ee.rating)
                                .font(.largeTitle)
                            VStack(alignment: .leading){
                                Text(ee.title ?? "unknown title")
                                    .font(.headline)
                                Text(ee.author ?? "what author")
                                    .foregroundColor(.secondary)
                            }
                            
                        }
                    }
                }
                .onDelete(perform: deletebookfunc)
            }
    
            .navigationTitle("Saving Books:")
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading){
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing){
                    
                    Button{
                        showingAddScreen.toggle()
                    }label: {
                        Label("Add Book", systemImage: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddScreen){
                SwiftUIViewaddbookvariables()
            }
                
            
            
        }
        
    }
    func deletebookfunc(at offsets: IndexSet){
        for offset in offsets {
            let ee = varbooks[offset]
            moc.delete(ee)
        }
        try? moc.save()
        
    }
}
   
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
