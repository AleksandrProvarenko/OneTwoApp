//
//  AuthService.swift
//  onetwo
//
//  Created by Alex Provarenko on 29.12.2022.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore


class AuthService {
    
    public static let shared = AuthService()
    private init() {}
    
    //MARK: - Registration Users
    
    public func registerUser(with userRequets: RegisterUserRequest,
                             completion: @escaping (Bool, Error?) -> Void) {
        
        let email = userRequets.email
        let password = userRequets.password
        let confirmPassword = userRequets.confirmPassword
        
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                completion(false, error)
                return
            }
            
            guard let resultUser = result?.user else {
                completion(false, nil)
                return
            }
            
            let dataBase = Firestore.firestore()
            dataBase.collection("users")
                .document(resultUser.uid)
                .setData(["email": email,
                          "password": password,
                          "confirmPassword": confirmPassword]) { error in
                    if let error = error {
                        completion(false, error)
                        return
                    }
                    
                    completion(true, nil)
                }
        }
    }
    
    //MARK: - Log In Users
    
    public func logInUser(with userRequest: LogInUserRequest,
                          completion: @escaping (Error?) -> Void) {
        
        Auth.auth().signIn(withEmail: userRequest.email,
                           password: userRequest.password) { result, error in
            if let error = error {
                completion(error)
                return
            } else {
                completion(nil)
            }
        }
    }
    
    //MARK: - Sign Out Method
    
    public func signOut(completion: @escaping (Error?) -> Void) {
        do {
            try Auth.auth().signOut()
            completion(nil)
        } catch let error {
            completion(error)
        }
    }
}
