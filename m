Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEE2E23AC;
	Tue, 12 Apr 2022 23:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649807296; x=1681343296;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IJvGmPJK6JXJ0NGpzqoa95ppXfXhePjXaC/5FHzKSF8=;
  b=fKqXBRlutpPleAaeqQZ6AEYVz9k1oV2H9HNDvqGC3P+SflJJOPyd32g6
   0doYL+dl554ezP6j9SShY84icmEAOJ+dkXL4rYipNf1wxb9Lv5hH9y2lT
   /517D77XS06rqwUDGH0ZmA+u5Thjn5g1zdeQGl0M7gaOgVCTD9xVh14Bi
   4fuzy2b/5rz6FTKIMnviR3QYJ2l7j+H3Q8gM+ktDMq9gIsa8xS5bOtvbN
   hCg7laCRCfDopqValgeRx4eFK94RvIwkevY8itF9cilWGwkEy0lGct5Ko
   wAMDlLmeBdiDkPnEa47/ttSZeXtMLbztc+ZTP0Ow6IL7Kk2NYJQ3XE7e8
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10315"; a="262284431"
X-IronPort-AV: E=Sophos;i="5.90,254,1643702400"; 
   d="scan'208";a="262284431"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2022 16:48:10 -0700
X-IronPort-AV: E=Sophos;i="5.90,254,1643702400"; 
   d="scan'208";a="507764200"
Received: from aalaniz-mobl.amr.corp.intel.com (HELO localhost) ([10.209.160.104])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2022 16:48:09 -0700
Date: Tue, 12 Apr 2022 16:48:08 -0700
From: Ira Weiny <ira.weiny@intel.com>
To: Sevinj Aghayeva <sevinj.aghayeva@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: Re: [PATCH] staging: rtl8723bs: simplify control flow
Message-ID: <YlYPuIMr8mq66Lea@iweiny-desk3>
References: <20220403224207.GA397480@euclid>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220403224207.GA397480@euclid>

On Sun, Apr 03, 2022 at 06:42:07PM -0400, Sevinj Aghayeva wrote:
> Checkpatch issues "WARNING: else is not generally useful after a break
> or return" for the following code:
> 
> while (1) {
> 	do_join_r = rtw_do_join(padapter);
> 	if (do_join_r == _SUCCESS) {
> 		break;
> 	} else {
> 		rtw_dec_to_roam(padapter);
> 
> 		if (rtw_to_roam(padapter) > 0) {
> 			continue;
> 		} else {
> 			rtw_indicate_disconnect(padapter);
> 			break;
> 		}
> 	}
> }
> 
> We simplify this code in multiple steps. First, we remove do_join_r

I can't say how Greg would like to see a change like this but my gut says that
each of these steps should be a patch in a series...

> variable because it is only used right after it is assigned. Second,
> we remove the unnecessary else statement right after break:
> 
> while (1) {
> 	if (rtw_do_join(padapter) == _SUCCESS)
> 		break;
> 	rtw_dec_to_roam(padapter);
> 
> 	if (rtw_to_roam(padapter) > 0) {
> 		continue;
> 	} else {
> 		rtw_indicate_disconnect(padapter);
> 		break;
> 	}
> }
> 
> Next, we move the call to rtw_do_join into the while test because the
> while will loop only until the call is successful:
> 
> while (rtw_do_join(padapter) != _SUCCESS) {
> 	rtw_dec_to_roam(padapter);
> 	if (rtw_to_roam(padapter) > 0) {
> 		continue;
> 	} else {
> 		rtw_indicate_disconnect(padapter);
> 		break;
> 	}
> }
> 
> Finally, looking at the code above, it is clear that the code will
> break out of the loop if rtw_to_roam call is <= 0. Hence:
> 
> while (rtw_do_join(padapter) != _SUCCESS) {
> 	rtw_dec_to_roam(padapter);
> 	if (rtw_to_roam(padapter) <= 0) {
> 		rtw_indicate_disconnect(padapter);
> 		break;
> 	}
> }

...  that said, this commit message made reviewing the change much easier,
thanks.

Did you submit a patch for the r8188eu driver too?  I just noticed it has a
similar loop in _rtw_roaming().

Reviewed-by: Ira Weiny <ira.weiny@intel.com>

> 
> Signed-off-by: Sevinj Aghayeva <sevinj.aghayeva@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_mlme.c | 18 ++++--------------
>  1 file changed, 4 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
> index 3eacf8f9d236..a45df775d535 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
> @@ -2594,30 +2594,20 @@ void _rtw_roaming(struct adapter *padapter, struct wlan_network *tgt_network)
>  {
>  	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
>  	struct wlan_network *cur_network = &pmlmepriv->cur_network;
> -	int do_join_r;
>  
>  	if (rtw_to_roam(padapter) > 0) {
>  		memcpy(&pmlmepriv->assoc_ssid, &cur_network->network.ssid, sizeof(struct ndis_802_11_ssid));
>  
>  		pmlmepriv->assoc_by_bssid = false;
>  
> -		while (1) {
> -			do_join_r = rtw_do_join(padapter);
> -			if (do_join_r == _SUCCESS) {
> +		while (rtw_do_join(padapter) != _SUCCESS) {
> +			rtw_dec_to_roam(padapter);
> +			if (rtw_to_roam(padapter) <= 0) {
> +				rtw_indicate_disconnect(padapter);
>  				break;
> -			} else {
> -				rtw_dec_to_roam(padapter);
> -
> -				if (rtw_to_roam(padapter) > 0) {
> -					continue;
> -				} else {
> -					rtw_indicate_disconnect(padapter);
> -					break;
> -				}
>  			}
>  		}
>  	}
> -
>  }
>  
>  signed int rtw_linked_check(struct adapter *padapter)
> -- 
> 2.25.1
> 
