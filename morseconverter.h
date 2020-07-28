#ifndef MORSECONVERTER_H
#define MORSECONVERTER_H

#include <QObject>
#include <QMap>
#include <QUrl>
#include <QFile>
#include <QDebug>

const static QMap<QChar, QString> MorseAlphabet{
    {'a', ".-"},    {'b', "-..."},  {'c', "-.-."},  {'d', "-.."},
    {'e', "."},     {'f', "..-."},  {'g', "--."},   {'h', "...."},
    {'i', ".."},    {'j', ".---"},  {'k', "-.-"},   {'l', ".-.."},
    {'m', "--"},    {'n', "-."},    {'o', "---"},   {'p', ".--."},
    {'q', "--.-"},  {'r', ".-."},   {'s', "..."},   {'t', "-"},
    {'u', "..-"},   {'v', "...-"},  {'w', ".--"},   {'x', "-..-"},
    {'y', "-.--"},  {'z', "--.."},

    {'.', "......"}, {',', ".-.-.-"}, {'-', "-....-"}, {':', "---..."},
    {';', "-.-.-."}, {'?', "..--.."}, {'!', "--..--"}
};

class MorseConverter : public QObject
{
    Q_OBJECT

public:
    explicit MorseConverter(QObject *parent = nullptr);

    Q_INVOKABLE void processText(const QString inputText);
    Q_INVOKABLE void saveText(QString fileName, const QString inputText);
    Q_INVOKABLE void openFile(QString fileName);

signals:
    void encodedTextReady(QString encodedText);
    void decodedTextReady(QString decodedText);

};

#endif // MORSECONVERTER_H
