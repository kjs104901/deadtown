if iap_status() == iap_status_available
{
    if iap_auto_consume == 0
    {
        for (var i=0; i<ds_list_size(global.iap_product_list); i++)
        {
            var val = ds_list_find_value(global.iap_product_list, i);
            {
                var idd = ds_map_find_value(val,"id")
                if iap_check_consume(idd)
                {
                    iap_consume(idd)
                }
            }
        }
        iap_auto_consume = 1
    }
}
