import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    ListModel {
        id: arr
        ListElement {num: 1}
        ListElement {num: 2}
        ListElement {num: 3}
        ListElement {num: 4}
        ListElement {num: 5}
        ListElement {num: 6}
        ListElement {num: 7}
        ListElement {num: 8}
        ListElement {num: 9}
        ListElement {num: 10}
        ListElement {num: 11}
        ListElement {num: 12}
        ListElement {num: 13}
        ListElement {num: 14}
        ListElement {num: 15}
        ListElement {num: 16}
        ListElement {num: 17}
    }

    GridView {
        id: gView
        model: arr
        anchors {fill: parent; margins:50}
        //height: parent.height; width: parent.width
        cellWidth: width/4; cellHeight: height/4

        clip: true
        delegate: Rectangle {
            id: cell
            color: "yellow"
            height: gView.cellHeight; width: gView.cellWidth
            border.color: "black"
            scale: 1
            Text {anchors.centerIn: parent; text: model.num}
            MouseArea {anchors.fill: parent; onClicked: arr.remove(index)}


        }
        remove: Transition {
            id: removeAnim
            SequentialAnimation{
                PropertyAction {
                    //target: cell
                    property: "GridView.delayRemove"
                    value: true
                }

                ParallelAnimation{
                    NumberAnimation{
                        properties: "scale"
                        to: 0
                        duration: 1000
                    }

                    ColorAnimation {
                        to: "black"
                        duration: 1000
                    }
                }

                PropertyAction {
                    //target: cell
                    property: "GridView.delayRemove"
                    value: false
                }
            }
        }

        add: Transition {
                NumberAnimation{
                    property: "scale"
                    from: 0
                    to: 1
                    duration: 1000
                }
        }

        //        removeDisplaced: Transition{
        //            SequentialAnimation{
        //                NumberAnimation {
        //                    properties: "opacity"
        //                    to: 0.5
        //                    duration: 500
        //                }
        //                NumberAnimation {
        //                    properties: "opacity"
        //                    to: 1
        //                    duration: 500
        //                }
        //            }
        //        }

    }

    Rectangle {
        color: "cyan"
        height: 50; width: 70
        anchors {bottom: parent.bottom; horizontalCenter: parent.horizontalCenter}
        Text {anchors.centerIn: parent; text: "Add"}
        MouseArea { anchors.fill: parent; onClicked: arr.append({num:arr.count+1})}
    }


}
