#include "drawerpluginmanager.h"
#include "core.h"

DrawerPluginManager::DrawerPluginManager(Core *core):m_core(core)
{

}

DrawerPluginManager::~DrawerPluginManager()
{

}

void DrawerPluginManager::loadConfig()
{
    for(QJsonValue jsonValue : m_core->pluginsConfig())
    {
        QJsonObject jsonObject = jsonValue.toObject();
        if (jsonObject.contains("showInDrawer") && jsonObject.value("showInDrawer").toBool() == true)
        {
            if (jsonObject.contains("drawerPosition") && jsonObject.value("drawerPosition").toInt() <= m_config.size())
                m_config.insert(jsonObject.value("showInDrawer").toInt(), jsonObject);
            else
                m_config.append(jsonObject);
        }
    }
}

QJsonArray DrawerPluginManager::config() const
{
    return  m_config;
}
