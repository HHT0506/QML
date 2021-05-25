//github
import QtQuick 2.4
import QtQuick.Window 2.2
import QtPositioning 5.5
import QtLocation 5.6

Rectangle {
    width: 700
    height: 500
    visible: true

    //下面的两个值可直接赋值给Plane的coordinate值
    property variant qinhuangdao: QtPositioning.coordinate(39.91, 119.5284)//燕大工程小院
    property variant qinhuangdao1: QtPositioning.coordinate(37.91, 119.5284)//燕大工程小院


    //两个文本框加一个按钮
    Row{
        id:topRow
         anchors.left:parent.left
         anchors.top:parent.top
         anchors.margins:4
         spacing:4
         z:1

        Rectangle{//两个输入框
            id:rect_longitude
            width:100
            height: 40
            color:"yellow"

            TextInput{
                selectByMouse: true
                mouseSelectionMode:TextInput.SelectWords
                id:input_longitude
                anchors.centerIn:parent
                font.pixelSize: 20
                text:"39.91"
            }
        }

        Rectangle{
            id:rect_latitude
            width:100
            height: 40
            color:"pink"
            TextInput{
                id:input_latitude
                selectByMouse: true
                mouseSelectionMode:TextInput.SelectWords
                anchors.centerIn:parent
                font.pixelSize: 20
                text:"119.5284"
            }
        }

    }

    //经纬度
    Row{
        anchors.top:topRow.bottom
        anchors.left:topRow.left
        spacing:4
        z:1
        Rectangle{
            width:100
            height: 40
            color:"yellow"
            Text{
                anchors.centerIn: parent
                color:"red"
                font.pixelSize: 20
                text:qsTr("纬度")
            }
        }
        Rectangle{
            width:100
            height: 40
            color:"pink"
            Text{
                anchors.centerIn: parent
                color:"red"
                font.pixelSize: 20
                text:qsTr("经度")
            }
        }
    }

    //将地图嵌套在一个Rectangle中
    Rectangle{
         width:1920
         height:1080
         z:0
         anchors.centerIn: parent
        Map {
            id: map
            anchors.centerIn: parent;
            anchors.fill: parent
            center:qinhuangdao
            plugin: Plugin {
                id:mapPlugin
                name: "mapboxgl" // "mapboxgl", "esri","osm"等使用的地图插件
            }
            Camera {
                id: qmlPlane
                coordinate: qinhuangdao
                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onClicked: {
                        console.log("待添加事件")
                    }
                    onEntered: {//指针放在相机上时显示经纬度信息
                        parent.displayBoxInfo="纬度为："+parent.coordinate.latitude+"\n经度为："+parent.coordinate.longitude
                        parent.displayBoxIsVisible=true
                    }
                    onExited: parent.displayBoxIsVisible=false//离开时设置信息框不可见
                }
            }

            Camera {
                id: qmlPlane1
                coordinate: qinhuangdao1
                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onClicked: {
                        console.log("待添加事件")
                    }
                    onEntered: {
                         parent.displayBoxInfo="纬度为："+parent.coordinate.latitude+"\n经度为："+parent.coordinate.longitude
                        parent.displayBoxIsVisible=true
                    }
                    onExited: parent.displayBoxIsVisible=false
                }
            }

        }
    }
}
