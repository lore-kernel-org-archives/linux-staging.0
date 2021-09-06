Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6541E3FC1
	for <linux-staging@lists.linux.dev>; Mon,  6 Sep 2021 12:37:01 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id u16so9653495wrn.5
        for <linux-staging@lists.linux.dev>; Mon, 06 Sep 2021 05:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=VX21Q1wpGiOpiva+IThVTrifsWOLftr6Zwi9vQzn0VI=;
        b=q/npCZBG5L3lGLbMSdu4NMX3Ctk6Ad7I+cGARbRcucC/TQNttqexAphG2Xr950+CRn
         lQXjILuqgzrdJANuQpKf4iojCSc53auX2OnwPuSi+KqCDYfm8LdaIykVVprQtKXhqkNh
         ltB11KXTVtIzdjqSsrD/mUehKx6+M2HrJn3Ogh9pIdFf5L02P6z2gCBN/5+GxKU2E01V
         j26omRs5aYCxRy8omLxTP7WK93BvTmx+qVk0puabyNlrtFh56vqbB0Ble1+sZ6AqXF2A
         IvWeHtp8sDfCoqSiiE0KfG1Ruecnf+sckUzReZu1jadnU59cKoyKVkvQmhGvZLnKQglf
         QCvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=VX21Q1wpGiOpiva+IThVTrifsWOLftr6Zwi9vQzn0VI=;
        b=gmiKj30OU6JKVFteAhWG9Hf3Ol9HYNjXDCmePK7/bw6d68MFIRfXKb8lZuyBnhriyk
         eUVUHsEG/xlxnkJseb7rscya+AQUbsDZCunoq9SRikOFZlz7ok0dRVilLnN7hsixkoQ6
         wEl7JlHLCR5C5JxUQvyijem2Jim/GOv+SQ6zxr881hPADv9BQgaWHyk8z5mYXcsouoNP
         r5Zrn0OnxhGxKibpJwZy5nNyi/k97ppTC3EfCWS4WPm9sU2eRLlD4O/b5M+41zftZyhU
         laqaqB4hYQ3/9/2X/3465sgsSQpb832wga3jpkBI1+eMGGRO3QMt0nHYyfuDRzEpIl+Y
         ByyQ==
X-Gm-Message-State: AOAM5327DS8qrejp/D58sswdJmahP2NAHbMU7JxdnIKD+PZGOyGsM2pQ
	nCZoxHMt6lv38T92UAK0lcjfhw==
X-Google-Smtp-Source: ABdhPJwEMng/N0V1zZ4ZkG+iEuNFlsHHHf1I8nEkBFzbiKlIdgCCQhlygeCfux6P+CO7yWmAtu2tZQ==
X-Received: by 2002:adf:c144:: with SMTP id w4mr13310866wre.398.1630931819430;
        Mon, 06 Sep 2021 05:36:59 -0700 (PDT)
Received: from ?IPv6:2001:861:44c0:66c0:9afb:57ba:5ea:2010? ([2001:861:44c0:66c0:9afb:57ba:5ea:2010])
        by smtp.gmail.com with ESMTPSA id c2sm7744538wrs.60.2021.09.06.05.36.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Sep 2021 05:36:59 -0700 (PDT)
Subject: Re: [PATCH] Media: meson: vdec: Use
 devm_platform_ioremap_resource_byname()
To: zhaoxiao <long870912@gmail.com>, mchehab@kernel.org, khilman@baylibre.com
Cc: gregkh@linuxfoundation.org, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, linux-media@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-staging@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20210906070013.7362-1-long870912@gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <1b6f9a78-c648-e8b0-2ae6-1922aad89c49@baylibre.com>
Date: Mon, 6 Sep 2021 14:36:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210906070013.7362-1-long870912@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi,

In subject Medis should be media

On 06/09/2021 09:00, zhaoxiao wrote:
> Use the devm_platform_ioremap_resource_byname() helper instead of
> calling platform_get_resource_byname() and devm_ioremap_resource()
> separately.
> 
> Signed-off-by: zhaoxiao <long870912@gmail.com>
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

With the subject fixed:

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
