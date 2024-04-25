//
//  StoriesVM.swift
//  VoicesAI
//
//  Created by User50 on 25/04/24.
//

import Foundation
import GoogleGenerativeAI

@MainActor
class StoryVM: ObservableObject {
    @Published var storyText = ""
    @Published var isLoading = false
    @Published var errorMessage: String?
    @Published var displayedStoryText = "" // display typewriting effect
    
    private var timer: Timer?
    
    // MARK: - GENERATE STORY
    func generateStory(topic: Topics, mood: Mood) async {
        isLoading = true
        defer {isLoading = false}
        errorMessage = nil
        storyText = ""
        let apiKey = UserDefaults.standard.string(forKey: "GeminiAIKey") ?? ""
        
        guard !apiKey.isEmpty else {
            errorMessage = "API Key is missing. Please set it in Settings page!"
            return
        }
        
        let model = GenerativeModel(name: "gemini-pro", apiKey:apiKey)
        let topicString = topic.rawValue
        let moodString = topic.rawValue
        
        
        do {
            let prompt = "Write a quote about \(topicString) with emotion mood \(moodString). max consist of 40 words in english"
            let response = try await model.generateContent(prompt)
            if let text = response.text {
                storyText = text
                startTypeWriterEffect()
            }
            
        } catch {
            errorMessage = "😞 Failed to generate story !! : \(error.localizedDescription)"
            return
        }
        
        
    }
    // MARK: - TYPEWRITER EFFECT
    func startTypeWriterEffect(){
        
        var charIndex = 0
        
        DispatchQueue.main.async {
            self.displayedStoryText = ""
        }
        
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.09, repeats: true){ [weak self] timer in
            guard let self = self, charIndex < self.storyText.count else {
                timer.invalidate()
                return
            }
            DispatchQueue.main.async {
                let index = self.storyText.index(self.storyText.startIndex,offsetBy: charIndex)
                self.displayedStoryText += String(self.storyText[index])
                charIndex += 1
            }
        }
       
        
    }
}
