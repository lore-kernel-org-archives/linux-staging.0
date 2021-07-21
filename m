Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A9970
	for <linux-staging@lists.linux.dev>; Wed, 21 Jul 2021 16:27:00 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id oz7so4148996ejc.2
        for <linux-staging@lists.linux.dev>; Wed, 21 Jul 2021 09:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=6rxBSnZCujLbQhKhyDascpF8n6wsyclfCgFL5qiQVUM=;
        b=rabb6ZSTLhR2YVkWsN+WNhK+GHdYeQAPSj+sPk6eI9AdL+37iTIzKhZbaG9Z73fA5M
         gqlsDfYKlb6kYHl2R4qRFguJg1MB60FxphwWrV40SvLmHCMGYOlje/83s8dXa8ElYXAd
         xq/AOf2Nkm7dNbh8dh66H29eb86gpBwON+sdePsQ4OZIjbX6k3mmU2nWMo+Dw54viKXT
         UBR7Ywlpbjz6oRE0RnWlPICDQjaQeFsqcGsH/al8Fjng2PsOAcgLPCHvo2XIAVIGvYp3
         4oT4eA7nJR/6TuId09Mpjmi4n6VSH5JPJshw85l5L63o4b5eMw9p8o0sGYU0ve0WTfHb
         94oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=6rxBSnZCujLbQhKhyDascpF8n6wsyclfCgFL5qiQVUM=;
        b=aBvHuru6kCjkfUbXv0p15pZGPdyrspJI01q6dLFFumfSgzaGFictLKG/juoLpMUk6P
         aOTJLQ5vCvLG80OBkkqv2whH/7RXewiy+IsUKKVrnYoHWGZYVvkxuVjDE6rnpHxar0S8
         kY9/rB2r+lXkUVuuY/lu+WlZB+Kyn6zV/le5uhwV531jkAcjEVCo7QUzY5i7SbMB06Bn
         YsKSqC3GfHPCJjg5znNlmyaSPUL3TRswvfrRpPBn/R/oUv5pTdGeBAcrqy7gpmwXtO4r
         hbH4YQNYsOJ9d48lrc38XEqxU+m/gbu2McsQenbHmrXP/f1XiKGCxlNHy/tUOvWUFhfc
         0TtA==
X-Gm-Message-State: AOAM531HjDgx8b6Dg3BQMHjrzi49/Hs5yC3+y/sgLGBaeUtZyQ31R/zs
	Fd21uYuLJ8rsh7QWfwEuTZM=
X-Google-Smtp-Source: ABdhPJyR57ay+APBdznlFocgeTsTCHeL6lLYxI4NGz1IDP0jrmffPfWNh/IoLsIkk51Vv8Rp3M5s0w==
X-Received: by 2002:a17:907:a079:: with SMTP id ia25mr11319079ejc.515.1626884819304;
        Wed, 21 Jul 2021 09:26:59 -0700 (PDT)
Received: from agape.jhs ([5.171.81.22])
        by smtp.gmail.com with ESMTPSA id n18sm8572472ejl.74.2021.07.21.09.26.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jul 2021 09:26:59 -0700 (PDT)
Date: Wed, 21 Jul 2021 18:26:53 +0200
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: select CONFIG_CRYPTO_LIB_ARC4
Message-ID: <20210721162645.GA1395@agape.jhs>
References: <20210721153550.3624490-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210721153550.3624490-1-arnd@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Wed, Jul 21, 2021 at 05:35:44PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The other rtlwifi drivers already have this, but r8723bs
> was converted to the generic implementation without adding
> the select:
> 
> ERROR: modpost: "arc4_crypt" [drivers/staging/rtl8723bs/r8723bs.ko] undefined!
> ERROR: modpost: "arc4_setkey" [drivers/staging/rtl8723bs/r8723bs.ko] undefined!
> 
> Fixes: 1b11e893eda0 ("staging: rtl8723bs: replace private arc4 encryption with in-kernel one")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/staging/rtl8723bs/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/staging/rtl8723bs/Kconfig b/drivers/staging/rtl8723bs/Kconfig
> index a88467334dac..7eae820eae3b 100644
> --- a/drivers/staging/rtl8723bs/Kconfig
> +++ b/drivers/staging/rtl8723bs/Kconfig
> @@ -5,6 +5,7 @@ config RTL8723BS
>  	depends on m
>  	select WIRELESS_EXT
>  	select WEXT_PRIV
> +	select CRYPTO_LIB_ARC4
>  	help
>  	This option enables support for RTL8723BS SDIO drivers, such as
>  	the wifi found on the 1st gen Intel Compute Stick, the CHIP
> -- 
> 2.29.2
> 

Acked-by: Fabio Aiuto <fabioaiuto83@gmail.com>

thank you,

fabio
