Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C4C36A035;
	Thu, 21 May 2026 09:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779354906; cv=none; b=Pm7Y+Zhqf/oY7MztaLlv+G9biYcIOnPekmNRFhYffenRpHZEHfYTgUUV+483h6spME6927s3I7mHyZLi7nANELDGCVa/PlZHXkvlakOVT/zkdi7jq8sgk7ooO7L97p7gg0mKRiYQ1igVDMfm8YK5mZjr1JIki5Wj/DfI1heeDS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779354906; c=relaxed/simple;
	bh=yTxnqidlW97ZsSB6dKLp7VdmNvEDnMxSlUrCqlgDm8E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pmpXhP2PkxZALgrSbjvzpNj4S+mjnVFcHdMrSOp8x4d876jeZvCMqdPaIX0uutLKO2nLz+Ey+YE+kWqSFI69XgRUm9d/6QhnC5/bNMmMFFKPPntkaHd5Hfnx+d6s0AkUVq5CdTSjB+Y0ENqJWwTXYk9G3r1TE5Vaky8kchnCsfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=GamQWFwq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="GamQWFwq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5610B1F000E9;
	Thu, 21 May 2026 09:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1779354904;
	bh=X+HtlKUPhKf75GOIPtn7qWERLTRDRYR+ty4RNs7A6bY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GamQWFwqT2sFfoQzErABV21VE33i9kCx++o1s5FRdm4kIQhtA0dxFtObUqj5RpUnJ
	 ngtJKdpiwszEGbi6AnTvfLs1wpgYjl8MNjBxME0//i6tGe2zkgNP6q7fW1v4GexysJ
	 ExTeWogoCnXuUcBNvnXUg6b9NZZ3zsidTFkb8+rg=
Date: Thu, 21 May 2026 11:15:07 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] staging: rtl8723bs: simplify LPS_RF_ON_check control
 flow
Message-ID: <2026052148-amaretto-aspirate-7c36@gregkh>
References: <20260512030445.6360-1-dennylin0707@gmail.com>
 <20260512030445.6360-2-dennylin0707@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260512030445.6360-2-dennylin0707@gmail.com>

On Tue, May 12, 2026 at 03:04:44AM +0000, Hungyu Lin wrote:
> Replace err + break pattern with direct returns to simplify
> the control flow and improve readability.
> 
> No functional change intended.
> 
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_pwrctrl.c | 24 ++++++++------------
>  1 file changed, 9 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
> index ca1cb58fc801..7f297f2d2ff4 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
> @@ -389,35 +389,29 @@ void rtw_set_ps_mode(struct adapter *padapter, u8 ps_mode,
>  
>  /*
>   * Return:
> - *0:	Leave OK
> - *-1:	Timeout
> - *-2:	Other error
> + * 0:    Leave OK
> + * -1:   Timeout
> + * -2:   Other error
>   */

This change was not documented above, and doesn't belong in this patch
:(
