import Foundation
import SwiftUI


struct FlagImage: View {
    var countries: [String]
    var number: Int
    var body: some View {
        Image(countries[number])
            .clipShape(.capsule)
            .shadow(radius: 5)
    }
}

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var score: Int = 0
    @State private var restart: Bool = false
    @State private var game:Int = 1
    func flagTapped(_ number: Int){
        if number == correctAnswer{
            scoreTitle = "Correct!"
            self.score += 10
            game += 1
            showingScore = true
            if game == 9 {
                restart = true
                showingScore = false
            }
        } else {
            scoreTitle = "Wrong!"
            showingScore = true
            
            game += 1
            
            if game == 9 {
                restart = true
                showingScore = false
            }
        }
    }
    func askQuestion(){
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        if game == 9 {
            game = 1
            score = 0
        }
    }
    
    @State private var showingScore = false
    @State private var scoreTitle: String = ""
    
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red:0.1, green:0.2, blue:0.45),location: 0.3),
                .init(color: Color(red:0.76, green:0.15, blue:0.26),location: 0.3)
                ], center: .top, startRadius: 200, endRadius: 700)
                .ignoresSafeArea()
            VStack {
                Spacer()
                Text("Guess the Flag")
                    .foregroundStyle(.white)
                    .font(.largeTitle.bold())
                VStack (spacing: 15){
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        
                        Text(countries[correctAnswer])
                            
                            .font(.largeTitle.weight(.semibold))
                        
                    }
                    ForEach(0..<3){number in
                        Button
                        {
                            flagTapped(number)
                        }
                        label:{
                            FlagImage(countries: countries, number: number)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))
                
                Spacer()
                Spacer()
                Text("Game: \(game)")
                    .foregroundStyle(.white)
                    .font(.title.bold())
                
                Text("Score: \(score)")
                    .foregroundStyle(.white)
                    .font(.title.bold())
                Spacer()
            }
            .padding()
        }
        
            .alert(scoreTitle, isPresented: $showingScore){
                Button("Continue",action: askQuestion)
            }
            message:{
                    Text("Your score is \(score)")
        }
            .alert(scoreTitle, isPresented: $restart){
                Button("New Game",action: askQuestion)
            }
            message:{
                    Text("Your score: \(score)")
        }
    }
}

#Preview {
    ContentView()
}
