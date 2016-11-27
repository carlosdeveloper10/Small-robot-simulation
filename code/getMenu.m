%% returns a option menu
function str_menu = getMenu(menu)
    
clc
    if(menu == 1)
        str1 = '==============================================================\n';
        str2 = '=========     ** Motion menu for the robot  **     ===========\n';
        str3 = '==============================================================\n';
        str4 = '-------Please choose a option of motion for the robot---------\n';
        str5 = '(1) Single movement\n';
        str6 = '(2) Compound movement (Work)\n';
        str7 = '(4) Select other robot\n';
        str8 = 'ctrtl + c to stop the app\n';
        str9 = 'Type your option -> ';

        str_menu = strcat(str1, str2, str3, str4, str5, str6, str7, str8, str9);
    end
    if(menu == 2)
        str1 = '=============     *********************     ==================\n';
        str2 = '=============     ** WELCOME TO RBS  **     ==================\n';
        str3 = '=============     *********************     ==================\n';
        str4 = '-------           Please a following robots          ---------\n';
        str5 = '(1) Scara\n';
        str6 = '(2) Mitsubishi\n';
        str7 = '(3) fanuc\n';
        str8 = 'ctrtl + c to stop the app\n';
        str9 = 'Type your option -> ';

        str_menu = strcat(str1, str2, str3, str4, str5, str6, str7, str8, str9);
    end
    if(menu == 3)
        str1 = '-------           Chose a option          ---------\n';
        str5 = '(1) See T in a any time\n';
        str6 = '(2) See all Ts\n';
        str7 = '(3) See x, y, and z\n';
        str8 = 'Type your option -> ';

        str_menu = strcat(str1, str5, str6, str7, str8);
    end
end