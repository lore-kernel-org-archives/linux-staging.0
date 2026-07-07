Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFBE33DB99A;
	Tue,  7 Jul 2026 10:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783419379; cv=none; b=gxBtcVZ+qeHgs4Vu8Cu/SIbbZoHSyWV4X5sIvh+Z3JcbyVlYHwsgbu9X2RIM2bUqnldCiH5xh8bhAZvaqhQSvbjEWjTCzmLARhfkhkejpYk9lCcRUjgMNOylxFT3T2DKXBLFACOhUktfo/fPw6WBSnKGihpXXrHalH4Kw6sWPSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783419379; c=relaxed/simple;
	bh=4h5dDa+8X4Ayax4EtJ23D1PR0JXK+hXG2KcvCEfC+/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NLbOhASnjpQxnXIkx3JVizP6TlBD+WKF1JIs13nPkCxoeJVEKW2M+LJBhqDSG4VNgC+glY1rifAqATQmcrpMVebF101ka4bLWlVGFlP6cQSzKm6F8ihraQdURRial0VsVhUZTGVzZ5tuNWTNtUhcY9N1glh12tIEpjshCmVTmLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=EryjEfQy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="EryjEfQy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B9761F000E9;
	Tue,  7 Jul 2026 10:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783419378;
	bh=QS/8GsuEUZp/GO/d0LoscQqgIDAeVijOsJ8gMtX+roI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EryjEfQywnWhjpc1lh9B/H79wnlmwseF4P2leXDgXIJdqZssfir7e1nh+Rxmc0fnT
	 V3ZKdhLU4fzIZ9oMlbQiyjuRSU7ci0XUesrlVAnhE4W/YPZH77NS3m66k5snaXJd/7
	 MLv+5IMTWrNHdEMceCS/wHmtk+yXRFBvLgBpEHvw=
Date: Tue, 7 Jul 2026 12:16:16 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Anirban Bose <boses156@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: rename camelcase variable bAllow
Message-ID: <2026070702-murkiness-upfront-3082@gregkh>
References: <20260524142309.88007-1-boses156@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260524142309.88007-1-boses156@gmail.com>

On Sun, May 24, 2026 at 07:53:09PM +0530, Anirban Bose wrote:
> Rename the local variable 'bAllow' to 'allow' in rtw_cmd_filter() to fix
>  a checkpatch CamelCase warning.
> 
> Signed-off-by: Anirban Bose <boses156@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_cmd.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
> index b932670f5d63..aa4a810d8322 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
> @@ -299,12 +299,12 @@ void rtw_free_cmd_priv(struct	cmd_priv *pcmdpriv)
>  int rtw_cmd_filter(struct cmd_priv *pcmdpriv, struct cmd_obj *cmd_obj);
>  int rtw_cmd_filter(struct cmd_priv *pcmdpriv, struct cmd_obj *cmd_obj)
>  {
> -	u8 bAllow = false; /* set to true to allow enqueuing cmd when hw_init_completed is false */
> +	u8 allow = false; /* set to true to allow enqueuing cmd when hw_init_completed is false */

Why isn't this converted to a boolean at the same time?

thanks,

greg k-h
