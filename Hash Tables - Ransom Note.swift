import Foundation;

let _ = readLine()!
let magazine = readLine()!
let note = readLine()!

func wordsFrequency(text: String) -> [String: Int] {
    var dict = [String: Int]()
    for word in text.components(separatedBy: " ") {
        if dict.keys.contains(word) {
            dict[word]! += 1
        } else {
            dict[word] = 1
        }
    }
    return dict
}

func canReplicate(note: String, from magazine: String) -> Bool {
    let magazineWordsFrequency = wordsFrequency(text: magazine)
    let noteWordsFrequency = wordsFrequency(text: note)
    return hasEnoughWords(in: magazineWordsFrequency, for: noteWordsFrequency)
}

func hasEnoughWords(in magazineFrequecy: [String: Int], for noteFrequency: [String: Int]) -> Bool {
    for word in noteFrequency.keys {
        guard let magazineWordCount = magazineFrequecy[word] else { return false }
        if magazineWordCount < noteFrequency[word]! {
            return false
        }
    }
    return true
}

if canReplicate(note: note, from: magazine) {
    print("Yes")
} else {
    print("No")
}
