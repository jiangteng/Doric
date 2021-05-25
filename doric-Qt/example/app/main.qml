import QtQuick 2.12
import QtQuick.Controls 2.5

ApplicationWindow {
    visible: true
    width: 600
    height: 800
    title: qsTr("Scroll")

    ScrollView {
        anchors.fill: parent

        ScrollBar.horizontal.policy: ScrollBar.AlwaysOff
        ScrollBar.vertical.policy: ScrollBar.AlwaysOff

        ListView {
            width: parent.width
            model: 15
            delegate: Rectangle {
                Column {
                    anchors.centerIn: parent
                    Text {
                        text: {
                            switch (index) {
                                case 0:
                                    return "Counter.js"
                                case 1:
                                    return "EffectsDemo.js"
                                case 2:
                                    return "Gobang.js"
                                case 3:
                                    return "ImageDemo.js"
                                case 4:
                                    return "InputDemo.js"
                                case 5:
                                    return "LayoutDemo.js"
                                case 6:
                                    return "LayoutTestDemo.js"
                                case 7:
                                    return "ModalDemo.js"
                                case 8:
                                    return "NetworkDemo.js"
                                case 9:
                                    return "PopoverDemo.js"
                                case 10:
                                    return "ScrollerDemo.js"
                                case 11:
                                    return "SimpleDemo.js"
                                case 12:
                                    return "Snake.js"
                                case 13:
                                    return "StorageDemo.js"
                                case 14:
                                    return "TextDemo.js"
                            }
                        }
                    }
                }
                width: parent.width
                height: 60
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        demoBridge.navigate(index)
                    }
                }
            }
        }
    }
}
