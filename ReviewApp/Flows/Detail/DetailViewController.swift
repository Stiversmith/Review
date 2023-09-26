import UIKit

class DetailViewController: UIViewController {
    
    var index: Int!
    var item: Item {
        ItemsData.shared.items[index]
    }
    
    @IBOutlet weak var itemStackView: UIStackView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var ratingLbl: UILabel!
    @IBOutlet weak var showReviwBtn: UIButton!
    @IBOutlet weak var saveBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI(with: view.bounds.size)
        showReviwBtn.isEnabled = true
        ratingLbl.text = "\(item.rating)"
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        updateUI(with: size)
    }
    
    private func updateUI(with size: CGSize){
        let isVertical = size.width < size.height
        itemStackView.axis = isVertical ? .vertical : .horizontal
        title = item.name
        imageView.image = item.image
        nameLbl.text = item.name
        priceLbl.text = item.price.description + " USD"
        ratingLbl.text = item.rating
        showReviwBtn.setTitle("Show (\(FeedbackData.shared.feedbacks.count)) reviews", for: .normal)
        showReviwBtn.isEnabled = item.feedbacks.count != 0
    }
}
