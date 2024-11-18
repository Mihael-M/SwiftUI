import SwiftUI
import Foundation


struct StoryView: View {
    var body: some View {
       
        NavigationStack {
            
            ZStack {
                Image("appstart")
                    .resizable()
                    .ignoresSafeArea()
                
                
                VStack {
                    Spacer()
                    
                    NavigationLink {
                        StoryPageView(story: story, pageIndex : 0)
                        
                    }
                label:
                    {
                        Text("Start Adventure")
                            .font(.title2)
                            .padding()
                            .background(Color.green.opacity(0.8))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding(80)
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        StoryView()
    }
}
