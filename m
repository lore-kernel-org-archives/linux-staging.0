Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B7B25F798;
	Sun,  8 Mar 2026 07:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772953634; cv=none; b=sTZDSovR9J1Mlkruy+iv753eggBBiMPf0ctOCPr2U7+EL9Cf3KR3sDmWuN2VgdRvQAykOiOF3L9l9dZFhqWJSJtwxZW89nYEOMaDZKJ3SbV2gyPny9KJATcTWqW9eraSyckIMJtwztm6oTy1BsOjRMCItyWeY6cmaghbON8G9Cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772953634; c=relaxed/simple;
	bh=Ysr9cLNbGMAlta3l1fhMmuKZviE3qCxMnTyHjYMLH3U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jJGDpA8mHQMBut9U2UuVJ1X1heYGrAIY4bD93cJvRiAd3oqwVRdST9LKXpERHVJwebwzRQMDb9QfWr4Iz7HSVHeVWNxog3uUIMr1PRhKHCgCFcbPdz0zswjUTa3oRNoOrXBYq+XkcrUW+/3H/x05N0Nm1rMROcOCYLqydpHpMP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=uc/q2BJb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="uc/q2BJb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98EDBC116C6;
	Sun,  8 Mar 2026 07:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1772953634;
	bh=Ysr9cLNbGMAlta3l1fhMmuKZviE3qCxMnTyHjYMLH3U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uc/q2BJbMHxLwfRwX8DdgISmNx6YWun7PnaFaniw0sSAHhKQpl4VhzPDCqjDjS6a8
	 hoSrXxhSSv+0TPQ51wNZAs7lIx2WgrhZDF/QQjKkcbEH9by+1we467UY1rfSNyw5Qs
	 FUVjLmf/9K6BvbNa7fMM0py2Iwsr0lu3a/0w5Kg8=
Date: Sun, 8 Mar 2026 08:06:59 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Esther Zilberberg <esty5664@gmail.com>
Cc: arthur.stupa@gmail.com, jannik@jrehkemper.de,
	william.hansen.baird@gmail.com, kaizhetan@yahoo.com,
	s9430939@naver.com, straube.linux@gmail.com, ysinghcin@gmail.com,
	kees@kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: rename supportRateNum to
 support_rate_num
Message-ID: <2026030839-omit-neurosis-4f1b@gregkh>
References: <20260307234430.5439-1-esty5664@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260307234430.5439-1-esty5664@gmail.com>

On Sat, Mar 07, 2026 at 11:44:30PM +0000, Esther Zilberberg wrote:
> Rename supportRateNum to support_rate_num to fix warning
> reported by checkpatch.pl.
> 
> Signed-off-by: Esther Zilberberg <esty5664@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_mlme_ext.c  | 18 +++++++++---------
>  drivers/staging/rtl8723bs/core/rtw_wlan_util.c |  8 ++++----
>  2 files changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> index a631fe323157..cc197b3bb195 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> @@ -937,7 +937,7 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
>  	int		i, ie_len, left;
>  	u8 wpa_ie_len;
>  	unsigned char supportRate[16];
> -	int					supportRateNum;
> +	int					support_rate_num;
>  	unsigned short		status = WLAN_STATUS_SUCCESS;
>  	unsigned short		frame_type, ie_offset = 0;
>  	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
> @@ -1024,7 +1024,7 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
>  	if (!p) {
>  		/*  use our own rate set as statoin used */
>  		/* memcpy(supportRate, AP_BSSRATE, AP_BSSRATE_LEN); */
> -		/* supportRateNum = AP_BSSRATE_LEN; */
> +		/* support_rate_num = AP_BSSRATE_LEN; */
>  
>  		status = WLAN_STATUS_CHALLENGE_FAIL;
>  		goto OnAssocReqFail;
> @@ -1033,25 +1033,25 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
>  			ie_len = sizeof(supportRate);
>  
>  		memcpy(supportRate, p+2, ie_len);
> -		supportRateNum = ie_len;
> +		support_rate_num = ie_len;
>  
>  		p = rtw_get_ie(pframe + WLAN_HDR_A3_LEN + ie_offset, WLAN_EID_EXT_SUPP_RATES, &ie_len,
>  				pkt_len - WLAN_HDR_A3_LEN - ie_offset);
>  		if (p) {
>  
> -			if (supportRateNum + ie_len <= sizeof(supportRate)) {
> -				memcpy(supportRate+supportRateNum, p+2, ie_len);
> -				supportRateNum += ie_len;
> +			if (support_rate_num + ie_len <= sizeof(supportRate)) {
> +				memcpy(supportRate + support_rate_num, p + 2, ie_len);
> +				support_rate_num += ie_len;
>  			}
>  		}
>  	}
>  
>  	/* todo: mask supportRate between AP & STA -> move to update raid */
> -	/* get_matched_rate(pmlmeext, supportRate, &supportRateNum, 0); */
> +	/* get_matched_rate(pmlmeext, supportRate, &support_rate_num, 0); */
>  
>  	/* update station supportRate */
> -	pstat->bssratelen = supportRateNum;
> -	memcpy(pstat->bssrateset, supportRate, supportRateNum);
> +	pstat->bssratelen = support_rate_num;
> +	memcpy(pstat->bssrateset, supportRate, support_rate_num);
>  	update_basic_rate_table_soft_ap(pstat->bssrateset, pstat->bssratelen);
>  
>  	/* check RSN/WPA/WPS */
> diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
> index cffb1a9d36fa..6a7c09db4cd9 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
> @@ -1595,7 +1595,7 @@ int update_sta_support_rate(struct adapter *padapter, u8 *pvar_ie, uint var_ie_l
>  {
>  	unsigned int	ie_len;
>  	struct ndis_80211_var_ie *pIE;
> -	int	supportRateNum = 0;
> +	int	support_rate_num = 0;
>  	struct mlme_ext_priv *pmlmeext = &(padapter->mlmeextpriv);
>  	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
>  
> @@ -1606,11 +1606,11 @@ int update_sta_support_rate(struct adapter *padapter, u8 *pvar_ie, uint var_ie_l
>  		return _FAIL;
>  
>  	memcpy(pmlmeinfo->FW_sta_info[cam_idx].SupportedRates, pIE->data, ie_len);
> -	supportRateNum = ie_len;
> +	support_rate_num = ie_len;
>  
>  	pIE = (struct ndis_80211_var_ie *)rtw_get_ie(pvar_ie, WLAN_EID_EXT_SUPP_RATES, &ie_len, var_ie_len);
> -	if (pIE && (ie_len <= sizeof(pmlmeinfo->FW_sta_info[cam_idx].SupportedRates) - supportRateNum))
> -		memcpy((pmlmeinfo->FW_sta_info[cam_idx].SupportedRates + supportRateNum), pIE->data, ie_len);
> +	if (pIE && (ie_len <= sizeof(pmlmeinfo->FW_sta_info[cam_idx].SupportedRates) - support_rate_num))
> +		memcpy((pmlmeinfo->FW_sta_info[cam_idx].SupportedRates + support_rate_num), pIE->data, ie_len);
>  
>  	return _SUCCESS;
>  }
> -- 
> 2.43.0
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
  kernel file, Documentation/process/submitting-patches.rst for what
  needs to be done here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
