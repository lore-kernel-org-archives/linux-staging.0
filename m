Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD8071096F;
	Fri, 16 Jan 2026 13:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768568754; cv=none; b=rNeHyi0gZWrL5jxaHmzkcF4UJRUtKtD88bzD0gj8bAac1IcQwEHJtujM8jX3bLEDHo80i27zrgUAIck+oYORzu8/5RVJufPCktzsQ6NI9MpiM5VVUiUSjVea2biag30Z7/EId1SPkjwrNL6lhs9NSfhsstQ01EFdVd8JhgmhbtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768568754; c=relaxed/simple;
	bh=dj4Ypf/E/v+ne2V9u1jXwe4JdHzuv1vFLRdz2DFDDn8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X1L0vQPCkqjS/JxpAtQXP2SdlCW2YVoNQXC0Oc65fltBVbh7oXq8EeHxWd9VJIhd9MaXzVytngyY53lRsmvGulJsB2EkLv8fzUHB7tfdrWtIaIkWBdYtL+tZxExACtqhnKOh3l5rpVTq7g3+h/seYcIEskzEcAt/rlfRcLtA8jQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=nOBYVdwG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="nOBYVdwG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00A06C116C6;
	Fri, 16 Jan 2026 13:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1768568754;
	bh=dj4Ypf/E/v+ne2V9u1jXwe4JdHzuv1vFLRdz2DFDDn8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nOBYVdwG4Y30KpZwr92Ttactn5k9btUYjqNosukHuAxnkKtqKI0mzCioBY/U9/mbJ
	 CSqYGArEO2tEI66HKVKPern/uTllmccSto9XWS+kt66vNWnpSpi9jYqJB5f1soWI++
	 oOBOiAsfUPhzt8OJCVbkwRiGrDJ6NQr2pa3a4Feo=
Date: Fri, 16 Jan 2026 14:05:51 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: William Hansen-Baird <william.hansen.baird@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] staging: rtl8723bs: core/rtw_mlme_ext.c: flatten
 control flow in OnAssocReq()
Message-ID: <2026011624-walnut-dinginess-e201@gregkh>
References: <20260113211433.89512-1-william.hansen.baird@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113211433.89512-1-william.hansen.baird@gmail.com>

On Tue, Jan 13, 2026 at 04:14:32PM -0500, William Hansen-Baird wrote:
> Rewrite if-else construct with an early exit to reduce indentation,
> and make the execution clearer.
> 
> Signed-off-by: William Hansen-Baird <william.hansen.baird@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 59 +++++++++----------
>  1 file changed, 29 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> index ac49bfbaa5bb..d3b395894d4b 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> @@ -1181,47 +1181,46 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
>  		p = pframe + WLAN_HDR_A3_LEN + ie_offset; ie_len = 0;
>  		for (;;) {
>  			p = rtw_get_ie(p, WLAN_EID_VENDOR_SPECIFIC, &ie_len, pkt_len - WLAN_HDR_A3_LEN - ie_offset);
> -			if (p) {
> -				if (!memcmp(p+2, WMM_IE, 6)) {
> +			if (!p)
> +				break;
>  
> -					pstat->flags |= WLAN_STA_WME;
> +			if (!memcmp(p+2, WMM_IE, 6)) {
>  
> -					pstat->qos_option = 1;
> -					pstat->qos_info = *(p+8);
> +				pstat->flags |= WLAN_STA_WME;
>  
> -					pstat->max_sp_len = (pstat->qos_info>>5)&0x3;
> +				pstat->qos_option = 1;
> +				pstat->qos_info = *(p+8);
>  
> -					if ((pstat->qos_info&0xf) != 0xf)
> -						pstat->has_legacy_ac = true;
> -					else
> -						pstat->has_legacy_ac = false;
> +				pstat->max_sp_len = (pstat->qos_info>>5)&0x3;
>  
> -					if (pstat->qos_info&0xf) {
> -						if (pstat->qos_info&BIT(0))
> -							pstat->uapsd_vo = BIT(0)|BIT(1);
> -						else
> -							pstat->uapsd_vo = 0;
> +				if ((pstat->qos_info&0xf) != 0xf)
> +					pstat->has_legacy_ac = true;
> +				else
> +					pstat->has_legacy_ac = false;
>  
> -						if (pstat->qos_info&BIT(1))
> -							pstat->uapsd_vi = BIT(0)|BIT(1);
> -						else
> -							pstat->uapsd_vi = 0;
> +				if (pstat->qos_info&0xf) {
> +					if (pstat->qos_info&BIT(0))
> +						pstat->uapsd_vo = BIT(0)|BIT(1);
> +					else
> +						pstat->uapsd_vo = 0;
>  
> -						if (pstat->qos_info&BIT(2))
> -							pstat->uapsd_bk = BIT(0)|BIT(1);
> -						else
> -							pstat->uapsd_bk = 0;
> +					if (pstat->qos_info&BIT(1))
> +						pstat->uapsd_vi = BIT(0)|BIT(1);
> +					else
> +						pstat->uapsd_vi = 0;
>  
> -						if (pstat->qos_info&BIT(3))
> -							pstat->uapsd_be = BIT(0)|BIT(1);
> -						else
> -							pstat->uapsd_be = 0;
> +					if (pstat->qos_info&BIT(2))
> +						pstat->uapsd_bk = BIT(0)|BIT(1);
> +					else
> +						pstat->uapsd_bk = 0;
>  
> -					}
> +					if (pstat->qos_info&BIT(3))
> +						pstat->uapsd_be = BIT(0)|BIT(1);
> +					else
> +						pstat->uapsd_be = 0;
>  
> -					break;
>  				}
> -			} else {
> +
>  				break;

If all ways through this loop ends up in a break, why is this a loop at
all?

thanks,

greg k-h
