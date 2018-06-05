# If code ran successfully, save the contents of Scratch
if [ ${CODE_DONE:-x} = true ]; then
    echo CODE_DONE $($the_time)
    unset LD_LIBRARY_PATH  # Prevents segmentation faults
    tar zcvf $results_dir/${the_date}_${JOB_NAME}_${JOB_ID}${sti}.tar.gz $output_dir
    echo DONE $($the_time)
else
    echo ERROR $($the_time)
fi
