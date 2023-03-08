//
//  CustomClaims.swift
//  TestProject
//
//  Created by Полина Толстенкова on 08.03.2023.
//

import Foundation
import SwiftJWT

struct CustomClaims: Claims {
    let uid: String
    let identity: String
}
