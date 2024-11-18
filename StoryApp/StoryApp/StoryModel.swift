import Foundation

struct Story{
    let pages: [StoryPage]
    
    subscript(_ pageIndex: Int) -> StoryPage {
            return pages[pageIndex]
        }
}

struct StoryPage{
    let label: String
    let text: String
    
    let choices:[Choice]
    init(title:String, label: String, choices: [Choice]){
        self.label = title
        self.text = label
        self.choices = choices
    }
}

struct Choice{
    let text: String
    let destination: Int
}

