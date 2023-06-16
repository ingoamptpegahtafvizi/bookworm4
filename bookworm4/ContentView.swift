//
//  ContentView.swift
//  bookworm4
//
//  Created by Pegah Tafvizi on 15.06.23.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var varbooks: FetchedResults<Book>
    
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
            }
    
            .navigationTitle("Saving Books:")
            .toolbar{
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
}
   
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
