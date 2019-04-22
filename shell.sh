#!/bin/bash
#xoa cac folder thua
ls -d */ | while read dir; do #ls -d */:chi liet ke folder
    if [ -d "$dir" ]; then #[ -d "$dir"]: kiem tra xem $dir co pai la 1 folder k
        rm -rf $dir #xoa tat ca folder ke ca folder cung dau
    fi
done
#Tao cac folder vs name la ngay/thang/nam cua 7 ngay trong tuan
dayofweek=$(date "+%u"); #In ra ngày của tuần (Thứ 2 được tính là ngày 1)
for (( i=1; i<=7; i++))
do
    distance=`expr "$i" - "$dayofweek"`;
    getday=$(date -d "$distance day" +%d_%m_%Y);#lay ra d/m/y theo dang d_m_y
    getkeyword=$(sed -n $i'p' idol.txt);# < :chuyen noi dung cua tep vao dau vao tieu chan cua lenh
    echo $getkeyword;
    #mkdir "$getday";
done
    
