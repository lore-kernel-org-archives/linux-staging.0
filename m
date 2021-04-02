Received: from smtprelay.hostedemail.com (smtprelay0157.hostedemail.com [216.40.44.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D559259E
	for <linux-staging@lists.linux.dev>; Fri,  2 Apr 2021 15:23:36 +0000 (UTC)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
	by smtpgrave07.hostedemail.com (Postfix) with ESMTP id 783251801924B
	for <linux-staging@lists.linux.dev>; Fri,  2 Apr 2021 10:38:06 +0000 (UTC)
Received: from omf06.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
	by smtprelay07.hostedemail.com (Postfix) with ESMTP id 8D3321845667E;
	Fri,  2 Apr 2021 10:37:59 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf06.hostedemail.com (Postfix) with ESMTPA id A866B2448BB;
	Fri,  2 Apr 2021 10:37:58 +0000 (UTC)
Message-ID: <2014e0fc141d73d907c781ca31c822c96d3a7c47.camel@perches.com>
Subject: Re: [PATCH 14/16] staging: rtl8723bs: remove all RT_TRACE logs in
 core/rtw_wlan_util.c
From: Joe Perches <joe@perches.com>
To: Fabio Aiuto <fabioaiuto83@gmail.com>, gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Date: Fri, 02 Apr 2021 03:37:57 -0700
In-Reply-To: <34bf6cdc7bdf5c64d47cb3525897970644de7052.1617356821.git.fabioaiuto83@gmail.com>
References: <cover.1617356821.git.fabioaiuto83@gmail.com>
	 <34bf6cdc7bdf5c64d47cb3525897970644de7052.1617356821.git.fabioaiuto83@gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.38.1-1 
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.10
X-Stat-Signature: eo5be4jg4uq7ck33xnnkjw9nhc1ks6zy
X-Rspamd-Server: rspamout05
X-Rspamd-Queue-Id: A866B2448BB
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX19GAvoOc0DujeQ+dLa7wUS3cppW1wTqUBc=
X-HE-Tag: 1617359878-159266

On Fri, 2021-04-02 at 12:01 +0200, Fabio Aiuto wrote:
> remove all RT_TRACE logs
> 
> fix patch-related checkpatch issues
> 
> Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
> ---
>  .../staging/rtl8723bs/core/rtw_wlan_util.c    | 26 +++++--------------
>  1 file changed, 6 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
[]
> @@ -1382,25 +1374,19 @@ int rtw_check_bcn_info(struct adapter *Adapter, u8 *pframe, u32 packet_len)
>  	if (encryp_protocol == ENCRYP_PROTOCOL_WPA || encryp_protocol == ENCRYP_PROTOCOL_WPA2) {
>  		pbuf = rtw_get_wpa_ie(&bssid->IEs[12], &wpa_ielen, bssid->IELength-12);
>  		if (pbuf && (wpa_ielen > 0)) {
> -			if (_SUCCESS == rtw_parse_wpa_ie(pbuf, wpa_ielen+2, &group_cipher, &pairwise_cipher, &is_8021x)) {
> -				RT_TRACE(_module_rtl871x_mlme_c_, _drv_info_,
> -						("%s pnetwork->pairwise_cipher: %d, group_cipher is %d, is_8021x is %d\n", __func__,
> -						 pairwise_cipher, group_cipher, is_8021x));
> -			}
> +			if (rtw_parse_wpa_ie(pbuf, wpa_ielen + 2, &group_cipher,
> +					     &pairwise_cipher, &is_8021x) == _SUCCESS)
> +				;

		This sort of if is a bit silly.
		Better would be to remove the test and just use:

			rtw_parse_wpa_ie(pbuf, wpa_ielen + 2, &group_cipher,
					 &pairwise_cipher, &is_8021x);

>  		} else {
>  			pbuf = rtw_get_wpa2_ie(&bssid->IEs[12], &wpa_ielen, bssid->IELength-12);
>  
> 
>  			if (pbuf && (wpa_ielen > 0)) {
> -				if (_SUCCESS == rtw_parse_wpa2_ie(pbuf, wpa_ielen+2, &group_cipher, &pairwise_cipher, &is_8021x)) {
> -					RT_TRACE(_module_rtl871x_mlme_c_, _drv_info_,
> -							("%s pnetwork->pairwise_cipher: %d, pnetwork->group_cipher is %d, is_802x is %d\n",
> -							 __func__, pairwise_cipher, group_cipher, is_8021x));
> -				}
> +				if (rtw_parse_wpa2_ie(pbuf, wpa_ielen + 2, &group_cipher,
> +						      &pairwise_cipher, &is_8021x) == _SUCCESS)
> +					;

				rtw_parse_wpa2_ie(pbuf, wpa_ielen + 2, &group_cipher,
						  &pairwise_cipher, &is_8021x);

etc...

Lastly, another suggestion would be to just submit a single patch
removing _ALL_ the RT_TRACE uses not intermixing various other cleanups
with the series and then do those other cleanups.

Using a coccinelle script like:

$ cat RT_TRACE.cocci
@@
expression a, b, c;
@@

-	RT_TRACE(a, b, (c));

$ spatch -sp-file RT_TRACE.cocci drivers/staging/rtl8723bs/

And then clean up the various bits you think are inappropriately done.


