/*
  导出
  1.文本是否可见
  2.文本框宽、高
  3.边框宽、颜色
  4.背景颜色
  5.文字内容
  6.文字大小
  7.文字颜色
*/
import QtQuick 2.0

Rectangle {
    id:root
    width:rectangleWidth
    height: rectangleHeight*5

    //1.文本是否可见
    property bool textVisible:true

    //2.文本框宽、高
    property var rectangleHeight:35
    property var rectangleWidth:170

    //3.边框宽、颜色
    property var borderWidth:1
    property var borderColor:"#41719c"

    //4.背景颜色
    property var rectColor0:"#5b9bd5"
    property var rectColor1:"#5b9bd5"
    property var rectColor2:"#5b9bd5"
    property var rectColor3:"#5b9bd5"
    property var rectColor4:"#5b9bd5"

    //5.文字内容
    property var text0:"输入文字"
    property var text1:"输入文字"
    property var text2:"输入文字"
    property var text3:"输入文字"
    property var text4:"输入文字"

    //6.文字大小
    property var textSize0:18
    property var textSize1:18
    property var textSize2:18
    property var textSize3:18
    property var textSize4:18

    //7.文本颜色
    property var textColor0:"white"
    property var textColor1:"white"
    property var textColor2:"white"
    property var textColor3:"white"
    property var textColor4:"white"
    Column {
        Rectangle {//rect0
            id:rect0
            color:rectColor0
            width: root.rectangleWidth
            height: root.rectangleHeight
            border.width:root.borderWidth
            border.color:root.borderColor
            Text {
                font.pixelSize: textSize0
                anchors.centerIn: parent
                color:textColor0
                text:text0
                visible:textVisible
            }
        }
        Rectangle {//rect1
            color: rectColor1
            width: root.rectangleWidth
            height: root.rectangleHeight
            border.width:root.borderWidth
            border.color:root.borderColor
            Text {
                visible:textVisible
                font.pixelSize: textSize1
                anchors.centerIn: parent
                color:textColor1
                text:text1
            }
        }
        Rectangle {//rect2
            id:rect2
            color:rectColor2
            width: root.rectangleWidth
            height: root.rectangleHeight
            border.width:root.borderWidth
            border.color:root.borderColor
            Text {
                visible:textVisible
                font.pixelSize: textSize2
                anchors.centerIn: parent
                color:textColor2
                text:text2
            }
        }
        Rectangle {//rect3
            id:rect3
            color: rectColor3
            width: root.rectangleWidth
            height: root.rectangleHeight
            border.width:root.borderWidth
            border.color:root.borderColor
            Text {
                visible:textVisible
                font.pixelSize: textSize3
                anchors.centerIn: parent
                color:textColor3
                text:text3
            }
        }
        Rectangle {//rect4
            id:rect4
            color: rectColor4
            width: root.rectangleWidth
            height: root.rectangleHeight
            border.width:root.borderWidth
            border.color:root.borderColor
            Text {
                visible:textVisible
                font.pixelSize: textSize4
                anchors.centerIn: parent
                color:textColor4
                text:text4
            }
        }
    }
}

