//
//  UserCredentialsService.swift
//  Commons
//
//  Created by Evgeny Boganov on 05/12/2018.
//  Copyright © 2018 Mirapolis. All rights reserved.
//

import Foundation

class UserCredentialsService {
    
    private let serviceName = "MirapolisLMS"
    private let serverKey = "credentialsServerKey"
    private let loginKey = "credentialsLoginKey"
    
    func getSavedUserCredentials() -> LoginData? {
        if let storedServer = UserDefaults.standard.value(forKey: serverKey) as? String,
            let storedLogin = UserDefaults.standard.value(forKey: loginKey) as? String {
            let passwordItem = KeychainPasswordItem(service: serviceName, account: storedLogin)
            
            return LoginData(server: storedServer,
                             login: passwordItem.account,
                             password: (try? passwordItem.readPassword()) ?? "")
            
        } else {
            return nil
        }
    }
    
    func saveUserCredentials(_ loginData: LoginData) {
        do {
            UserDefaults.standard.setValue(loginData.server, forKey: serverKey)
            UserDefaults.standard.setValue(loginData.login, forKey: loginKey)
            var passwordItem = KeychainPasswordItem(service: serviceName, account: loginData.login)
            try passwordItem.renameAccount(loginData.login)
            try passwordItem.savePassword(loginData.password)
        } catch {
            fatalError("Error updating keychain - \(error)")
        }
    }
    
    func removeAllSavedPasswords() {
        if let items = try? KeychainPasswordItem.passwordItems(forService: serviceName) {
            items.forEach {
                try? $0.deleteItem()
            }
        }
    }
    
    func removeSavedPassword(for server: String) {
        let item = KeychainPasswordItem(service: serviceName, account: server)
        try? item.deleteItem()
    }
}
