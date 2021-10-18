Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE9F32C88
	for <linux-staging@lists.linux.dev>; Mon, 18 Oct 2021 15:12:34 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6D3D060F22;
	Mon, 18 Oct 2021 15:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1634569953;
	bh=pqgf0b2infPHvF1hEZ3I0eVHSrDJKa5zOrYnSSNObZI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CYkyL3rfJCrhqojP1ocfsK+OCBjOljn2iXpKXopRPivYa8rwVfZPRAaUvnSRaMr0R
	 KJkHIz08r7RMtPlWlMwIZSGHmZJclxVu2HR77dCbg96P4h0gYiLWNGZnbgVO8daL17
	 zLl+vCvjRilyes/ckMs9WuF8CuMkUiIxkBNxB2bA=
Date: Mon, 18 Oct 2021 17:12:31 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Karolina Drobnik <karolinadrobnik@gmail.com>
Cc: outreachy-kernel@googlegroups.com, forest@alittletooquiet.net,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: vt6655: Fix line wrapping in rf.c file
Message-ID: <YW2O3wC8wMEKS3Ub@kroah.com>
References: <20211018150526.9718-1-karolinadrobnik@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211018150526.9718-1-karolinadrobnik@gmail.com>

On Mon, Oct 18, 2021 at 04:05:26PM +0100, Karolina Drobnik wrote:
> Fix line length warnings raised by checkpatch.pl in
> rf.c file for `RFvWriteWakeProgSyn`,`RFbRawSetPower`
> and `RFbAL7230SelectChannelPostProcess`functions.
> 
> Signed-off-by: Karolina Drobnik <karolinadrobnik@gmail.com>
> ---
>  drivers/staging/vt6655/rf.c | 66 +++++++++++++++++++++++++++----------
>  1 file changed, 49 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/staging/vt6655/rf.c b/drivers/staging/vt6655/rf.c
> index a6f17162d017..206d34b555bc 100644
> --- a/drivers/staging/vt6655/rf.c
> +++ b/drivers/staging/vt6655/rf.c
> @@ -699,11 +699,17 @@ bool RFvWriteWakeProgSyn(struct vnt_private *priv, unsigned char byRFType,
>  			return false;
>  
>  		for (ii = 0; ii < CB_AL2230_INIT_SEQ; ii++)
> -			MACvSetMISCFifo(priv, (unsigned short)(MISCFIFO_SYNDATA_IDX + ii), dwAL2230InitTable[ii]);
> +			MACvSetMISCFifo(priv,
> +					(unsigned short)(MISCFIFO_SYNDATA_IDX + ii),
> +					dwAL2230InitTable[ii]);
>  
> -		MACvSetMISCFifo(priv, (unsigned short)(MISCFIFO_SYNDATA_IDX + ii), dwAL2230ChannelTable0[uChannel - 1]);
> +		MACvSetMISCFifo(priv,
> +				(unsigned short)(MISCFIFO_SYNDATA_IDX + ii),
> +				dwAL2230ChannelTable0[uChannel - 1]);
>  		ii++;
> -		MACvSetMISCFifo(priv, (unsigned short)(MISCFIFO_SYNDATA_IDX + ii), dwAL2230ChannelTable1[uChannel - 1]);
> +		MACvSetMISCFifo(priv,
> +				(unsigned short)(MISCFIFO_SYNDATA_IDX + ii),
> +				dwAL2230ChannelTable1[uChannel - 1]);
>  		break;
>  
>  		/* Need to check, PLLON need to be low for channel setting */
> @@ -716,17 +722,28 @@ bool RFvWriteWakeProgSyn(struct vnt_private *priv, unsigned char byRFType,
>  
>  		if (uChannel <= CB_MAX_CHANNEL_24G) {
>  			for (ii = 0; ii < CB_AL7230_INIT_SEQ; ii++)
> -				MACvSetMISCFifo(priv, (unsigned short)(MISCFIFO_SYNDATA_IDX + ii), dwAL7230InitTable[ii]);
> +				MACvSetMISCFifo(priv,
> +						(unsigned short)(MISCFIFO_SYNDATA_IDX
> +						+ ii), dwAL7230InitTable[ii]);

You shouldn't put the "+" on the start of a new line.

Also, these are all just fine as-is for now.  A better way to make these
lines smaller is to use better variable and function names that are
shorter and make sense :)

thanks,

greg k-h
