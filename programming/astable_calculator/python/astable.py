import math

log2 = math.log(2);
e12_arr = [1.0, 1.2, 1.5, 1.8, 2.2, 2.7, 3.3, 3.9, 4.7, 5.6, 6.8, 8.2, 10]

def getFrequency(r1, r2, c):
	return 1 / (log2*c*(r1+(2*r2)))

def getHigh(r1, r2, c):
	return log2*c*(r1+r2)

def getLow(r1, r2, c):
	return log2*c*r2

def getError(actual, estimate):
	return (((math.fabs(actual-estimate))/actual)*100)

	
def getComponents(f, r1_const):
	iCount = 0

	r1 = r2 = 1E3
	c0 = f0 = 0
	
	f_curr = f_save = 0
	err = err_save = 0
	r2_curr = 1
	r1_curr = 1
		
	initialized = True
	
	iPass = False
	
	for r1k in range(3, 15, 1):
		for r1I in e12_arr:
			
			# Check if outer loop is worth it.
			if r1_const != 0:
				r1_curr = r1_const
			else:
				r1_curr = r1I*math.pow(10,r1k)
				
			for ck in range(0, -18, -1):
				for cI in e12_arr:
				
					c0_curr = cI*math.pow(10,ck)
					
					for rk in range(3, 15, 1):
						for rI in e12_arr:
							r2_curr = rI*math.pow(10,rk)
							f_curr = getFrequency(r1_curr, r2_curr, c0_curr)
							err = getError(f, f_curr)
							
							if initialized == True:
								initialized = False
							else:
								if (err_save > err) or (iPass == False):
									f0 = f_curr
									r2 = r2_curr
									r1 = r1_curr
									c0 = c0_curr
									iCount = iCount + 1
									err_save = err
									f_save = f_curr
									# print (f_curr)
									
									if iPass == False:
										iPass = True
			
			if r1_const != 0:
				break
				
		if r1_const != 0:
			break
		
			
	high = getHigh(r1, r2, c0) 
	low = getLow(r1, r2, c0)
	period = 1 / f_save
	
	print ('r1', r1)
	print ('r2', r2)
	print ('c', c0)
	print ('high', high)
	print ('low', low)
	print ('period', period)
	print ('dutycycle', high / period)
	print ('frequency', f_save)
	print ('desired freq', f)
	print ('percent diff', err_save, 'percent')

def printHelp():
	print("Options:");
	print("   -f [desired_frequency] : defaults to 1200 if not specified.");
	print("   -r1 [r1_const]         : defaults to 1K Ohm if not specified.");
	print("   -r1_vary               : r1 will not be locked to any const value");
	print("                          : (more accurate) but this will deviate the");
	print("                          : duty cycle away from 50%.");

if __name__ == "__main__":
	r1_const = 1000
	f = 1200
	f_set = 0

	import sys
	args = len(sys.argv)
	if  args > 1:
		for arg_i in range(1, args, 1):
			if sys.argv[arg_i] == '-r1':
				r1_const = sys.argv[arg_i + 1] 
			elif sys.argv[arg_i] == '-f':
				f = sys.argv[arg_i + 1] 
				f_set = 1
			elif sys.argv[arg_i] == "-r1_vary":
				r1_const = 0
			elif sys.argv[arg_i] == "-h":
				printHelp()
				sys.exit()
	else:
		print("No arguments specified, use -h flag for help.");
		sys.exit()
		
	if f_set == 0:
		print("Frequency was not set. To set, use flag '-f [freq]'.");
		sys.exit()
		
	getComponents(float(f), float(r1_const))
	print("Calculation Completed.");
	sys.exit()
	