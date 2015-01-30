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


if [ $1 == 'pico' ]
then
  directory="/home/lyang3/systems/products/lib"
  file_exclude="verif|CVS"
  file_type="-name *.vhd -o -name *.asm -o -name *.s -o -name *.c -o -name *.h -o -name *.inc -o -name *.cpp -o -name *.cc"
elif [ $1 == 't' ]
then
  directory="/home/lyang3/work/src_git_mindspeed/framework_3g /home/lyang3/work/src_git_mindspeed/fix_simulator /home/lyang3/work/src_git_mindspeed/simulation_lib"
#  file_exclude="_tb|tb_|test|ulceva1|crptb|verif"
  file_exclude="_tb|tb_|testcase|UnitLevelTest|ulceva1|crptb|verif"
  file_type="-name *.vhd -o -name *.asm -o -name *.s -o -name *.c -o -name *.h -o -name *.inc -o -name *.cpp -o -name *.cc -o -name *.hpp"
elif [ $1 == 'nmm' ]
then
  directory="/home/lyang3/work/src_songit_lte/lte_t2k_meta"
  file_exclude="verif|CVS"
  file_type="-name *.vhd -o -name *.asm -o -name *.s -o -name *.c -o -name *.h -o -name *.inc -o -name *.cpp -o -name *.cc"
elif [ $1 == 'son' ]
then
  directory="/home/lyang3/work/src_git_son"
  file_exclude="verif|CVS"
  file_type="-name *.vhd -o -name *.asm -o -name *.s -o -name *.c -o -name *.h -o -name *.inc -o -name *.cpp -o -name *.cc"
else
  exit
fi

echo "Now generate tags for $1 project!"
find $directory -type f $file_type | grep -i -v -E $file_exclude > ~/.vim/cscope_$1.files

rm -rf ~/.vim/cscope.files
ln -s ~/.vim/cscope_$1.files ~/.vim/cscope.files
cscope -bkq -i ~/.vim/cscope.files 
