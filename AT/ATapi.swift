//
//  ATapi.swift
//  AT
//
//  Created by Askhat Bolatkhan on 6/26/17.
//  Copyright © 2017 Askhat Bolatkhan. All rights reserved.
//
import Moya

enum ATapi {
    case makeRequest(fullName: String, email: String, phoneNumber: String, message: String, tour: Int)
}
// MARK: - TargetType Protocol Implementation
extension ATapi: TargetType {
    var baseURL: URL { return URL(string: "http://108.61.179.192/")! }
    var path: String {
        switch self {
        case .makeRequest:
            return "api/tours/book"
        }
    }
    var method: Moya.Method {
        switch self {
        case .makeRequest:
            return .post
        }
    }
    var parameters: [String: Any]? {
        switch self {
        case .makeRequest(let fullName,let email, let phoneNumber, let message, let tour):
            return ["name": fullName, "email": email, "phone_number": phoneNumber, "message": message, "tour": tour]
        }
    }
    var parameterEncoding: ParameterEncoding {
        switch self {
            case .makeRequest:
            return JSONEncoding.default // Send parameters as JSON in request body
        }
    }
    var sampleData: Data {
       return "Sample data isn't loaded".utf8Encoded
    }
    var task: Task {
        return .request
    }
}
// MARK: - Helpers
private extension String {
    var urlEscaped: String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
    
    var utf8Encoded: Data {
        return self.data(using: .utf8)!
    }
}
