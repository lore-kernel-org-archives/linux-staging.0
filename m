Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0646B30BF4F
	for <linux-staging@lists.linux.dev>; Tue, 14 Oct 2025 21:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760476253; cv=none; b=YAL7Gv8QNEFv1ehG5UojoIZmGv2mOzXin1SzYRiUz7UY3zMRzhyCbGblPQivqjFOmWv6PBY9lCvb+fF4DI2c6+wvN2mFuqy8b8W/VmUyZ67dakivvQVLMaL99AWnAvn5FQWv46hW4Nce/iJAOfYnUzOCog8gWmwErWcQILdszqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760476253; c=relaxed/simple;
	bh=BQJLULTT/Wn1VgzHKtiLeywejDNqOrYVAnsXBZ3US70=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EW9x9FmGLNTE00eMK48h5ZVaHU3ljFmL7B7I/5PK7qBHxRnJJu2skh4zxv9LIEAP5C3jh2v9QgEwlGDJfA/9oPGw+5jwbkWSxmqG8Eyw6gidzY5nZOeSTL3x25gWqvsnCanhd7JIDHaRdoJMgpWwVjHydvnUlAoqM3wC6ks4jRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gecsiyRt; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gecsiyRt"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3f2cf786abeso4982520f8f.3
        for <linux-staging@lists.linux.dev>; Tue, 14 Oct 2025 14:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760476250; x=1761081050; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OU1/mxCO0gs9pfD0TKLeg6fFAQ0zkZSd+iwsC02HbYM=;
        b=gecsiyRtzffnjqmjyVY7Dtw6k0WxV3JwgY6i66xARNNHJXd2DnDNtDqu7izpu/smV3
         z84PS4BopXF39NFkOqGksdE5Gc9ypQYsSu8O8Yv0fulX1TM5OqQUczc7DYvwesSHCAiA
         fFTmQNEf/VtT+nY4cVxTJqBwTpGj4JbZ4AMgfCxaii+t7htWpdxDwUP3kHXJOsqyVAmh
         4yHHrBVcvVX5seTmKomlSDmV/zTwBlDir7cCl/fjAsOjeH0bXOZCvGQVqKcf5lZcFdcW
         dxxhEoYd6+kxGOkD7O4WiZEnqNegjwAHiUjWBvipDqQydyzM+I4muY4wZmBCCENpvU3K
         8JcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760476250; x=1761081050;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OU1/mxCO0gs9pfD0TKLeg6fFAQ0zkZSd+iwsC02HbYM=;
        b=D7Tj5nXPpMfdBv2JlX8fI/nI0/Skcm2Pk5acenOASLn7718DGSh21/j0N9a/KyRmBx
         P0SGNS8LQXR8D7xj5I4Yax4ofB1kaDpNdF41P4EDgk5XrkHero/utlbArn1DeBETS+6K
         WtTHz61VIlmEpaZmdx3nSJMInMBn4dwSFZiQBSbMeB3nCwBKF5KFUvt80ynRUZZytFCy
         in6phkUzY/XE7piRZnV0UxfDR66/c0v0moZuWr9P+Zs87h7E0HfLyrd+UR9eS/nFiAKD
         G1z48NptO7MZSR0NJ5Rm6boOyAikWWiaC/Lxe8bWOK90GW5wQkAp2Wml5kmHsqH3qRbA
         f38g==
X-Forwarded-Encrypted: i=1; AJvYcCXBO18drhXPO23onwmwggzjc8qQZ62BIzd50JQxVVDsDhWYsvaT5nMXgVtDFn0dO85pSu2LosVTV+mFdWNn@lists.linux.dev
X-Gm-Message-State: AOJu0YzhD2+Ok44F45j0PcEvzm9hzfw1isEFQ4JThwypQxfDkvXSTuic
	jnU5nTS6pKWU7cpftFv+U15g/Yr2cjuhKUtQZN08wEmLLXMRdqhVy7gzoKYS5aN//F0=
