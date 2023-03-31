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

    func login(completion: @escaping (Bool) -> Void) {
        // 通常はAPIを利用して実際のログイン処理を行うが、
        // ここではメールアドレスとパスワードが一致している場合に成功とする
        if email == "test@example.com" && password == "password" {
            completion(true)
        } else {
            completion(false)
        }
    }
}
