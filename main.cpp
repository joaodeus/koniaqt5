#include <QtGui/QGuiApplication>
#include "qtquick2applicationviewer.h"

#include "boarddrawing.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    qmlRegisterType<BoardDrawing>("DrawingBoard",1,0,"BoardDrawing");

    QtQuick2ApplicationViewer viewer;
    viewer.setMainQmlFile(QStringLiteral("qml/KoniaQt5/main.qml"));
    viewer.showExpanded();

    return app.exec();
}
