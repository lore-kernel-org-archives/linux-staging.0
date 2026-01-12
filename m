Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7DB733D6EC
	for <linux-staging@lists.linux.dev>; Mon, 12 Jan 2026 08:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768204981; cv=none; b=AkYkx8wNIwN2H8sHxWNs4mDHJCP/BFU/M7nn6F3H8Hf9QrSQQ8oXxhsQXSK6siEOlFg7caFDkYAygXLZw7QSygZdz8W0kIUTv15Aiht58d1qVhkemlRker3Zosw3gq5AtMi5acCLPrjLPFT6YHJj6c80v7aQjXjeIOUkKouAhgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768204981; c=relaxed/simple;
	bh=8eSaqBHhyaTbXx8HyFw7w133c0078czWubgAV5Moivs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FpE9lRg9gjApK7Htgh8n/VAep7LXoypfzi5C/SbK8yC0ZtCHqWoEWXQ0I/ZdEb9II551jrwuhZTo6cxfskUo4qf7np1cbPRFAGp/PUSwCu3eSN8yF8R+915/L6GdEXquJhbKwJKi1P9P3B4Tnj3wNNY11DXnXYie8seF1rRllxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TbNbVHqh; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TbNbVHqh"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-430f57cd471so2916813f8f.0
        for <linux-staging@lists.linux.dev>; Mon, 12 Jan 2026 00:02:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768204978; x=1768809778; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DXTb/TRMy/aD5Zg0lrKtWEV5XVMb4ppi7OiMcPdP/cc=;
        b=TbNbVHqhRoheRmgrB/32Ed0GRHcYDFTcm7Y5qDsb9SW+e29SjasjzGMXx94JgFmIBL
         cBQp9V2FvZgTTCWsd9mEH/K0p6MMWo3il6jZ3EuDzKmjxeTOxh17zOm6sPfL4YXNKRPH
         ClQ8bYYTnAyPOaFFUp/gpiTDev+RNkCzcpvGrfTVQ9bACud1KKAq/82A9MSFK8TbnzTD
         eZ3JW+Ct6xtPko7ywyjv1zUtTkXKxDZuoQl0pSOpuKvxkocPGxsOt6OQOF/WvzsEeg0o
         0/EJaDe7jeGukaMVGkHUpEszMnTy1+a1ivaLUG+It8m/1phbHXLTTBbJQWlvIoOTlRSx
         Ft2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768204978; x=1768809778;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DXTb/TRMy/aD5Zg0lrKtWEV5XVMb4ppi7OiMcPdP/cc=;
        b=oG+pMBmdSacEDxYiv2ocPW6Q2v7oi8tLfTz6npYv49N9ZGsQIzG5y0X7bBtCeaUxl6
         Y6C2hZvHUo7COVOC3H8mUgFBwhkgttYR2911/C4neCmPlUif+BcN/lLyVsF/Lt1WQFJS
         hAl+xXhyympMCGPjYQuRgEisa7ylGdi1kJ+8LX5d4dbqZyjwj+k6atvzkDnY8q1t9hmq
         txgbc8RPFem2vBuWhXb1OiHYWc0kvEn/NsXCdY0whoyGGjeiTCX/NN4a6/nUVBUxjW0i
         j0SVahS3EyXPnlJu6gLeBif7AhXf3VPEwNwB3lKpIiaBdAMM7X37U3EN+mjvVcpDm9UZ
         nHKA==
X-Forwarded-Encrypted: i=1; AJvYcCU3xJ0Jjwortw/ejzY1UTSfD7y1nYdN1whoe3NhR0ODhw2lFWR5AGnKKtlPzsxEC9rfFWA2NpJkfxHi89x1@lists.linux.dev
X-Gm-Message-State: AOJu0YyOnAAShgUMd8ahxaYsR7Hcjpa609fyxeIyI66fPEUCD3bjdpd3
	IjPE/lgncFqgJmMeUXBixuky09SiXBSxxmsSfpGtC+/9SNA2nRQx1QpIb3SoOm7GPRc=
