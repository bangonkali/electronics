function getComponents () {
   frequency = parseInt(document.getElementById('txtFrequency').value);
   document.getElementById('lblDesiredFrequency').innerHTML = frequency;
   brute(frequency);
}

function brute(f){
   var e12_arr = [1.0, 1.2, 1.5, 1.8, 2.2, 2.7, 3.3, 3.9, 4.7, 5.6, 6.8, 8.2, 10];
   
   var iCount = 0;
   
   var r1 = 1E3; 
	var r2 = 1E3;
   var c0 = 0;
   var f0 = 0;
   
   var f_curr = 0;
   var f_save = 0;
   var err = 0;
   var err_save = 0;
   var r2_curr = 1;
   var initial = true;
   
   var c0_count = 0;
	
	var iPass = false;
   
   for (var cK = 0; cK >= -17; cK--) {
	
      for (var cI in e12_arr) {
         var c0_curr = e12_arr[cI]*Math.pow(10,cK);
			
         for (var rK = 3; rK <= 15; rK++) {
			
            for (var rI in e12_arr) {
				
               r2_curr = e12_arr[rI]*Math.pow(10,rK);
               f_curr = getFrequency(r1, r2_curr, c0_curr);
               err = getError(f, f_curr);
               
               if (initial == true) {
                  initial = false;
               } else {
					
                  if (err_save > err || !iPass) {
                     f0 = f_curr;
                     r2 = r2_curr;
                     c0 = c0_curr;
                     iCount++;
							err_save = err;
							
							if (!iPass) {
								iPass = true;
							}
                  }
               }
            }
         }
      }
   }
   
   cprintDetails(r1, r2, c0, 'nc');
	document.getElementById("lblStatus").innerHTML = 'The percent difference between the desired and estimated frequency is ' + err_save.toFixed(2) + '%.';
}

function cprintDetails(r1, r2, c, col) {
   f = getFrequency(r1, r2, c);
   high = getHigh(r1, r2, c);
   low = getLow(r1, r2, c);
   period = getPeriod(f);
   duty = getDutyCycle(high, period);
   
   if (col === false) {
      console.log('R1 is: ' + shorter(r1) + '<br />');
      console.log('R2 is: ' + shorter(r2) + '<br />');
      console.log('C is: ' + c + '<br />');
   } else if (col == 'nc' || col == 'pv') {
      // document.getElementById("r1_" + col).innerHTML = shorter(r1)+' Ohms';
      document.getElementById("r1_" + col).innerHTML = r1+' Ohms';
      document.getElementById("r2_" + col).innerHTML = r2+' Ohms';
      document.getElementById("c_" + col).innerHTML = c + ' F';
   }
   
   printDetails(f, high, low, period, duty, col);
}

function printDetails(f, high, low, period, duty, col) {
   if (col === false) {
      console.log('Frequency is: ' + f + '<br />');
      console.log('High is: ' + high + '<br />');
      console.log('Low is: ' + low + '<br />');
      console.log('Period is: ' + period + '<br />');
      console.log('Duty Cycle is: ' + duty + '<br />');
   } else if (col == 'nc' || col == 'pv') {
      document.getElementById("f_" + col).innerHTML=f;
      document.getElementById("high_" + col).innerHTML=high;
      document.getElementById("low_" + col).innerHTML=low;
      document.getElementById("period_" + col).innerHTML=period;
      document.getElementById("dc_" + col).innerHTML=duty;
   }
   
}

function getPeriod(frequency) {
   return (1 / frequency);
}

function getDutyCycle(high, period) {
   return (high / period);
}

function getFrequency(r1, r2, c) {
   return 1 / (Math.LN2*c*(r1+(2*r2)));
}

function getHigh(r1, r2, c) {
   return Math.LN2*c*(r1+r2);
}

function getLow(r1, r2, c) {
   return Math.LN2*r2*c;
}

function getError(actual, estimate) {
   return (((Math.abs(actual-estimate))/actual)*100);
}