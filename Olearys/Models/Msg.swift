
import Foundation
import UIKit


class Msg {
    
    
    
    static let emptyAccess = "Var vänlig Fyll i ditt lösenord och användarnamn för att logga in"
    static let noAccess = "Du har ej access"
    static let guestDosentOrdered = "Denna gäst har inte beställt något"
    static let tableHaseNoOrder = "Det finns ingen order att skicka"
    static let tableIsTaken = "Detta bordet är upptaget"
    static let emptyusername = "Var vänlig Fyll i ditt användarnamn"
    static let emptypassword = "Var vänlig Fyll i ditt lösenord"
    static let orderDosentDone = "order är inte klar"
    static let guestHaventpaid = "Inte alla gäst har betalt"
    static let areYouSure = "Är du säker du vill skicka beställning till köket ? "
    
    
    static func sendMsg (vc : UIViewController ,  msg : String){
        
        let dialogMessage = UIAlertController(title: "Warning", message: msg, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .default, handler: { (action) -> Void in
        })
        dialogMessage.addAction(ok)
        vc.present(dialogMessage, animated: true, completion: nil)
    }
    
    
    
    
    static func confirmOrder (vc : UIViewController  ,msg : String){
        
        let dialogMessage = UIAlertController(title: Constance.confirm , message: msg,  preferredStyle: .alert)
        
        let noButton = UIAlertAction(title: Constance.no, style: .destructive, handler: { [] (action) -> Void in
        })
        
        let jaButton = UIAlertAction(title: Constance.ja, style: .default, handler: { (action) -> Void in
            
            let takeOrderVC = Singleton.sharedInstance.takeOrderViewController
            let sendOrderToFb = SendOrderToFb()
            let guest = takeOrderVC?.tableViewModel.guest!
            
            if (guest!.sum == 0.0){
                
                // remove last guest in order last kids dosent order
                let guestNumber  = Int (guest!.number)
                let index = guestNumber! - Nr.one
                takeOrderVC!.tableViewModel.guests.remove(at: index)
           
            }
            
          
            
            sendOrderToFb.sendOrderToFireBase(table: takeOrderVC!.tableViewModel)
            
            for vc in takeOrderVC!.navigationController!.viewControllers {
                if let viewController = vc as? MainViewController
                {
                    vc.navigationController?.popToViewController(viewController, animated: true)
                }
            }
            
        })
        
        dialogMessage.addAction(noButton)
        dialogMessage.addAction(jaButton)
        vc.present(dialogMessage, animated: true, completion: nil)
    }
    
    
    
    
    
    
    
    
    
}
