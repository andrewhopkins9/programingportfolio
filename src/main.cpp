#include <iostream>
#include <string>

using namespace std;

bool isVowel(char c) {
    return (c == 'a' || c == 'e' || c == 'i' || c == 'o' || c == 'u' || c == 'A' || c == 'E' || c == 'I' || c == 'O' || c == 'U');
}

string convertToPigLatin(string word) {
    int len = word.length();
    int index = -1;
    for (int i = 0; i < len; i++) {
        if (isVowel(word[i])) {
            index = i;
            break;
        }
    }
    if (index == -1) {
        return word;
    }
    return word.substr(index) + word.substr(0, index) + "ay";
}

int main() {
    string sentence;
    cout << "Enter a sentence: ";
    getline(cin, sentence);
    string word;
    string result = "";
    for (int i = 0; i < sentence.length(); i++) {
        if (sentence[i] == ' ') {
            result += convertToPigLatin(word) + " ";
            word = "";
        }
        else {
            word += sentence[i];
        }
    }
    result += convertToPigLatin(word);
    cout << "Pig Latin: " << result << endl;
    return 0;
}