import Foundation

class AuthService {
    private var currentUser: String?

    func login(username: String, password: String, completion: @escaping (Bool, Error?) -> Void) {
        // Simulate a network call for user authentication
        DispatchQueue.global().async {
            // Here you would typically make a network request to your backend
            // For demonstration, we assume a successful login if username and password are not empty
            if !username.isEmpty && !password.isEmpty {
                self.currentUser = username
                completion(true, nil)
            } else {
                completion(false, NSError(domain: "AuthError", code: 401, userInfo: [NSLocalizedDescriptionKey: "Invalid username or password"]))
            }
        }
    }

    func logout() {
        currentUser = nil
    }

    func isLoggedIn() -> Bool {
        return currentUser != nil
    }
}