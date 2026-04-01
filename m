Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9EBF31E84D;
	Wed,  1 Apr 2026 18:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775067354; cv=none; b=DhfnEDmeXHUyGNIH47M7+0inCfsUpYuOn7XxwtXU5ib8SnhId3gBu2Z8n2eZSc+EbRO8RzlbCgw8KNvkD7qmqoI4uP0/sFumiz6iBTAl12lshUqa/JlJqI8Y7lcnfaGMCfwQdkXChDEHms+CZ4jDJupfnQjhsPI2zgNZYVqgOQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775067354; c=relaxed/simple;
	bh=6kFZHQMw5LmBRiiIUka4/QrrQclE41U1pVmbCLklQ2I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DtGmFpE/t/TRJ98yWTOfX9HnNy845POeMRxGwYIaWoFxM0smttwz2WBW7pRcxJFEq1x800wey0lwcHaMlml4G6M/t5CQVRi0BmROvPEio4REVNQAf8l/O7wkMrHzYDeJW+CmDgspCNcbKsjjNUTINT1olSf0ljamaq5H2zB8Bno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=FONXe4Bj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="FONXe4Bj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13D0FC4CEF7;
	Wed,  1 Apr 2026 18:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1775067354;
	bh=6kFZHQMw5LmBRiiIUka4/QrrQclE41U1pVmbCLklQ2I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FONXe4Bjy6gnvWXyXS1WD2V20C33ZYwMR/BYz2oZMk4Hy/2czTFq+/xyxo6uc8c4p
	 nGDiso6zSo27hjwLfII2RR/3h/Em26AydRHziIyg0cGwCWW/X1gIu1GlHPPJysZrdj
	 7VawM7WEitkf012AtKclCjObF6LtBmcIJm4P7DMw=
Date: Wed, 1 Apr 2026 20:15:51 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Joshua David Crofts <joshua.crofts1@gmail.com>
Cc: grondon@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: Use array_size() in
 rtw_spt_band_alloc
Message-ID: <2026040114-evident-groove-c44e@gregkh>
References: <20260401173917.2946-1-joshua.crofts1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260401173917.2946-1-joshua.crofts1@gmail.com>

On Wed, Apr 01, 2026 at 07:39:17PM +0200, Joshua David Crofts wrote:
> Replaced raw multiplication with array_size() macro to prevent
> integer overflows. Found using Coccinelle.
> 
> Signed-off-by: Joshua David Crofts <joshua.crofts1@gmail.com>
> ---
>  drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> index 098456e97..7f0ca5a5e 100644
> --- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> +++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> @@ -128,7 +128,8 @@ static struct ieee80211_supported_band *rtw_spt_band_alloc(
>  		goto exit;
>  
>  	spt_band->channels = (struct ieee80211_channel *)(((u8 *)spt_band) + sizeof(struct ieee80211_supported_band));
> -	spt_band->bitrates = (struct ieee80211_rate *)(((u8 *)spt_band->channels) + sizeof(struct ieee80211_channel) * n_channels);
> +	spt_band->bitrates = (struct ieee80211_rate *)(((u8 *)spt_band->channels) +
> +			     array_size(n_channels, sizeof(struct ieee80211_channel)));

Can this ever overflow?  Who controls n_channels, and why isn't it
bounds check before this?  Also, this is just getting a pointer to a
structure, it's not overflowing a size of an allocation.

thanks,

greg k-h
