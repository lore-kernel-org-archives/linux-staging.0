Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F90363090;
	Mon, 27 Apr 2026 03:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777261856; cv=none; b=PQStcue7tA6B3yfH2DiGhG6o8oc3B9e4qDNtBHRUArGT2SK+RpC+plcEqWXM6BfrBX3+uq91ix+NO75VRoDrXNM3c++qAESb9K/v2mlexqOK7a7YZWx06ZLzGW64s5svN8LMTUE7KNzYAzFtz3wlChnAvDsawYYrEqaBmuxzlmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777261856; c=relaxed/simple;
	bh=Q7gtp8WH54JY7qkRw1hitr4arANt1HXgFGFjGZ4yDt4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bcrIF60LoPWdSXyuBfo/GJB/dDEZjOqd4ET6mC4kHczH8BoUVrWyamyC9ALfA3MxZyx3+ppR1fRSXoGGqprzbtBGDJEmS4i8/3RGJbwO+Mrxj/AdG4knkVbnIW19Gw2HSl9hlqnY6H3GyRxXxb2lbKreXFd1cvSYc8SoQnPDIFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=0P5blbdt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="0P5blbdt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 908CEC2BCB7;
	Mon, 27 Apr 2026 03:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1777261856;
	bh=Q7gtp8WH54JY7qkRw1hitr4arANt1HXgFGFjGZ4yDt4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=0P5blbdtTm7rrQGyq9RqmkcfR1vcUg8PJPawayzDXecwc6lltCrBrWBzx7VsR+DtH
	 9OPCSQLSL1vACoZSudptygg7BxZxgfhssbzuC+3kapNXyoQa/Us30UKsEdT+eOkJA9
	 tKqm0Aq/R19fXzjzZY1RQ0QvQZhvPlWJ7GFAuEDo=
Date: Sun, 26 Apr 2026 21:42:57 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Alexandru Hossu <hossu.alexandru@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	dan.carpenter@linaro.org,
	Alexandru Hossu <a.hossu@student.tudelft.nl>
Subject: Re: [PATCH 2/2] staging: rtl8723bs: fix OOB read in OnAssocRsp() IE
 loop
Message-ID: <2026042647-unreeling-perm-1aad@gregkh>
References: <20260420140432.150431-1-hossu.alexandru@gmail.com>
 <20260420140432.150431-2-hossu.alexandru@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260420140432.150431-2-hossu.alexandru@gmail.com>

On Mon, Apr 20, 2026 at 04:04:32PM +0200, Alexandru Hossu wrote:
> From: Alexandru Hossu <a.hossu@student.tudelft.nl>
> 
> The IE parsing loop in OnAssocRsp() advances by (pIE->length + 2) each
> iteration but only guards on i < pkt_len.  When a malicious AP sends an
> AssocResponse whose last IE has only one byte remaining in the frame (the
> element_id byte lands at pkt_len-1), the loop reads pIE->length from
> pframe[pkt_len], which is one byte past the allocated receive buffer.
> 
> Additionally, even when the header bytes are in bounds, pIE->length itself
> can extend the data window beyond pkt_len, silently passing a truncated IE
> to the handler functions.
> 
> Add two guards at the top of the loop body:
>   1. Break if fewer than sizeof(*pIE) bytes remain (can't read the header).
>   2. Break if the IE's declared data extends past pkt_len.
> 
> Signed-off-by: Alexandru Hossu <a.hossu@student.tudelft.nl>
> ---
>  drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> index 5f00fe282..9666226a6 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> @@ -1400,7 +1400,11 @@ unsigned int OnAssocRsp(struct adapter *padapter, union recv_frame *precv_frame)
>  	/* to handle HT, WMM, rate adaptive, update MAC reg */
>  	/* for not to handle the synchronous IO in the tasklet */
>  	for (i = (6 + WLAN_HDR_A3_LEN); i < pkt_len;) {
> +		if (i + sizeof(*pIE) > pkt_len)
> +			break;
>  		pIE = (struct ndis_80211_var_ie *)(pframe + i);
> +		if (i + sizeof(*pIE) + pIE->length > pkt_len)
> +			break;
>  
>  		switch (pIE->element_id) {
>  		case WLAN_EID_VENDOR_SPECIFIC:
> -- 
> 2.53.0
> 
> 

Where is patch 1/2?

I'm totally lost...

greg k-h
