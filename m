Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19A222D12EA;
	Sun, 28 Dec 2025 12:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766926449; cv=none; b=VfI2ZFSVr+n5i+Rlv7iS5Eed+4RI9S9ziwrIdgGJo1PuILfo51sv3xxXPuxDUNyQl0XZ/8Ld6HYk0Q2vUhqZT7dw3ol763iQzi/ok1US36mLrNxw7F6Eejlek+N1k/zTV56ssva8ZX15YebRhE0b8DjaGaUy3GRS3iqvkWaoZ9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766926449; c=relaxed/simple;
	bh=qUzktLq0VQCT2Wl5PNraVAJnddiSlt3fFiR77HklBAY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EQBnPt6o3Fhk5920dZ5gH4MguFreq0M7yVgthPtggPMnZUz4+YnpCIJauBsIOcM0b06MHbRi0FGTMMyiKlfQkgHKdXS5rRdQjrwFyq9X0gmq//d8u5HTP+sI7lQInsNktudzBYnpXhR/kfpS0tKSvSCEULHuB4NFEHOhlYANdbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=XRqFkb54; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="XRqFkb54"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61FD0C4CEFB;
	Sun, 28 Dec 2025 12:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1766926446;
	bh=qUzktLq0VQCT2Wl5PNraVAJnddiSlt3fFiR77HklBAY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XRqFkb54MuNXwC1xXKldRuv9mmi2viEzOodLacg/0LLvnxPdvo3pXDoTouVXnclFC
	 puXtB5xG3lIL8WRylV4UaoCRLCW+tUxDrNnHDN2wSbPhlTpSa4tyweZmF2Mk6uBRaw
	 UQwXuwJg9elhO/eIuNsRsSN6QcxcTrHR+0VXHsOs=
Date: Sun, 28 Dec 2025 13:54:03 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Sun Jian <sun.jian.kdev@gmail.com>
Cc: linux-staging@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>,
	Ignacio Pena <ignacio.pena87@gmail.com>,
	Bryant Boatright <bryant.boatright@proton.me>,
	JJ Strnad <strnad.jj@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: avoid short msleep duration
Message-ID: <2025122822-rectangle-wisdom-f775@gregkh>
References: <20251228054902.9065-1-sun.jian.kdev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251228054902.9065-1-sun.jian.kdev@gmail.com>

On Sun, Dec 28, 2025 at 01:49:02PM +0800, Sun Jian wrote:
> msleep() is documented to sleep for at least the specified
> number of milliseconds, but small values may result in a
> longer delay due to scheduler granularity.
> 
> Replace msleep(10) with msleep(20) to match the effective
> sleep duration and silence checkpatch warning.
> 
> No functional change intended.
> 
> Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_cmd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
> index ef2d92b5588a..0edf9ecc4bed 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
> @@ -215,7 +215,7 @@ void _rtw_free_evt_priv(struct	evt_priv *pevtpriv)
>  {
>  	_cancel_workitem_sync(&pevtpriv->c2h_wk);
>  	while (pevtpriv->c2h_wk_alive)
> -		msleep(10);
> +		msleep(20);

That is very arbritrary, are you sure this is ok?  Why 20?

Just doing this for checkpatch without being able to test and know it
works properly on real hardware is not a good idea.

thanks,

greg k-h
