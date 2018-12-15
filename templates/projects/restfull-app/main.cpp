#include "core.h"

#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QQuickStyle>
#include <QDebug>
#include <QJsonArray>

int main(int argc, char *argv[])
{    
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);

    QQuickStyle::setStyle("Material");

    QQmlApplicationEngine engine;
    Core core;
    core.initialize();

    engine.addImportPath("qrc:/modules/");
    engine.rootContext()->setContextProperty(QLatin1String("core"), &core);        

    engine.load(QUrl(QLatin1String("qrc:/main.qml")));

    return app.exec();
}
