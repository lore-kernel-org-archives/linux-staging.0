Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A57FE3C8C55;
	Tue,  7 Jul 2026 11:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783423800; cv=none; b=qFg4d5CPZdtY0Zx9QjtHWrLWJlhZyNUDyTNQzVQI+97XwAk3Z+kdtdOGu+ksj3at341bnlA1Y5JRQxnVsKhbKAsydk1FEB2sA6HLhE21z2CQ9a0wQW2dPAL1gZWK3EfwoqEYLmQ9xAoatfo9gN5LHTvbgIvQEcRflfT5OlVocRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783423800; c=relaxed/simple;
	bh=uoT80BP6d6dcczqXUs168DRlnY1VFVacluyPVR/ZDy0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jWACUEnczF5OOK1G3VYYQ6orlBdyUAtZ+O7YRDmJ0Jfb8SwuabKUN0ccqTyn3w60fppVGDHodXNf9J/34JbSaePCnf+3OBJ07Csqq91UV2xVKL9SD259uwIaj1H07POgjBRRk6LXhKe1yD/GMHTefrRE6thF9/CIC4bLlLV/DaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=tezbuzvr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="tezbuzvr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F255B1F000E9;
	Tue,  7 Jul 2026 11:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783423799;
	bh=NtsMAbbrttaWj/eT+br0jgyc3JWU8NboO8jYgOMMlqY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=tezbuzvrG5h3WFntVJ5MoYGV2tLp0SWGaRgBv4yv1w0tVhaEbY8tgBEn3bk41x7We
	 pncbDoZssHvBWI++lAm0QLUV/p+YGU9Uq/SCuMlwpJ1q9IQilFNLt4GgIWOzwlIHGr
	 iKActRBSxklL39XYGE53sXTDNwTh9VyAQuOyyCtE=
Date: Tue, 7 Jul 2026 13:29:56 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Alonso Garrigues <agarrigues@riseup.net>
Cc: error27@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: remove unnecessary braces in
 odm_HWConfig.c
Message-ID: <2026070742-playgroup-stoop-0128@gregkh>
References: <20260624193446.1429981-1-agarrigues@riseup.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260624193446.1429981-1-agarrigues@riseup.net>

On Wed, Jun 24, 2026 at 08:34:46PM +0100, Alonso Garrigues wrote:
> Single statement block does not need braces.
> 
> Signed-off-by: Alonso Garrigues <agarrigues@riseup.net>
> ---
>  drivers/staging/rtl8723bs/hal/odm_HWConfig.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/hal/odm_HWConfig.c b/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
> index c88d669cb086..1716252641d3 100644
> --- a/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
> +++ b/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
> @@ -236,9 +236,8 @@ static void odm_rx_phy_status_parsing(struct dm_odm_t *dm_odm,
>  	if (is_cck_rate) {
>  		phy_info->signal_strength = (u8)(odm_signal_scale_mapping(dm_odm, pwdb_all));
>  	} else {
> -		if (rf_rx_num != 0) {
> +		if (rf_rx_num != 0)
>  			phy_info->signal_strength = (u8)(odm_signal_scale_mapping(dm_odm, total_rssi /= rf_rx_num));
> -		}
>  	}
>  }
>  
> -- 
> 2.54.0
> 
> 

Someone else already submitted this change before you, sorry.

greg k-h
