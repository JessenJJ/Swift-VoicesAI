//
//  Constant.swift
//  VoicesAI
//
//  Created by User50 on 24/04/24.
//

import Foundation

struct Constant {
    static let baseURL = "https://api.elevenlabs.io/"
    static let appVersion = "v1"
    
    enum Endpoint: String {
        case textToSpeech = "text-to-speech"
        case speechToSpeech = "speech-to-speech"
    }
    
    enum VoiceID: String {
        case ana =  "rCmVtv8cYU60uhlsOo1M"
        case myra = "tKZQTIqwDrPzLv6MrPxF"
    }
    
    /// let urlString = Constant.fullURL(forVoice:.ana)
    ///
    static func fullURL(forVoice voice: VoiceID) -> String {
        let results = baseURL + appVersion + "/" + Endpoint.textToSpeech.rawValue + "/" + voice.rawValue
        
        return results
    }
    
}
