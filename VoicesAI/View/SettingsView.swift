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
                        .onAppear{
                            geminiAIKey = UserDefaults.standard.string(forKey: "GeminiAIKey") ?? ""
                        }
                    TextField("Eleven Labs Key ",text:$elevenLabsKey)
                        .onAppear{
                            elevenLabsKey = UserDefaults.standard.string(forKey: "ElevenLabsAPIKey") ?? ""
                        }
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
                // MARK: - SAVE KEY
                Button {
                    saveKey()
                }label: {
                    Text("Save")
                        .padding(.trailing,8)
                }
                .padding()
                .disabled(geminiAIKey.isEmpty || elevenLabsKey.isEmpty)
            }
        }
        
    }
}

#Preview {
    SettingsView()
}

extension SettingsView {
    func saveKey() {
        UserDefaults.standard.set(geminiAIKey,forKey: "GeminiAIKey")
        UserDefaults.standard.set(elevenLabsKey,forKey: "ElevenLabsAPIKey")
    }
}
