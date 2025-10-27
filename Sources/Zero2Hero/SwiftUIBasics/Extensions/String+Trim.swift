import Foundation

extension String {
    func trim() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}

/*
    self means “my current value”
    Self means “my current data type.”
*/ 