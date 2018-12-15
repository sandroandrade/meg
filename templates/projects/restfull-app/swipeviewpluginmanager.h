#ifndef SWIPEVIEWPLUGINMANAGER_H
#define SWIPEVIEWPLUGINMANAGER_H

#include <QJsonArray>

class Core;

class SwipeViewPluginManager
{
public:
    SwipeViewPluginManager(Core *core);
    virtual ~SwipeViewPluginManager();
    void loadConfig();
    QJsonArray config() const;
private:
    Core *m_core;
    QJsonArray m_config;
};

#endif // SWIPEVIEWPLUGINMANAGER_H
