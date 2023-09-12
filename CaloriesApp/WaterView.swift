//
//  WaterView.swift
//  CaloriesApp
//
//  Created by Eslam Ghazy on 4/9/23.
//

import SwiftUI

struct WaterView: View {
    @State var checkmark = true
    var body: some View {
        VStack{
            HStack{
                Text("6 of 6 classes").bold()
                    .font(.title3)
                    .offset(y:-10)
                Image("cup")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40 ,height: 40)
            }.padding(.horizontal)
            
            HStack{
                ForEach(0...5,id:\.self){ item in
                    ZStack{
                        Circle().frame(width: 50,height: 50)
                            .foregroundColor(.blue.opacity(checkmark ? 0.1 : 0.03))
                        HStack{
                            
                            Image("water")
                                .resizable()
                                .scaledToFill()
                                .frame(width:40 ,height: 40)
                                .onTapGesture {
                                    checkmark.toggle()
                                }
                            
                        }
                    }.overlay(alignment: .topLeading){
                        ZStack{
                            Circle().frame(width: 15,height: 15)
                                .foregroundColor(.white)
                            
                            Image(systemName: checkmark ? "checkmark" : "").bold()
                                .font(.system(size: 10))
                                .foregroundColor(.green)
                        }
                    }
                }
            }
            
        }.frame(maxWidth: .infinity)
            .frame(height: 130)
            .background(.white)
            .cornerRadius(10)
            .padding(.horizontal)
            .modifier(customShadow())
    }
}

struct WaterView_Previews: PreviewProvider {
    static var previews: some View {
        WaterView()
    }
}
