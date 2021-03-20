if (( $# < 1 ));then
	echo $0":file_name"
else
	for par in $@;do
		file_res=`file $par`
		if [[ $file_res =~ "8859" ]];then
			iconv -f gb18030 -t utf-8 -o $par".iconv" $par
			rm $par
			mv $par".iconv" $par
		else
			echo 'jump '$par
		fi
	done
fi
