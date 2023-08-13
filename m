Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 172466FA6;
	Sun, 13 Aug 2023 15:22:58 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-99c4923195dso484552066b.2;
        Sun, 13 Aug 2023 08:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691940177; x=1692544977;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xOYu2IPoVjQ+GlOQpp/sc735FXMDqqp74Kxel4PS4WY=;
        b=a3PZcVhzZuz5/aDJbeO8G0equz5aNJ+edAoIRlJjEa99ZpM3dCVO/TpUK25mSTOXab
         3sqpNEHvolDXdsdXNLJSsUaetXUgPWrkqohq4kgUcf55FeGpM+9lRE5pmTpaL4KVqJn6
         Xm9beVm89diSQBbDlPpADDpOP7ElHW4OOs/oOrPCPjfzMbw7eklGXVqGqpvj6awDrNbU
         LTFQzv0NC7+qLReKpxc+HhdEm+3OCMsK2miRC9MvlG3YsIPrdvswTs3fFaR1FGGAWD/4
         0FdA+FgPFyWSWqPZYL/X8LfJ0xsjMKv8W040Y4fklkjudmbAUHGM6y3tIkq71oLOm1+I
         Y5Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691940177; x=1692544977;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xOYu2IPoVjQ+GlOQpp/sc735FXMDqqp74Kxel4PS4WY=;
        b=IP1o+MUD+Ob4V7OEytxVBhNtNrhoKcQ/5GLVn6Srqtq3mrN0EbZQIaFxPPtXZGmJOH
         YpQbJnthUHNQmpyk+qYZTnkC1Ixf93aHAMPlqwqkCQxti6zHS3y0a+gKjgFpP9zV8pgY
         +94Mo7WzaDnoJfbTQe04GrSa15Fp7j1qVUIwITQRDPBQaY1NeIaWQE+ugA58yOEXuWq1
         CgHBauCM5h9MRS7b+0+nisnGGuR0MvVXaRPKVmg6kYEjveEHfPBKCP02wrSYBu0RdQ5L
         /a18nsDAOu2ZkKAM/blHIxs7MoMvq3ILdseBeu4BPLg4Y590oart6a7SUxbEgbXGlxYi
         XQfQ==
X-Gm-Message-State: AOJu0Yw9CC0WdEmI/dDNXzwM+AcqYCGwJOr9/nBFRIshoYrIDWSYMiCC
	3tHZYWbuB9hfAXpTJSAwgMk=
X-Google-Smtp-Source: AGHT+IEiqZ/AH2dkvv+d1Un7SV0dOkHEcRzNWsuK/wOuO/Tj+4wEfa+y+RQkJrzGLHdjNr5/Y97sXA==
X-Received: by 2002:a17:906:32d6:b0:99d:5adc:fdff with SMTP id k22-20020a17090632d600b0099d5adcfdffmr6179021ejk.45.1691940177122;
        Sun, 13 Aug 2023 08:22:57 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id y12-20020a17090629cc00b0099bccb03eadsm4656049eje.205.2023.08.13.08.22.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Aug 2023 08:22:56 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: TheSven73@gmail.com, gregkh@linuxfoundation.org, mripard@kernel.org,
 paul.kocialkowski@bootlin.com, mchehab@kernel.org, wens@csie.org,
 samuel@sholland.org, linux-staging@lists.linux.dev,
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, Ruan Jinjie <ruanjinjie@huawei.com>
Cc: ruanjinjie@huawei.com
Subject:
 Re: [PATCH -next 2/2] media: staging: media: sunxi: cedrus: Remove redundant
 of_match_ptr()
Date: Sun, 13 Aug 2023 17:22:55 +0200
Message-ID: <5698814.DvuYhMxLoT@jernej-laptop>
In-Reply-To: <20230811024945.2256437-3-ruanjinjie@huawei.com>
References:
 <20230811024945.2256437-1-ruanjinjie@huawei.com>
 <20230811024945.2256437-3-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne petek, 11. avgust 2023 ob 04:49:45 CEST je Ruan Jinjie napisal(a):
> The driver depends on CONFIG_OF, it is not necessary to use
> of_match_ptr() here.
> 
> Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  drivers/staging/media/sunxi/cedrus/cedrus.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c
> b/drivers/staging/media/sunxi/cedrus/cedrus.c index
> 8e248d4a0aec..f52df6836045 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
> @@ -708,7 +708,7 @@ static struct platform_driver cedrus_driver = {
>  	.remove_new	= cedrus_remove,
>  	.driver		= {
>  		.name		= CEDRUS_NAME,
> -		.of_match_table	= of_match_ptr(cedrus_dt_match),
> +		.of_match_table	= cedrus_dt_match,
>  		.pm		= &cedrus_dev_pm_ops,
>  	},
>  };




