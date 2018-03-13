#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QDebug>
#include <QFile>
#include <QDir>
#include <QStandardPaths>
#include <QQmlContext>
#include <QJsonArray>
#include <QJsonObject>
#include <QJsonDocument>
#include <QQuickStyle>

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);

    QQuickStyle::setStyle("Material");
    QString pluginsAbsolutePath;
#ifdef Q_OS_ANDROID
    QDir dir("assets:/plugins");
#else
    QDir dir(qApp->applicationDirPath());
    dir.cd("plugins");
    pluginsAbsolutePath = "file://";
#endif
    pluginsAbsolutePath += dir.absolutePath();
    QString contents;
    QJsonArray mergedArray;
    foreach(const QString &fileName, dir.entryList(QStringList() << "*.json")) {
        QFile dfile(dir.absoluteFilePath(fileName));
        dfile.open(QIODevice::ReadOnly);
        QJsonObject jsonObject = QJsonDocument::fromJson(dfile.readAll()).object();
        QDir pluginDir(dir);
        pluginDir.cd(fileName.split('.').first());
#ifdef Q_OS_ANDROID
        jsonObject["pluginName"] = fileName.split('.').first();
#else
        jsonObject["pluginName"] = pluginDir.absolutePath();
#endif
        mergedArray.append(jsonObject);
        dfile.close();
    }

    QQmlApplicationEngine engine;
    engine.addImportPath("qrc:/modules/");
    engine.rootContext()->setContextProperty("pluginsDir", pluginsAbsolutePath);
    engine.rootContext()->setContextProperty("contents", mergedArray);
    engine.load(QUrl(QLatin1String("qrc:/main.qml")));

    return app.exec();
}
