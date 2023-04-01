//
//  LoginViewModel.swift
//  LendTracker
//
//  Created by 鈴木正義 on 2023/03/31.
//

import Foundation
import Combine

class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var errorMessage: String = ""
    @Published var showAlert: Bool = false

    func login() {
        if email.isEmpty || password.isEmpty {
            errorMessage = "メールアドレスとパスワードを入力してください"
            showAlert.toggle()
            return
        }

        // ここでFirebaseを使用して実際のログイン処理を行う
        // 成功した場合は、次の画面へ遷移
        // 失敗した場合は、エラーメッセージを表示

        if email == "test@example.com" && password == "password" {
            // ログイン成功時の処理（次の画面へ遷移）
        } else {
            errorMessage = "メールアドレスかパスワードが間違っています"
            showAlert.toggle()
        }
    }
}
