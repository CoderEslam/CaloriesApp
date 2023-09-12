//
//  FoodCard.swift
//  CaloriesApp
//
//  Created by Eslam Ghazy on 4/9/23.
//

import SwiftUI

struct FoodCard: View {
    var width :CGFloat = 200
    @State var protein :CGFloat = 20
    @State var fat :CGFloat = 100
    @State var cards :CGFloat = 70
    @State var name :String = ""
    @State var title :String = ""
    @State var icon :String = ""
    
    var body: some View {
        let multipier = width / 40
        VStack(alignment: .leading, spacing: 2) {
            HStack{
                Text("\(name)")
                    .font(.title2)
                    .frame(width: 160)
                    .lineLimit(1)
                    .minimumScaleFactor(0.7)
                
            }.bold()
            
            HStack{
                Text("\(title)")
                
                Spacer()
                
            }
            .frame(width: 200,height: 30)
            .minimumScaleFactor(0.6)
        }
        .offset(x: 20,y:-20)
        .frame(width: 270,height: 110)
        .background(.white)
        .cornerRadius(10)
        .modifier(customShadow())
        .overlay(alignment: .topLeading, content: {
            Image("bur")
                .resizable()
                .scaledToFit()
                .frame(width: 65,height: 65)
                .offset(x:-12,y: -16)
        })
        .overlay(alignment: .bottom, content: {
            HStack{
                Elements(name: "Cards",color: "cards", foodElement: cards ,multipier: multipier)
                Elements(name: "protein",color: "cards", foodElement: protein ,multipier: multipier)
                Elements(name: "fat",color: "cards", foodElement: fat ,multipier: multipier)
            }
            })
    }
}

struct Elements: View {
    var name = "name"
    var color = ""
    var foodElement :CGFloat = 0
    var multipier :CGFloat = 0

    var body: some View {
        let width :CGFloat =  130
        let multipier :CGFloat = width / 200
       return VStack{
            Text(name).font(.system(size: 12))
            Rectangle().frame(width: foodElement * multipier,height: 5)
                .foregroundColor(Color(color))
            
        }.padding(.bottom,5)
            .frame(width: 90)
    }
}

struct FoodCard_Previews: PreviewProvider {
    static var previews: some View {
        FoodCard()
    }
}
