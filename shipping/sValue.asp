<%
' Copyright (C) 1998-2004 CyberStrong Internet Services, Inc. All Rights Reserved
'
' This file has been seeded with unique information at point of sale and
' is traceable to its purchaser.
'
' Your license agreement forbids the removal of this notice.

' sValue.asp - Vendor By Order Value Lookup

Class clsShippingRateByOrderValue

	' Constructor -----------------------------------------------------	

	Private Sub Class_Initialize()
		Name          = "By Order Value Shipping"
		Installed     = True
		Debug         = False
		HelpFileName  = "hByOrder.asp"
		Version       = 1.0
	End Sub
	

	' Destructor ------------------------------------------------------

	Private Sub Class_Terminate()
	End Sub
	

	' Public Properties -----------------------------------------------

	Public Name			' The full name of this gateway
	Public Installed	' True for real gateway, False for gateway hook
	Public Debug		' True to enable debug messages
	Public HelpFileName ' Help for this gateway stored here
	Public Version		' Class version number


	' Public Methods --------------------------------------------------

	' AddRates() - Add rates for this shipping method to master rate table ...
	
	Public Sub AddRates(ByVal argShipToInfo, ByVal argCart, ByRef argShipChoiceTable, ByRef argErrorMsg)
		Dim SQL, Key, rsMethods, rsCost

		On Error Resume Next

		SQL = "SELECT * FROM ShippingByOrderValue " & _
		 		"WHERE (" & argShipToInfo.OrderTotal & " >= MinOrderValue) AND " & _
		 		      "(" & argShipToInfo.OrderTotal & " <= MaxOrderValue)"

		Set rsCost = Server.CreateObject("ADODB.Recordset")
		rsCost.Open SQL, Conn, adOpenKeyset, adLockOptimistic
		
		If (rsCost.RecordCount <> 0) Then
			SQL = "SELECT * FROM ShippingMethods " & _
			 		"WHERE {fn LCase(Gateway)} = 'byvalue' AND {fn LCase(ShippingMethodActive)} = 'yes'"

			Set rsMethods = Server.CreateObject("ADODB.Recordset")
			rsMethods.Open SQL, Conn, adOpenKeyset, adLockOptimistic
		
			' Save rate(s) in table for customer selection ...

			Do While (Not rsMethods.EOF)
				Key = Trim(rsMethods("ShippingMethod"))
				Set argShipChoiceTable.Item(Key) = New clsShipChoice

				argShipChoiceTable.Item(Key).Carrier     = ""
				argShipChoiceTable.Item(Key).Service     = Key
				argShipChoiceTable.Item(Key).ServiceCode = rsMethods("ShipperCode")
				argShipChoiceTable.Item(Key).Rate        = rsCost("CostForMethod" & CInt(rsMethods("ShipperCode")))
				argShipChoiceTable.Item(Key).Delivery    = ""

				rsMethods.MoveNext
			Loop
		End If

		rsCost.Close
		rsMethods.Close
		
		Set rsCost = Nothing
		Set rsMethods = Nothing
	End Sub
	
	
	' Supports() - Returns TRUE if this gateway has the given (optional) capability
	
	Public Function Supports(ByVal argCapability)
		Supports = False
	End Function


	' Install() - Install this class into eShop.
	'           - Reserved for future use.

	Public Sub Install()
	End Sub
	

	' Dump() - Dump internal class variables for debug.

	Public Sub Dump()
	End Sub
	

	' Test() - Class self test.
	
	Public Sub Test()
	End Sub
	

	' Private Functions/Subs ------------------------------------------

End Class

' Register gateway on loading ...
Set FeatureInstalled.Item("Rate Gateway:ByValue") = New clsShippingRateByOrderValue

%>
