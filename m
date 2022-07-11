Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0A033C1D
	for <linux-staging@lists.linux.dev>; Mon, 11 Jul 2022 11:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1657538954;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RT3petxY8Mc8sRJ6vFuAVMWzCJ23AGysMIvMZ0enDtM=;
	b=IMxmIKliCO5d6kq366VW7HAI/cjOND8Gzb4jEfG//aiRz53KzvZ0FsbD0FrrhiusDUAZfe
	fFKv0Tv5HtffYxcQWPetLHNSkJ7jHTjJJjt21/tuLcWFWQmChEkCeRBa88KzJdMkAovA6S
	GLv7mfsy9kwctTsvf2dxEKTx9bJrJX0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-478-cgLmI2kLORKGG-9iolxYYA-1; Mon, 11 Jul 2022 07:29:13 -0400
X-MC-Unique: cgLmI2kLORKGG-9iolxYYA-1
Received: by mail-wm1-f70.google.com with SMTP id z24-20020a1c4c18000000b003a2e963c399so671965wmf.4
        for <linux-staging@lists.linux.dev>; Mon, 11 Jul 2022 04:29:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=RT3petxY8Mc8sRJ6vFuAVMWzCJ23AGysMIvMZ0enDtM=;
        b=wLGk2O8OE6hQLB83N/vk9I/8wgnpeyEbad+X/jyZ6CjbbfVVOouvalS0lZEMIu6urL
         jCJi0gWw/eThiBFZQ56T7sHmX4xzIr7AWdEd0Hr9htryJy++TiZRPrwtYyqyhdciySsU
         la94bjxGO74Goil+49urM+eah7n3tRBmUtf77nyyHDe+u2NENtjKgXOt+/Elsy5vZ68Q
         b/WBHYsTM+XTBxO5jYahP3GCIe8FPt2bgdAFjIxd32yv1xI5LWv4tr4ckHoFFfZ4tQZb
         c08g6Wvwcc6dy4MSmosd3Hptkh+hxjwhwp5zQ7ec2M502ErxfgorjC3j50uJ+HfFgmAn
         56Dg==
X-Gm-Message-State: AJIora+R1s0psKKBdgjo2M07exZye7IlSuNuagdf6rnLjBglGAzEPdxr
	WIscECIDwVdp1qtkjewWLDIzbDIzMtW7mU8Ir6R6G6q2/Wg4Tg+si/wu+2X3lzx1qNzYAP7l+42
	zTW4W9nQlOessr7PoN2BARjRFNg==
X-Received: by 2002:a05:6000:617:b0:21d:9873:bbf4 with SMTP id bn23-20020a056000061700b0021d9873bbf4mr10913064wrb.389.1657538951603;
        Mon, 11 Jul 2022 04:29:11 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vvC/M+fY0ZZDYvsO2CNoVptaM7dK1K21A3mz/ozhjRY8+6xu1Vcu63XmcV3f4+Js5dGVbFSQ==
X-Received: by 2002:a05:6000:617:b0:21d:9873:bbf4 with SMTP id bn23-20020a056000061700b0021d9873bbf4mr10913050wrb.389.1657538951426;
        Mon, 11 Jul 2022 04:29:11 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id t8-20020a05600c198800b003a04722d745sm2521753wmq.23.2022.07.11.04.29.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Jul 2022 04:29:10 -0700 (PDT)
Message-ID: <3f22174e-e1ee-1c1e-c643-37d437af7578@redhat.com>
Date: Mon, 11 Jul 2022 13:29:10 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 10/11] fbdev: Acquire framebuffer apertures for firmware
 devices
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de, daniel@ffwll.ch,
 sam@ravnborg.org, maxime@cerno.tech
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 dri-devel@lists.freedesktop.org
References: <20220707153952.32264-1-tzimmermann@suse.de>
 <20220707153952.32264-11-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220707153952.32264-11-tzimmermann@suse.de>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/7/22 17:39, Thomas Zimmermann wrote:
> When registering a generic framebuffer, automatically acquire ownership
> of the framebuffer's I/O range. The device will now be handled by the
> aperture helpers. Fbdev-based conflict handling is no longer required.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/video/fbdev/core/fbmem.c | 33 ++++++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
> 
> diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
> index 2237049327db..e556ad69f48f 100644
> --- a/drivers/video/fbdev/core/fbmem.c
> +++ b/drivers/video/fbdev/core/fbmem.c
> @@ -13,6 +13,7 @@
>  
>  #include <linux/module.h>
>  
> +#include <linux/aperture.h>
>  #include <linux/compat.h>
>  #include <linux/types.h>
>  #include <linux/errno.h>
> @@ -1739,6 +1740,32 @@ static void do_unregister_framebuffer(struct fb_info *fb_info)
>  	put_fb_info(fb_info);
>  }
>  
> +static int fbm_aperture_acquire_for_platform_device(struct fb_info *fb_info)
> +{

What's the meaning of 'm' here ? Misc, memory ? I would just call it 'fb_'.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

