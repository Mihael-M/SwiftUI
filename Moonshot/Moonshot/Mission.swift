//
//  Mission.swift
//  Moonshot
//
//  Created by Mishoni Mihaylov on 19.12.24.
//

import Foundation
import SwiftUI

struct Mission: Codable, Identifiable {
    
    struct CrewRole: Codable {
        let name: String
        let role: String
        
        
    }

    let id: Int
    let launchDate: Date?
    let crew: [CrewRole]
    let description: String
    
    var displayName: String{
        "Apollo \(id)"
    }
    
    var image: String{
        "apollo\(id)"
    }
    
    var fomattedLaunchDate: String{
        launchDate?.formatted(date: .abbreviated,time: .omitted) ?? "N/A"
    }
}
