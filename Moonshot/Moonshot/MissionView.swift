//
//  MissionView.swift
//  Moonshot
//
//  Created by Mishoni Mihaylov on 19.12.24.
//

import SwiftUI

struct MissionView: View {
    struct CrewMember{
        let role: String
        let astronaut: Astronaut
    }
    let crew: [CrewMember]
    let mission: Mission
    
    var body: some View {
        ScrollView{
            VStack{
                Image(mission.image)
                    .resizable()
                    .scaledToFit()
                    .containerRelativeFrame(.horizontal){
                        width, axis in
                        width * 0.6
                    }
                Text(mission.fomattedLaunchDate)
                    .font(.headline .bold())
                    .padding(.top)
                
                VStack(alignment: .leading){
                    DividerView()
                    
                    Text("Mission Highlights")
                        .font(.title.bold())
                        .padding(.bottom,5)
                    
                    Text(mission.description)
                    
                    DividerView()
                    
                    
                    Text("Crew")
                        .font(.title.bold())
                        .padding(.bottom,5)
                }
                .padding(.horizontal)
               
                CrewScrollView(crew: crew)
            
            }
            .padding(.bottom)
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
    init(mission: Mission, astronauts: [String: Astronaut]){
        self.mission = mission
        self.crew = mission.crew.map{member in
            if let astronaut = astronauts[member.name]{
                return CrewMember(role: member.role, astronaut: astronaut)
            }else{
                fatalError("We are missin \(member.name)")
            }
        }
    }
}

#Preview {
    
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let astronauts: [String:Astronaut] = Bundle.main.decode("astronauts.json")
    
    MissionView(mission: missions[0],astronauts: astronauts)
        .preferredColorScheme(.dark)
}
