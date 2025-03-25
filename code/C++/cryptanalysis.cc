#include <iostream>
#include <fstream>
#include <unordered_map>
#include <cctype>
#include <vector>
#include <algorithm>

std::string readFile(const std::string& filename) {
    std::ifstream file(filename);
    if (!file.is_open()) {
        std::cerr << "Error opening file: " << filename << std::endl;
        return "";
    }

    std::string content((std::istreambuf_iterator<char>(file)), std::istreambuf_iterator<char>());
    file.close();
    return content;
}

std::string cleanText(const std::string& text) {
    std::string cleaned;
    for (char ch : text) {
        if (std::isalpha(ch)) {
            cleaned += std::tolower(ch);
        }
    }
    return cleaned;
}

std::unordered_map<char, int> countFrequency(const std::string& text) {
    std::unordered_map<char, int> frequency;
    for (char ch : text) {
        frequency[ch]++;
    }
    return frequency;
}

void printFrequencyTable(const std::unordered_map<char, int>& frequency) {
    std::vector<std::pair<char, int>> freqVec(frequency.begin(), frequency.end());
    std::sort(freqVec.begin(), freqVec.end());

    std::cout << "| Character | Frequency |\n";
    std::cout << "|-----------|-----------|\n";
    for (const auto& pair : freqVec) {
        std::cout << "| " << pair.first << "         | " << pair.second << "         |\n";
    }
}

int main() {
    std::string filename = "malavoglia.txt";
    std::string content = readFile(filename);
    if (content.empty()) {
        return 1;
    }

    std::string cleanedText = cleanText(content);
    std::unordered_map<char, int> frequency = countFrequency(cleanedText);
    printFrequencyTable(frequency);

    return 0;
}