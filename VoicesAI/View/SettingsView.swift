//
//  SettingsView.swift
//  VoicesAI
//
//  Created by User50 on 24/04/24.
//

import SwiftUI

struct SettingsView: View {
    @State private var geminiAIKey = ""
    @State private var elevenLabsKey = ""
    
    let signUpGemini = "https://ai.google.dev"
    let signUpElevenLabs = "https://elevenlabs.io/api"
    
    var body: some View {
        NavigationStack {
            Form {
                // MARK: - API KEY
                Section {
                    TextField("Gemini AI Key ",text:$geminiAIKey)
                    TextField("Eleven Labs Key ",text:$elevenLabsKey)
                } header: {
                    Text("API KEYS")
                } footer: {
                    Text("Please input your API Key above")
                }
                
                Section {
                    
                    Link(destination: URL(string:signUpGemini)!, label: {
                            Text("GET API KEY GEMINI AI")
                        })
                    .foregroundStyle(.blue)
                    
                    Link(destination: URL(string:signUpElevenLabs)!, label: {
                            Text("GET API KEY Eleven Labs")
                        })
                    .foregroundStyle(.blue)
                    

                } header: {
                    Text("DON'T HAVE API KEY")
                } footer: {
                    Text("Sign up to get your own api key via link above")
                }
            }
            .navigationTitle("Configuration")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                Button {
                    
                }label: {
                    Text("Save")
                        .padding(.trailing,8)
                }
            }
        }
        
    }
}

#Preview {
    SettingsView()
}
