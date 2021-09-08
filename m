Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 956BC72
	for <linux-staging@lists.linux.dev>; Wed,  8 Sep 2021 12:07:39 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id d6so2892536wrc.11
        for <linux-staging@lists.linux.dev>; Wed, 08 Sep 2021 05:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xKkXisCl2vIi7OCx8uRGfHdsX0k2dDIgnIlUiuL+Z/Y=;
        b=JnOw9NpBCJWVZZ7iNJI979Pib4l2Z6LsNopyLTg13EkvXDZAZIYHBf6alkeJ3CcUUo
         E2j1KcTKOXOZfAKgihAk+9zTUEEFYiE1rAobG1mL5rZeSpc8UrXH+ZTovHtTnf6WxHoj
         tuA5dqHmYrEDw1X0kDL0RrmzYSVcHj/vGDLXjsGDcYh34STSoxnW7tTtgcGLxqErs/OI
         vdXTqAk37kFohJoydya+FyqMLoaOnFaD9MXkycdCoFembCzxhKJLKKeFnAeVyQkX331w
         pl4cI6FX0etmJvwWgGeyN4wtfsIXtT9evwlq0AOj5gN34Qcuq2UXdEKacySWTvhaLIH4
         O04w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=xKkXisCl2vIi7OCx8uRGfHdsX0k2dDIgnIlUiuL+Z/Y=;
        b=bKZPlSZScWnGBm/1KZOKpsgtCiYKyVBBeyOXUiiy+Wm8NxVuThfs9eqa8Jki5YbG84
         hW2qgLcPD2Fws8xxvHbtFS2tHcIdaKV5l/rORc7OzpRpSkzBtiX2JbExnoNvT/9DvjwU
         aNqQibvF97wnNaLR73WkSFbF0/eFEI8g4QBS87GWBQqQK4X4E/xs881zppCn7hrxZsc9
         cBCxzlTlHBGWj5yJkmrIdHWodlaWGT1p43OlSZP6QUgHJFnYS2PN/znhtUXjgmMcy1xS
         82Cv6rai+ndJnv2uJBpFQkp84k0/JYpcfMa9Eeq2F9jRrlavF04T3Ejr4MfScncTsF41
         /CpQ==
X-Gm-Message-State: AOAM532QHnZn1NFnfQb7IcuQzIqDoS4STxTA/qAu+yZ01CT6G5IXsALx
	gzMGDN8AXTYcXocF+gJsPmukww==
X-Google-Smtp-Source: ABdhPJwSSpAail5nl9T9TWoMaDxdil36KbTbvhFE3B+c19tOhhcm0J3vdXa3Hm58ilTQjL+kaX6kYw==
X-Received: by 2002:adf:c44b:: with SMTP id a11mr3748453wrg.416.1631102857845;
        Wed, 08 Sep 2021 05:07:37 -0700 (PDT)
Received: from ?IPv6:2001:861:44c0:66c0:19d:2e13:ec0a:9d59? ([2001:861:44c0:66c0:19d:2e13:ec0a:9d59])
        by smtp.gmail.com with ESMTPSA id l15sm1739951wms.38.2021.09.08.05.07.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Sep 2021 05:07:37 -0700 (PDT)
Subject: Re: [PATCH] staging: media: meson: vdec: Make use of the helper
 function devm_platform_ioremap_resource_byname()
To: Cai Huoqing <caihuoqing@baidu.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20210908105730.1882-1-caihuoqing@baidu.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <4cd6453f-8b0e-a438-0e97-53e3962d652b@baylibre.com>
Date: Wed, 8 Sep 2021 14:07:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210908105730.1882-1-caihuoqing@baidu.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 08/09/2021 12:57, Cai Huoqing wrote:
> Use the devm_platform_ioremap_resource_byname() helper instead of
> calling platform_get_resource_byname() and devm_ioremap_resource()
> separately
> 
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
> ---
>  drivers/staging/media/meson/vdec/vdec.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
> index e51d69c4729d..8549d95be0f2 100644
> --- a/drivers/staging/media/meson/vdec/vdec.c
> +++ b/drivers/staging/media/meson/vdec/vdec.c
> @@ -994,7 +994,6 @@ static int vdec_probe(struct platform_device *pdev)
>  	struct device *dev = &pdev->dev;
>  	struct video_device *vdev;
>  	struct amvdec_core *core;
> -	struct resource *r;
>  	const struct of_device_id *of_id;
>  	int irq;
>  	int ret;
> @@ -1006,13 +1005,11 @@ static int vdec_probe(struct platform_device *pdev)
>  	core->dev = dev;
>  	platform_set_drvdata(pdev, core);
>  
> -	r = platform_get_resource_byname(pdev, IORESOURCE_MEM, "dos");
> -	core->dos_base = devm_ioremap_resource(dev, r);
> +	core->dos_base = devm_platform_ioremap_resource_byname(pdev, "dos");
>  	if (IS_ERR(core->dos_base))
>  		return PTR_ERR(core->dos_base);
>  
> -	r = platform_get_resource_byname(pdev, IORESOURCE_MEM, "esparser");
> -	core->esparser_base = devm_ioremap_resource(dev, r);
> +	core->esparser_base = devm_platform_ioremap_resource_byname(pdev, "esparser");
>  	if (IS_ERR(core->esparser_base))
>  		return PTR_ERR(core->esparser_base);
>  
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
