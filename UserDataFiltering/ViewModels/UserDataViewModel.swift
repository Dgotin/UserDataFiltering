//
//  UserDataViewModel.swift
//  UserDataFiltering
//

import Foundation
import OrderedCollections

@MainActor
final class UserDataViewModel: ObservableObject {
    private var timer: Timer?
    private var userData: [UserData] = [] {
        didSet {
            self.filteredUserData = self.userData
        }
    }
    @Published var isLoading = false
    @Published var isPresentingSheet = false
    @Published var isRecording = false {
        didSet {
            checkRecordingState()
        }
    }
    @Published var filteredUserData: [UserData] = []
    @Published var text: String = "" {
        didSet {
            filterData()
        }
    }
    @Published var speechRecognizer = SpeechRecognizer()

    private let backendManager = Dependencies.shared.backendManager

    init() {
        Task {
            do {
                isLoading = true
                self.userData = try await backendManager.getUserData(of: "http://www.someBackendUrl.com/users", with: nil)
                isLoading = false
            } catch {
                isLoading = false
            }
        }
    }
    
    internal func filterData() {
        guard !text.isEmpty else {
            self.filteredUserData = userData
            return
        }
        
        if containsOnlyNumbers() {
            filterByPostcode()
        } else {
            filterByAnyName()
        }
    }

    /// Succeeds if no number contains otherwise empty list will be generated
    private func filterByAnyName() {
        let formattedText = text.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        var firstNameData = userData.filter({ $0.firstName.lowercased().hasPrefix(formattedText) })
        let lastNameData = userData.filter({ $0.lastName.lowercased().hasPrefix(formattedText) })
        firstNameData.append(contentsOf: lastNameData)
        let removedDuplicates = OrderedSet(firstNameData)
        let filteredUserData = Array(removedDuplicates)
        self.filteredUserData = filteredUserData
    }
    
    private func filterByPostcode() {
        self.filteredUserData = userData.filter({ $0.adress.postcode.hasPrefix(self.text) })
    }
    
    private func containsOnlyNumbers() -> Bool {
        let pattern = #"^\d+$"#

        if let regex = try? NSRegularExpression(pattern: pattern) {
            if let _ = regex.firstMatch(in: self.text, options: [], range: NSRange(location: 0, length: self.text.utf16.count)) {
                return true
            }
        }

        return false
    }
    
    internal func addItem(_ item: UserData) {
        self.userData.append(item)
    }

    internal func deleteItem(offset: IndexSet) {
        self.userData.remove(atOffsets: offset)
    }
    
    internal func addTestData() {
        self.userData.append(contentsOf: UserData.testData())
    }
    
    private func checkRecordingState() {
        if isRecording {
            self.text = ""
            startRecord()
        } else {
            endRecord()
        }
    }

    private func startRecord() {
        self.speechRecognizer.resetTranscript()
        self.speechRecognizer.startTranscribing()
    }

    private func endRecord() {
        self.speechRecognizer.stopTranscribing()
        self.text = self.speechRecognizer.transcript
        self.speechRecognizer.resetTranscript()
    }
}
