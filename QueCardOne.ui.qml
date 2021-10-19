import QtQuick 2.15
import QtQuick.Controls 2.15
Page {
    id: page
    width: 600
    height: 400
    padding: 10
    Rectangle {
        id: background
        anchors.fill: parent
        color: "#1b500136"
        radius: 45
        MouseArea {
            id: swipe
            anchors.fill: parent
            preventStealing: false
            acceptedButtons: Qt.LeftButton
        }
        Rectangle {
            id: rightmargin
            width: parent.width / 5.7
            height: parent.height - 60
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.left: card.right
            anchors.rightMargin: 10
            anchors.topMargin: 10
            anchors.bottomMargin: 10
            anchors.leftMargin: 10

            color: "#ffffff"
            radius: 40

            SwipeView {
                id: swipeView
                height: rightmargin.height * 4/9
                width: parent.width
                anchors.top: rightmargin.top; anchors.topMargin: rightmargin.height * 1/9
                ListView {
                    id: listview
                        model: 20
                        delegate: ItemDelegate {
                            Rectangle {
                                id: object
                                width: rightmargin.width
                                height: parent.height
                                color: "#1b500136"
                                radius: 2
                                border.color: "#5edc9191"
                                border.width: 1
                                Label{
                                    id: objectText
                                    text: qsTr("Que " + index)
                                    font.pointSize: parent / 4
                                    anchors.centerIn: parent
                                }
                            }


                            required property int index
                        }
                }
            }


        }
        Rectangle {
            id: addButton
            anchors.right: parent.right
            anchors.left: card.right
            anchors.bottom: parent.bottom
            anchors.leftMargin: 20
            anchors.bottomMargin: 20
            anchors.rightMargin: 20
            width: height
            height: parent.height / 7
            color: "#62500136"
            state: "notPressed"
            radius: 500
            Label {
                id: addmore
                text: qsTr("+")
                font.pixelSize: parent.height / 3
                anchors.centerIn: parent
            }
            MouseArea {
                id: addButtonPressed
                anchors.fill: parent
                onPressed: addButton.state = "clicked"
            }
            Rectangle {
                id: edit
                anchors.right: parent.right
                anchors.left: card.right
                anchors.bottom: addButton.top
                anchors.bottomMargin: 5
                width: addButton.width
                height: addButton.height / 1.35
                color: "#62500136"
                radius: 500
                Label {
                    id: editt
                    text: qsTr("EDIT")
                    font.pixelSize: parent.height / 3
                    anchors.centerIn: parent
                }
            }
        }
        Rectangle {
            id: card
            width: background.width / 1.3
            height: background.height - 20
            radius: 50
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.margins: 10
            color: "#ffffff"

            Label {
                id: label
                text: qsTr("2 + 2")
                font.pixelSize: parent.width / 12
                anchors.centerIn: parent
            }
            MouseArea {
                id: flipIt
                pressAndHoldInterval: 555
                anchors.fill: parent
                visible: true
                onPressAndHold: card.state = "pressed"
                onReleased: card.state = ""
            }
            Rectangle {
                id: newCardOptions
                anchors.fill: card
                radius: 45
                visible: false
                color: "#ffffff"
                Rectangle {
                    id: doneshape
                    width: background.width / 6
                    height: background.height / 6
                    color: "#1b500136"
                    radius: 35
                    anchors.right: parent.right
                    anchors.bottom: parent.bottom
                    anchors.rightMargin: 20
                    anchors.bottomMargin: 20
                    Label {
                        id: done
                        text: qsTr("Done")
                        anchors.centerIn: parent
                        font.pointSize: parent.height / 4
                    }
                    MouseArea {
                        id: endClicked
                        anchors.fill: parent
                        onPressed: addButton.state = ""
                    }
                }
                TextInput {
                    id: textInput
                    x: 117
                    y: 141
                    width: 80
                    height: 20
                    text: qsTr("Text Input")
                    font.pixelSize: 12
                }

                Text {
                    id: text1
                    x: 54
                    y: 76
                    text: qsTr("Text")
                    font.pixelSize: 12
                }
            }
        }
    }

    states: [
        State {
            name: "flip"
            when: (card.state == "pressed")

            PropertyChanges {
                target: label
                text: qsTr("4")
            }
            PropertyChanges {
                target: card
                color: "#62500136"
            }
        },
        State {
            name: "addNewCard"
            when: (addButton.state == "clicked")
            PropertyChanges {
                target: addButton
                color: "#1b500136"
            }
            PropertyChanges {
                target: newCardOptions
                visible: true
            }
            PropertyChanges {
                target: flipIt
                visible: false
            }
            PropertyChanges {
                target: listview
                restoreEntryValues: true
                explicit: true
                model: model + 1

            }
        }
    ]
}
