//
//  ContentView.swift
//  DevStatus SwiftUi
//
//  Created by Henry Ifebunandu on 11/3/23.
//

import SwiftUI

struct ContentView: View {
    let backgroundColor = UIColor(hex: "#395266")
    @State private var username: String = ""
    @State private var navigateToNextScreen = false
    
    @StateObject var viewModel = DevStatusViewModel()
    
    var myBoolBinding: Binding<Bool> {
            Binding<Bool>(
                get: { viewModel.user != nil },
                set: { newValue in
                    self.navigateToNextScreen = newValue
                    
                }
            )
        }
    
    var body: some View {
        ZStack {
            Color(uiColor: backgroundColor).ignoresSafeArea()
            
            VStack(alignment: .leading){
                Text("Developer Status").font(.title).fontWeight(.bold).foregroundColor(Color.white)
                
                Spacer()
                    .frame(height: 60.0)
                
                VStack{
                    Text("Check").font(.headline).fontWeight(.bold).foregroundColor(Color.white)
                }
                
                Spacer()
                    .frame(height: 30.0)
                
                TextField(
                        "Enter GitHub Username ",
                        text: $username
                    ).textFieldStyle(CustomTextFieldStyle())
                    .background(Color.white)
                
                Spacer()
                    .frame(height: 25.0)
                
                Button (action: {
                    Task {
                        await viewModel.getGitHubUser(username: username)
                    }
                }, label: {
                    if(viewModel.loadingState == true) {
                        ProgressView()
                    } else {
                        Text("Check Status").font(.subheadline).fontWeight(.semibold).foregroundColor(Color(uiColor: backgroundColor))
                    }
                    
                })
                .frame(height: 45.0)
                .buttonStyle(.plain)
                .frame(maxWidth: .infinity)
                .background(Color.white)
                
                
            }
            .padding(.horizontal, 25.0)
        }.navigate(to: DevInfo(viewModel: viewModel), when: myBoolBinding)
        
        
    }
        
}

struct CustomTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<_Label>) -> some View {
        configuration
            .padding(10)
            .background(RoundedRectangle(cornerRadius: 0).stroke(Color.white, lineWidth: 2))
    }
}


//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
