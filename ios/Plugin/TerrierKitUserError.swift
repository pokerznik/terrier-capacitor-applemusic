//
//  TerrierKitUserError.swift
//  Plugin
//
//  Created by Zan Pokerznik on 28/05/2020.
//  Copyright © 2020 Max Lynch. All rights reserved.
//

import Foundation

enum TerrierKitUserError : Error
{
    case developerTokenIsNullOrEmpty
    case developerTokenNotValid
    case userNotAuthorized
}
