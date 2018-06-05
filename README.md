```
                 _     _
   ___ ___ _   _| |__ | |__   ___ _ __ TM
 / _` / __| | | | '_ \| '_ \ / _ \ '__|
| (_| \__ \ |_| | |_) | |_) |  __/ |
 \__, |___/\__,_|_.__/|_.__/ \___|_|
    |_|    Like qsub, but better
```

`qsubber` is a submission script compiler and job submitter for SGE/qsub.

## Why?

Job submission scripts quickly accumulate when using SGE and are difficult to organise and maintain. Most submission scripts contain boilerplate setup/teardown code around the specific job command that is repeated in multiple scripts. `qsubber` solves these two problems by centralising the boilerplate code and providing an intuitive API to compile submission scripts and submit them to the queue.

## Usage

```
./qsubber JOB_NAME SCRIPT_AND_ARGS [--KWARGS ...]
```

## Dependencies

* [Fire](https://github.com/google/python-fire)

## Installation

```
pip install fire
```

Edit the following files:

**File** | **Contents**
--- | ---
`prologue.sh` | Shell commands to set up the job environment
`gpu.sh` | Source CUDA libraries and set `LD_LIBRARY_PATH`
`epilogue.sh` | Save the job output and tear down the job environment

## Options

Specify options like this: `--PARAMETER VALUE`

**Parameter** | **Default** | **Alias**
--- | --- | ---
`shell` | `/bin/bash`
`resource_request` | `y` | `R`
`working_directory` | `$HOME/results` | `wd`
`run_time` | `1:00:0` | `rt`
`memory` | `1.8G` | `mem`
`scratch` | `10G`
`parallel` | `None` | `pe`
`gpu` | `None`
`submit_command` | `qsub`
`submission_script_path` | `None`
`virtual_env` | `None` | `venv`
`results_dir` | `$HOME/results` | `res`
`output_dir` | `/scratch0/$USER/${JOB_NAME}_${JOB_ID}${sti}` | `out`

Setting `submission_script_path` to a path will save the compiled submission script

# 👾
