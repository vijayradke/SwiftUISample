//
//  User.swift
//  Basics
//
//  Created by Gourav on 17/06/22.
//

import SwiftUI
import Combine

class User:  ObservableObject {
    
    @Published var email = ""
    @Published var phone = ""
    @Published var language = ""
    @Published var countryCode = ""
    @Published var city = ""
    
    @Published var showEmailError = false
    @Published var showPhoneError = false
    @Published var showLanguageError = false
    @Published var showCountryCodeError = false
    @Published var showCityError = false
    
    
    @Published var inlineEmailError = "Email is empty."
    @Published var inlinePhoneError = "Phone is empty."
    @Published var inlineLanguageError = "Language is empty."
    @Published var inlineCountryCodeError = "Country code is empty."
    @Published var inlineCityError = "City is empty."
    
    @Published var isValid = false
    @Published var allsatify = false
    
    private var cancellableSet: Set<AnyCancellable> = []
    
    var countries : [String] = []

    func getCountries() {
        if let fileLocation = Bundle.main.url(forResource: "Countries", withExtension: "json") {

            // do catch in case of error
            do {
                let data = try Data(contentsOf: fileLocation)
                let jsonDecoder = JSONDecoder()
                let dataFromJson = try jsonDecoder.decode([[String]].self, from: data)
               print(dataFromJson)
                self.countries = dataFromJson.map({$0[0]})
            } catch {
                print(error)
            }
        }
    }
    
    init(){
        
        getCountries()
        
        validatedEmail
            .dropFirst()
            .receive(on: RunLoop.main)
            .map { emailCheck in
                switch emailCheck {
                case .empty:
                    self.showEmailError = true
                    return "Email is empty."
                case .notValid:
                    self.showEmailError = true
                    return "Email is incorrect"
                default:
                    self.showEmailError = false
                    return ""
                }
            }
            .assign(to: \.inlineEmailError, on: self)
            .store(in: &cancellableSet)
        
        validatedLanguage
            .dropFirst()
            .receive(on: RunLoop.main)
            .map { languageCheck in
                switch languageCheck {
                case .empty:
                    self.showLanguageError = true
                    return "Language is empty."
                default:
                    self.showLanguageError = false
                    return ""
                }
            }
            .assign(to: \.inlineLanguageError, on: self)
            .store(in: &cancellableSet)
        
        
        validatedCity
            .dropFirst()
            .receive(on: RunLoop.main)
            .map { cityCheck in
                switch cityCheck {
                case .empty:
                    self.showCityError = true
                    return "City is empty."
                default:
                    self.showCityError = false
                    return ""
                }
            }
            .assign(to: \.inlineCityError, on: self)
            .store(in: &cancellableSet)
        
        validatedCountryCode
            .dropFirst()
            .receive(on: RunLoop.main)
            .map { countryCodeCheck in
                switch countryCodeCheck {
                case .empty:
                    self.showCountryCodeError = true
                    return "Country code is empty."
                default:
                    self.showCountryCodeError = false
                    return ""
                }
            }
            .assign(to: \.inlineCountryCodeError, on: self)
            .store(in: &cancellableSet)
        
        validatedPhone
            .dropFirst()
            .receive(on: RunLoop.main)
            .map { phoneCheck in
                switch phoneCheck {
                case .empty:
                    self.showPhoneError = true
                    return "Phone is empty."
                default:
                    self.showPhoneError = false
                    return ""
                }
            }
            .assign(to: \.inlinePhoneError, on: self)
            .store(in: &cancellableSet)
        
        
        readyToSubmit
            .receive(on: RunLoop.main)
            .assign(to: \.isValid, on: self)
            .store(in: &cancellableSet)
    }
    
    //MARK: Define our validation streams
    
