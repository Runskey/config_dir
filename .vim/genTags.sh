#! /bin/sh

#path_pico="/home/lyang3/systems/products/lib"
#path_transcede="/home/lyang3/codeTree/framework_3g /home/lyang3/codeTree/fix_simulator /home/lyang3/codeTree/simulation_lib"

#file_list_pico=" -path *verif* -prune -path *CVS* -prune -path *Verif* -prune -name *.vhd -o -name *.asm -o -name *.s -o -name *.c -o -name *.h -o -name *.inc -o -name *.cpp -o -name *.cc"
#file_list_transcede=" -path *_tb* -prune -path *tb_* -prune -path *test* -prune -path *Test* -prune -path *ulceva1* -prune -path *crptb* -prune -path  -path *verif* -prune -path *Verif* -prune -name *.vhd -o -name *.asm -o -name *.s -o -name *.c -o -name *.h -o -name *.inc -o -name *.cpp -o -name *.cc"

#path_find=path_$1
#eval path_find=$(echo \$$path_find)

#echo "Now generate tags for $1 project!"
#echo "Including paths: $path_find"
#find $path_find $file_list_$1 > ~/.vim/cscope_$1.files

#rm -rf ~/.vim/cscope.files
#ln -s ~/.vim/cscope_$1.files ~/.vim/cscope.files
#cscope -bkq -i ~/.vim/cscope.files 


if [[ $1 == 'pico' ]]
then
  directory="/home/lyang3/systems/products/lib"
  file_type="-name *.vhd -o -name *.asm -o -name *.s -o -name *.c -o -name *.h -o -name *.inc -o -name *.cpp -o -name *.cc"
elif [[ $1 == 't' ]]
then
  directory="/home/lyang3/work/src_git_mindspeed/framework_3g /home/lyang3/work/src_git_mindspeed/fix_simulator /home/lyang3/work/src_git_mindspeed/simulation_lib"
  file_type="-name *.vhd -o -name *.asm -o -name *.s -o -name *.c -o -name *.h -o -name *.inc -o -name *.cpp -o -name *.cc -o -name *.hpp"
elif [[ $1 == 'dpdk' ]]
then
  directory="/home/lyang3/other_project/DPDK.L.1.2.2-2/DPDK"
  file_type="-name *.vhd -o -name *.asm -o -name *.s -o -name *.c -o -name *.h -o -name *.inc -o -name *.cpp -o -name *.cc -o -name *.hpp"
elif [[ $1 == 'ab' ]]
then
  directory="/home/lyang3/work/isg_cid-wireless_lte /home/lyang3/work/isg_cid-wireless_l2_l3"
  file_type="-name *.vhd -o -name *.asm -o -name *.s -o -name *.c -o -name *.h -o -name *.inc -o -name *.cpp -o -name *.cc -o -name *.hpp"
elif [[ $1 == 'nmm' ]]
then
  directory="/home/lyang3/work/src_songit_lte/lte_t2k_meta"
  file_type="-name *.vhd -o -name *.asm -o -name *.s -o -name *.c -o -name *.h -o -name *.inc -o -name *.cpp -o -name *.cc"
elif [[ $1 == 'mec' ]]
then
  if [[ $myconfig_platform == 'mac' ]]
  then
    directory="/Users/Lin/project/isg_cid-wireless_mec/nes /Users/Lin/project/isg_cid-wireless_mec/libs"
  elif [[ $myconfig_platform == 'cygwin' ]]
  then
    directory=""
  fi
  file_type="-name *.vhd -o -name *.asm -o -name *.s -o -name *.c -o -name *.h -o -name *.inc -o -name *.cpp -o -name *.cc"
elif [[ $1 == 'son' ]]
then
  if [[ $myconfig_platform == 'mac' ]]
  then
    directory="/Users/Lin/Cloud/cloudFolder/src/son_src"
  elif [[ $myconfig_platform == 'cygwin' ]]
  then
    directory="/home/lyang3/work/src_git_son"
  fi
  file_type="-name *.vhd -o -name *.asm -o -name *.s -o -name *.c -o -name *.h -o -name *.inc -o -name *.cpp -o -name *.cc"
else
  exit
fi

file_exclude="verif|CVS|test|Test|cnsim"
echo "Now generate tags for $1 project!"
find $directory -type f $file_type | grep -i -v -E $file_exclude > ~/.vim/cscope_$1.files

rm -rf ~/.vim/cscope.files
ln -s ~/.vim/cscope_$1.files ~/.vim/cscope.files
cscope -bkq -i ~/.vim/cscope.files 
