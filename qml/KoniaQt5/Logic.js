
function PhoneInitialPositionX(pageWidth, phoneWidth)
{
    return pageWidth/2 - phoneWidth/2
}

function PhoneInitialPositionY(gameHeight, seaHeight, plataformHeight, phoneHeight)
{
    return gameHeight - seaHeight - plataformHeight + phoneHeight
}

function PhoneFinalPositionX (pageWidth)
{
    return Math.random()*pageWidth
}

function PhoneFinalPositionY (pageHeight, seaHeight)
{
    return pageHeight-seaHeight + Math.random()*seaHeight
}


function setPhoneRandomModel()
{
    //We will make it 70% chances of being a M Phone, 30% being a W Phone
    if (Math.random() > 0.3)
        return true
    else
        return false
}

function setPhoneColor(isM)
{
    var model

    if (isM)
        model = "M"
    else
        model = "W"

    var phonecolor=Math.floor( Math.random() * 6 )

    switch(phonecolor) {
        case 0:
            return "qrc:/images/images/" + model + "Phone_black.png"
            break;
        case 1:
            return "qrc:/images/images/" + model + "Phone_blue.png"
            break;
        case 2:
            return "qrc:/images/images/" + model + "Phone_green.png"
            break;
        case 3:
            return "qrc:/images/images/" + model + "Phone_orange.png"
            break;
        case 4:
            return "qrc:/images/images/" + model + "Phone_white.png"
            break;
        case 5:
            return "qrc:/images/images/" + model + "Phone_yellow.png"
            break;
        default:
            return "qrc:/images/images/" + model + "Phone_yellow.png"
    }
}

function checkColision(x1, y1, x2, y2)
{
    var precision = 10
    var dist = Math.sqrt( (x2-x1)^2 + (y2-y1)^2 )
    if (dist < precision)
        return true
    else
        return false
}