    /// - return the language as a string if the language are good, and nil if the language is empty or bad.
    var validatedLanguage: AnyPublisher<TextFieldCheck, Never> {
        
        //First, we access the Publisher using the $ symbol. Then we use the map operator to check if the entry met our validation or not. And finally, we use eraseToAnyPublisher to return the new publisher.
        return $language
            .map { language in
                
                guard !language.isEmpty else {
                    
                    return .empty
                }
                return .valid
            }
            .eraseToAnyPublisher()
    }
    
    
    /// - return the country code as a string if the country code are good, and nil if the country code is empty or bad.
    var validatedCountryCode: AnyPublisher<TextFieldCheck, Never> {
        
        //First, we access the Publisher using the $ symbol. Then we use the map operator to check if the entry met our validation or not. And finally, we use eraseToAnyPublisher to return the new publisher.
        return $countryCode
            .map { countryCode in
                
                guard !countryCode.isEmpty  else {
                    
                    return .empty
                }
                return .valid
            }
            .eraseToAnyPublisher()
    }
    
    /// - return the city name as a string if the city name are good, and nil if the city name is empty or bad.
    var validatedCity: AnyPublisher<TextFieldCheck, Never> {
        
        //First, we access the Publisher using the $ symbol. Then we use the map operator to check if the entry met our validation or not. And finally, we use eraseToAnyPublisher to return the new publisher.
        return $city
            .map { city in
                
                guard !city.isEmpty else {
                    
                    return .empty
                }
                return .valid
            }
            .eraseToAnyPublisher()
    }
    
    /// - return the phone as a string if the phone are good, and nil if the phone is empty or bad.
    var validatedPhone: AnyPublisher<TextFieldCheck, Never> {
        
        //First, we access the Publisher using the $ symbol. Then we use the map operator to check if the entry met our validation or not. And finally, we use eraseToAnyPublisher to return the new publisher.
        return $phone
            .map { phone in
                
                guard !phone.isEmpty else {
                    
                    return .empty
                }
                return .valid
            }
            .eraseToAnyPublisher()
    }
    
    /// - return the username as a string if the username are good, and nil if the username is empty or bad.
    var validatedEmail: AnyPublisher<TextFieldCheck, Never> {
        
        //First, we access the Publisher using the $ symbol. Then we use the map operator to check if the entry met our validation or not. And finally, we use eraseToAnyPublisher to return the new publisher.
        return $email
            .map { email in
                
                guard !email.isEmpty else {
                    
                    return .empty
                }
                
                guard isValidEmail(testStr: email) else {
                    return .notValid
                }
                
                
                return .valid
            }
            .eraseToAnyPublisher()
    }
    
    
    //MARK: Combining the results
    var readyToSubmit: AnyPublisher<Bool, Never> {
        return Publishers.CombineLatest4(validatedCountryCode,validatedPhone,validatedCity,validatedLanguage)
            .map {countryCode, phone, city,language in
                let conditions = [countryCode,phone,city,language]
//

                let allValid = conditions.allSatisfy { txt in
                    return txt == .valid
                }
                print("all valid \(allValid)")
                return allValid

//                return false

//                if email == .valid {
//                    return true
//                }else if city == .valid {
//                    return true
//                }else if language == .valid {
//                    return true
//                }else if countryCode == .valid {
//                    return true
//                }else if validatedPhone == .valid {
//                    return true
//                }
//                else {
//                    return false
//                }

             //  return (countryCode == .valid && validatePhone == .valid)
            }
            .eraseToAnyPublisher()
    }

    var  publisher1 :AnyPublisher<Bool,Never> {

        return Publishers.CombineLatest3(validatedCountryCode, validatedPhone, validatedCity)
            .map { countryCode, phone, city  in
                let conditions = [countryCode,phone,city]
    
                let allValid = conditions.allSatisfy { txt in
                    return txt == .valid
                }
                print("all valid \(allValid)")
                return allValid
            }
            .eraseToAnyPublisher()
    }
//
//    var publisher2 :AnyPublisher<Bool,Never>{
//        return Publishers.CombineLatest(validatedLanguage,validatedEmail)
//        .map { language, email in
//            return (language == .isValid && email == .isValid)
//        } .eraseToAnyPublisher()
//    }
//
//    var readyToSubmit : AnyPublisher<Bool,Never>{
//        return     publisher1.combineLatest(publisher2)
//        //.debounce(for: 0.3, scheduler: DispatchQueue.main)
//        .assign(to: \.isValid, on: self)
//        .store(in: &cancellableSet)
//    }
}


