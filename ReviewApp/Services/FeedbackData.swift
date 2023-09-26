import UIKit

class FeedbackData {
    
    static var shared = FeedbackData()
    private let userDefaults = UserDefaults.standard
    private let key = "feedbacks"
    var feedbacks: [Feedback] {
        get {
            if let savedData = userDefaults.data(forKey: key),
               let savedFeedbacks = try? JSONDecoder().decode([Feedback].self, from: savedData)
            { return savedFeedbacks }
            else { return [] }
        }
        set { if let encodedReviews = try? JSONEncoder().encode(newValue) {
            userDefaults.set(encodedReviews, forKey: key)
        }
    }
}
    func addFeedback(_ feedback: Feedback) {
            var updatedFeedbacks = feedbacks
            updatedFeedbacks.append(feedback)
            feedbacks = updatedFeedbacks
    }
}


  
