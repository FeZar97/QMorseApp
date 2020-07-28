#include "morseconverter.h"

MorseConverter::MorseConverter(QObject *parent) : QObject(parent) {}

void MorseConverter::processText(QString inputText) {

    QString result = "";
    inputText = inputText.trimmed();
    inputText = inputText.toLower();

    if(!inputText.isEmpty()) {

        // remove extra whitespaces from start and end of string and transform to lower

        // if input text is Morse
        if(inputText[0] == '.' || inputText[0] == '-') {

            QList<QString> morseSymbols = inputText.split(" ");
            for(auto mSym: morseSymbols) {
                if(MorseAlphabet.values().contains(mSym)) {
                    result += MorseAlphabet.key(mSym);
                } else if(mSym.isEmpty()) {
                    result += " ";
                } else {
                    result = QString("Fined unknown morse symbol input text: '%1'").arg(mSym);
                    break;
                }
            }
        } else {
        // if input text is latin

            for(auto c: inputText) {
                if(!MorseAlphabet.contains(c) && c != " ") {
                    result = QString("Fined invalid character in input text: %1").arg(c);
                    break;
                } else {
                    if(c == " ") {
                        result += "  ";
                    } else {
                        if(!result.isEmpty()) {
                            result += " ";
                        }
                        result += MorseAlphabet[c];
                    }
                }
            }
        }
    }

    emit decodedTextReady(result);
}

void MorseConverter::saveText(QString fileName, const QString inputText) {

    QFile outputFile(fileName.remove("file:///"));

    if(outputFile.open(QFile::WriteOnly)) {
        QTextStream outstream(&outputFile);
        outstream << inputText;
        outputFile.close();
    }
}

void MorseConverter::openFile(QString fileName) {

    QString inputText;
    QFile inputFile(fileName.remove("file:///"));

    if(inputFile.open(QIODevice::ReadOnly)) {
        inputText = inputFile.readAll();
    }

    emit encodedTextReady(inputText);
}
