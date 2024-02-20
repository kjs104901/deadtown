/// ui_message(message)
for (i=global.ui_message_number-2; 0<=i; i--)
{
    global.ui_message[i+1] = global.ui_message[i]
}

global.ui_message[0] = argument0
