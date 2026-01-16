Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D94811E9B1A;
	Fri, 16 Jan 2026 13:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768569077; cv=none; b=IxFMNzB8/krds07PrvNm8xdU+951Mmd874AWrfZWrmJxIy+ykLzSQ0p0jJqJRggWTmdvp/6EU3JNTdfWrP5IDVAx1vJlaZeA56K9oKvUBLhHVvgK28+AqZ1zk+sBrpUI1BPsTbnub9OeizcHwLs2MxgCK//qGfkRgziI/6jQ8+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768569077; c=relaxed/simple;
	bh=6Nxo6YHqlVQmp8Kka3S2S8I4E1cjMl6H8+5cp0ws8GY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C5bkjRZhPyvnwnji6Ua9vWAzj2QlXR+ohzMbT6/q1nM2f33ZYwMYLpws7AyYlqgiSrlc3iEU9Y8a6YTCLPM3moGHmDqoyqKLLIy/7UCNbBOssnFyG5404tb73aBZnFRnHmvpfZ5mTaGt0frdZPKhYA+mYo47PRSnoJHyeKt3hco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=F/l4JxFz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="F/l4JxFz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11C98C19425;
	Fri, 16 Jan 2026 13:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1768569077;
	bh=6Nxo6YHqlVQmp8Kka3S2S8I4E1cjMl6H8+5cp0ws8GY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F/l4JxFzJCJcf3a2fYcqsKYyPLy2v+6zMWwyRNpnM/yrqfIhXAQLBWBAxmxRTa/Rj
	 x0caJV96mM/j5YZ89Y6XLdHNayVnmMYiYl/QtopituJGS0h38w582KjCu2fpKm9Wim
	 K+HBsBOambgSe4Ag+x52IdmbMmf9aiDkl5K4n57I=
Date: Fri, 16 Jan 2026 14:11:14 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Khushal Chitturi <khushalchitturi@gmail.com>
Cc: dan.carpenter@linaro.org, straube.linux@gmail.com, hansg@kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/4] staging: rtl8723bs: simplify boolean expressions
Message-ID: <2026011610-aghast-crazed-178a@gregkh>
References: <20260116053052.4198-1-khushalchitturi@gmail.com>
 <20260116053052.4198-3-khushalchitturi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260116053052.4198-3-khushalchitturi@gmail.com>

On Fri, Jan 16, 2026 at 11:00:50AM +0530, Khushal Chitturi wrote:
> Simplify boolean expressions in rtw_xmit.c to
> comply with the kernel coding style

Please use the full 72 characters on a line.

> Signed-off-by: Khushal Chitturi <khushalchitturi@gmail.com>
> 
> ---
> Changelog:
> v2 -> v3: Resubmitted as a versioned series to avoid threading confusion.
> v1 -> v2: Corrected commit messages.
> 
>  drivers/staging/rtl8723bs/core/rtw_xmit.c | 38 ++++++++++++-----------
>  1 file changed, 20 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
> index bbc42db1c828..97e38ef62ac4 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
> @@ -384,7 +384,8 @@ static void update_attrib_vcs_info(struct adapter *padapter, struct xmit_frame *
>  	} else {
>  		while (true) {
>  			/* IOT action */
> -			if ((pmlmeinfo->assoc_AP_vendor == HT_IOT_PEER_ATHEROS) && (pattrib->ampdu_en == true) &&
> +			if ((pmlmeinfo->assoc_AP_vendor == HT_IOT_PEER_ATHEROS) &&
> +			    (pattrib->ampdu_en) &&

You moved this to the next line in the right place, but here:

> @@ -903,8 +905,8 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
>  
>  			if (pattrib->qos_en)
>  				qos_option = true;
> -		} else if ((check_fwstate(pmlmepriv, WIFI_ADHOC_STATE) == true) ||
> -		(check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE) == true)) {
> +		} else if ((check_fwstate(pmlmepriv, WIFI_ADHOC_STATE)) ||
> +		(check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE))) {

You did not?  How come?

thanks,

greg k-h
