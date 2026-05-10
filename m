Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 046E2285C91
	for <linux-staging@lists.linux.dev>; Sun, 10 May 2026 19:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778443103; cv=none; b=lsEsplpjS5oJekMaE39iP/knDmlebDYFbcWGxtOGh/Ej4dQ4I0GR6Vu2DS28VN6sMdwrkrmu5I6hLK6AMPouwIar9qduqf91M+hVx6XPbTBQJu+tjabY5pebb4CRqIkaGqBhUw1AKe4uuBXgew3tyVT7aLO8h0YwtVbqukgtpBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778443103; c=relaxed/simple;
	bh=aCvVt43COjr4JGaeTBnYLPuYB+fK9Umf4KVPvVj9NnY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F6s3esAzeLjjgnvSlKLP0F5G93CZSXsdx/n7ydJmbgjLKv3MESQFxw2IMUfONXHpPVq7Vhi/Gv9Yk5Yv9dNJRGMbOaCOaJNFiZgQVVbVk0o5T8wtqvD3H8PozLMOcUSeOsn4TnADA85ifjNVHJahjb2mRrOJNQ26z0lwbP2FVrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MdGZtZcW; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MdGZtZcW"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3937014be0cso32516351fa.0
        for <linux-staging@lists.linux.dev>; Sun, 10 May 2026 12:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778443099; x=1779047899; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7fsGpZWzj9soCD/1XAWhc0B3Eh71hdLD7XMEVCShBMM=;
        b=MdGZtZcWsJfJXpXsvrJK/eJz5rzGOHlIxmn/rvihY2Tr11qTmzLrKxCUmPdOR8ATv0
         7r/MdD6h1sJw+LC0Lci+TlIW2v0D8Xuicec97HAoR5sF5cHX6Rx+7YwF7lVu5TRBprRX
         jFySbLVeY0EyZFhuUYqmLfccQv/TU3w+bFQ6rMOyYLvqH2+E/O0smms9SXzwB2lKq6ON
         c/hmQxowQCoaUVYOeDRBGENXUhvmUVCC9O/qZNanGfcCj0XeIADmVQrbt2oEhReswC6z
         hQXH1fBq823ixfneIyI9esCbliyH1q1RhIVyQVDRGZSRvWW0dYXh9Vov3eiZqd42NeXw
         olaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778443099; x=1779047899;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7fsGpZWzj9soCD/1XAWhc0B3Eh71hdLD7XMEVCShBMM=;
        b=Vw2vLrM6Y3m47glVGJo5wZS8J0A6po5QswqQEnN/XQM1ZPg5esKrsZekWCAs6cdOAv
         yWEZPzr5d+j7xCh/C1QxOx0pJrIv85orQz9FBQwGxyoG0rpNWGkPp+uf1cu5s92dkRsE
         0mRT+C8pGi3TygUCL8JG3O0u+CdAxGgdWyYw6RiE8+oD8yQsE5stCjwWC2UNrCjWSEUq
         rghkWiGjPNp4/J9vVGQezo+dMUNTXRsKbY2TH4z/WhNkMT0BSBMr7rw587b87afLK3RU
         qqIPWfCLXh6DmjafQ17AQ3T71WE0pS8E8PCrH/oMdQa2eih4YqO6F855tWZUmoHWCuTW
         humg==
X-Forwarded-Encrypted: i=1; AFNElJ+I3c1jFiRdP0202XA1t2Sf0t+CkCgcFrwLsSMmiyS+TT4tdSoEbWRqNPpUX13d6grqX0Csf/gWxcx33Jx0@lists.linux.dev
X-Gm-Message-State: AOJu0YxxPxVNAnP6+bS0rgm3tRYZ88hPL31exZTGW1p/nzfZoQWWKR0O
	B9d2qB7q/hFBmvfeaCQdT171xKzeiLYvfjyqnnOr7arSsmse1Nt9FYCc
X-Gm-Gg: Acq92OHfIZBoGSUsb7WOAz7h8/9QBct2dxmDlb8hVWLmaV5z247e1TrpI5gF4twljzS
	k2k6zBYQXl+vI+4FJh0ewJLuskGOh0OnFOT/fwcj6nkZSHNLBE6a+2TItiuB7eCNHG162w3rZ2x
	bcmH8ZCNGQi/or7epxTaPqcNc3flGNi7p6LkDotg31vQ6wBctK4++iPik+eSTT5qeiBpR4l2wto
	jPKD33YpmGtFB7BbKCH3yCQPqXcTKozqHsKrbg9OFaRn41X/fZIeKv8Hz4LpjJEypCClLJuiXoP
	Mu9aM9QcvR80uFEjrxyTrMW+OhgiTHwjtLhX9fSS3M5KXnbhjexmwd3X5VYzAkzON22eZdeJjbc
	5CB3lWcLOOy6JGOvJ/e3Bxb935Roe265y86SMMurZmYO02VpWBb5GxpyL3NA96rDDzuYfdlXlZt
	0Co3D7EERaIpRNNevTsu8rnYrgWPKD+9ESPII=
X-Received: by 2002:a05:6512:3d9e:b0:5a2:bedb:2119 with SMTP id 2adb3069b0e04-5a8a94bc40fmr4059959e87.26.1778443099115;
        Sun, 10 May 2026 12:58:19 -0700 (PDT)
Received: from archlinux ([185.140.161.214])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a955e140sm2148289e87.48.2026.05.10.12.58.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 12:58:18 -0700 (PDT)
Date: Sun, 10 May 2026 22:58:15 +0300
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Pramod Maurya <pramod.nexgen@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] staging: rtl8723bs: Enclose CHAN_ARG macro body
 in parentheses
Message-ID: <agDjV1_6UUl1xDYC@archlinux>
References: <20260510175207.563378-1-pramod.nexgen@gmail.com>
 <20260510175207.563378-5-pramod.nexgen@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260510175207.563378-5-pramod.nexgen@gmail.com>

On Sun, May 10, 2026 at 01:52:07PM -0400, Pramod Maurya wrote:
> Wrap the macro expansion in outer parentheses to prevent operator
> precedence issues when the macro is used in expressions.
> 
> Signed-off-by: Pramod Maurya <pramod.nexgen@gmail.com>
> ---
>  drivers/staging/rtl8723bs/include/ieee80211.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/include/ieee80211.h b/drivers/staging/rtl8723bs/include/ieee80211.h
> index beee37041eeb..d1167d9ea846 100644
> --- a/drivers/staging/rtl8723bs/include/ieee80211.h
> +++ b/drivers/staging/rtl8723bs/include/ieee80211.h
> @@ -639,7 +639,7 @@ struct rtw_ieee80211_channel {
>  	/*"orig_mpwr:%d\n"*/
>  
>  #define CHAN_ARG(channel) \
> -	/*(channel)->band*/ \
> +	(/*(channel)->band*/ \
>  	/*, (channel)->center_freq*/ \
>  	(channel)->hw_value \
>  	, (channel)->flags \
> @@ -649,7 +649,7 @@ struct rtw_ieee80211_channel {
>  	/*, (channel)->beacon_found*/ \
>  	/*, (channel)->orig_flags*/ \
>  	/*, (channel)->orig_mag*/ \
> -	/*, (channel)->orig_mpwr*/ \
> +	/*, (channel)->orig_mpwr*/)
>  
>  /* Parsed Information Elements */
>  struct rtw_ieee802_11_elems {
> -- 
> 2.52.0
> 

This macro is never used in the driver, why not just remove it?


Thanks,
Nikolay
