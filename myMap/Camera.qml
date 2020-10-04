import QtQuick 2.4
import QtLocation 5.14

MapQuickItem {
    id: camera

    /*导出的属性*/
    property string displayBoxInfo;//经纬度提示框内容
    property bool displayBoxIsVisible:false//经纬度提示框信息是否可见

    anchorPoint.x: image.width/2  //图片的某个位置在经纬度中心
    anchorPoint.y: image.height/2
    autoFadeIn:false//默认为true，为true的话，当地图缩小至一定程度，即地图范围很大时，图片会消失
    sourceItem: Grid {
        columns: 1
        Grid {
            horizontalItemAlignment: Grid.AlignHCenter
            Image {//图片
                id: image
                width:50
                height: 50
                source: "camera.png"
            }
            Rectangle {//信息提示框
                color: "lightblue"
                border.width: 1
                width: text.width * 1.3
                height: text.height * 1.3
                visible: displayBoxIsVisible//初始设置不可见
                radius: 5
                Text {
                    id: text
                    anchors.centerIn: parent
                    text: displayBoxInfo
                }
            }
        }
    }

}