X-Gm-Gg: AY/fxX7Zv2RrD297Ll/kSdaKonTx3Uao4Qg2B6hIqI/rDIqIT1YwugtxcuZNPyDGz3D
	mj3LfGghXSsHl8jL5UyTIpVkH0lUoOSjUp3Iff//oSV3tYKLT3Jm7h1vUBJT+qnfQEHnlJm6nVE
	OFtEBcwvP5AFGNK3Kl8Wb4es0n2r+tWRIQeOSZuh3M/C5PRJ6xYfT8wVcvev9+nvv+Ixjb91sET
	OEZCjdZi1xwUkzZgdORKg/8oC6Px9bLStLEHqSEBcr4d6UkHR4QoVfINTyKcaA7+4/fcauO6TV+
	7CVihmk5Dbu+hh3Dp5Xyf4evnnqy0HrwkYPDbLO/VpERPJw5UeerZXutPpGp61QTebzALZFv7Nd
	rVQ9P09yWJKGoCWq/g8IKaITwVLl4a0RqQ0hJUrUlt4J136ZpvpAhiTkOvbsWCNC//BlbHNchyb
	t8Se4qkA4U4X5dsqll
X-Google-Smtp-Source: AGHT+IGa06vl7V+9OMZmesChPdTfB81+O48iDAVJjk7fsGcbNg3J6WDhfLSPsO+YS5n0PKEqrjZQdQ==
X-Received: by 2002:a05:6000:18c9:b0:432:8537:85ca with SMTP id ffacd0b85a97d-432c3761574mr15158266f8f.50.1768204978178;
        Mon, 12 Jan 2026 00:02:58 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432dfa6dc4esm15393027f8f.23.2026.01.12.00.02.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 00:02:57 -0800 (PST)
Date: Mon, 12 Jan 2026 11:02:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Khushal Chitturi <khushalchitturi@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>,
	Hans de Goede <hansg@kernel.org>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/9] staging: rtl8723bs: remove empty branches
Message-ID: <aWSqrd0bOFBuxDtU@stanley.mountain>
References: <20260111183630.12816-1-khushalchitturi@gmail.com>
 <20260111183630.12816-3-khushalchitturi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260111183630.12816-3-khushalchitturi@gmail.com>

On Mon, Jan 12, 2026 at 12:06:23AM +0530, Khushal Chitturi wrote:
> Remove empty else blocks in rtw_xmit.c to improve
> readability and follow the kernel coding style.
> 
> Signed-off-by: Khushal Chitturi <khushalchitturi@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_xmit.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
> index b0d7e59e492d..cf7d92a85d6c 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
> @@ -1707,8 +1707,6 @@ s32 rtw_free_xmitframe(struct xmit_priv *pxmitpriv, struct xmit_frame *pxmitfram
>  		queue = &pxmitpriv->free_xmit_queue;
>  	else if (pxmitframe->ext_tag == 1)
>  		queue = &pxmitpriv->free_xframe_ext_queue;
> -	else {
> -	}
>  
>  	spin_lock_bh(&queue->lock);
>  
> @@ -1999,11 +1997,11 @@ inline bool xmitframe_hiq_filter(struct xmit_frame *xmitframe)
>  		)
>  			allow = true;
>  
> -	} else if (registry->hiq_filter == RTW_HIQ_FILTER_ALLOW_ALL)
> +	} else if (registry->hiq_filter == RTW_HIQ_FILTER_ALLOW_ALL) {
>  		allow = true;
> -	else if (registry->hiq_filter == RTW_HIQ_FILTER_DENY_ALL) {
> -	} else
> +	} else {
>  		rtw_warn_on(1);
> +	}

Please be more careful.  I'm not going to review the other patches.

regards,
dan carpenter

