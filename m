Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3FEF3D330B;
	Fri,  3 Apr 2026 17:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775236979; cv=none; b=nN+3T/I03GUSCtGHCOJ2vEExvAJNtjMWX5PjdfzkSR1ED+8muY8Akf4kkEeUjXvQmFubVpBzAtLMbbpPz2nm48RB3gLXaXl605BnPU/16YR7otY+2+UxYJN48w0qbGkeFbHCEgMRWGLYEgSSKnfySqiyw470bjQEQgXXM70+Qzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775236979; c=relaxed/simple;
	bh=oqNTZ3wSZv5k/PLXorDdoGYR4R5LX+x5EQnr9hhZ+8g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rJAucOWUxdkB4MXcl2jci4M6E+FcjzRjFZAKVCrkkuhbKGcBLPXbPEGzz5cg8jbtO4SwqvvPtOD1lAr7J/hHuxnqlJNtv5d4Sbasz+k4Lfxn8hP5Aen05fb/MNVvqaS5wdSly9uSNMKM+IgoywjrXXxxw+KttHy24mKgcwX28m4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=hfo4KcCp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="hfo4KcCp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1427C4CEF7;
	Fri,  3 Apr 2026 17:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1775236978;
	bh=oqNTZ3wSZv5k/PLXorDdoGYR4R5LX+x5EQnr9hhZ+8g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hfo4KcCpGDkx+flQMatky7B1yxG79O1Lth+ayhG+RAmtbM5ZBe5BRElMePf7OLDNp
	 /65UM9LbXWepBOHcUqQ34DlgXk2Yq7jGpBN+r0HZ2hVZk6eU42VABG8hO+UvMaUo4k
	 nqIpvZKWO/IhUEH7aihIDOjXqFbh8jlhYlJe8ebA=
Date: Fri, 3 Apr 2026 19:22:28 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	straube.linux@gmail.com, dan.carpenter@linaro.org
Subject: Re: [PATCH] staging: rtl8723bs: simplify xmit_frame initialization
Message-ID: <2026040340-impish-bootlace-9b42@gregkh>
References: <20260403001307.5722-1-dennylin0707@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260403001307.5722-1-dennylin0707@gmail.com>

On Fri, Apr 03, 2026 at 12:13:07AM +0000, Hungyu Lin wrote:
> Simplify initialization of pframe by combining declaration and
> assignment, improving readability.
> 
> No functional change.
> 
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> ---
>  drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
> index a1f2cbf2cf55..84e58e53d708 100644
> --- a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
> +++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
> @@ -239,8 +239,9 @@ static s32 xmit_xmitframes(struct adapter *padapter, struct xmit_priv *pxmitpriv
>  						/* pxmitbuf->priv_data will be NULL, and will crash here */
>  						if (pxmitbuf->len > 0 &&
>  						    pxmitbuf->priv_data) {
> -							struct xmit_frame *pframe;
> -							pframe = (struct xmit_frame *)pxmitbuf->priv_data;
> +							struct xmit_frame *pframe =
> +								pxmitbuf->priv_data;
> +

This is now 3 lines, not 2, which didn't really help anything out in
looking better.

What tool told you to make this change?  It needs to be fixed.

thanks,

greg k-h
