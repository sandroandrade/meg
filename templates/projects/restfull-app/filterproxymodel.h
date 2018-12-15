#ifndef FILTERPROXYMODEL_H
#define FILTERPROXYMODEL_H

#include <QSortFilterProxyModel>
#include <QVariant>
#include <QVariantMap>

class FilterProxyModel: public QSortFilterProxyModel
{
    Q_OBJECT
    Q_PROPERTY(QObject *source READ source WRITE setSource)
    Q_PROPERTY(QString filterRoleName READ filterRoleName WRITE setFilterRoleName)
public:
    FilterProxyModel(QObject* parent = nullptr);

    Q_INVOKABLE void setFilterString(QString string);
    Q_INVOKABLE void setSortOrder(bool checked);

    QObject *source() const;
    void setSource(QObject *source);
    const QString filterRoleName() const;
    void setFilterRoleName(const QString filterRoleName);
    QVariantMap get(int row) const;
    bool filterAcceptsRow(int sourceRow,const QModelIndex &sourceParent) const;
private:
    QString m_filterRoleName;
};

#endif // FILTERPROXYMODEL_H
