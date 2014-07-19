#ifndef BOARDDRAWING_H
#define BOARDDRAWING_H

#include <QQuickPaintedItem>
#include <QPolygon>

class BoardDrawing : public QQuickPaintedItem
{
    Q_OBJECT
    Q_PROPERTY(QColor color READ color WRITE setColor NOTIFY colorChanged)
public:
    BoardDrawing();
    void paint(QPainter *painter);


    QColor color() const;
signals:
    void colorChanged(QColor newColor);
public slots:
    void setColor(const QColor &color);
    void addPoint(const int &x, const int &y);

private:
    QPolygon m_points;
    QList<QColor> m_listColor;
    QColor m_color;
};

#endif // BOARDDRAWING_H
