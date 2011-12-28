<!---

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

--->

<cfparam name="rc.vendorOrder">
<cfparam name="rc.vendorOrderReceiver">

<cfoutput>
	<ul id="navTask">
		<cf_SlatwallActionCaller action="admin:vendorOrder.detailVendorOrder" queryString="vendorOrderId=#rc.vendorOrder.getVendorOrderId()#" type="list">
	</ul>
	
	<div class="basicOrderInfo">
		<table class="listing-grid stripe" id="basicVendorOrderInfo" style="width:400px;">
			<tr>
				<th colspan="2">#$.Slatwall.rbKey("admin.vendorOrderReceiver.basicvendorOrderrecenverinfo")#</th>
			</tr>
			<cf_SlatwallPropertyDisplay object="#rc.VendorOrder#" property="VendorOrderNumber" edit="false" displayType="table">
			<cf_SlatwallPropertyDisplay object="#rc.VendorOrder.getVendorOrderType()#" property="Type" edit="false"  displayType="table">
			<cf_SlatwallPropertyDisplay object="#rc.VendorOrder#" property="createdDateTime" edit="false"  displayType="table">
			<cf_SlatwallPropertyDisplay object="#rc.VendorOrder.getVendor()#" property="vendorName" edit="false"  displayType="table">
			<cf_SlatwallPropertyDisplay object="#rc.VendorOrder.getVendor()#" property="emailAddress" edit="false" displayType="table">
		</table>
	</div>

	<div class="clear">
		<dl class="twoColumn">
			<cf_SlatwallPropertyDisplay object="#rc.VendorOrderReceiver#" property="boxCount" edit="#rc.edit#">
		</dl>

		<table class="listing-grid stripe">
			<tr>
				<th class="varWidth">Sku</th>
				<th>Brand - Product Name</th>
				<th>Cost</th>
				<th>Quantity Ordered</th>
				<th>Ordered for Location</th>	
				<th>Quantity Receiving</th>
			</tr>
			
			<tbody>
				<cfloop array="#rc.vendorOrderReceiver.getVendorOrderReceiverItems()#" index="local.vendorOrderReceiverItem">
					<cfset local.stock = local.vendorOrderReceiverItem.getStock()>
					<cfset local.product = local.stock.getSku().getProduct()>
					<tr>
						<td class="varWidth">#local.stock.getSku().getSkuCode()#</td>
						<td>#local.product.getBrand().getBrandName()# #local.product.getProductName()#</td>
						<td>#local.vendorOrderReceiverItem.getFormattedValue('cost', 'currency')#</td>
						<td>#local.vendorOrderReceiverItem.getQuantity()#</td>
						<td>#local.stock.getLocation().getLocationName()#</td>
						<td>#local.vendorOrderReceiverItem.getQuantity()#</td>
					</tr>
				</cfloop>
			</tbody>
		</table>

		<cf_SlatwallActionCaller action="admin:vendorOrder.detailVendorOrder" type="link" class="cancel button" queryString="vendorOrderId=#rc.vendorOrder.getVendorOrderID()#" text="#rc.$.Slatwall.rbKey('admin.nav.back')#">
	</div>
</cfoutput>