# Matlab-Candapter-Utility
Displays:
	Pedal Position (green level bars and text)
		-Hex
		-Voltage
		-Calibrated value
	Brake Pressure (green level bars and text)
		-Hex
		-Voltage
		-Calibrated Value
	Motor Controller Command Torque
		-Hex
		-Percentage of max
	Motor Controller Actual Torque
		-Hex
		-Percentage of max
		-Percentage of command torque
	Highest battery cell
		-Voltage
	Lowest battery cell
		-voltage
	6 module temperatures
	Motor rpm
		- motor rpm
		- wheel speed (mph/kmh)
	TS current
	Motor controller dc bus voltage
	BMS voltage sum
	State of charge
	TS power
	TS power limit
	LV Battery voltage
	24v current usage
	12v current usage
	5v current usage
	pump current usage
	car state
	Motor temperatures
	Motor controller temperature
	Pedal box message time
	Motor controller command message time
	Accelerometer data
		-current acc
			-lat
			-long
		-peak acc
			-lat
			-long
	
	{Status lights}
		-All pedal box errors
		-FRG Run
		-RFE
		-Precharge
		-discharge enable
		
Message scheduler
	- allow u to schedule can messages to send every x ms (async call functions that send messages from an async scheduling thing) maybe do something like if time % messagefrequency == 0 send message
	
User inputs
	- allow u to do things like start car
	-set a current limit
	
Plotting
	-allow u to plot values on a real time graph
	-choose time scales
	
Message logger
	-log messages as they are receieved
	-log values as they are received (there is a timestamp passed with the message to the BytesAvailable callback)