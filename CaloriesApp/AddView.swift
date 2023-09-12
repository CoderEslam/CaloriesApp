//
//  AddView.swift
//  CaloriesApp
//
//  Created by Eslam Ghazy on 4/9/23.
//

import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var env
    @EnvironmentObject var vm:cddatamodel
    @State var itemselected :Tab = .Breackfast
    @State var showiocn:Bool = true
    @State var icon :String = "m1"
    @State var name = ""
    @State var titel = ""
    @State var fat:String = "0"
    @State var protein :String = "0"
    @State var cards :String = "0"
    @State var fatTF :Bool = false
    @State var proteinTF :Bool = false
    @State var cardsTF :Bool = false
    
    var body: some View {
        VStack{
            Spacer()
            TabView(itemselected: $itemselected)
            
            VStack(spacing: 25){
                
                Image(icon)
                    .resizable()
                    .foregroundColor(.gray)
                    .scaledToFit()
                    .frame(width: 45,height: 45)
                    .padding(5)
                    .background(RoundedRectangle(cornerRadius: 100).stroke().fill(.gray))
                    .clipShape(Circle())
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .onTapGesture {
                        withAnimation{
                            showiocn.toggle()
                        }
                    }
                
                if showiocn {
                    
                    ScrollView (.horizontal , showsIndicators: false){
                        HStack{
                            ForEach(icons){ item in
                                Image(item.image)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 60,height: 60)
                                    .onTapGesture {
                                        icon = item.image
                                        withAnimation{
                                            showiocn.toggle()
                                        }
                                    }
                            }
                            
                        }
                        
                    }
                    
                }
                
                VStack{
                    
                    TextField("name", text: $name)
                    Divider()
                    TextField("titel", text: $titel)
                    
                }.font(.title3)
                    .padding()
                    .background(.white)
                    .cornerRadius(10)
                    .modifier(customShadow())
                    .padding()
                
                VStack{
                    values(number: $fat, show: $fatTF ,name: "Fat")
                    values(number: $protein, show: $proteinTF ,name: "Protin")
                    values(number: $cards, show: $cardsTF ,name: "cards")
                }.background(.white)
                    .cornerRadius(20)
                    .padding(.horizontal)
                    .modifier(customShadow())
                
                Button{
                    switch itemselected {
                    case .Breackfast:
                        vm.addBreakfast(icon: icon, name: name, ingredint: titel, fat: CGFloat(Int(fat) ?? 0), protein: CGFloat(Int(protein) ?? 0), cards: CGFloat(Int(cards) ?? 0))
                        env.wrappedValue.dismiss()

                    case .Lunch: break
                        vm.addLunch(icon: icon, name: name, ingredint: titel, fat: CGFloat(Int(fat) ?? 0), protein: CGFloat(Int(protein) ?? 0), cards: CGFloat(Int(cards) ?? 0))
                        env.wrappedValue.dismiss()

                    case .Dinner:
                    print("")
                    case .Snacks:
                        print("")
                    }
                }label: {
                    Text("Save").bold()
                        .font(.title2)
                        .foregroundColor(.black)
                        .frame(width: 180,height: 50)
                        .background(.white)
                        .cornerRadius(10)
                        .modifier(customShadow())
                    
                }
            }.padding()
            Spacer()
        }.overlay(alignment: .topLeading){
            Button{
                env.wrappedValue.dismiss()
            }label: {
                ZStack{
                    Circle().frame(width: 30,height: 30)
                        .foregroundColor(.black)
                    Image(systemName: "xmark")
                        .imageScale(.large) // scale type
                        .foregroundColor(.white)
                }.modifier(customShadow())
                    .padding()
            }
        }
    }
}

struct male :Identifiable {
    var id = UUID()
    var image : String
}

var icons:[male] = [
    male(image: "m1"),
    male(image: "m2"),
    male(image: "m3"),
    male(image: "m4"),
    male(image: "m5"),
    male(image: "m6"),
    male(image: "m7"),
]

struct values: View {
    @Binding var number : String
    @Binding var show : Bool
    var name = ""
    
    var body: some View {
        HStack {
            
            Text(name).bold()
                .font(.title2)
            Spacer()
            Text("\(number)").bold()
                .font(.title2)
                .frame(width: 45,height: 30)
                .background(.black)
                .cornerRadius(5)
                .foregroundColor(.white)
                .onTapGesture {
                    withAnimation{
                        show.toggle()
                    }
                }
            
            if show {
                ScrollView(.horizontal,showsIndicators: false) {
                    HStack(spacing: 5){
                        ForEach(1...100,id: \.self) { item in
                            
                            Text("\(item)").bold()
                                .frame(width: 30,height: 30)
                                .background(.black.opacity(0.2))
                                .cornerRadius(5)
                                .onTapGesture {
                                    withAnimation{
                                        show.toggle()
                                        number = "\(item)"
                                    }
                                }
                        }
                    }
                }.frame(width: 180,height: 30)
                    
            }
                
            
        }.padding(5)
            
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView().environmentObject(cddatamodel())
    }
}
