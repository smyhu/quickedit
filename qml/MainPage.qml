import QtQuick 1.1
import com.nokia.meego 1.0

Page
{
    id: mainPage
    orientationLock: PageOrientation.LockPortrait

    Component
    {
        id: appDelegate

        Rectangle
        {
            id: appBg
            width: 120
            height: 140
            color: "transparent"
            border.color: "transparent"
            border.width: 5
            radius: 10

            Image
            {
                id: appIcon
                width: 80
                height: 80
                y: 20
                anchors.horizontalCenter: parent.horizontalCenter
                source: model.app.icon
                MouseArea
                {
                    anchors.fill: parent
                    onClicked:
                    {
                        controller.appSelected(model.app)
                        helpText.visible = false
                        //appBg.color = "cyan"
                    }
                }
            }

            Text
            {
                anchors
                {
                    top: appIcon.bottom
                    horizontalCenter: parent.horizontalCenter
                }
                color: "white"
                font.pixelSize: 16
                text: model.app.name
            }
        }
    }

    Rectangle
    {
        color: "black"
        anchors.fill: parent
    }

    Rectangle
    {
        id: apps
        color: "#222"
        border.color: "black"
        border.width: 5
        radius: 10
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.left: parent.left
        anchors.bottom: quicklaunch.top

        GridView
        {
            id: appview
            anchors.fill: parent
            cellWidth: 120
            cellHeight: 120
            focus: true
            model: appListModel
            delegate: appDelegate
        }

        Rectangle
        {
            id: helpText
            color: "#AA000000"
            anchors.fill: parent

            Label
            {
                id: label
                anchors.centerIn: parent
                text: qsTr("Select the Quick-launch icon you <br />want to change, then click<br />on the Application to replace it.")
                color: "white"
            }
        }
    }

    Rectangle
    {
        id: quicklaunch
        color: "black"
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.left: parent.left
        height: 154

        GridView
        {
            id: quicklaunchGrid
            anchors.fill: parent
            cellWidth: 120
            cellHeight: 154
            focus: true
            model: quickListModel
            delegate: appDelegate
            flickableDirection: Flickable.AutoFlickDirection
        }
    }
}
