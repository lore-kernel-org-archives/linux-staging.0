Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EC5A27A907;
	Tue,  7 Jul 2026 09:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783418400; cv=none; b=jUQn4gAkgLrHJXCnttS6qvofr+jnkP1wux1at86gGuuYx/05cR88qsXTPk+t3PNrz0vK3LsSAhmPUvQwyLodC4qZ2FRewMR3qLtoze0Myg3i2tQsLjjodPskGoC4BTXfgpxqz6PIXuahEhiZw7bxfqV9B6z5a7TBFAA7f817gJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783418400; c=relaxed/simple;
	bh=3OOV3gT7Dhm5ebiEewYMEnHFHiFkuUQIWOyRr5nzAnQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iIhhtLtvj4BqqP5KfkVR23ssa22nqTpSmHO18lfP99ZuDgj6HfJ/IADr0se8mIJvafm/oII5yuSAwkQYyMDIq+fbhhaj8BUksUfqwDMMUcW/W3HTrTu1b0jnAoJTvdKQW+FkJ7fHTRylFBn1tn5sVCtA7CM0POqKLnzAzXj2Y9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=0XhCDVTU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="0XhCDVTU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B6911F000E9;
	Tue,  7 Jul 2026 09:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783418398;
	bh=/8mjPD40N3vgMofdeVpcl8iN91dng7EtLdqpCAtTE74=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=0XhCDVTUFPD5BOBWS5A/M/xpf77dGyewWxCiRpjT1t0L/tNqPjQPvWlB+iS7WDaN5
	 Un8PxPE1fTSTJf2hmIBwy/hYMiT+XnxZ5q0+R6EOYZsuOVOM4dPnjNNTKvLxKp0Lfo
	 rInxMd9W0fuz+j6SQFFcV1fSOTHe9Q5RytZxGvNU=
Date: Tue, 7 Jul 2026 11:59:56 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: artur.ugnivenko@gmx.de
Cc: ahmet@sezginduran.net, error27@gmail.com, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v9 3/3] staging: rtl8723bs: refactor queue priority
 initialization
Message-ID: <2026070724-unsolved-phoney-3b8c@gregkh>
References: <20260528170645.30861-1-artur.ugnivenko@gmx.de>
 <20260528180757.19082-1-artur.ugnivenko@gmx.de>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260528180757.19082-1-artur.ugnivenko@gmx.de>

On Thu, May 28, 2026 at 08:07:57PM +0200, artur.ugnivenko@gmx.de wrote:
> From: Artur Ugnivenko <artur.ugnivenko@gmx.de>
> 
> Pack individual priority values into an enum-indexed array
> to simplify the initialization code and prevent passing around
> six loose values as function parameters.
> 
> Signed-off-by: Artur Ugnivenko <artur.ugnivenko@gmx.de>
> ---
> Changes in v9:
> - don't declare variables in the middle of functions
> - remove unnecessary whitespace
> Changes in v8:
> - Remove the struct from v7, use an enum-indexed array instead
> - Remove other lines ending in parentheses fixes to keep the
>   commit small
> Changes in v7:
> - Add changelog.
> - Add transmit_queues struct in include/drv_types.h to improve
>   style of _InitNormalChipRegPriority
> Changes in v6: Make the patch apply to gregkh/staging-testing.
> Changes in v5: No changes in this patch.
> Changes in v4: No changes in this patch.
> Changes in v3: Split the patch into multiple patches.
> Changes in v2: Make patch apply to gregkh/staging-testing.
> 
>  drivers/staging/rtl8723bs/hal/sdio_halinit.c  | 105 +++++++++---------
>  drivers/staging/rtl8723bs/include/drv_types.h |  10 ++
>  2 files changed, 62 insertions(+), 53 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
> index 6f2aea984b30..1246c5fdfc32 100644
> --- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
> +++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
> @@ -188,25 +188,18 @@ static void _InitTxBufferBoundary(struct adapter *padapter)
>  	rtw_write8(padapter, REG_TDECTRL + 1, txpktbuf_bndy);
>  }
>  
> -static void _InitNormalChipRegPriority(
> -	struct adapter *Adapter,
> -	u16 beQ,
> -	u16 bkQ,
> -	u16 viQ,
> -	u16 voQ,
> -	u16 mgtQ,
> -	u16 hiQ
> -)
> +static void _InitNormalChipRegPriority(struct adapter *Adapter,
> +				       u16 queues[TX_Q_MAX])

Wow, that's an odd thing to be passing by value in a function, do you
really mean to do this?  Yes, the compiler will let you, but it's not a
good idea to do that at all in the kernel as it messes with the stack,
and all sorts of "odd" things can happen.

Please always pass structures by reference.

Also, you are "open coding" the structure size here, which is not a good
idea as you have to manually keep everything in sync.  What's wrong with
that original structure you used a few versions before?

thanks,

greg k-h
