#include "meglistmodel.h"
#include "meglistmodel.h"

MegListModel::MegListModel(QObject *parent) :
    QAbstractListModel(parent)
{

}

void MegListModel::addData(const QVariantMap &unit)
{
    beginInsertRows(QModelIndex(), rowCount(), rowCount());
    m_data.append(unit);
    endInsertRows();
}

int MegListModel::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);
    return m_data.count();
}

QVariant MegListModel::data(const QModelIndex &index, int role) const
{
    if (index.row() < 0 || index.row() >= m_data.count())
        return QVariant();

    const QVariant &name = m_data.at(index.row());
    if (role == NameRole)
        return name;
    return QVariant();
}

bool MegListModel::setData(const QModelIndex &item, const QVariant &value, int role)
{
    if (item.isValid() && role == Qt::EditRole) {
        MegListModel::setData(item, value, role);
        emit dataChanged(item, item);
        return true;
    }
    return false;

}

QHash<int, QByteArray> MegListModel::roleNames() const
{
    QHash<int, QByteArray> roles;
    roles[NameRole] = "name";
    return roles;
}

QVariant MegListModel::get(int index) const
{
    return m_data.at(index);
}

bool MegListModel::clearAll()
{
    beginResetModel();
    m_data.clear();
    endResetModel();
    return true;
}
