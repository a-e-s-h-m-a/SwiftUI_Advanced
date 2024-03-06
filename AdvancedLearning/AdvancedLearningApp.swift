//
//  AdvancedLearningApp.swift
//  AdvancedLearning
//
//  Created by Malith Madhushanka on 2023-12-08.
//

import SwiftUI

@main
struct AdvancedLearningApp: App {
    let currentUserIsSignedIn: Bool
    
    init() {
        /*
         Two ways of acessing arguments
         */
        
        // let userIsSignedIn: Bool = CommandLine.arguments.contains("-UITests_startSignedIn") ? true : false
        let userIsSignedIn = ProcessInfo.processInfo.arguments.contains("-UITests_startSignedIn") ? true : false
//        let value = ProcessInfo.processInfo.environment["-UITests_startSignedIn2"]
//        let userIsSignedIn = value == "true"
        self.currentUserIsSignedIn = userIsSignedIn
    }
    
    var body: some Scene {
        WindowGroup {
            //UITestingBootcampView(currentUserIsSignedIn: currentUserIsSignedIn)
            PropertyWrappersBootcamp2()
        }
    }
}
