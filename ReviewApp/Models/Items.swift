import UIKit

struct Item {
    let name: String
    let price: Double
    let image: UIImage?
    var feedbacks: [Feedback] = []
    var rating: String {
        if feedbacks.isEmpty { return "🙄" } else { let totalRating = feedbacks.reduce(0) {
            total, feedback in
                if let mark = Int(feedback.mark) {
                    return total + mark
                } else { return total }
            }
            let averageRating = Double(totalRating) / Double(feedbacks.count)
            let roundedRating = Int(floor(averageRating))
            
            switch roundedRating {
            case 1:
                return "🤮"
            case 2:
                return "😊"
            case 3:
                return "😍"
            default:
                return "🤷‍♂️"
            }
        }
    }
}
