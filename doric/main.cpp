#include <QFile>
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QTextStream>

#include "context_manager.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/doric/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    {
        QResource resource(":/doric/Snake.js");
        QFile *file = new QFile(resource.fileName());
        file->open(QFile::ReadOnly | QFile::Text);
        QTextStream in(file);
        QString script = in.readAll();
        file->close();
        delete file;

        QString* source = new QString("Snake.js");
        Context *context = ContextManager::getInstance()->createContext(&script, source);
        context->show();
        context->init(180, 320);
        delete source;
    }

    return app.exec();
}
