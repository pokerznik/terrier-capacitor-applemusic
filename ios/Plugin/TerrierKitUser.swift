//
//  TerrierKitUser.swift
//  Plugin
//
//  Created by Zan Pokerznik on 28/05/2020.
//  Copyright © 2020 Max Lynch. All rights reserved.
//

import Foundation
import StoreKit
import Capacitor

public class TerrierKitUser : NSObject {
    private var developerToken: String
    private var userToken: String
    
    private var authorizationStage: Int
    {
        didSet {
            if(self.authorizationStage == 2)
            {
                self.checkDeveloperToken()
                self.authorizationStage = 0
            }
        }
    }
    
    private var authorized: Bool
    {
        didSet {
            onAuthorizationRequested()
        }
    }
    private var cloudController: SKCloudServiceController
    
    public override init() {
        self.authorizationStage = 0
        self.developerToken = ""
        self.userToken = ""
        self.authorized = false
        self.cloudController = SKCloudServiceController()
        super.init()
    }
    
    public func getUserToken () -> String {
        return self.userToken
    }
    
    public func isAuthorized () -> Bool {
        return self.authorized
    }
    
    public func authorize(devToken: String) throws {
        do
        {
            try self.setDeveloperToken(devToken: devToken)
            self.requestAuthorization()
        } catch TerrierKitUserError.developerTokenIsNullOrEmpty {
            throw TerrierKitUserError.developerTokenIsNullOrEmpty
        }
    }
    
    private func postAuthorization() throws -> Void {
        if(!self.authorized) {
            throw TerrierKitUserError.userNotAuthorized
        }
        self.authorizationStage+=1
        self.requestUserToken()
    }
    
    private func checkDeveloperToken()
    {
        if(self.userToken == "") {
            print("Developer token is not valid.")
        }
    }
    
    private func requestAuthorization() -> Void {
        SKCloudServiceController.requestAuthorization(self.authorizationRequested(status:))
    }
    
    private func onAuthorizationRequested() -> Void
    {
        do {
            try self.postAuthorization()
        } catch TerrierKitUserError.userNotAuthorized {
            print("User does not allow access to their library or does not have valid membership.")
        }
        catch {
            print("Unknown error on authorization request.")
        }
    }
    
    private func authorizationRequested(status: SKCloudServiceAuthorizationStatus) -> Void {
        if(status == SKCloudServiceAuthorizationStatus.authorized)
        {
            self.authorized = true
        }
        else {
            self.authorized = false;
        }
    }
    
    private func setDeveloperToken(devToken: String) throws -> Void {
        
        if(devToken == "")
        {
            throw TerrierKitUserError.developerTokenIsNullOrEmpty
        }
        
        self.developerToken = devToken
    }
    
    private func requestUserToken() -> Void {
        self.cloudController.requestUserToken(forDeveloperToken: self.developerToken, completionHandler: self.userTokenRequested(token:error:))
    }
    
    private func userTokenRequested(token: String?, error: Error?) -> Void {
        if(token != nil)
        {
            self.userToken = token!
        }
        
        self.authorizationStage+=1
    }
        
}
