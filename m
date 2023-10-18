Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8111D15ACE
	for <linux-staging@lists.linux.dev>; Wed, 18 Oct 2023 13:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech-se.20230601.gappssmtp.com header.i=@ragnatech-se.20230601.gappssmtp.com header.b="D94jxtNm"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-507bd19eac8so2801413e87.0
        for <linux-staging@lists.linux.dev>; Wed, 18 Oct 2023 06:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20230601.gappssmtp.com; s=20230601; t=1697634441; x=1698239241; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=56lqzAcgtdJPl7JHirL9fzd0FCjYyOYyIARceuj/CkY=;
        b=D94jxtNmM7T1RUl2UtdyC2jfUHGmDgnVH9MpL0c51AFg0aNSKtktGetZVsUwjgWi9E
         vhVIrTY1k+guz8m/4AUGwo4cf6QZaMBInAiCfdvZUssA5YOzWibTZj76N8Mco8VqmZFV
         vcvyVjTSWSq2BcR2R1KN2NHZ+soU9CMAYjwQ/29RluOP9QQ88GErJw8Aghr1z1Z8dBXO
         4yhF4r60CErMXqydCIIYs1ObCfLfoHA7nl/Qp7k5oMQnx1yoFevWqyoMd9fd+S8DrOri
         2b1IEg56pOYeuu8gEE0kga64qH6byLItGyh9zwgmXt5C8zJbc748ZbEtCyEhslvWoKDj
         zGWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697634441; x=1698239241;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=56lqzAcgtdJPl7JHirL9fzd0FCjYyOYyIARceuj/CkY=;
        b=QcU8K7KaVepXlCRnXhPEZ5gz5ulWeGjlYsobVJSB0X8KMzMZJca0uH/MinHnh/P81Z
         Emrgl+ZF2pdtvkPpgaByG01qMYxCk5BKokD98EtJlOqpiIpGHl7BUA0VF9c15D4dbeCq
         i4VpKqSqGJXjxw/xzG3ciq0O0GFnMPdisuLFcZZS//jl2jks+IyiOGas0ozpykZgk+q8
         DoPZ1IyPWtZqX6Giz45C9VtrPP9ZPOrN8QofqAh6emj3GzL2qXIqg1WCxEH1P0OiP5RQ
         7hL1f3peCWyRF24M35hrmfFCz1FZjJUYtYgakwh4tEz8hqt7lNKypvS5dq+a9kMWMfBj
         VMvg==
X-Gm-Message-State: AOJu0Yy6VzWd1tO3uIhDulCgYfModq1kS9uQCmMeWAr8HwOABQuYRpj6
	6suwfySxEkEEuVw9rSZuiUx78Q==
X-Google-Smtp-Source: AGHT+IED5LOQF4gPuytjBt6ZHSRvZ7g8+GSXt9ldsLC1rJ70oCBHJbItwMZL7pVuGVt2d2SPRx1wrg==
X-Received: by 2002:a2e:3c08:0:b0:2c5:1900:47a4 with SMTP id j8-20020a2e3c08000000b002c5190047a4mr3750816lja.0.1697634441016;
        Wed, 18 Oct 2023 06:07:21 -0700 (PDT)
Received: from localhost (h-46-59-36-206.A463.priv.bahnhof.se. [46.59.36.206])
        by smtp.gmail.com with ESMTPSA id d2-20020a2e8902000000b002c5056bcbb2sm699184lji.16.2023.10.18.06.07.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 06:07:20 -0700 (PDT)
Date: Wed, 18 Oct 2023 15:07:19 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: ihor.matushchak@foobox.net
Cc: mchehab@kernel.org, gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: staging: max96712: Fix device name in description
Message-ID: <ZS_YhwYJnS5ZC6EF@oden.dyn.berto.se>
References: <ZS7doO43ijXhBqkm@oden.dyn.berto.se>
 <11a00300c76df12c13adabfc71111607619a49f9.1697572799.git.ihor.matushchak@foobox.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <11a00300c76df12c13adabfc71111607619a49f9.1697572799.git.ihor.matushchak@foobox.net>

Hi Ihor,

Thanks for your work and taking the time to work thru the review.

On 2023-10-17 21:02:39 +0100, ihor.matushchak@foobox.net wrote:
> From: Ihor Matushchak <ihor.matushchak@foobox.net>
> 
> Fix the device model name in driver description,
> which appears to be a copy-paste error.
> 
> Signed-off-by: Ihor Matushchak <ihor.matushchak@foobox.net>

Reviewed-by: Niklas Söderlund <niklas.soderlund@ragnatech.se>

Small note, in future remember to increase the patch version for each 
new posting. You did this correctly between v1 and v2.

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
