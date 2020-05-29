

import UIKit

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource, detailDelegate {
    
    @IBOutlet weak var tableview: UITableView!
    
    var arrayName: [String] = ["mot","hai","ba","bon"]
    var arrayImage: [String] = ["hinh1a","hinh2a","hinh3a","hinh4a"]
    // method delegate
    // phương thức lấy data từ second
    func passData(data: String) {
        if let indexView = tableview.indexPathForSelectedRow {
            // hàm dưới là hàm lâý data từ second
            self.arrayName[indexView.row] = data
            
        } else {
            arrayName.append(data)
            tableview.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.dataSource = self
        tableview.delegate = self
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IDCell", for: indexPath) as? TableViewCell
        cell?.textLabel?.text = arrayName[indexPath.row]
        cell?.imageView?.image = UIImage(named: arrayImage[indexPath.row])
        return cell!
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let segueToSecond = segue.destination as? SecondViewController
        // ham dupi la ham truyen data di
        if let indexview = tableview.indexPathForSelectedRow {
            segueToSecond?.dataSecond = arrayName[indexview.row]
            segueToSecond?.dataImage = arrayImage[indexview.row]
        }
        
         // ham duoi la ham truyen data ve.
        // self ở đây là viewcontroller ak, hàm đưới có nghĩa class viewcontroller đóng vai trò là delegate.
        // no nhu kieu datasource de hieu may dong ta viet la gi
        segueToSecond?.delegate = self
        
        tableview.reloadData()
    }
    
    
    


}

