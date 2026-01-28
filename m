Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D73663009D2;
	Wed, 28 Jan 2026 05:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769579862; cv=none; b=mJGnKTLM+E309v8eXoqscNQ7Au6H9sk0elVpHif8XbkkTIrSPcch61qixFLcKYQD1g64f4ZMcoKD0t8x6FSe8U4Ty/Fmktkzw0vCGLOmipUpP5vUHZmwTDIoZ7PHN6LBiM16d2CYFEa6OazrVOfsnzMEK3uAbwjgut+gZHt2a+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769579862; c=relaxed/simple;
	bh=jodoj2iwmnptOh85EaU3KnUY+DFJ4+pP6wb32xQnX/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MUNd7qWIThLcWx805kuM+9VHFZc93ALbUlUTiGNh9bfsXpM6WT3P68dJKp/3PbFZ7Vy4mt7HtyH6K1bwudKSjtAXwTdC9+/b+jZ449r8IFMXQ6xvfb1S3n9q9edY/sqqA9K6gSl0cWm+03KNT6YiG6PSIfne7lbbh2XizABWfA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=seFqgSb8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="seFqgSb8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1606CC4CEF1;
	Wed, 28 Jan 2026 05:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1769579862;
	bh=jodoj2iwmnptOh85EaU3KnUY+DFJ4+pP6wb32xQnX/Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=seFqgSb8X+obKdauRGmFziC+Mk6oztLhhBApdQ3vhh1fshbVPrKYj3YjDo4XZ4TBX
	 EWUh4gsVIG3gR3DpURtlRa/USoh9o4HmY8iruhWjt6bT6r2oEfVefGA6QhYn3DFWnm
	 2UiY5CH02BPM3+GWwH0t/4k00z2rAfYP3X6ZuJqc=
Date: Wed, 28 Jan 2026 06:57:39 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Madhumitha Sundar <madhuananda18@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: sm750fb: replace magic number with jiffies
 timeout
Message-ID: <2026012818-landmass-cattle-d8c2@gregkh>
References: <20260127164816.91481-1-madhuananda18@gmail.com>
 <20260127164816.91481-2-madhuananda18@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260127164816.91481-2-madhuananda18@gmail.com>

On Tue, Jan 27, 2026 at 04:48:16PM +0000, Madhumitha Sundar wrote:
> The hardware wait loop in hw_sm750_de_wait used a hardcoded loop
> counter (0x10000000), which depends on CPU speed and is unreliable.
> 
> Replace the loop counter with a jiffies-based timeout (1 second)
> using time_before(). This ensures consistent delays across architectures.
> 
> Signed-off-by: Madhumitha Sundar <madhuananda18@gmail.com>
> ---
> Changes in v2:
>  - Switched from loop counter to jiffies + cpu_relax() as requested by Greg KH.
> ---
>  drivers/staging/sm750fb/sm750_hw.c | 21 +++++++++++++++++----
>  1 file changed, 17 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/sm750fb/sm750_hw.c b/drivers/staging/sm750fb/sm750_hw.c
> index ce46f240c..b24d27a77 100644
> --- a/drivers/staging/sm750fb/sm750_hw.c
> +++ b/drivers/staging/sm750fb/sm750_hw.c
> @@ -523,19 +523,32 @@ int hw_sm750le_de_wait(void)
>  
>  int hw_sm750_de_wait(void)
>  {
> -	int i = 0x10000000;
> +	/* Wait for 1 second (HZ) */

No need for a comment, right?

> +	unsigned long timeout = jiffies + HZ;

Why is a variable needed?

And are you sure 1 second is ok?  How short was the original timeout?

>  	unsigned int mask = SYSTEM_CTRL_DE_STATUS_BUSY |
>  			    SYSTEM_CTRL_DE_FIFO_EMPTY |
>  			    SYSTEM_CTRL_DE_MEM_FIFO_EMPTY;
> +	unsigned int val;

Why move this?

> -	while (i--) {
> -		unsigned int val = peek32(SYSTEM_CTRL);
> +	/* Run while Current Time is BEFORE the Deadline */

Run what?

> +	while (time_before(jiffies, timeout)) {
> +		val = peek32(SYSTEM_CTRL);
>  
> +		/* If Not Busy (0) AND Buffers Empty (1), we are good */
>  		if ((val & mask) ==
>  		    (SYSTEM_CTRL_DE_FIFO_EMPTY | SYSTEM_CTRL_DE_MEM_FIFO_EMPTY))
>  			return 0;
> +
> +		/* Polite pause to save power */
> +		cpu_relax();

Are you sure you can sleep here?

>  	}
> -	/* timeout error */
> +
> +	/* Final check in case we succeeded at the last millisecond */

I do not understand this, why would this matter?

> +	val = peek32(SYSTEM_CTRL);
> +	if ((val & mask) ==
> +	    (SYSTEM_CTRL_DE_FIFO_EMPTY | SYSTEM_CTRL_DE_MEM_FIFO_EMPTY))
> +		return 0;
> +

Was this tested on real hardware?

thanks,

greg k-h
