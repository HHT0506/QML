import QtQuick 2.0
Rectangle
{
    id: root
    width: 90
    height: 40
    property alias textSize:buttonText.font.pointSize //导出按钮文字字体大小、颜色、内容等属性
    property alias textColor:buttonText.color
    property alias text:buttonText.text


    signal clicked   //可以在外部通过onClicked:等方式获取按钮状态
    signal released
    signal hovered
    signal pressed

    Text{
        id:buttonText
        text:"Button"
        visible:false
        anchors.centerIn: parent
        color:"white"
        font.pointSize: 15
    }
    Text{
        id:buttonText1
        text:buttonText.text
        x:buttonText.x
        y:buttonText.y
        color:buttonText.color
        font.pointSize: buttonText.font.pointSize
    }

    gradient:leave.gradient
    //这里想设置不同状态下的渐变，不可以直接在gradient:中通过if判断的方式设置，也不能在MouseArea状态改变时设置，
    //均会报错，只能在下面两个Rectangle中设置，然后状态改变时直接“借用”
    Rectangle{
        id:leave
        gradient: Gradient {
                    GradientStop { position: 0.0;   color: "#787878" }
                    GradientStop { position: 0.495; color: "#000000" }
                    GradientStop { position: 0.495; color: "#000000" }
                    GradientStop { position: 1.0;   color: "#787878" }
              }
    }
    Rectangle{
        id:hover
        gradient: Gradient {
                    GradientStop { position: 0.0;   color: "#AAAAAA" }
                    GradientStop { position: 0.495; color: "#000000" }
                    GradientStop { position: 0.495; color: "#000000" }
                    GradientStop { position: 1.0;   color: "#AAAAAA" }
              }
    }

    MouseArea{
        anchors.fill:parent;
        hoverEnabled:true;
        onPressed: {
            parent.gradient=leave.gradient
            root.pressed()
            buttonText1.x=buttonText1.x+1
            buttonText1.y=buttonText1.y+1
            }
        onEntered:{
            parent.gradient=hover.gradient
            root.hovered()
        }
        onExited:{
            parent.gradient=leave.gradient
        }
        onReleased:{
            parent.gradient=hover.gradient
            root.released()
            buttonText1.x=buttonText1.x-1
            buttonText1.y=buttonText1.y-1
        }
        onClicked:
        {
            root.clicked();
        }
    }

}
