import UIKit

class ReviewTVC: UITableViewController {
    
    var reviews: [Feedback] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        reviews = FeedbackData.shared.feedbacks
        tableView.reloadData()
        tableView.register(UINib(nibName: "ReviewTableViewCell", bundle: nil),
                           forCellReuseIdentifier: "ReviewTableViewCell")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FeedbackData.shared.feedbacks.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewTableViewCell", for: indexPath)
        as! ReviewTableViewCell
        
        let review = reviews[indexPath.row]
        cell.numberLbl.text = "\(indexPath.row + 1)"
        cell.reviewLbl.text = review.text
        cell.emogiLbl.text = review.mark
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            FeedbackData.shared.feedbacks.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
