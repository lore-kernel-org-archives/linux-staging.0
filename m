Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D94F3AEF22
	for <linux-staging@lists.linux.dev>; Sun,  3 May 2026 09:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777802301; cv=none; b=aC6bRos4hTgKusilIcQ+w6hBH/omxbjvDLuW5YdDxjRMG9/3/Moqyb9rluvQIjePrGdlB3o1ff9Jy38gXGQWMXuOiESyIrwDn4kCmp3LQna4s3ZeeCmvkGWHaAkEdgPCT/InPdhNqb4gT3650cSz3Kn7+a7mO51ZsPZSzhbdEy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777802301; c=relaxed/simple;
	bh=wN7YJNialwwvaCvyEYZQX1g9WMoTRdqmlQMx4oFABfg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fKOW/+IgA2ejIASmyP8ykYzLiNE9harTYwGMOZCJcIQ9VgE9CBFb85OPrNeVV+Da/IGEVg9B6AoJ864lQIXkZAvZUHt216Y6kbhCLCEZeSLgyFvLcoK2Eb4V7jaGxcUNrw+ypIS6Qvj6m7Uswz38PZscjXxd9F9n7Lgz4uuHFnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eWBO7cih; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eWBO7cih"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-393925cb1baso3961561fa.0
        for <linux-staging@lists.linux.dev>; Sun, 03 May 2026 02:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777802298; x=1778407098; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lSBf8CExY9jgudE78FG1uqiYWbeT+6xyXMQp2hwYd6M=;
        b=eWBO7cihkzswu1COIAxUD/wFHbkLeIuh9e6oFaOaOBivq9qB2biVeh2MeMlwzLmCvk
         yu1nGKBPHlH3gKxVgg4AjRUQKQmjw7YsQsbJtnOG7/1GaroLCES7C4qqtKsz3ETrwruQ
         4J0saku2IXyuqmydS+ENnh3h28TKwbzunShQzv2S7rIKSo6biiNxmGoniDRUIFEOamzZ
         ikQAH6vE7wZMh4TPyqSvFyyAO/ltefU3LM9y/TWKgQcAucHpWVCA1xG5vQwbRMK8l8/o
         HyeYspygSTHx8mo4kSD71zyL6tJgpW0bRzQjUuQ11dc4aU1gG/28KHJwA3SYU1P6VTz1
         rH8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777802298; x=1778407098;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lSBf8CExY9jgudE78FG1uqiYWbeT+6xyXMQp2hwYd6M=;
        b=K0y+vL4vNpjWVcS3Dwp8mctWdOkkEfQWy9SceeHC9E+sB4G0/R88L2/YDHP0oGMgtx
         +MoHfbqQfPM3myu2YJFPhCNPC3ebhKlPgaIyidxhjHZ/637WJMvHHx9guhWb6a1Qgscz
         6ukmg8RDX7DFr65sMo6jUiX9kSWLtJS9pL3h60KXp4B7F3PnFJpt1TNgCR1lpcF2aR4/
         9cahAhOMSLdtZN58dnNjUqXXfzTgUDoiRn+ir5IPhG+tgyaRWIGj+ZLP17SznvbTdGAH
         nNWg9TTgX7VU0NoXwmL1K7pSp2DWU9tMRrklwC8meBwkRIQpDR4jzGhchI2VPOgWahmc
         W8Iw==
X-Forwarded-Encrypted: i=1; AFNElJ8GNYVPnPTwhfYpoCpiSbalYJtczOAb4oMSx9qTsStKsn6/voJRAaQwwf5R53iNQ+zQat6GUoCi/RMXp4zW@lists.linux.dev
X-Gm-Message-State: AOJu0YwZKULbP2wy+5L36QWghy15KcOehSgcIM5cT7pNq0oqmInD0Fjk
	SkaRET1Drjm7b3pD/ocV6rhtg1vksHugmbZscpHft2HUjGwFUbPvDm3cdmXXdQ==
X-Gm-Gg: AeBDietvdfquPMXonnehrBAk+7Em5cje44ZONEqAXH6SN40QCEY6makj6seow1s4PiT
	oYe4QbkZ796US68N51J2cH5b3yhFDVaFe7tkBcRn35rWnHa35DFWaDn2W+uRcp/RCzaGbUXh1QB
	fpJg8xa0ePpogJAPaDM4u5SpG5t5Wi6pwTgVVXyBebPRleB4/4cRRfmQeW6x6CO31FhAaIKrT5l
	RTUh7B1VJfrTX7eCtOV45EFzPzouzxHMxd8Xr/W+Rs/uS0fYJPsbhMeUaiu3nVQiUF/Lm02iJ6A
	+qXn7L2+20o0cb+deZ2q13GJyUYp735h/RnaEVvxSNd/TzHP9+E2YU3ifLIPPU1qUAnX/Dxnxg2
	NGgKuU4iQr5HN4t7u2fetlZhyzVHx1hjv3hIPrALcLs/k7jLragTDGG6jXr2VpeIvtHUaut5oN8
	WJgbEl0SCoqao+r3mC+swuGhP1vVxYpRlT31Y=
X-Received: by 2002:a2e:ab19:0:b0:38e:22:c612 with SMTP id 38308e7fff4ca-393783c5d72mr17424511fa.6.1777802298032;
        Sun, 03 May 2026 02:58:18 -0700 (PDT)
Received: from archlinux ([185.140.161.214])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3937a9aef4asm10448641fa.4.2026.05.03.02.58.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 02:58:17 -0700 (PDT)
Date: Sun, 3 May 2026 12:58:14 +0300
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Francisco Maestre <francisco@maestretorreblanca.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] staging: rtl8723bs: remove unnecessary braces in
 sdio_intf.c
Message-ID: <afccNlRpYCowTwah@archlinux>
References: <20260503004144.66733-1-francisco@maestretorreblanca.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260503004144.66733-1-francisco@maestretorreblanca.com>

On Sat, May 02, 2026 at 07:41:44PM -0500, Francisco Maestre wrote:
> Remove braces around a single-statement block in the SDIO
> disconnect path, as per kernel coding style guidelines.
> 
> This fixes the following checkpatch.pl warning:
>   WARNING: braces {} are not necessary for single statement blocks
> 
> Signed-off-by: Francisco Maestre <francisco@maestretorreblanca.com>
> ---
>  drivers/staging/rtl8723bs/os_dep/sdio_intf.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
> index d664e254912c..a86252ccac76 100644
> --- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
> +++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
> @@ -146,9 +146,8 @@ static void sdio_deinit(struct dvobj_priv *dvobj)
>  		sdio_claim_host(func);
>  		sdio_disable_func(func);
>  
> -		if (dvobj->irq_alloc) {
> +		if (dvobj->irq_alloc)
>  			sdio_release_irq(func);
> -		}
>  
>  		sdio_release_host(func);
>  	}
> -- 
> 2.50.1 (Apple Git-155)
> 
> 

This is already fixed in staging-next.


Thanks,
Nikolay
