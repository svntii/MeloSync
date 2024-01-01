//
//  AuthViewModel.swift
//  MeloSync
//
//  Created by santiago on 12/31/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore


@MainActor
class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: MeloUser?
    
    init() {
        self.userSession = Auth.auth().currentUser
    }
    
    func signInUserEmailPassword(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            userSession = result.user
            await fetchUser()
        } catch {
            print("DEBUG: Failed to sign in with error: \(error.localizedDescription)")

        }
    }

    
    func createUser(withEmail email: String, firstName fname: String, lastName lname: String, userName uname: String, phoneNumber phone: String, password: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            
            let user = MeloUser(
                id: result.user.uid,
                userName: uname,
                firstName: fname,
                lastName: lname,
                profilePic: "",
                phoneNumber: phone,
                email: email,
                playlists: [],
                reviews: []
            )
            
            let encodedUser = try Firestore.Encoder().encode(user)
            try await Firestore.firestore().collection("DEVMeloUsersIOS").document(user.id).setData(encodedUser)
            await fetchUser()
            
        }
        catch {
            print("DEBUG: Failed to create User with error: \(error.localizedDescription)")
        }

    }
    
    
    func signOut() {
        do {
            try Auth.auth().signOut()
            self.userSession = nil
            self.currentUser = nil
        } catch {
            print("DEBUG: Failed to sign out error: \(error.localizedDescription)")
        }
    }
    
    func deleteAccount() async throws {
        
    }
    
    func fetchUser() async {
        guard let uid  = Auth.auth().currentUser?.uid else { return }
        guard let snapshot = try? await Firestore.firestore().collection("DEVMeloUsersIOS").document(uid).getDocument() else { return }
        self.currentUser = try? snapshot.data(as: MeloUser.self)
        print("DEBUG: Current User is \(self.currentUser)")
        
    }
    
}

protocol AuthenticationFormProtocol {
    var formIsValid: Bool { get }
}

extension AuthenticationFormProtocol {
    func isUsernameUnique(_ username: String) async -> Bool {
        do {
            let querySnapshot = try await Firestore.firestore()
                .collection("DEVMeloUsersIOS")
                .whereField("userName", isEqualTo: username) // TODO: Make keys dynamic
                .getDocuments()
            return querySnapshot.isEmpty
        } catch {
            print("Error checking username uniqueness: \(error.localizedDescription)")
            return false
        }
    }
    
    func isEmailUnique(_ email: String) async -> Bool {
        do {
            let querySnapshot = try await Firestore.firestore()
                .collection("DEVMeloUsersIOS")
                .whereField("email", isEqualTo: email)
                .getDocuments()
            return querySnapshot.isEmpty
        } catch {
            print("Error checking email uniqueness: \(error.localizedDescription)")
            return false
        }
    }
    
    func isPhoneUnique(_ number: String) async -> Bool {
        do {
            let querySnapshot = try await Firestore.firestore()
                .collection("DEVMeloUsersIOS")
                .whereField("phoneNumber", isEqualTo: number)
                .getDocuments()
            return querySnapshot.isEmpty
        } catch {
            print("Error checking number uniqueness: \(error.localizedDescription)")
            return false
        }
    }
}
