//
//  CDDataModel.swift
//  CaloriesApp
//
//  Created by Eslam Ghazy on 3/9/23.
//

import Foundation
import CoreData
class cddatamodel :ObservableObject{
    
    let contanier : NSPersistentContainer
    @Published var saveBreackfastEntity: [BreakfastEntity] = []
    @Published var saveLunchEntity: [LunchEntity] = []
    @Published var saveValueEntity: [ValueEntity] = []
    
    init(){
        contanier = NSPersistentContainer(name: "CDfoodEntity")
        contanier.loadPersistentStores{descrip,error in
            if let error = error {
                print("Error loading data => \(error)")
            }
        }
        fechData()
    }
    
    
    func fechData(){
        let requestone = NSFetchRequest<BreakfastEntity>(entityName: "BreakfastEntity")
        let requestTow = NSFetchRequest<LunchEntity>(entityName: "LunchEntity")
        let requestThree = NSFetchRequest<ValueEntity>(entityName: "ValueEntity")
        
        do {
            saveBreackfastEntity = try contanier.viewContext.fetch(requestone)
            saveLunchEntity = try contanier.viewContext.fetch(requestTow)
            saveValueEntity = try contanier.viewContext.fetch(requestThree)
        } catch let error {
            print("Error faching Data \(error)")
        }
    }
    
    func addBreakfast(icon:String ,name:String , ingredint:String,fat:CGFloat,protein:CGFloat,cards:CGFloat){
        let newmale = BreakfastEntity(context: contanier.viewContext)
        newmale.icon = icon
        newmale.name = name
        newmale.ingredients = ingredint
        newmale.fat = Float(fat)
        newmale.protein = Float(protein)
        newmale.cards = Float(cards)
        saveData()
    }
    
    func addLunch(icon:String ,name:String , ingredint:String,fat:CGFloat,protein:CGFloat,cards:CGFloat){
        let newmale = BreakfastEntity(context: contanier.viewContext)
        newmale.icon = icon
        newmale.name = name
        newmale.ingredients = ingredint
        newmale.fat = Float(fat)
        newmale.protein = Float(protein)
        newmale.cards = Float(cards)
        saveData()
    }
    
    func addValue(fat:CGFloat,protein:CGFloat,cards:CGFloat){
        let newmale = NSFetchRequest<ValueEntity>(entityName: "ValueEntity")
        do {
          let result = try contanier.viewContext.fetch(newmale)
            if let entity = result.first {
                entity.fat += Float(fat)
                entity.protein += Float(protein)
                entity.cards += Float(cards)
            } else{
                let newValue = ValueEntity(context: contanier.viewContext)
                newValue.fat = Float(fat)
                newValue.protein = Float(protein)
                newValue.cards = Float(cards)
            }
            saveData()
            fechData()
        } catch {
            print("\(error)")
        }
    }
    
    func addringCalories(calories:CGFloat){
        let newcal = NSFetchRequest<ValueEntity>(entityName: "ValueEntity")
        do{
            let result = try contanier.viewContext.fetch(newcal)
            if let entity = result.first{
                entity.ring += Float(Int(calories))
            }else{
                let newEntity = ValueEntity(context: contanier.viewContext)
                newEntity.ring = 10
            }
        }catch{
            print("\(error)")
        }
        saveData()
        fechData()
    }
    
    func addmealToggle(meal:BreakfastEntity){
        meal.addmale.toggle()
        saveData()
    }
    
    func saveData(){
        do {
            try contanier.viewContext.save()
        }catch{
            print("Save data failed \(error)")
        }
    }
    
}

