Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 239DA1078A
	for <linux-staging@lists.linux.dev>; Sat, 27 May 2023 15:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685202493;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X/O1MpqEOZzuixz/P/whtACWNhl6nb37DODJ17M4M+Q=;
	b=h3cBppVlVyrCEraas7Gc4PnT1nR/YL0GFmLj0i/57Fmdn4sfVDHNJYl4W/Ircb5x3lki41
	E6GzmKYs2uTiZVI06V/Kb22ndoi1NV2zjqzNktuzXqM00LZ/CO+dkqPNpX0YXCw2cv/ok7
	k5N64TiPm8z0WaWQpVdbuFmre53t7nY=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-613-k2yt3o95MeCZC4_dneoaTw-1; Sat, 27 May 2023 11:48:12 -0400
X-MC-Unique: k2yt3o95MeCZC4_dneoaTw-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-9715654aba1so227129766b.0
        for <linux-staging@lists.linux.dev>; Sat, 27 May 2023 08:48:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685202491; x=1687794491;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X/O1MpqEOZzuixz/P/whtACWNhl6nb37DODJ17M4M+Q=;
        b=YQsfOTzC34JFBO5gfycLs95aBEKtEMxMRjE2w2YxA54VartbGA8o5z4EWrz5aGeO2N
         47ouWdDhrjyqR3QcNa8jBNU/82mII91bgaxUg7mAvdQThP/XOzIl0RPkIRhQWSiXuJkG
         +TN/anU81N/HcexCO9I0E/vdu/ptnYSCW8o5RJPGH1Nv54zSYhH2hSSJ4sWaDmPX5yZG
         G0VbAZas+8MWR1H/wXpaRaxCkkmLvKNbiXkifqfTzmw/AOIWM3NGa/HhNf584XSILdU7
         av1hs/xcVjPiLnIyVDhq/HHo94/0Q/DHuBLJFOyHbLPneH8MnHfaTLi/F3d+uh/zP1Rp
         IvIw==
X-Gm-Message-State: AC+VfDxrolhZo8GkSY3y4ThQD1/AEDQocfBNFpGRGTN7lQa/lDYkxglv
	gXkKY0N/0Zj38MCMnYkChXoSXiS/D3lN9NPJ7O03qKCuUjgjfzK7HGuG3DJzxr/4vgKlgwJJ3Vh
	f6H/pxiHsxVf2E3nk6uP8SviBnA==
X-Received: by 2002:a17:906:ef05:b0:96f:7d0a:5981 with SMTP id f5-20020a170906ef0500b0096f7d0a5981mr1896898ejs.36.1685202491179;
        Sat, 27 May 2023 08:48:11 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7v1grDXcy8stnhzDrUAF04Y8v8KpvQLbkSsVjAvB5J6Zm36T78KzlGZMg+Pbaa2c+xPuxebw==
X-Received: by 2002:a17:906:ef05:b0:96f:7d0a:5981 with SMTP id f5-20020a170906ef0500b0096f7d0a5981mr1896883ejs.36.1685202490920;
        Sat, 27 May 2023 08:48:10 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id bh1-20020a170906a0c100b00965f6ad266bsm3530345ejb.119.2023.05.27.08.48.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 May 2023 08:48:10 -0700 (PDT)
Message-ID: <d8e5d438-16d8-64ca-d856-a11de6e9ba45@redhat.com>
Date: Sat, 27 May 2023 17:48:09 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] media: atomisp: gmin_platform: fix out_len in
 gmin_get_config_dsm_var()
To: Dan Carpenter <dan.carpenter@linaro.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Ard Biesheuvel <ardb@kernel.org>, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org
References: <26124bcd-8132-4483-9d67-225c87d424e8@kili.mountain>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <26124bcd-8132-4483-9d67-225c87d424e8@kili.mountain>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 5/26/23 13:53, Dan Carpenter wrote:
> Ideally, strlen(cur->string.pointer) and strlen(out) would be the same.
> But this code is using strscpy() to avoid a potential buffer overflow.
> So in the same way we should take the strlen() of the smaller string to
> avoid a buffer overflow in the caller, gmin_get_var_int().
> 
> Fixes: 387041cda44e ("media: atomisp: improve sensor detection code to use _DSM table")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Thank you I have applied this to my media-atomisp branch:
https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/log/?h=media-atomisp

And this will be included in my next pull-req to Mauro
for merging this into the linux-media tree.

Regards,

Hans




> ---
>  drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
> index c718a74ea70a..88d4499233b9 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
> @@ -1357,7 +1357,7 @@ static int gmin_get_config_dsm_var(struct device *dev,
>  	dev_info(dev, "found _DSM entry for '%s': %s\n", var,
>  		 cur->string.pointer);
>  	strscpy(out, cur->string.pointer, *out_len);
> -	*out_len = strlen(cur->string.pointer);
> +	*out_len = strlen(out);
>  
>  	ACPI_FREE(obj);
>  	return 0;

