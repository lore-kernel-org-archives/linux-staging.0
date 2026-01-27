Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE02D359714;
	Tue, 27 Jan 2026 14:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769524713; cv=none; b=Df8Gickn+98C0BOqjGtxf3o0QS/vSaFegFsiuSj/PtbyfDnM3ZZ/vR/e9XplpFjSPnAjLLSto5H21Vdjb6/lFtWs4kmFoplw01A5fJGxK0jEZ+NlgINxarVWly36co+pdx92Gp0Cel5dJNlUlCwJ6T12QR30+akTb2e0V8U3A2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769524713; c=relaxed/simple;
	bh=gYjkpQU1cUfjzmAz+ofPZ1VLmsLvykdLt1J+VQOnyxo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k3Md0c2oYJ1ad9mObcu0FNkHvSiLbf3jO79QvCMJ5ZF1NdF0Ug5cYvcwoI0BoA6tvNnoppede6p3pG2nd96BZdKPkJlNCwoxPKQKxTGtdJlvHYNIBVMr7iVdIA5BjdO9COUK3Wn/Moy+CTekdk8TZvVKKdpA3GpuoZwLYA3dsCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=mkJioc3p; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="mkJioc3p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2578CC116D0;
	Tue, 27 Jan 2026 14:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1769524712;
	bh=gYjkpQU1cUfjzmAz+ofPZ1VLmsLvykdLt1J+VQOnyxo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mkJioc3poiRjT5lWb1mc7y/ZHbADJkVz5+JnHdn0Hj56+qR8HKLnCuH0A1xizzAMW
	 TIz4vyfeECVU9PZviVKypMbh7iZ5WYPtukGXpFLEiuBKEeWemqttz80fyT89STsCE/
	 268/suMllA2AnCpZyRF99vgjTuMYuwMOxPrJ1Odg=
Date: Tue, 27 Jan 2026 15:38:29 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: William Hansen-Baird <william.hansen.baird@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] staging: rtl8723bs: core/rtw_mlme_ext.c: initialize
 copy_len, clearing later control-flow.
Message-ID: <2026012720-ending-obsessive-3555@gregkh>
References: <20260116160914.88069-1-william.hansen.baird@gmail.com>
 <20260116160914.88069-5-william.hansen.baird@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260116160914.88069-5-william.hansen.baird@gmail.com>

On Fri, Jan 16, 2026 at 11:08:51AM -0500, William Hansen-Baird wrote:
> Initialize copy_len to 0 in rtw_parse_assoc_security_ies function.
> This allows later if-statement to not have to explicitly set copy_len to 0.
> Thus we can make the if statement single-lined, and remove the braces
> from the if-else branch.
> The change is purely cosmetic and changes no logic.
> 
> Signed-off-by: William Hansen-Baird <william.hansen.baird@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> index 842e95e1eaec..d470725a033f 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> @@ -946,6 +946,7 @@ static unsigned short rtw_parse_assoc_security_ies(struct adapter *padapter,
>  	pstat->wpa_pairwise_cipher = 0;
>  	pstat->wpa2_pairwise_cipher = 0;
>  	memset(pstat->wpa_ie, 0, sizeof(pstat->wpa_ie));
> +
>  	if ((psecuritypriv->wpa_psk & BIT(1)) && elems->rsn_ie) {
>  
>  		int group_cipher = 0, pairwise_cipher = 0;

Why this line added?

> @@ -1016,17 +1017,15 @@ static unsigned short rtw_parse_assoc_security_ies(struct adapter *padapter,
>  		}
>  
>  	} else {
> -		int copy_len;
> +		int copy_len = 0;
>  
>  		if (psecuritypriv->wpa_psk == 0) 
>  			return WLAN_STATUS_INVALID_IE;
>  
> -		if (elems->wps_ie) {
> +		if (elems->wps_ie)
>  			pstat->flags |= WLAN_STA_WPS;
> -			copy_len = 0;
> -		} else {
> +		else
>  			copy_len = min_t(int, sizeof(pstat->wpa_ie), wpa_ie_len+2);
> -		}
>  
>  		if (copy_len > 0)
>  			memcpy(pstat->wpa_ie, wpa_ie-2, copy_len);

I feel like this is just polishing the code for no reason at all.  Why
make this change at all?  What asked for it?

thanks,

greg k-h
