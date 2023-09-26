import Foundation

struct Feedback: Codable {
    private var date = Date()
    let text: String
    let mark: String
    init(text: String, mark: String) {
        self.text = text
        self.mark = mark
    }
}


