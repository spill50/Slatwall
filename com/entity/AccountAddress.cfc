/*

    Slatwall - An e-commerce plugin for Mura CMS
    Copyright (C) 2011 ten24, LLC

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
    
    Linking this library statically or dynamically with other modules is
    making a combined work based on this library.  Thus, the terms and
    conditions of the GNU General Public License cover the whole
    combination.
 
    As a special exception, the copyright holders of this library give you
    permission to link this library with independent modules to produce an
    executable, regardless of the license terms of these independent
    modules, and to copy and distribute the resulting executable under
    terms of your choice, provided that you also meet, for each linked
    independent module, the terms and conditions of the license of that
    module.  An independent module is a module which is not derived from
    or based on this library.  If you modify this library, you may extend
    this exception to your version of the library, but you are not
    obligated to do so.  If you do not wish to do so, delete this
    exception statement from your version.

Notes:

*/
component displayname="Account Address" entityname="SlatwallAccountAddress" table="SlatwallAccountAddress" persistent="true" accessors="true" output="false" extends="BaseEntity" {
	
	// Persistent Properties
	property name="accountAddressID" ormtype="string" length="32" fieldtype="id" generator="uuid" unsavedvalue="" default="";
	// name for this account Address
	property name="accountAddressName" ormtype="string";
	
	// Related Object Properties
	property name="account" cfc="Account" fieldtype="many-to-one" fkcolumn="accountID";
	property name="address" cfc="Address" fieldtype="many-to-one" fkcolumn="addressID";
	//property name="accountAddressType" cfc="Type" fieldtype="many-to-one" fkcolumn="accountAddressTypeID";
	
	/*
	public string function getAddressType() {
		return getAccountAddressType().getType();
	}
	*/

	/******* Association management methods for bidirectional relationships **************/
	
    // Account (many-to-one)
	public void function setAccount(required any account) {
	   variables.account = arguments.account;
	   if(isNew() or !arguments.account.hasAccountAddress(this)) {
	       arrayAppend(arguments.account.getAccountAddresses(),this);
	   }
	}
	
	/************   END Association Management Methods   *******************/
	
}
