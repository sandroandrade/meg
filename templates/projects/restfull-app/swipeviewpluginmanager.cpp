#include "swipeviewpluginmanager.h"
#include "core.h"

SwipeViewPluginManager::SwipeViewPluginManager(Core *core):m_core(core)
{

}

SwipeViewPluginManager::~SwipeViewPluginManager()
{

}

void SwipeViewPluginManager::loadConfig()
{
    for(QJsonValue jsonValue : m_core->pluginsConfig())
    {
        QJsonObject jsonObject = jsonValue.toObject();
        if (jsonObject.contains("showInSwipeView") && jsonObject.value("showInSwipeView").toBool() == true)
        {
            if (jsonObject.contains("swipeViewPosition") && jsonObject.value("swipeViewPosition").toInt() < m_config.size())
                m_config.insert(jsonObject.value("swipeViewPosition").toInt(), jsonObject);
            else
                m_config.append(jsonObject);
        }
    }
}

QJsonArray SwipeViewPluginManager::config() const
{
    return  m_config;
}
