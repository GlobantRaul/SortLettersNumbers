func sortLettersNumbers(_ input: String) -> String {
        // Preprocess the input string to categorize its characters into different groups
        var letters = ""
        var numbers = ""
        var others = ""
        
        for char in input {
                if char.isLetter {
                        letters.append(char)
                } else if char.isNumber {
                        numbers.append(char)
                } else {
                        others.append(char)
                }
        }
        
        // Sort each group of characters separately
        letters = String(letters.sorted { (char1, char2) -> Bool in
                if char1.lowercased() != char2.lowercased() {
                        return char1.lowercased() < char2.lowercased()
                } else {
                        return char1 < char2
                }
        })
        
        numbers = String(numbers.sorted { (char1, char2) -> Bool in
                if let num1 = Int(String(char1)), let num2 = Int(String(char2)) {
                        if num1 % 2 != num2 % 2 {
                                return num1 % 2 == 1
                        } else {
                                return num1 < num2
                        }
                } else {
                        return false // This case should not occur if preprocessing is correct
                }
        })
        
        others = String(others.sorted())
        
        // Concatenate the sorted groups together
        return letters + numbers + others
}

// Test the function
let input = "D7.h3a-86gR*1O4"
let output = sortLettersNumbers(input)
print(output) 
