Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795158609;
	b=di5rrD4WM4CyucAYKCSQWN3vucsH3ceb55xdLS/DCSh0iE3kvMzilgkER+bU/twGIf22
	 5L/iLUh9KYu1Ug539HS3fy0Cu8dFEhUnsXDyayUYFsRDLr0mgVIjzSPNzMfPhSaAyXwJ/
	 1TNxnVwROX+wCXwWrs7OxCQhoDDIUEnaPht+NnsoHfl1FKr9nbg5mtZlT0o60L/AyGshC
	 lmCK/YpUjBja0JFQJ8oZFU0CdFXOYDLHwj6aV5aCQqFxt45IelX6AtNqtBaUDg9kgIPA/
	 rdgrgeCyoXPf4lQq5UdCrgYqC+33EkpbwYxOLiAdJdnmRdUKBMw7Zw59nWNDOV2Tb3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795158609;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=ZBniOJtkIkQCDoLNiGx8LtKCE4afkgtR1wZvkesmdXY=;
	b=y0nAM4I0IeEuMcmBNnn1n5lBoi9Hnj/tZupqwzQRGyVMlRxUGS95fw/lceWz2Y5f8oCg
	 7DGfe5FNLTuyGSMPObUJOrlz+5wjZCpioDwLvWBWWOrEGmKzlYfVI5N7HMrewgUBGL1Ir
	 rvc6p/UExZKk6QOGfKf7NojOBpc4oTkgH7cwqXA+v7FaCi7PdZV7L5mQoKeHvEmvlEKvh
	 AZCl5AFwTDce+UVJx5EHPIjqTsCGkYCAZ50WI+YlmKanInnHSsSzGeGNi19j596n+wUo4
	 ZD6tVqXPA+e/1GYdbdRBUj655X5yZbxMxDv5W700IqXTPGEp7hs/u/cA5wpWmQN02UQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=efx3a9rs;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 766A2606A32A;
	Fri, 20 Nov 2026 07:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=efx3a9rs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFA261F000C4;
	Fri, 20 Nov 2026 07:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795158608;
	bh=ZBniOJtkIkQCDoLNiGx8LtKCE4afkgtR1wZvkesmdXY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=efx3a9rsBlp0tUlsDX6YC1VFDTcAB2nuHDCJWSW49vRhT/BmiQeNuaku8/K7pD0HU
	 YEmJ305CzaWMMdF71Mf/TH8kM0oUj5dDqq456Rg/N+ddT1T7t5/zHe8yzfYWgb5nmB
	 RKG0Gm7EISi1v9Y8MGpiMfhcfvFzDC+sAt7moLzw=
Date: Fri, 20 Nov 2026 08:10:05 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Temitope obabi <obabitemitope765@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: Remove extra blank line in os_intfs.c
Message-ID: <2026112057-bunch-prologue-9ef6@gregkh>
References: <20261021065940.863-1-obabitemitope765@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261021065940.863-1-obabitemitope765@gmail.com>

On Wed, Oct 21, 2026 at 09:59:40AM +0300, Temitope obabi wrote:
> Remove a duplicate blank line. Reported by checkpatch.pl.
> 
> Signed-off-by: Temitope obabi <obabitemitope765@gmail.com>
> ---
>  drivers/staging/rtl8723bs/os_dep/os_intfs.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
> index c15056ee207c..231a863317f2 100644
> --- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
> +++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
> @@ -18,7 +18,6 @@ static int rtw_chip_version;
>  static int rtw_rfintfs = HWPI;
>  static int rtw_lbkmode;/* RTL8712_AIR_TRX; */
>  
> -
>  static int rtw_network_mode = NL80211_IFTYPE_ADHOC;/* infra, ad-hoc, auto */
>  /* struct ndis_802_11_ssid	ssid; */
>  static int rtw_channel = 1;/* ad-hoc support requirement */
> -- 
> 2.53.0
> 
> 

This file is no longer present in the tree, sorry.

greg k-h
