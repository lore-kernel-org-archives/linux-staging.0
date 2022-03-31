Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6BF67E0;
	Thu, 31 Mar 2022 05:45:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1BDAC340F0;
	Thu, 31 Mar 2022 05:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1648705508;
	bh=typN6HaBunrT3sm6KGyaPW9XCKoGbVVwCGjp0mnJLcA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C8EelGk+foqMrqM9tqxQUYQK54WLMsdObwXzqXxBYss9g0Lh1HlXZWydeVBAZnLg+
	 8UKii0KPD9pEzRkfoprtAWWjzBQUNPiV1AqECccSRqXg1fvQ61T3a8DghCvKEHlg/G
	 x+3R6I9Pt2R+WWU5NR3hIX5hDAiUCiGz56yPPqXQ=
Date: Thu, 31 Mar 2022 07:45:05 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Sevinj Aghayeva <sevinj.aghayeva@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: Re: [PATCH v2] staging: rtl8723bs: remove redundant braces in if
 statements
Message-ID: <YkU/4YYz53VHVzoj@kroah.com>
References: <20220330005229.GA318642@euclid>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220330005229.GA318642@euclid>

On Tue, Mar 29, 2022 at 08:52:29PM -0400, Sevinj Aghayeva wrote:
> Adhere to Linux kernel coding style.
> 
> Reported by checkpatch:
> 
> WARNING: braces {} are not necessary for single statement blocks
> 
> Signed-off-by: Sevinj Aghayeva <sevinj.aghayeva@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_ieee80211.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
> index 27de086903e2..68e41d99679d 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
> @@ -335,9 +335,8 @@ int rtw_generate_ie(struct registry_priv *pregistrypriv)
>  
>  	ie = rtw_set_ie(ie, WLAN_EID_IBSS_PARAMS, 2, (u8 *)&(pdev_network->configuration.atim_window), &sz);
>  
> -	if (rateLen > 8) {
> +	if (rateLen > 8)
>  		ie = rtw_set_ie(ie, WLAN_EID_EXT_SUPP_RATES, (rateLen - 8), (pdev_network->supported_rates + 8), &sz);
> -	}
>  
>  	/* HT Cap. */
>  	if ((pregistrypriv->wireless_mode & WIRELESS_11_24N) &&
> @@ -366,9 +365,8 @@ unsigned char *rtw_get_wpa_ie(unsigned char *pie, int *wpa_ie_len, int limit)
>  
>  		if (pbuf) {
>  			/* check if oui matches... */
> -			if (memcmp((pbuf + 2), wpa_oui_type, sizeof(wpa_oui_type))) {
> +			if (memcmp((pbuf + 2), wpa_oui_type, sizeof(wpa_oui_type)))
>  				goto check_next_ie;
> -			}
>  
>  			/* check version... */
>  			memcpy((u8 *)&le_tmp, (pbuf + 6), sizeof(val16));
> @@ -493,9 +491,8 @@ int rtw_parse_wpa_ie(u8 *wpa_ie, int wpa_ie_len, int *group_cipher, int *pairwis
>  	if (is_8021x) {
>  		if (left >= 6) {
>  			pos += 2;
> -			if (!memcmp(pos, SUITE_1X, 4)) {
> +			if (!memcmp(pos, SUITE_1X, 4))
>  				*is_8021x = 1;
> -			}
>  		}
>  	}
>  
> @@ -514,9 +511,8 @@ int rtw_parse_wpa2_ie(u8 *rsn_ie, int rsn_ie_len, int *group_cipher, int *pairwi
>  		return _FAIL;
>  	}
>  
> -	if ((*rsn_ie != WLAN_EID_RSN) || (*(rsn_ie+1) != (u8)(rsn_ie_len - 2))) {
> +	if ((*rsn_ie != WLAN_EID_RSN) || (*(rsn_ie+1) != (u8)(rsn_ie_len - 2)))
>  		return _FAIL;
> -	}
>  
>  	pos = rsn_ie;
>  	pos += 4;
> -- 
> 2.25.1
> 
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/SubmittingPatches for what needs to be done
  here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
