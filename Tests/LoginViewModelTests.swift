import XCTest
@testable import ToDoListApp

class LoginViewModelTests: XCTestCase {
    
    var viewModel: LoginViewModel!
    var authService: MockAuthService!

    override func setUp() {
        super.setUp()
        authService = MockAuthService()
        viewModel = LoginViewModel(authService: authService)
    }

    override func tearDown() {
        viewModel = nil
        authService = nil
        super.tearDown()
    }

    func testLoginSuccess() {
        viewModel.username = "testUser"
        viewModel.password = "testPassword"
        
        viewModel.login()
        
        XCTAssertTrue(authService.loginCalled)
        XCTAssertEqual(authService.username, "testUser")
        XCTAssertEqual(authService.password, "testPassword")
        XCTAssertTrue(viewModel.isLoggedIn)
    }

    func testLoginFailure() {
        authService.shouldFailLogin = true
        viewModel.username = "wrongUser"
        viewModel.password = "wrongPassword"
        
        viewModel.login()
        
        XCTAssertTrue(authService.loginCalled)
        XCTAssertFalse(viewModel.isLoggedIn)
    }

    func testUsernameAndPasswordValidation() {
        viewModel.username = ""
        viewModel.password = ""
        
        XCTAssertFalse(viewModel.isLoginValid())
        
        viewModel.username = "user"
        viewModel.password = "pass"
        
        XCTAssertTrue(viewModel.isLoginValid())
    }
}

class MockAuthService: AuthService {
    var loginCalled = false
    var shouldFailLogin = false
    var username: String?
    var password: String?

    override func login(username: String, password: String, completion: @escaping (Bool) -> Void) {
        loginCalled = true
        self.username = username
        self.password = password
        
        if shouldFailLogin {
            completion(false)
        } else {
            completion(true)
        }
    }
}