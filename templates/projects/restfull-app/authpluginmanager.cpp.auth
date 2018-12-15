#include "authpluginmanager.h"
#include "core.h"

AuthPluginManager::AuthPluginManager(Core *core):m_core(core)
{

}

AuthPluginManager::~AuthPluginManager()
{

}

void AuthPluginManager::loadConfig()
{
    for(QJsonValue jsonValue : m_core->pluginsConfig())
    {
        QJsonObject jsonObject = jsonValue.toObject();
        if (jsonObject.contains("type") && jsonObject.value("type").toString() == "auth")
            m_config.append(jsonObject);
    }
}

QJsonArray AuthPluginManager::config() const
{
    return  m_config;
}
