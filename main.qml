import QtQuick 2.15
import QtQuick.Controls 2.15

ApplicationWindow {
    width: 640
    height: 480
    minimumHeight: 320
    minimumWidth: 426
    visible: true
    title: qsTr("Cards")

    SwipeView {
        id: swipeViewCards
        anchors.fill: parent
        orientation: Qt.Vertical
        QueCardOne {
        }
    }
}
