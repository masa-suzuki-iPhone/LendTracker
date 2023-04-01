//
//  LoginView.swift
//  LendTracker
//
//  Created by 鈴木正義 on 2023/03/31.
//

import Foundation
import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer().frame(height: 100)
                
                Text("ログイン")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.bottom, 50)
                
                VStack(alignment: .leading) {
                    Text("メールアドレス")
                        .font(.headline)
                    
                    TextField("Email", text: $viewModel.email)
                        .autocapitalization(.none)
                        .keyboardType(.emailAddress)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    
                }
                
                VStack(alignment: .leading) {
                    Text("パスワード")
                        .font(.headline)
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                }
                
                Button(action: {
                    viewModel.login()
                }) {
                    Text("ログイン")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding(.top, 30)
                
                
                Spacer()
                
                //                VStack {
                //                    Text("アカウントをお持ちでない方は")
                //                        .font(.callout)
                //                    NavigationLink(destination: RegistrationView()) {
                //                        Text("新規登録")
                //                            .font(.callout)
                //                            .foregroundColor(.blue)
                //                    }
                //                }
                    .padding(.bottom, 20)
            }
            .padding(.horizontal, 20)
            .background(Color.orange.opacity(0.3))
            
        }
        .onTapGesture {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
        .alert(isPresented: $viewModel.showAlert) {
            Alert(
                title: Text("エラー"),
                message: Text(viewModel.errorMessage ?? "未知のエラーが発生しました"),
                dismissButton: .default(Text("OK")) {
                    viewModel.showAlert = false
                }
            )
        }
    }
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}



