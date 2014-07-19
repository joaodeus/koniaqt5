#include "boarddrawing.h"

#include <QPainter>
#include <qglobal.h>

BoardDrawing::BoardDrawing()
{
    m_color.setRgbF(1, 0, 0, 1);

    /*qsrand(qrand());
    int max = 300;
    for (int i = 0; i < 100 ; i++)
    {
        m_points << QPoint(rand() % max, rand() % max);
    }*/
    //points << QPointF(10.4, 20.5) << QPointF(20.2, 30.2);


}


void BoardDrawing::paint(QPainter *painter)
{
   // QPen pen;//(m_color, 5);
   // painter->setPen(pen);
   // painter->setRenderHint(QPainter::Antialiasing, true);

    for (int i = 0; i < m_points.size();i++)
    {
        QPen pen(m_listColor[i], 5);
       // pen.setColor(m_listColor[i]);
        painter->setPen(pen);
        painter->setRenderHint(QPainter::Antialiasing, true);
        painter->drawPoint(m_points[i]);
    }
   // painter->drawPoints(m_points);
}

QColor BoardDrawing::color() const
{
    return m_color;
}

void BoardDrawing::setColor(const QColor &color)
{
    if (m_color != color)
    {
        m_color = color;
        emit colorChanged(color);
    }
}

void BoardDrawing::addPoint(const int &x, const int &y)
{
    m_points.append(QPoint(x,y));
    m_listColor.append(m_color);
    qDebug()<<"adding points:" <<m_points.size();
    qDebug()<<"x, y: "<<x<<";"<<y;
    update();
}
