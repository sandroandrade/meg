#include "filterproxymodel.h"
#include "meglistmodel.h"

FilterProxyModel::FilterProxyModel(QObject *parent)
 : QSortFilterProxyModel(parent)
{
    setSortOrder(false);
}

void FilterProxyModel::setFilterString(QString string)
{
    QRegExp regExp(string, Qt::CaseSensitive, QRegExp::FixedString);
    this->setFilterRegExp(regExp);
}

void FilterProxyModel::setSortOrder(bool checked)
{
    if(checked)
        this->sort(0, Qt::DescendingOrder);
    else
        this->sort(0, Qt::AscendingOrder);
}

QObject *FilterProxyModel::source() const
{
    return sourceModel();
}

void FilterProxyModel::setSource(QObject *source)
{
    setSourceModel(qobject_cast<QAbstractItemModel *>(source));
    this->setFilterRole(NameRole);
}

const QString FilterProxyModel::filterRoleName() const
{
    return m_filterRoleName;
}

void FilterProxyModel::setFilterRoleName(const QString filterRoleName)
{
    if (m_filterRoleName == filterRoleName)
        return;
    m_filterRoleName = filterRoleName;
}

bool FilterProxyModel::filterAcceptsRow(int sourceRow,const QModelIndex &sourceParent) const
{
    for(int i = 0; i < sourceModel()->columnCount(); i ++)
    {
        QModelIndex index = sourceModel()->index(sourceRow, i, sourceParent);
        QString fieldText = sourceModel()->data(index, this->filterRole()).toMap().value(m_filterRoleName).toString();
        if(fieldText.trimmed().contains(filterRegExp()))
            return true;
    }

    return false;
}

QVariantMap FilterProxyModel::get(int row) const
{
    QVariantMap map;
    QModelIndex modelIndex = index(row, 0);
    QHash<int, QByteArray> roles = roleNames();
    for (QHash<int, QByteArray>::const_iterator it = roles.begin(); it != roles.end(); ++it)
        map.insert(it.value(), data(modelIndex, it.key()));
    return map;
}
