//
//  ContentView.swift
//  Moonshot
//
//  Created by Mishoni Mihaylov on 19.12.24.
//

import SwiftUI

struct ContentView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    @State private var selectedView: Bool = true
    var body: some View {
        NavigationStack{
            ZStack{
                if selectedView {
                    MainViewGrid(astronauts: astronauts, missions: missions)
                }
                else{
                    MainViewList(astronauts: astronauts, missions: missions)
                }
            }
            .toolbar{
                Button{
                    selectedView.toggle()
                }
            label:
                {
                    HStack{
                        Image(systemName: selectedView ? "list.bullet" : "square.grid.2x2.fill")
                    }
                }
            }
        }
       
        
        
    }
    
}

#Preview {
    ContentView()
}
