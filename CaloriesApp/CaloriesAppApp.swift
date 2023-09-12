//
//  CaloriesAppApp.swift
//  CaloriesApp
//
//  Created by Eslam Ghazy on 3/9/23.
//

import SwiftUI

@main
struct CaloriesAppApp: App {
    @StateObject var vm:cddatamodel = cddatamodel()
    var body: some Scene {
        WindowGroup {
            ContentView()
            /// to not make new instance every time ->  make it as environmentObject
                .environmentObject(cddatamodel())
        }
    }
}
