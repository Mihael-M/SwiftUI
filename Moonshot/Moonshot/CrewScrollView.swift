//
//  CrewScrollView.swift
//  Moonshot
//
//  Created by Mishoni Mihaylov on 19.12.24.
//

import SwiftUI

struct CrewScrollView: View {
    let crew: [MissionView.CrewMember]
    var body: some View {
        ScrollView(.horizontal,showsIndicators: false)
        {
            HStack{
                
                ForEach(crew, id: \.role){member in
                    NavigationLink{
                        AstronautView(astronaut: member.astronaut)
                    }label:{
                        HStack{
                            Image(member.astronaut.id)
                                .resizable()
                                .frame(width: 104, height: 72)
                                .clipShape(.capsule)
                                .overlay(
                                    Capsule()
                                        .strokeBorder(.white,lineWidth: 1)
                                )
                            
                            VStack(alignment: .leading){
                                 Text(member.astronaut.name)
                                    .font(.headline)
                                    .foregroundStyle(.white)
                                
                                Text(member.role)
                                    .foregroundStyle(.gray)
                            }
                            
                        }
                        .padding(.horizontal)
                        
                    }
                }
            }
        }
    }
}


