var fireTime;

fireTime = date_inc_day(date_current_datetime(), 1);
fireTime = date_inc_minute(date_current_datetime(), 1);
data = "1day"
if lang_type_get() == 0
{
    push_local_notification(fireTime, "1 day rewards", "It's been a day. Get your bonus. 10 coins", data);
}
else if lang_type_get() == 1
{
    push_local_notification(fireTime, "1일 보상", "1일이 지났습니다. 재접속해서 보상을 받으세요. 10 코인", data);
}

fireTime = date_inc_day(date_current_datetime(), 3);
fireTime = date_inc_minute(date_current_datetime(), 3);
data = "3days"
if lang_type_get() == 0
{
    push_local_notification(fireTime, "3 days rewards", "It's been three days. Get your bonus. 40 coins", data);
}
else if lang_type_get() == 1
{
    push_local_notification(fireTime, "3일 보상", "3일이 지났습니다. 재접속해서 보상을 받으세요. 40 코인", data);
}

fireTime = date_inc_day(date_current_datetime(), 7);
fireTime = date_inc_minute(date_current_datetime(), 7);
data = "7days"
if lang_type_get() == 0
{
    push_local_notification(fireTime, "7 days rewards", "It's been seven days. Get your bonus. 100 coins", data);
}
else if lang_type_get() == 1
{
    push_local_notification(fireTime, "7일 보상", "7일이 지났습니다. 재접속해서 보상을 받으세요. 100 코인", data);
}
