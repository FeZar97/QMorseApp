#include "morseconverter.h"

MorseConverter::MorseConverter(QObject *parent) : QObject(parent)
{}

void MorseConverter::processText(const QString &inputText) {
    qDebug() << "process text: " << inputText;
}
