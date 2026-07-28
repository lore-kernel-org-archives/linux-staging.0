Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59FD131A045;
	Tue, 28 Jul 2026 15:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785254066; cv=none; b=cxlSyGye0aSUjPhFIHN2hqgL4xAslO83m8V7oTL33swImbvSMf1x6sEh7s4y7t6BpT8q+o2R0hkoIxi17eGm3bNvK1AhsguhYxRuJEOAZzWQfjHYqaelEdJVD96M0S6x7gG006qimi97P3n7R4cXk2Sak/oarzW4dFChlxk5zJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785254066; c=relaxed/simple;
	bh=ciQrFnVJKCKAu49PKNBytR+uhTwEVj+FkAkprNOAWEM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fxP2Iw1zVsmUTkFRqzWUHjt5FqW/KRlDEkN4G/bPDmMFkO8XoZH0wr9f37qYYO2ZKFVsRXF7sUOYO34XFF/XtEX+bW9n4PLe/swuoCbdFwnAuTawOTGBLO49gHVEAF5i3ui7R9gsbG/onQuuMxw86+qH6MIFfcsh/NJmU65vTT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=pjMkXGaP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="pjMkXGaP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32B831F000E9;
	Tue, 28 Jul 2026 15:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785254065;
	bh=RzoJ7woWQ91SW7DYrXLv499ElqJfw2sbp1TB9My/0LY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=pjMkXGaP/uhgtd+RnF81FQ2IJQ+mb7XWUJifmll2QdptIUeSx+ciGS2yyuirKdeHd
	 FENPhtbTRDnPVpFgUTWAutCzTF0LfHTWTFQnUZGPb9kSCyubNE5FYS7dxDn9lNUVcx
	 wYmFYKKv+de0DtOvRGDzsUrhjRFZbL/3HLL0auw8=
Date: Tue, 28 Jul 2026 17:54:10 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Bramwel Barack <bramwelbarack89@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: fix line length warnings in
 os_intfs.c
Message-ID: <2026072826-cocoa-chance-aa5a@gregkh>
References: <amjKM_tz7ul0vj40@fedora>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <amjKM_tz7ul0vj40@fedora>

On Tue, Jul 28, 2026 at 06:26:43PM +0300, Bramwel Barack wrote:
> The current formatting standards in the file rtl8723bs violates the
> kernel coding standards of 100 lines.
> Targeted most comments of code while avoiding key functions and comments
> included due to indents.
> 
> >From 08a6ba8dd59504c030c0e6c9f9459a53436d32eb Mon Sep 17 00:00:00 2001
> From: Bramwel Barack <bramwelbarack89@gmail.com>
> Date: Tue, 28 Jul 2026 17:50:30 +0300
> Subject: [PATCH] staging: rtl8723bs: fix line length warnings in os_intfs.c
> 
> Signed-off-by: Bramwel Barack <bramwelbarack89@gmail.com>

No changelog text?  Something went wrong here, perhaps use `b4` to
create and send patches out?  Heck, even I've started using it, it
really is a nice workflow to learn.

> ---
>  drivers/staging/rtl8723bs/os_dep/os_intfs.c | 37 ++++++++++++++++-----
>  1 file changed, 29 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
> index c15056ee207c..c916f6f52253 100644
> --- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
> +++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
> @@ -71,20 +71,36 @@ int rtw_ht_enable = 1;
>   * 0x01 means enable 2.4G 40MHz
>   */
>  static int rtw_bw_mode = 0x01;
> -static int rtw_ampdu_enable = 1;/* for enable tx_ampdu ,0: disable, 0x1:enable (but wifi_spec should be 0), 0x2: force enable (don't care wifi_spec) */
> +static int rtw_ampdu_enable = 1;
> +/*  for enable tx_ampdu ,0: disable */
> +/*  0x1:enable (but wifi_spec should be 0) */
> +/*  0x2: force enable (don't care wifi_spec) */

Shouldn't the comment be on the top of the variable?

thanks,

greg k-h
