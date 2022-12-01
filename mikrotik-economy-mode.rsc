#disable interfaces to save more battery in my Ukrainian house

:local VoltRAW [/system health get voltage]
:local VoltAct [ ($VoltRAW / 10) ]
:local poe3  [/interface ether poe get ether3 poe-out]

:tonum VoltAct

:if ( $VoltAct <= 19 && poe3 = "auto-on" ) do={ 
    :log info ("******* voltage is $VoltAct V, turn off 2 interfaces *******")
    /interface ether set ether3 poe-out=off
    /interface ether set ether4 poe-out=off
} 

:if ( $VoltAct >= 19 && poe3 = "off" ) do={ 
    :log info ("******* voltage is $VoltAct V, turn on all interfaces *******")
    /interface ether set ether3 poe-out=auto-on
    /interface ether set ether4 poe-out=forced-on
}