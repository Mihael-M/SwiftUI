//
//  MainViewGrid.swift
//  Moonshot
//
//  Created by Mishoni Mihaylov on 19.12.24.
//

import SwiftUI

struct MainViewGrid: View {
    let astronauts: [String: Astronaut]
    let missions: [Mission]
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    var body: some View {
        NavigationStack{
            ScrollView{
                LazyVGrid(columns: columns){
                    ForEach(missions){ mission in
                        NavigationLink{
                            MissionView(mission: mission, astronauts: astronauts)
                        }
                    label:
                        {
                            VStack{
                                Image(mission.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                    .padding()
                                
                                VStack{
                                    Text(mission.displayName)
                                        .font(.headline)
                                        .foregroundStyle(.white)
                                    
                                    Text(mission.fomattedLaunchDate)
                                        .font(.caption)
                                        .foregroundStyle(.gray)
                                }
                                .padding(.vertical)
                                .frame(maxWidth: .infinity)
                                .background(.lightBackground)
                            }
                            .clipShape(.rect(cornerRadius:  10))
                            .overlay(RoundedRectangle(cornerRadius: 10)
                                .stroke(.lightBackground))
                            
                        }
                    }
                }
                .padding([.horizontal,.bottom])
                
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
        }
    }
}

#Preview {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    MainViewGrid(astronauts: astronauts, missions: missions)
}
