//
//  RingView.swift
//  CaloriesApp
//
//  Created by Eslam Ghazy on 3/9/23.
//

import SwiftUI

struct RingView: View {
    @EnvironmentObject var vm : cddatamodel
    var percent :CGFloat = 50
    let width : CGFloat = 130
    let height : CGFloat = 130
    var perc :CGFloat = 1000
    var body: some View {
        let ringValue = vm.saveValueEntity.first // اول عنصر في ال list
        let mutiplier = width / 44
        let progres = 1 - ((ringValue?.ring ??  0) / 1700)
        //let progres = 1 - (perc / 1700)
        return HStack (spacing: 40) {
            ZStack {
                Circle().stroke(Color.blue.opacity(0.1) ,style: StrokeStyle(lineWidth: 5))
                    .frame(width: width,height: height)
                
                Circle()
                    .trim(from: CGFloat(Int(progres)),to: 1)
                    .stroke(LinearGradient(gradient: Gradient(colors:[Color.red,Color.yellow]), startPoint: .top, endPoint: .bottom),
                            style: StrokeStyle(lineWidth: 5 * mutiplier ,lineCap: .round,lineJoin: .round,miterLimit: .infinity ,dash: [20,0],dashPhase: 0))
                    .rotationEffect(Angle(degrees: 90))
                    .rotation3DEffect(Angle(degrees: 180), axis: (x: 1, y: 0, z: 0))
                    .frame(width: width,height: height)
                
                Text("1790")
                    .font(.title)
                    .fontWeight(.bold)
            }
            HStack (spacing: 30){
                ForEach (vm.saveValueEntity){ item in
                    foodElementvalue(element: "Cards" , gram: String(format: "%.0f", item.cards),color: "cards" ,elementvalue:  CGFloat(item.cards )
                    )

                    foodElementvalue(element: "fat" , gram: String(format: "%.0f", item.fat),color: "cards" ,elementvalue:  CGFloat(item.fat)
                    )

                    foodElementvalue(element: "protein" , gram: String(format: "%.0f", item.protein),color: "cards" ,elementvalue:  CGFloat(item.protein)
                    )
                    
                }
            }
        }.frame(height: 180)
            .frame(width: UIScreen.main.bounds.width - 20)
            .background(Color.white)
            .cornerRadius(20)
            .modifier(customShadow())
    }
}

struct customShadow : ViewModifier {
    func body(content: Content) -> some View {
        content.shadow(color: .black.opacity(0.2), radius: 20 ,x: 0,y: 0)
    }
}


struct foodElementvalue : View{
    var element = ""
    var gram = ""
    var color  = "cards"
    var elementvalue : CGFloat = 1
    var body: some View{
        let height : CGFloat = 130
        let multiplier : CGFloat = height / 2000
        return VStack{
            ZStack(alignment: .bottom){
                Rectangle().frame(width: 8,height: 110)
                    .foregroundColor(.gray.opacity(0.5)) // backgroun rectangle
                if elementvalue != 0 {
                    Rectangle().frame(width: 8,height: elementvalue * multiplier)
                        .foregroundColor(Color(color))
                    
                } else{
                    Rectangle().frame(width: 8,height: 110)
                        .foregroundColor(Color(color))
                }
                
            }.cornerRadius(10)
            Text(element).font(.system(size: 12))
            
            Text(gram).font(.system(size: 10))
        }
    }
}

struct RingView_Previews: PreviewProvider {
    static var previews: some View {
        RingView().environmentObject(cddatamodel())
    }
}
