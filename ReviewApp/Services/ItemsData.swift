
import Foundation

class ItemsData {
    static let shared = ItemsData()
    var items: [Item]
    private init() {
        items = [Item(name: "XB8 Modem", price: 260, image: #imageLiteral(resourceName: "XB8 Modem.png")),
                 Item(name: "XB7 Modem", price: 220, image: #imageLiteral(resourceName: "XB7 Modem.png")),
                 Item(name: "XB6 Modem", price: 180, image: #imageLiteral(resourceName: "XB7 Modem.png"))]
    }
}
