import UIKit

class FeedbackVC: UIViewController, UITextViewDelegate {

    var reviewText: String?
    var selectedSegmentValue: String?
    
    @IBOutlet weak var textTV: UITextView!
    @IBOutlet weak var errorLbl: UILabel!
    @IBOutlet weak var emogiC: UISegmentedControl!
    @IBOutlet weak var saveBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textTV.delegate = self
        saveBtn.isEnabled = false
    }
    
    func textViewDidChange(_ textView: UITextView) {
        if textView.text.count >= 20 {
            errorLbl.isHidden = true
            saveBtn.isEnabled = true
        } else {
            errorLbl.isHidden = false
            saveBtn.isEnabled = false
        }
    }
    
    @IBAction func saveBtbTap(_ sender: Any) {
        if let text = textTV.text,
        text.count >= 20 {
            reviewText = text
            selectedSegmentValue = emogiC.titleForSegment(at: emogiC.selectedSegmentIndex)
            let newReview = Feedback(text: reviewText ?? "", mark: selectedSegmentValue ?? "")
            FeedbackData.shared.addFeedback(newReview)
        }
    }
}
