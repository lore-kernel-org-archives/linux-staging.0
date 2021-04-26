Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1252B71
	for <linux-staging@lists.linux.dev>; Mon, 26 Apr 2021 18:03:41 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id n3-20020a05600c4f83b02901425630b2c2so1177673wmq.1
        for <linux-staging@lists.linux.dev>; Mon, 26 Apr 2021 11:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=z9wgVVjDAXXSJE2ca33a8jal0v2yahV0C8O37SZcpvQ=;
        b=pFmvfHUw2Xc6IYETlM2LNNtATPOTQ7qOqODeMSW5rpBgjncMHgqe6irSOKEOei9ueF
         8Fg0qy8zm0/2CZeZRz3bPZuNX4PtQZmWvgm2YXiJHd04qhm0nB7gZmZKmjqkhYGK1A+8
         qaA40+XWCDSzNyo3lWRkGVmM5NW8sM/46hVfe3VDrmQkztlWr/gLFmWYkcz6fxRSqlK1
         nk6Xmahbo1ODPRDT3+DUgHsPaPiKMfDQDjVKHjfKghPWBijfyLPPpNN0oFZHKBzVj3Ch
         gAgQlhllqE4dhpHOX/WKq8jycyAfJT1bpXlbw+26SpZuCIhG8KHV0Kpb+nV74Cqbys+7
         /Yuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=z9wgVVjDAXXSJE2ca33a8jal0v2yahV0C8O37SZcpvQ=;
        b=LH14Au7hU+S2aqTJOUVzgwlIAv5bzhUaJUGnw/uqJetVh3pmuc4FsjohkhHFZ5YAkC
         BfRR90prQSZ7RdGExGoA+0YOOQ0ku80EHk2voNaMpC4jkiIf6zxpOz2fUcYBs+8Rtz3z
         k1q9FQAElP3DE61UB6SWzGJXPUg2I3o5RvOQQGOV2DzqBpj0lY9c68CZ5lBmIeqzf9UN
         DRTFxazOmHd2z0hdjjmt8KKJg0wSxRkT2z4N56Kujz2AS/1CO6yMbvOuMfIGZ3w15pJF
         Qkbl3PungEgIAtyv8gfENuENJIU+0aOJGAkOEIcJoR0XCVMWZGBD+m9aUNZAq5WfGQwU
         PBlA==
X-Gm-Message-State: AOAM531a4FrWfmIBQZ16Ig2+LKEu01NyF1LWQOaCS2Sxz4DjJaSD+5QG
	JuOhG6WJl1+e7+JGmaNx5r9Isw==
X-Google-Smtp-Source: ABdhPJxJp+6XWXivaWJQgtNlleCFdrEv8YRWrei4fRGW/lK200EqgUguXQtGmn4s4C0b2JUb8aewUA==
X-Received: by 2002:a05:600c:2148:: with SMTP id v8mr236741wml.167.1619460220445;
        Mon, 26 Apr 2021 11:03:40 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:90c:e290:b76e:7362:77c0:ddc3? ([2a01:e0a:90c:e290:b76e:7362:77c0:ddc3])
        by smtp.gmail.com with ESMTPSA id l9sm1096913wrz.7.2021.04.26.11.03.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Apr 2021 11:03:38 -0700 (PDT)
Subject: Re: [PATCH] staging: media/meson: remove redundant dev_err call
To: Muhammad Usama Anjum <musamaanjum@gmail.com>, hverkuil@xs4all.nl,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 "open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS"
 <linux-media@vger.kernel.org>,
 "open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS"
 <linux-amlogic@lists.infradead.org>,
 "open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>,
 "moderated list:ARM/Amlogic Meson SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
Cc: kernel-janitors@vger.kernel.org, dan.carpenter@oracle.com
References: <20210407160921.GA1504294@LEGION>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <3fac78c4-189f-57cb-ca81-a97c918e2386@baylibre.com>
Date: Mon, 26 Apr 2021 20:03:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210407160921.GA1504294@LEGION>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 07/04/2021 18:09, Muhammad Usama Anjum wrote:
> devm_ioremap_resource() prints error message in itself. Remove the
> dev_err call to avoid redundant error message.
> 
> Signed-off-by: Muhammad Usama Anjum <musamaanjum@gmail.com>
> ---
>  drivers/staging/media/meson/vdec/vdec.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
> index 5d4db7a5b4b5..e51d69c4729d 100644
> --- a/drivers/staging/media/meson/vdec/vdec.c
> +++ b/drivers/staging/media/meson/vdec/vdec.c
> @@ -1008,17 +1008,13 @@ static int vdec_probe(struct platform_device *pdev)
>  
>  	r = platform_get_resource_byname(pdev, IORESOURCE_MEM, "dos");
>  	core->dos_base = devm_ioremap_resource(dev, r);
> -	if (IS_ERR(core->dos_base)) {
> -		dev_err(dev, "Couldn't remap DOS memory\n");
> +	if (IS_ERR(core->dos_base))
>  		return PTR_ERR(core->dos_base);
> -	}
>  
>  	r = platform_get_resource_byname(pdev, IORESOURCE_MEM, "esparser");
>  	core->esparser_base = devm_ioremap_resource(dev, r);
> -	if (IS_ERR(core->esparser_base)) {
> -		dev_err(dev, "Couldn't remap ESPARSER memory\n");
> +	if (IS_ERR(core->esparser_base))
>  		return PTR_ERR(core->esparser_base);
> -	}
>  
>  	core->regmap_ao =
>  		syscon_regmap_lookup_by_phandle(dev->of_node,
> 

Acked-by: Neil Armstrong <narmstrong@baylibre.com>
