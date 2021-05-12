
IDS = range(1,100)

rule all:
	input: expand("output/{sample}.txt", sample=IDS)

rule do_nothing:
	output: "output/{id}.txt"
	threads: 4
	resources:
		mem_mb=4000, disk_mb=20000
	shell:
		'''
		sleep 120s
		echo "Hello World!" > {output}
		'''
