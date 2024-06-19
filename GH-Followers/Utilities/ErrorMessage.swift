//
//  ErrorMessage.swift
//  GH-Followers
//
//  Created by Abdelrahman Esmail on 19/06/2024.
//

import Foundation

enum GFError: String, Error {
    case invaildUsername = "This username created an invaild request, Please Try again."
    case unableToComplete = "Unable to complete your request, Please Check your internet connection."
    case invaildResponse = "Invaild response from the server, Please try again."
    case invaildData = "The data recieved from the server is invalid, Please try again."
}
