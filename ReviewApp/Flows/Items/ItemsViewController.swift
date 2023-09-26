import UIKit

class ItemsViewController: UITableViewController {
    
    var items: [Item] { ItemsData.shared.items }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { items.count }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let item = items[indexPath.row]
        CellManager.configure(cell: cell, with: item)
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow,
        let detailViewController = segue.destination as? DetailViewController else {return}
        detailViewController.index = indexPath.row
    }
}
