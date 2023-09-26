
import UIKit

class CellManager {
    static func configure(cell: UITableViewCell, with item: Item) {
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = "\(item.price) USD\n\(item.rating)"
        cell.imageView?.image = item.image
    }
}
