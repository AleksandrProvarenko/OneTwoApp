//
//  AlertManager.swift
//  onetwo
//
//  Created by Alex Provarenko on 29.12.2022.
//

import UIKit

class AlertManager {
    private static func showBasicAlert(on vc: UIViewController,
                                       title: String,
                                       message: String?) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
            vc.present(vc, animated: true)
        }
    }
}

//MARK: - Show Validation Alert

extension AlertManager {
    public static func showInvalidEmailAlert(on vc: UIViewController) {
        self.showBasicAlert(on: vc, title: "Invalid Email", message: "Please enter a valid email.")
    }
    
    public static func showInvalidPasswordAlert(on vc: UIViewController) {
        self.showBasicAlert(on: vc, title: "Invalid Password", message: "Please enter a valid password")
    }
    
    public static func showConfirmPasswordAlert(on vc: UIViewController) {
        self.showBasicAlert(on: vc, title: "Password confirmation is not correct", message: "Please enter a valid password confirmation.")
    }
}

//MARK: - Show Registration Errors

extension AlertManager {
    public static func showRegistrationErrorAlert(on vc: UIViewController) {
        self.showBasicAlert(on: vc, title: "Unknown Registration Error", message: nil)
    }
    
    public static func showRegistrationError(on vc: UIViewController, with error: Error) {
        self.showBasicAlert(on: vc, title: "Unknown Registration Error", message: "\(error.localizedDescription)")
    }
}

//MARK: - Log In Errors

extension AlertManager {
    public static func showSignInErrorAlert(on vc: UIViewController) {
        self.showBasicAlert(on: vc, title: "Unknown Error Sign In", message: nil)
    }
    
    public static func showSignInErrorAlert(on vc: UIViewController, with error: Error) {
        self.showBasicAlert(on: vc, title: "Unknown Error Sign In", message: "\(error.localizedDescription)")
    }
}

//MARK: - Fatching User Errors

extension AlertManager {
    public static func showFatchingUsererrors(on vc: UIViewController, with error: Error) {
        self.showBasicAlert(on: vc, title: "Error Fatching User", message: "\(error.localizedDescription)")
    }
    
    public static func showUnknownFatchingUserErrors(on vc: UIViewController) {
        self.showBasicAlert(on: vc, title: "Unknown Error Sign In", message: nil)
    }
}

