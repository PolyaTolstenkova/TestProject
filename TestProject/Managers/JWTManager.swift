//
//  JWTManager.swift
//  TestProject
//
//  Created by Полина Толстенкова on 08.03.2023.
//

import Foundation
import SwiftJWT

class JWTManager {
    
   private func generateJWTSecretKey() -> Data {
       let secret = "jwt_secret".localized
        let secretData = secret.data(using: .utf8)
        if let secretData = secretData {
            let base64EncodedString = secretData.base64EncodedString()
            let data = base64EncodedString.data(using: .utf8)!
            return data
        }
        return Data()
    }

    func generateJWTToken() -> String {
        let header = Header(typ: "jwt_typ".localized)
        let claims = CustomClaims(
            uid: "jwt_uid".localized,
            identity: "jwt_identity".localized
        )
        
        var jwt = JWT(header: header, claims: claims)
        if let token = try? jwt.sign(using: .hs256(key: generateJWTSecretKey())) {
            return token
        }
        
        return ""
    }
}
