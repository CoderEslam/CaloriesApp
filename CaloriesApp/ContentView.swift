//
//  ContentView.swift
//  CaloriesApp
//
//  Created by Eslam Ghazy on 3/9/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var vm :cddatamodel
    @State var itemselected:Tab = .Breackfast
    @State var show :Bool = false
    var body: some View {
        NavigationView{
            VStack{
                HStack{
                    Text("Hi Eslam").bold()
                        .font(.system(size: 34))
                    Spacer()
                    
                    Image("bur")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 50,height: 50)
                        .shadow(color: .black, radius: 20,x: 0,y: 0)
                        .clipShape(Circle())
                    
                    
                    
                }.padding(.horizontal)
                
                RingView()
                Divider()
                TabView(itemselected: $itemselected)
                if itemselected == .Breackfast {
                    ScrollView(.horizontal,showsIndicators: false){
                        HStack(spacing: 10){
                            ForEach(vm.saveBreackfastEntity){ item in
                                FoodCard(width: 200,protein: CGFloat(item.cards), fat: CGFloat(item.cards), cards: CGFloat(item.cards),name: item.name ?? "" ,title: item.ingredients ?? "" ,icon: item.icon ?? "")
                                    .padding(.leading)
                                    .overlay(alignment:.topTrailing){
                                        Button(action: {
                                            vm.addValue(fat: CGFloat(item.fat), protein: CGFloat(item.protein), cards: CGFloat(item.cards))
                                            vm.addmealToggle(meal: item)
                                            vm.addringCalories(calories: CGFloat(item.cards))
                                        }, label: {
                                            ZStack{
                                                Circle()
                                                    .frame(width: 30,height: 30)
                                                    .foregroundColor(.white)

                                                Image(systemName: item.addmale ? "checkmark" : "plus")
                                                    .imageScale(.small)
                                                    .foregroundColor(.black)


                                            }
                                            .modifier(customShadow())
                                        })
                                        .offset(x: -5,y:5)
                                    }

                            }
                        }
                        .frame(height: 180)
                    }.offset(y:-30)
                }
                else if itemselected == .Lunch{
                    ScrollView(.horizontal,showsIndicators: false){
                        HStack(spacing: 10){
                            ForEach(vm.saveLunchEntity){ item in
                                FoodCard(width: 200,protein: CGFloat(item.cards), fat: CGFloat(item.cards), cards: CGFloat(item.cards),name: item.name ?? "" ,title: item.ingredients ?? "" ,icon: item.icon ?? "")
                                    .padding(.leading)

                            }
                        }
                        .frame(height: 180)
                    }.offset(y:-30)
                }
                WaterView().offset(y:-60)
                Spacer()
                    .overlay(alignment: .bottomLeading){
                        Button{
                            show.toggle()
                        }label: {
                            Text("New Male")
                                .bold()
                                .foregroundColor(.black)
                                .frame(width: 150,height: 50)
                                .background(.white)
                                .clipShape(Capsule())
                                .modifier(customShadow())
                        }
                        .padding()
                    }.sheet(isPresented: $show){
                        AddView()
                    }
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(cddatamodel())
    }
}
