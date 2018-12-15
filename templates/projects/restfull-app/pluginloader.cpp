#include "pluginloader.h"
#include "core.h"

#include <QFile>
#include <QDir>
#include <QStandardPaths>
#include <QJsonObject>
#include <QJsonDocument>
#include <QGuiApplication>

PluginLoader::PluginLoader(Core *core):
    m_core(core),
    m_pluginsDir(findPluginsDirectory())
{    
    loadPlugins();
}

QJsonArray PluginLoader::pluginsConfig() const
{
    return m_pluginsConfig;
}

QString PluginLoader::pluginsDir() const
{
    return m_pluginsDir;
}

QString PluginLoader::findPluginsDirectory()
{
    QString pluginsAbsolutePath;
#ifdef Q_OS_ANDROID
    QDir dir("assets:/plugins");
#else
    QDir dir(qApp->applicationDirPath());
    if (!QDir(dir.absolutePath() + "/plugins").exists()){
        dir.cdUp();
        dir.cd("/fullApp");
    }
    dir.cd("plugins");
    pluginsAbsolutePath = "file://";
#endif
    pluginsAbsolutePath += dir.absolutePath();
    m_pluginsPathWithoutPrefix = dir.absolutePath();
    return pluginsAbsolutePath;
}

void PluginLoader::loadPlugins()
{    
    QDir dir(m_pluginsPathWithoutPrefix);
    for(const QString &fileName : dir.entryList(QStringList() << "*.json"))
    {
        QFile dfile(dir.absoluteFilePath(fileName));
        dfile.open(QIODevice::ReadOnly);
        QJsonObject jsonObject = QJsonDocument::fromJson(dfile.readAll()).object();

        QDir pluginDir(m_pluginsPathWithoutPrefix);
        pluginDir.cd(fileName.split('.').first());

        jsonObject["pluginDir"] = m_pluginsDir + "/" + jsonObject["name"].toString();
        m_pluginsConfig.append(jsonObject);

        dfile.close();
    }
}
