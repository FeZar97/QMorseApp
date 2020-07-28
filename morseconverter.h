#ifndef MORSECONVERTER_H
#define MORSECONVERTER_H

#include <QObject>
#include <QDebug>

class MorseConverter : public QObject
{
    Q_OBJECT
public:
    explicit MorseConverter(QObject *parent = nullptr);

    void processText(const QString &inputText);

signals:
    void decodedTextReady(QString decodedText);

};

#endif // MORSECONVERTER_H
