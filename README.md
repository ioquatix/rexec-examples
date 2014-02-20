# MyScript Daemon Example

This is a simple example of how to use [RExec][1].

The script we will run as a daemon is `my-script.rb`.

[1]: http://www.codeotaku.com/projects/rexec

## 1- Daemon Execute

The simplest option is to run the script using daemon-exec which runs the progress in the background. Combined with `nohup` this provides a robust way to launch a process which will run in the background to completion.

	> daemon-exec --help
	Usage: daemon-exec [-I stdin] [-O stdout] [-E stderr] [script/stdin]
	Copyright (c) 2010 Samuel Williams <http://www.oriontransfer.co.nz/>.
		-d [dir]                         Daemons working path, default /
		-s                               Don't attempt to relocate arguments to absolute paths
	File / Pipe Options:
		-I [path]                        File for STDIN, defaults to /dev/null
		    --stdin                      Read from current STDIN to daemon process.
		-O [path]                        File for STDOUT, defaults to /tmp/daemon-exec.log
		-E [path]                        File for STDERR, defaults to /tmp/daemon-exec-error.log
	Misc Options:
		-p                               Print out the PID of the forked process
		-V                               Print verbose information about what is going on
		-h                               Show this help/version information and exit

To start `my-script.rb` in the background:

	> daemon-exec my-script.rb

To avoid signals being passed to the script run in combination with nohup:

	> nohup daemon-exec my-script.rb

## 2- Daemon Task

You can also run it in a similar mode to the daemons script you’ve provided below. Instead of Daemons.run_proc, you call 

	task = RExec::Task.open("my-script.rb", :daemonize => true)

Then you’d be responsible for managing the task yourself:

	task.wait

## 3- Daemon Singleton

This gives you complete control over the process and can be integrated into other libraries. Included in this project is `my-script-daemon` which shows how to run `my-script.rb`.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

Released under the MIT license.

Copyright, 2012, by [Samuel G. D. Williams](http://www.codeotaku.com/samuel-williams).

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
