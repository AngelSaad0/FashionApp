//
//  SignInViewModel.swift
//  FashionApp
//
//  Created by Engy on 11/20/24.
//


import Foundation
import AuthenticationServices
import GoogleSignIn
import FBSDKLoginKit
import FirebaseAuth
import Firebase

class SignInViewModel: NSObject {

    var onSignInFailure: ((Error?) -> Void)?
    var onSignInSuccess: (() -> Void)?
    var onNaviagtion:(() -> ())?
    var displayMessage:((ValidMessage) -> ())?
    let networkManager = NetworkManager.shared
    let userDefaults = UserDefaultsManager.shared

    // MARK: -  Continue as guest mode
    func continueAsGuest() {
        userDefaults.logout()
        userDefaults.continueAsAGuest = true
        userDefaults.storeData()
        onSignInSuccess?()
    }

    // MARK: - User Defaults
    func setUserDefaults(customer: Customer) {
        userDefaults.logout()
        userDefaults.userId = customer.id
        userDefaults.email = customer.email
        userDefaults.firstName = customer.firstName ?? ""
        userDefaults.lastName = customer.lastName ?? ""
        userDefaults.phone = customer.phone ?? ""
        userDefaults.password = customer.tags?[0] ?? ""
        userDefaults.storeData()
    }
    func setUserDefaults(userId: String , email: String) {
        userDefaults.logout()
        userDefaults.userId = userId
        userDefaults.email = email
        userDefaults.isLogin = true
        userDefaults.storeData()
    }

    // MARK: -  fetchDataFromNetwork
    func fetchDataFromNetwork(email:String) {
        let api = ShopifyAPI.getCustomers
        let url = api.shopifyGraphQLURL()
        let headers = api.headers
        let query = ShopifyAPI.getCustomerByEmail(email: email).graphqlQuery
        networkManager.executeGraphQL(query: query, url: url, headers: headers) { (result: Result<GraphQLResponse, Error>) in
            switch result {
            case .success(let response):
                guard let customerData = response.data.customers?.edges.first?.node  else{
                    self.displayMessage?(.emailDoesNotExist)
                    return
                }
                self.setUserDefaults(customer: customerData)
                self.onNaviagtion?()

            case .failure(let error):
                print(error.localizedDescription)
                self.displayMessage?(.unexpectedError)
            }
        }
    }
    // MARK: - Google Sign-In
    func signInWithGoogle(presenting viewController: UIViewController) {
        guard let clientID = FirebaseApp.app()?.options.clientID else {
            onSignInFailure?(NSError(domain: "GoogleSignIn", code: -1, userInfo: [NSLocalizedDescriptionKey: "Client ID not found"]))
            return
        }

        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config

        GIDSignIn.sharedInstance.signIn(withPresenting: viewController) { [weak self] result, error in
            if let error = error {
                self?.onSignInFailure?(error)
                return
            }

            guard let idToken = result?.user.idToken?.tokenString else {
                self?.onSignInFailure?(NSError(domain: "GoogleSignIn", code: -1, userInfo: [NSLocalizedDescriptionKey: "Google Sign-In failed"]))
                return
            }

            let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: result?.user.accessToken.tokenString ?? "")
            Auth.auth().signIn(with: credential) { authResult, error in
                if let error = error {
                    self?.onSignInFailure?(error)
                } else if let user = authResult?.user {
                    self?.setUserDefaults(userId: user.uid , email: user.email ?? "")
                    self?.onSignInSuccess?()
                }
            }
        }
    }

    // MARK: - Facebook Sign-In
    func signInWithFacebook(presenting viewController: UIViewController) {
        let loginManager = LoginManager()
        loginManager.logIn(permissions: ["public_profile", "email"], from: viewController) { [weak self] result, error in
            if let error = error {
                self?.onSignInFailure?(error)
                return
            }

            guard let tokenString = AccessToken.current?.tokenString else {
                self?.onSignInFailure?(NSError(domain: "FacebookSignIn", code: -1, userInfo: [NSLocalizedDescriptionKey: "Facebook Sign-In failed"]))
                return
            }

            let credential = FacebookAuthProvider.credential(withAccessToken: tokenString)
            Auth.auth().signIn(with: credential) { authResult, error in
                if let error = error {
                    self?.onSignInFailure?(error)
                } else if let user = authResult?.user {
                    self?.setUserDefaults(userId: user.uid , email: user.email ?? "")
                    self?.onSignInSuccess?()
                }
            }
        }
    }

    // MARK: - Apple Sign-In
    func signInWithApple() {
        let request = ASAuthorizationAppleIDProvider().createRequest()
        request.requestedScopes = [.fullName, .email]
        let controller = ASAuthorizationController(authorizationRequests: [request])
        controller.delegate = self
        controller.presentationContextProvider = self
        controller.performRequests()
    }
}

// MARK: - ASAuthorizationControllerDelegate
extension SignInViewModel: ASAuthorizationControllerDelegate {
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        onSignInFailure?(error)
    }

    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
            let userId = appleIDCredential.user
            let userEmail = appleIDCredential.email ?? ""
            self.setUserDefaults(userId: userId , email: userEmail)
            self.onSignInSuccess?()
        }
    }
}

// MARK: - ASAuthorizationControllerPresentationContextProviding
extension SignInViewModel: ASAuthorizationControllerPresentationContextProviding {
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        if let windowScene = UIApplication.shared.connectedScenes.first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene {
            return windowScene.windows.first { $0.isKeyWindow } ?? UIWindow()
        }
        return UIWindow()
    }
}
