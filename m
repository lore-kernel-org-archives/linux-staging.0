Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FA4A1537CE
	for <linux-staging@lists.linux.dev>; Sun,  8 Sep 2024 11:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725795263; cv=none; b=bVN/bIY/vjzzyaw6IPN/v2edh9GlXVFtdn3bBYzhEj8BD5WSfq2f+2Tb68WVUD2DI425JhrnAa2EjnAQreFc6hABelhaSLfgm1cb0XY7dvboaaP3PcIOSKsQqCFBtbP4cPpuT2Jf6+m06Mom6RxlMFfaLjkTys7Sl44qmYNIFj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725795263; c=relaxed/simple;
	bh=w9PMPYTHVudpynkjFYwi/qlJ6/bq9L2og14lx1dcKB4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DcmB+MF9uaCBcvOqwgfTV/5sF151XtZPf2orTNSbveoo3n9RXAxNJ7eRlSU6U7NSF//GBMxFz0cjugFjxYsEI16fRrpvWybh5pprjdzsKxHi+QhWz6jvwnaR9BrRC/j0uSn+eonb8UCVPzO1MRlinOSB3/l91OXRf6Bvb099bZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=kVaudmq7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="kVaudmq7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4D40C4CEC3;
	Sun,  8 Sep 2024 11:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1725795263;
	bh=w9PMPYTHVudpynkjFYwi/qlJ6/bq9L2og14lx1dcKB4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kVaudmq7P5yriGs3eWUPDBhB4QVodfgqAXueoiiLYoc+cJYR2P0x1Dxug5ytmnUeh
	 aEz5T2UoVFR8W6GymMCB+4ThhpANUvxSbxaRVyRtJ0fsdx+7W2KtEC8eonC3+6H91l
	 4TSkF01vcRVAMoFaAp0rSqebF59uKme35fWEUTTM=
Date: Sun, 8 Sep 2024 13:33:44 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Fabio Joaquin <joakobar2000@gmail.com>
Cc: linux-staging@lists.linux.dev, ~lkcamp/patches@lists.sr.ht
Subject: Re: [PATCH] staging: iio: Solved warning of undefined string.
Message-ID: <2024090858-rewind-wolf-e75f@gregkh>
References: <20240907182514.8257-1-joakobar2000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240907182514.8257-1-joakobar2000@gmail.com>

On Sat, Sep 07, 2024 at 03:25:14PM -0300, Fabio Joaquin wrote:
> The remove of the line of the referenced string was the forced solution of this source of warning.

What warning exactly?

And please wrap your changelog at 72 columns like your editor asked you
to.

> The string wasn't defined in the bindings directory, so this was necessary.

I can't really understand this sentance, sorry.

> 
> Signed-off-by: Fabio Joaquin <joakobar2000@gmail.com>
> ---
>  drivers/staging/iio/accel/adis16203.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/staging/iio/accel/adis16203.c b/drivers/staging/iio/accel/adis16203.c
> index c0e4c9266b5f4..0255ed6dc300d 100644
> --- a/drivers/staging/iio/accel/adis16203.c
> +++ b/drivers/staging/iio/accel/adis16203.c
> @@ -293,7 +293,6 @@ static int adis16203_probe(struct spi_device *spi)
>  }
>  
>  static const struct of_device_id adis16203_of_match[] = {
> -	{ .compatible = "adi,adis16203" },

So now this driver doesn't bind to anything?

confused,

greg k-h
