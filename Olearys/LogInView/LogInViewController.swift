import UIKit

class LogInViewController: UIViewController {
  
  let buildTablesInFB = BuildTablesInFb()
  @IBOutlet weak var usernameTextField: UITextField!
  @IBOutlet weak var passWordTextField: UITextField!
   
  override func viewDidLoad() {
    super.viewDidLoad()

    
   // buildTablesInFB.buildTables(tableQuantity: 35)
    giveTextfieldPlaceHolderSize()
      
    
  }
  
  @IBAction func LogInButton(_ sender: Any) {
      
   
      
    ControlInputManager.controllInput(userNameTextField:usernameTextField, passWrordTextField: passWordTextField , viewController: self)
      
      
  }
  
    // Dismiss keyboard on touching screen.
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
  func giveTextfieldPlaceHolderSize() {
    let deviceManager = DeviceManager()
    usernameTextField.font = UIFont.systemFont(ofSize: CGFloat(deviceManager.placeholderSize))
    passWordTextField.font = UIFont.systemFont(ofSize: CGFloat(deviceManager.placeholderSize))
  }
  
  override func viewWillAppear(_ animated: Bool) {
    usernameTextField.text = Constance.emptyText
    passWordTextField.text = Constance.emptyText
  }
}
