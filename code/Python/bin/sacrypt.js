#!/usr/bin/env node

const fs = require('fs');

// Function to read a file
function readFile(filePath) {
    return fs.readFileSync(filePath, 'utf-8');
}

// Function to eliminate whitespace and punctuation
function eliminateWhitespaceAndPunctuation(text) {
    const punctuation = /[\s!"#$%&'()*+,\-./:;<=>?@[\\\]^_`{|}~«»“”‘’]/g;
    const normalizedText = text.normalize('NFD').replace(/[\u0300-\u036f]/g, ''); // Remove accents
    return normalizedText.replace(punctuation, '').replace(/[^a-zA-Z]/g, '');
}

// Function to calculate frequency of characters
function calculateFrequency(text) {
    const frequency = {};
    const lowerText = text.toLowerCase();

    for (const char of lowerText) {
        if (frequency[char]) {
            frequency[char]++;
        } else {
            frequency[char] = 1;
        }
    }

    return frequency;
}

// Function to print frequency in Markdown format
function printFrequencyMarkdown(frequency) {
    console.log("| Symbol | Frequency |");
    console.log("|--------|-----------|");
    const sortedFrequency = Object.entries(frequency).sort((a, b) => a[1] - b[1]);

    for (const [symbol, freq] of sortedFrequency) {
        console.log(`|   ${symbol}   |    ${freq}    |`);
    }
}

// Process text using version 0 logic
function processTextV0(filePath) {
    const text = readFile(filePath);
    const cleanedText = eliminateWhitespaceAndPunctuation(text);
    return calculateFrequency(cleanedText);
}

// Process text using version 1 logic
function processTextV1(filePath) {
    const fileContent = readFile(filePath);
    const lines = fileContent.split('\n');
    const frequency = {};

    for (const line of lines) {
        const lowerLine = line.toLowerCase();
        for (const char of lowerLine) {
            if (/[a-zA-Z]/.test(char)) {
                if (frequency[char]) {
                    frequency[char]++;
                } else {
                    frequency[char] = 1;
                }
            }
        }
    }

    return frequency;
}

// Main function
function main() {
    const args = process.argv.slice(2);

    if (args.length < 1) {
        console.error("Usage: node sacrypt.js <file_path> [v1]");
        process.exit(1);
    }

    const filePath = args[0];
    const useV1 = args.includes('v1');
    const frequency = useV1 ? processTextV1(filePath) : processTextV0(filePath);

    printFrequencyMarkdown(frequency);
}

// Run the main function if this script is executed directly
if (require.main === module) {
    main();
}