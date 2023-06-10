# default call server and starts logging
default: server
	@echo "Terminal logging starting..."  
	@# tail and awk work together to extract Jekyll regeneration messages
	@@(tail -f nohup.out | awk '/^ *Regenerating:/ { regenerate=1 } regenerate { if (/^[[:blank:]]*$$/) { regenerate=0 } else { print } }') 2>/dev/null &
	@echo "Terminal logging started"  
	@sleep 3
	@# outputs startup log, removes last line ($$d) as ctl-c message is not applicable for background process
	@@sed '$$d' nohup.out 

# start the local web server
server: stop convert
	@echo "Starting server..."
	@@nohup bundle exec jekyll serve -H 0.0.0.0 -P 4100 2>&1 & \
		PID=$$!; \
		echo "Server PID: $$PID"
	@@until [ -f nohup.out ]; do sleep 1; done
	@echo "Server is running"


# convert nb notebooks to markdown
convert:
	@echo "Converting IPYNB files..."
	@python scripts/convert_notebooks.py


# clean up project, to avoid issues stop is dependency
clean: stop
	@echo "Cleaning converted IPYNB files..."
	@@rm -f _posts/*_IPYNB_2_.md
	@rm -rf _site


# stop the server and clean up the port
stop:
	@echo "Stopping server..."
	@# kills process running on port 4100
	@@lsof -ti :4100 | xargs kill >/dev/null 2>&1 || true
	@# kills previously running logging processes
	@pkill -f "tail -f nohup.out" || true  
	@# removes log
	@rm -f nohup.out


