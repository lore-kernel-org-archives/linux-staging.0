Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 773D512B9E
	for <linux-staging@lists.linux.dev>; Sat, 14 Oct 2023 15:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech-se.20230601.gappssmtp.com header.i=@ragnatech-se.20230601.gappssmtp.com header.b="E9eY9d6e"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2c509f2c46cso18133041fa.1
        for <linux-staging@lists.linux.dev>; Sat, 14 Oct 2023 08:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20230601.gappssmtp.com; s=20230601; t=1697298685; x=1697903485; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tJ2bDCdkLDh8kympsU2RLtUY/ancw/4Exu+OPYeI8Ps=;
        b=E9eY9d6eE7mLy1x/9qvhBHheug0WckRtYEpX499FVs99ipo9BuXk3YxoVdiAr4tCWo
         BARnOgB4yuapJSE1FtfG2tzRy1GKljKrMyE1szMC+yD3JkJY9B0aVbdPrBcIlZV9B9ro
         G1O2Z1I7sjzsVJrXTSU+RNB/7Hi5vt3AUGg4yPGRlChhrRYu8yOYInEa50fYCL/yRFis
         9BjaAn+HJbU9KOSP2vG/DZ/84+iHI665+Zg1rQ7WjjL6zA8gxbkjRr16mTnu9sqDFICg
         /i3OaFISdjbyBGguFYAQxO7Abfd68DFFflyeK3cAnG2d/D+oLqk7J2CIdmGdREp2DEPn
         uVUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697298685; x=1697903485;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tJ2bDCdkLDh8kympsU2RLtUY/ancw/4Exu+OPYeI8Ps=;
        b=ao//SnISQFcuA8ZZmj0sbxRUJ+dLgNqrvUMm5qai5g6sP0qAenF4XST/CO2hP7B25m
         kVP8cVgUT3zsDNpMKlzj/+eMW4K63dmb4ACJoRYXanaCfxdr2rLEFrv0tMf+vjXtN8g5
         Sqoz0FpkmQXXLpsYG6MqgDdokzP+ZDX2pKAMubd0p0FKQjSmNz64ixs0KBoONmncmza+
         3Xz80vK4BiD5m02UCnQEu5lRAm4I9sB3f8ds2zDBEmUBf66KDR9pL7prqbGksk4Qc6x+
         INv+WHtVWTiHs72QB/VvwpECI/emQEAowTDksxL/Dn1o5m4AOpCUW3XHW6vl6ajqPpaG
         tqqQ==
X-Gm-Message-State: AOJu0Yx+5FBfslX5ui4IZKViFKFg9doK0tjfCajZ2rVvj3tMLw/m3rKy
	zsO/qUW5rkyo1WDD5yBPJ02jKA==
X-Google-Smtp-Source: AGHT+IFhOogOnFFdym6CReJqhNSEhoSNYZt6skC0F/7Rv3GeMoPWCzmhdk79ikXV98i1YSJWoOKM0w==
X-Received: by 2002:a05:651c:216:b0:2b9:e831:f16a with SMTP id y22-20020a05651c021600b002b9e831f16amr24580129ljn.26.1697298684897;
        Sat, 14 Oct 2023 08:51:24 -0700 (PDT)
Received: from localhost (h-46-59-36-206.A463.priv.bahnhof.se. [46.59.36.206])
        by smtp.gmail.com with ESMTPSA id f23-20020a2eb5b7000000b002bce38190a3sm416371ljn.34.2023.10.14.08.51.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Oct 2023 08:51:24 -0700 (PDT)
Date: Sat, 14 Oct 2023 17:51:23 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: ihor.matushchak@foobox.net
Cc: mchehab@kernel.org, gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: staging: max96712: fix copy-paste error
Message-ID: <ZSq4-7W_ke5XKsrE@oden.dyn.berto.se>
References: <20231014143843.3409-1-ihor.matushchak@foobox.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231014143843.3409-1-ihor.matushchak@foobox.net>

Hi Ihor,

Thanks for your work.

On 2023-10-14 15:38:43 +0100, ihor.matushchak@foobox.net wrote:
> From: Ihor Matushchak <ihor.matushchak@foobox.net>

I agree this is a copy-past error and the fix is correct. But you need 
to add a commit message describing this. I know it can feel a bit silly 
for a simple fix like this, but we can't have an empty commit message.

> 
> Signed-off-by: Ihor Matushchak <ihor.matushchak@foobox.net>
> ---
>  drivers/staging/media/max96712/max96712.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/max96712/max96712.c b/drivers/staging/media/max96712/max96712.c
> index c44145284aa1..ea67bcf69c9d 100644
> --- a/drivers/staging/media/max96712/max96712.c
> +++ b/drivers/staging/media/max96712/max96712.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /*
> - * Maxim MAX9286 Quad GMSL2 Deserializer Driver
> + * Maxim MAX96712 Quad GMSL2 Deserializer Driver
>   *
>   * Copyright (C) 2021 Renesas Electronics Corporation
>   * Copyright (C) 2021 Niklas Söderlund
> -- 
> 2.30.2
> 

-- 
Kind Regards,
Niklas Söderlund