X-Gm-Gg: ASbGncvfPO0lBbZ+Icxf69sRMqMq+jDGPs1AWJG+TzgU43l+2n6PcmCo7qw/cLBYjOz
	WlEJxKqGk3wjwuHF3P1zbwWnuttcwvpQKrrQtwXLCoJPmKD7+1gtjZLiP4DlsWNuEFyE0opX68c
	n7ie38XuxelukX7pbWEwR5ewnfEXB+s89PExG7ozCWmXXHnszmr0cTMY09FmWer1H5fdHtDpYCv
	kYW6zkDt4fsMkRWuFSVG4aZMcV3doudix3GAIM6GohbKnq0WJDLlFMynKpzEhoy4/cGK4AouXse
	CccfCHAD9rse3w5B6+vUzlU1XACsDGvQTYiWPmD/v5Q1GRrR/JJh7GbFzB/8BU53A0d+JyvhlWX
	83Z8J1fhhgtwQDMhUX0tzEaA7BjXlL3FYvy0ntpVkvcXG43AXvwhjuZp1KP9SLhHZBeYi1c0ETh
	4KtdUSw2g95ynEqnoc7kK1ww==
X-Google-Smtp-Source: AGHT+IG4aszTNfWkZ+8pnaYDUBRKBttfxEAtdOpVVT5WH4tPRBG36HzZa82lsANKG9dSujuWlON6Tg==
X-Received: by 2002:a5d:64e8:0:b0:426:d71c:9a34 with SMTP id ffacd0b85a97d-426d71ca0b4mr7446024f8f.51.1760476250194;
        Tue, 14 Oct 2025 14:10:50 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce57d3desm25578034f8f.7.2025.10.14.14.10.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 14:10:49 -0700 (PDT)
Message-ID: <8b64ff99-d3c3-4d5d-ad7e-1d11d0a8fcb4@linaro.org>
Date: Tue, 14 Oct 2025 22:10:46 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/32] media: i2c: ov9282: Use %pe format specifier
To: Ricardo Ribalda <ribalda@chromium.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 =?UTF-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Leon Luo <leonl@leopardimaging.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Julien Massot <julien.massot@collabora.com>, Jacopo Mondi
 <jacopo@jmondi.org>, Daniel Scally <djrscally@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>, Yong Zhi
 <yong.zhi@intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
 Tianshu Qiu <tian.shu.qiu@intel.com>, Tiffany Lin
 <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rui Miguel Silva <rmfrfs@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Dafna Hirschfeld <dafna@fastmail.com>,
 Heiko Stuebner <heiko@sntech.de>, Sylwester Nawrocki
 <s.nawrocki@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Yemike Abhilash Chandra <y-abhilashchandra@ti.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, imx@lists.linux.dev,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-staging@lists.linux.dev
References: <20251013-ptr_err-v1-0-2c5efbd82952@chromium.org>
 <MY_AlfixYZV-8oPbVR2rAt2c2MXqa44vOl4wBVxfvw8IARVU6fXVfIgMIEjDtagmcTUarlGkxLViwG6BYfcSUA==@protonmail.internalid>
 <20251013-ptr_err-v1-18-2c5efbd82952@chromium.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20251013-ptr_err-v1-18-2c5efbd82952@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/10/2025 15:14, Ricardo Ribalda wrote:
> The %pe format specifier is designed to print error pointers. It prints
> a symbolic error name (eg. -EINVAL) and it makes the code simpler by
> omitting PTR_ERR().
> 
> This patch fixes this cocci report:
> ./i2c/ov9282.c:1133:3-10: WARNING: Consider using %pe to print PTR_ERR()
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>   drivers/media/i2c/ov9282.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> index a9f6176e9729d500a40004de92c35b9abf89b08c..3e24d88f603c1432865b4d880670e4b67f1b5cec 100644
> --- a/drivers/media/i2c/ov9282.c
> +++ b/drivers/media/i2c/ov9282.c
> @@ -1129,8 +1129,8 @@ static int ov9282_parse_hw_config(struct ov9282 *ov9282)
>   	ov9282->reset_gpio = devm_gpiod_get_optional(ov9282->dev, "reset",
>   						     GPIOD_OUT_LOW);
>   	if (IS_ERR(ov9282->reset_gpio)) {
> -		dev_err(ov9282->dev, "failed to get reset gpio %ld",
> -			PTR_ERR(ov9282->reset_gpio));
> +		dev_err(ov9282->dev, "failed to get reset gpio %pe",
> +			ov9282->reset_gpio);
>   		return PTR_ERR(ov9282->reset_gpio);
>   	}
> 
> 
> --
> 2.51.0.760.g7b8bcc2412-goog
> 
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
