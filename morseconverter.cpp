#include "morseconverter.h"

bool MorseConverter::isMorseText(const QString &text) {
    for (int i = 0; i < text.length(); i++) {
        if ((text[i] != "-") && (text[i] != ".") && (text[i] != " ")) {
            return false;
        }
    }
    return true;
}

QString MorseConverter::latinToMorse(const QString &text) {
    QString result = "";

    for (auto c: text.simplified()) {
        if (MorseAlphabet.contains(c)) {
            // add whitespace after previous character
            if (!result.isEmpty()) {
                result += " ";
            }
            result += MorseAlphabet[c];
        } else if (c == " ") {
            result += " ";
        }
    }

    return result;
}

QString MorseConverter::morseToLatin(const QString &text) {
    QString result = "";

    QList<QString> morseSymbols = text.split(" ");
    for (auto mSym: morseSymbols) {
        if (MorseAlphabet.values().contains(mSym)) {
            result += MorseAlphabet.key(mSym);
        } else if (mSym.isEmpty()) {
            result += " ";
        }
    }
    return result;
}

MorseConverter::MorseConverter(QObject *parent) : QObject(parent) {

}

void MorseConverter::processText(QString inputText) {

    // remove extra whitespaces from start and end of string and transform it to lower
    inputText = inputText.trimmed().toLower();

    QString result = "";
    if (!inputText.isEmpty()) {
        if (isMorseText(inputText)) {
            result = morseToLatin(inputText);
        } else {
            result = latinToMorse(inputText);
        }
    }

    emit decodedTextReady(result);
}

void MorseConverter::saveText(QString fileName, const QString inputText) {

    QFile outputFile(fileName.remove("file:///"));

    if (outputFile.open(QFile::WriteOnly)) {
        QTextStream outstream(&outputFile);
        outstream << inputText;
        outputFile.close();
    }
}

void MorseConverter::openFile(QString fileName) {

    QString inputText;
    QFile inputFile(fileName.remove("file:///"));

    if (inputFile.open(QIODevice::ReadOnly)) {
        inputText = inputFile.readAll();
    }

    emit encodedTextReady(inputText);
}
