```
                 _     _
   ___ ___ _   _| |__ | |__   ___ _ __ TM
 / _` / __| | | | '_ \| '_ \ / _ \ '__|
| (_| \__ \ |_| | |_) | |_) |  __/ |
 \__, |___/\__,_|_.__/|_.__/ \___|_|
    |_|    Like qsub, but better
```

`qsubber` is a submission script compiler and job submitter for [SGE](https://en.wikipedia.org/wiki/Oracle_Grid_Engine)/qsub.

## Why?

Submission scripts accumulate quickly when using SGE. These scripts are difficult to organise and maintain.

Most submission scripts contain the specific job being run and some boilerplate setup/teardown code. For example, a typical Python job might look something like this:

```bash
# Setup
...

# Job
python ...

# Teardown
...
```

`qsubber` solves these problems by centralising the boilerplate code and providing an intuitive API to compile submission scripts and submit them to SGE.

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

**Parameter** | **Alias** | **Default** | **Example value**
--- | --- | --- | ---
`shell` | | `/bin/bash`
`resource_request` | `R` | `y`
`working_directory` | `wd` | `$HOME/results`
`run_time` | `rt` | `1:00:0`
`memory` | `mem` | `1.8G`
`scratch` | | `10G`
`parallel` | `pe` | `None` | `4`
`gpu` | | `None` | `1`
`submit_command` | `qsub`
`submission_script_path` | | `None` | `$HOME/qsub.sh`
`virtual_env` | `venv` | `None` | `conda_env`
`results_dir` | `res` | `$HOME/results`
`output_dir` | `out` | `/scratch0/$USER/${JOB_NAME}_${JOB_ID}${sti}`

Setting `submission_script_path` to a path will save the compiled submission script

# 👾
