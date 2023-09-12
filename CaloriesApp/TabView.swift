//
//  TabView.swift
//  CaloriesApp
//
//  Created by Eslam Ghazy on 4/9/23.
//

import SwiftUI

struct foodselected : Identifiable {
    var id = UUID().uuidString
    var food :String
    var tab : Tab
}

enum Tab :String {
    case Breackfast
    case Lunch
    case Dinner
    case Snacks
}

var selectedTab : [foodselected] = [
    foodselected(food: "Breackfast", tab: .Breackfast),
    foodselected(food: "Lunch", tab: .Lunch),
    foodselected(food: "Dinner", tab: .Dinner),
    foodselected(food: "Snacks", tab: .Snacks)
]

struct TabView: View {
    @Binding var itemselected : Tab
    var body: some View {
        
        HStack{
            
            ForEach(selectedTab) { item in
                Button{
                    withAnimation{
                        itemselected = item.tab
                    }
                } label: {
                Text(item.food)
                    .foregroundColor(itemselected == item.tab ? .white : .black)
                    .padding(8)
                    .background(itemselected == item.tab ? .black : .white)
                    .cornerRadius(10)
                
                }
                
            }
            
            
        }
        
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabView(itemselected: .constant(.Breackfast))
    }
}
