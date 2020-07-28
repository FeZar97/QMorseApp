#ifndef MORSECONVERTER_H
#define MORSECONVERTER_H

#include <QObject>

class MorseConverter : public QObject
{
    Q_OBJECT
public:
    explicit MorseConverter(QObject *parent = nullptr);

signals:

};

#endif // MORSECONVERTER_H
