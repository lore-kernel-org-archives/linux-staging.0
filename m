Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 562D139E166;
	Tue,  7 Apr 2026 10:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775558366; cv=none; b=EzMJcWIDNhrzmocaz/+tR+cEfgAAibi0SQ576o7lpSxjnfaJjQax6BVnzTJ098/7KaECBSbRkvBaRmI9NLTYrEtkxkUKEIK7aVtu8TDN0pArQNeA+UwEMPNOHH9gby2TriwWNN1XENZBF2Ko5aFrgrHzeTQU388Sx4jqiWT8PnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775558366; c=relaxed/simple;
	bh=I2dn0HGCGcCtj7tM0I4kGyhDDfcMQ1ilrK5G3AvWxz4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TUQBxkRbKXb9OYXf+QdJs0uW4n3c1Z26xGpswiCd0u4s+Zq18fV1HiCXeFrMuZigeB1cFN1L11+zJqJ/KxidHB0UTv0DnoZMJ08ADdIp9zlWwLz003QqKwPAXWNNgtH2iO6QCqLBbX/XL+2Ayy5NLuLAoNP95pj6/lHcElhmoqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=WXdWdmfP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="WXdWdmfP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 832BCC116C6;
	Tue,  7 Apr 2026 10:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1775558366;
	bh=I2dn0HGCGcCtj7tM0I4kGyhDDfcMQ1ilrK5G3AvWxz4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WXdWdmfPFhStpxTdliEV2OwHb0vA/Y4vfSEZgtdybupHLthKefvrArikRstKzRpJe
	 i50Y9sRFwfWTVpmxMfly/4cSpeB8+5FLPbfaucU4DYUH+rCGMRkqOH1UHP1jBT3YTB
	 YilHvrv/5zfJa0ABV4mD4SAfo9qabeN5UxTfKwhk=
Date: Tue, 7 Apr 2026 12:39:22 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Feng Ning <feng@innora.ai>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: fix heap buffer overflow in
 cfg80211_rtw_add_key
Message-ID: <2026040711-punch-outfield-e69e@gregkh>
References: <20260407102112.94414-1-feng@innora.ai>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260407102112.94414-1-feng@innora.ai>

On Tue, Apr 07, 2026 at 10:21:18AM +0000, Feng Ning wrote:
> The cfg80211 framework allows key sequence counters (NL80211_KEY_SEQ)
> up to 16 bytes, but ieee_param.crypt.seq is a fixed 8-byte buffer.
> When cfg80211_rtw_add_key() copies the sequence counter via memcpy()
> without checking seq_len, a heap buffer overflow of up to 8 bytes
> occurs, overwriting adjacent fields key_len and key[].
> 
> Cap the copy length at the buffer size using min_t().
> 
> Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
> Signed-off-by: Feng Ning <feng@innora.ai>
> ---
>  drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> index 7cb0c6f22..4fba53c2d 100644
> --- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> +++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> @@ -883,8 +883,11 @@ static int cfg80211_rtw_add_key(struct wiphy *wiphy, struct net_device *ndev,
>  
>  	param->u.c
> rypt.idx = key_index;
>  
> -	if (params->seq_len && params->seq)
> -		memcpy(param->u.crypt.seq, (u8 *)params->seq, params->seq_len);
> +	if (params->seq_len && params->seq) {
> +		size_t seq_copy = min_t(size_t, params->seq_len,
> +				       sizeof(param->u.crypt.seq));
> +		memcpy(param->u.crypt.seq, (u8 *)params->seq, seq_copy);
> +	}
>  
>  	if (params->key_len && params->key) {
>  		param->u.crypt.key_len = params->key_len;
> -- 
> 2.43.0




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
