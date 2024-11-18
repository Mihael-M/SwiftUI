import SwiftUI
import Foundation



struct StoryPageView: View {
    
    let story: Story
    let pageIndex : Int
    
    var body: some View {
        
        VStack {
            Spacer()
            Text(story.pages[pageIndex].text)
                .padding()
                .background(Color.white)
                            .foregroundColor(.green)
                            .font(.custom("Party let", size: 24))
                            .cornerRadius(25)
                            .shadow(radius: 1, x: 15, y: 20)
                                
            Spacer()
            ForEach(story[pageIndex].choices, id: \Choice.text) {
                choice in NavigationLink(destination: StoryPageView(story: story, pageIndex: choice.destination)) {
                    
                    Text(choice.text)
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .cornerRadius(8)
                        .background(Color.green.opacity(0.8))
                        .foregroundColor(.white)
                        .font(.custom("Party let", size: 22))
                        .cornerRadius(25)
                        .shadow(radius: 30)
                }
            }
        }
        .padding()
        .navigationTitle("\(Text(story.pages[pageIndex].label))") .font(.custom("Party let", size: 24)) .background(Color.green.opacity(0.35))
        .foregroundColor(.white)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .background(Image("background")
            .resizable()
            .ignoresSafeArea())
        
        
    }
}

struct NonlinearStory_Previews: PreviewProvider {
    static var previews: some View {
        StoryPageView(story: story, pageIndex: 0)
    }
}
