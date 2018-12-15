#ifndef DRAWERPLUGINMANAGER_H
#define DRAWERPLUGINMANAGER_H

#include <QJsonArray>

class Core;

class DrawerPluginManager
{
public:
    DrawerPluginManager(Core *core);
    virtual ~DrawerPluginManager();
    void loadConfig();
    QJsonArray config() const;
private:
    Core *m_core;
    QJsonArray m_config;
};

#endif // DRAWERPLUGINMANAGER_H
