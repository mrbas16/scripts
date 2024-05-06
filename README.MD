This script is designed to manage the power over Ethernet (PoE) functionality of interfaces on a MikroTik router based on the voltage level of the system. Here's a breakdown of what it does:

1. It retrieves the current voltage level of the router using the command `/system health get voltage` and stores it in a variable named `VoltRAW`.
2. It calculates the actual voltage value by dividing `VoltRAW` by 10 and stores it in a variable named `VoltAct`.
3. It retrieves the current status of PoE on interface ether3 and stores it in a variable named `poe3`.
4. It converts the voltage value stored in `VoltAct` to a number format using the `:tonum` command.
5. It checks two conditions:
   - If the voltage (`VoltAct`) is less than or equal to 19 volts and interface ether3 PoE status (`poe3`) is set to "auto-on", it logs a message indicating low voltage and turns off PoE on interfaces ether3 and ether4.
   - If the voltage (`VoltAct`) is greater than or equal to 19 volts and interface ether3 PoE status (`poe3`) is set to "off", it logs a message indicating normal voltage and turns on PoE on interfaces ether3 and ether4.

Overall, this script is a battery-saving mechanism for a router deployed in a Ukrainian house, adjusting PoE usage based on the voltage level to conserve power.
