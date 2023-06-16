//
//  newfrontvieworganization.swift
//  bookworm4
//
//  Created by Pegah Tafvizi on 16.06.23.
//

import SwiftUI

struct newfrontvieworganization: View {
    
    let intnewfrontview: Int16
    
    var body: some View {
        switch intnewfrontview{
        case 1:
            return Text("🤮")
        case 2:
            return Text("😏")
        case 3:
            return Text("😶")
        case 4 :
            return Text("☺️")
        default:
            return Text("🥰")
            
        }
    }
}

struct newfrontvieworganization_Previews: PreviewProvider {
    static var previews: some View {
        newfrontvieworganization(intnewfrontview: 3)
    }
}
