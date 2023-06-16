//
//  ratingstartVIEW.swift
//  bookworm4
//
//  Created by Pegah Tafvizi on 16.06.23.
//

import SwiftUI


struct ratingstartVIEW: View {
    @Binding var rating: Int
    
    var dd = ""
    var maxratingnumber = 4
    @State private var stringfortextfield = ""
    
    var noimage: Image? //option image
    var yellowimage = Image(systemName: "star")
    
    var darkcolor = Color.gray
    var yellowcolor = Color.yellow
    
    
    var body: some View {
        
        HStack{
            if dd.isEmpty == false{
                Text(dd)
            }
            
            ForEach(1..<maxratingnumber + 1 , id: \.self) {number in
                imageforstarfillingfunc(for:number)
                    .foregroundColor(number > rating ? darkcolor : yellowcolor)
                    .onTapGesture{
                        rating = number
                    }
            }
        }
    }
    
        
        
    func imageforstarfillingfunc (for number:Int) -> Image {
        if number > rating{
            return noimage ?? yellowimage
            
        } else  {
            return yellowimage
        }
    }
}
struct ratingstartVIEW_Previews: PreviewProvider {
    static var previews: some View {
        ratingstartVIEW(rating: .constant(4))
    }
}
