#include <QGuiApplication>
#include <QQuickView>
#include<QQmlEngine>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQuickView viewer;
    viewer.setResizeMode(QQuickView::SizeRootObjectToView);
    viewer.setSource(QUrl("qrc:/main.qml"));
    viewer.show();
    QObject::connect(viewer.engine(), SIGNAL(quit()), &app, SLOT(quit()));
    return app.exec();
}
