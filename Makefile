all: metrics

ctxt_: metrics.sh
	chmod +x $^
	./$^

clean:
	rm -f metrics

