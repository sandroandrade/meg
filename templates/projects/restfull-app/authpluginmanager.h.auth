#ifndef AUTHPLUGINMANAGER_H
#define AUTHPLUGINMANAGER_H

#include <QJsonArray>

class Core;

class AuthPluginManager
{
public:
    AuthPluginManager(Core *core);
    virtual ~AuthPluginManager();
    void loadConfig();
    QJsonArray config() const;
private:
    Core *m_core;
    QJsonArray m_config;
};

#endif // AUTHPLUGINMANAGER_H
