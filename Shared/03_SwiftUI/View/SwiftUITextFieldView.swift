//
//  SwiftUITextFieldView.swift
//  SuperSwiftUIDemoApp
//
//  Created by leng on 2021/02/26.
//

import SwiftUI

struct SwiftUITextFieldView: View {
    
    @State private var usernameText: String = ""
    @State private var password: String = ""
    @State private var money = 100.0

    var body: some View {
        VStack{
            HStack{
                Text("用户名：")
                TextField("username placeholder", text: $usernameText,
                  onEditingChanged:{(changed)in
                    print("username changed:\(changed)")
                  },
                onCommit: {
                    print("commit \(usernameText)")
                })
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
            }

            
            HStack{
                Text("密码：")
                SecureField("password",text: $password)
                    .keyboardType(UIKeyboardType.default)
                    .textContentType(UITextContentType.password)
                    .textFieldStyle(RoundedBorderTextFieldStyle()
                    )
            }
            
            HStack{
                Text("账户：")
                TextField("enter money:",value: $money,formatter: NumberFormatter.currency)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            
            
            
            Spacer()
            
            Button("Commit") {
                
                
            }.frame(width: 300, height: 45, alignment: .center)
            .background(Color.blue.opacity(0.5))
            .foregroundColor(Color.white)
            
        }.padding()
    }
}
extension NumberFormatter {
    static var currency: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter
    }
}

struct SwiftUITextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUITextFieldView()
    }
}
