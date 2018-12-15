#ifndef MEGLISTMODEL_H
#define MEGLISTMODEL_H

#include <QAbstractListModel>
#include <QObject>

enum Roles {
    NameRole = Qt::UserRole + 1,
};

class MegListModel : public QAbstractListModel
{
    Q_OBJECT
    Q_PROPERTY(int count READ rowCount NOTIFY countChanged)
public:
    explicit MegListModel(QObject *parent = nullptr);
    int rowCount(const QModelIndex & parent = QModelIndex()) const override;
    QVariant data(const QModelIndex & index, int role = Qt::DisplayRole) const override;
    bool setData(const QModelIndex &index, const QVariant &value, int role) override;
    Q_INVOKABLE void addData(const QVariantMap &unit);
    Q_INVOKABLE QVariant get(int index) const;
    Q_INVOKABLE bool clearAll();
protected:
    QHash<int, QByteArray> roleNames() const override;
private:
    QVariantList m_data;
signals:
    void countChanged(int c);
};
#endif // MEGLISTMODEL_H
