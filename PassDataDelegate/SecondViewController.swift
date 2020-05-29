

import UIKit

protocol detailDelegate {
    func passData(data: String)
    
}
class SecondViewController: UIViewController {
    @IBOutlet weak var textFieldSecond: UITextField!
    @IBOutlet weak var imageSecond: UIImageView!
    var dataSecond: String?
    var dataImage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if dataSecond != nil {
            textFieldSecond.text = dataSecond
        }
        if dataImage != nil {
            imageSecond.image = UIImage(named: dataImage ?? "hinh1a")
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    var delegate: detailDelegate?
    
    // mấy cái dòng cuối naỳ chưa hiểu lắm
    @IBAction func btDelegateToViewcontroller() {
        self.delegate?.passData(data: textFieldSecond.text!)
        dismiss(animated: true, completion: nil)
    }
}

