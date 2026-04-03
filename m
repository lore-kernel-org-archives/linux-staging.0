Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D007280A51;
	Fri,  3 Apr 2026 18:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775239236; cv=none; b=oXIO32mD+riHEM/3/9HXEgAldabRM05BO96SD7xzpVioQp22hb+vcwMHiQlo5504PKaV2ZbH+ywoycoeZfLxRJUKPO45ZsOamMCRs5C+PQVVmzPzIAevIXq71ijQaZR/DOttvo4eRaB6ufPqo5CCK5qWnzLOqB/L+sBGWA1253s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775239236; c=relaxed/simple;
	bh=Z1gmuU1FNnfvQNoN3XIMDyFTXOZRnTpr8maDEVmzJpA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B9Lt6ksIV/GwPLO/OuNHbhxBHu2mJE7c1W5LYynF90dGViXzhfUq8mPEk1XUgGLCeOVH3AILWrEfuBWvHJkEwdQSByvqlebQxL1jgKhVjKkKgtjyUZbiklt6nCoQZ5WEdC9YMgGn8qbj2LhqQXtYowUYlNYAu4EzMFmPCN9WjQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=fmtQZKU9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="fmtQZKU9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81220C4CEF7;
	Fri,  3 Apr 2026 18:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1775239236;
	bh=Z1gmuU1FNnfvQNoN3XIMDyFTXOZRnTpr8maDEVmzJpA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fmtQZKU9TyR9Iqg6bajPm2QwUbuOvENoKuj3666ZOWfktF6gnz6eR0esfz8BMd3+X
	 as683S+XwqnNf9st9/cHlrTnUfrpwH93nLt67We9ofdESnmcawivsUeTSaOhwiMUxC
	 wXt3d3qkdtIskToQfxuLAasUopjMjh1hpcQKlqzk=
Date: Fri, 3 Apr 2026 20:00:33 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	straube.linux@gmail.com, dan.carpenter@linaro.org
Subject: Re: [PATCH v2] staging: rtl8723bs: use single-line initialization
 for pframe
Message-ID: <2026040344-headsman-reveler-3786@gregkh>
References: <2026040340-impish-bootlace-9b42@gregkh>
 <20260403175427.415-1-dennylin0707@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260403175427.415-1-dennylin0707@gmail.com>

On Fri, Apr 03, 2026 at 05:54:27PM +0000, Hungyu Lin wrote:
> Combine declaration and assignment of pframe into a single line.

But why?

> 
> No functional change.
> 
> v2: adjust formatting based on review feedback.

This goes below the --- line.

> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> ---
>  drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
> index a1f2cbf2cf55..c79df13b67a8 100644
> --- a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
> +++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
> @@ -239,8 +239,8 @@ static s32 xmit_xmitframes(struct adapter *padapter, struct xmit_priv *pxmitpriv
>  						/* pxmitbuf->priv_data will be NULL, and will crash here */
>  						if (pxmitbuf->len > 0 &&
>  						    pxmitbuf->priv_data) {
> -							struct xmit_frame *pframe;
> -							pframe = (struct xmit_frame *)pxmitbuf->priv_data;
> +							struct xmit_frame *pframe = pxmitbuf->priv_data;
> +

If the cast is not needed, that can be dropped, but really, I don't see
what is wrong with the original code, do you?

What tool is asking you to make this change?

thanks,

greg k-h
