"""
This is to reprocess the pop code to make the pop file compatible 
with the file handling of the software.
"""
# dict = {sample: pop_code}
pop_code_dict = {}
where_the_sample_nested = 0
where_the_pop_code_nested = 2
with open("phase1_integrated_calls.20101123.ALL.panel") as f:
    for line in f:
        line_array = line.strip().split("\t")
        pop_code_dict[line_array[where_the_sample_nested]] = line_array[where_the_pop_code_nested]

with open("pop.csv", "w") as output:
    for pop in pop_code_dict:
        to_list = [pop, pop_code_dict[pop]]
        output.write(",".join(to_list) + "\n")




    