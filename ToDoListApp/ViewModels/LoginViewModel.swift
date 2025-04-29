class LoginViewModel {
    var username: String = ""
    var password: String = ""
    
    var isLoginSuccessful: Bool = false
    
    private let authService: AuthService
    
    init(authService: AuthService) {
        self.authService = authService
    }
    
    func login(completion: @escaping (Bool) -> Void) {
        guard !username.isEmpty, !password.isEmpty else {
            completion(false)
            return
        }
        
        authService.login(username: username, password: password) { success in
            self.isLoginSuccessful = success
            completion(success)
        }
    }
}