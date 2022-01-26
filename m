Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A9629CA
	for <linux-staging@lists.linux.dev>; Wed, 26 Jan 2022 13:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1643204656;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HO8OojRGDxiniZjv6SrW57XV+ZtoIr3bX0tnTNyRlq8=;
	b=RDkWD/Tk08hyfSBlCF3GFQp4ub3SduL52vmneWASFiJ7gGqLIux25sbbyXn32kJBxFKfrZ
	RPpPiWkAF84KNz5ow90pu7Fb0MYceHyU9ql8DoVo290OJuRmZu/vaHm2Bs8fp+uAck0X3t
	fGpP1NwdzvtVVH/AoFwr3DV6HhY2fUo=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-340-snexJmtxN_Cv1sq8xnkkuQ-1; Wed, 26 Jan 2022 08:44:15 -0500
X-MC-Unique: snexJmtxN_Cv1sq8xnkkuQ-1
Received: by mail-wr1-f70.google.com with SMTP id s25-20020adfa299000000b001d8d032255fso4299825wra.14
        for <linux-staging@lists.linux.dev>; Wed, 26 Jan 2022 05:44:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=HO8OojRGDxiniZjv6SrW57XV+ZtoIr3bX0tnTNyRlq8=;
        b=LdztY+rWVg4625cl9NU18p/PzlA1pL6zhtYbYFcdzItX+XCIazsWX8tq82S6esZP6L
         PS2Rwv6U54EO2eT7MKhgHDn6CJ/UbVO3wJ2NUApMahgx8hjAk63XUmFP9Zdp6kus8kfy
         JcjLpMafeCzuFlg+vd5RSDnODZ8vTOD9om00QDJj2/NYzRggcubvWp2CeRp+c01UiUm2
         ywdnoqkH5cA/Jcc6BcTSO6snRIL+O/SZQtlGGynqar6KIQ4h4uHOxz04x6btYT5ynYlO
         2eAFj6ABOFsqj5faVaNXnlQpDWH1mf/2hQqUobyY2x+7wenC7eFj5LYVU5EH72GZlBDe
         QjCw==
X-Gm-Message-State: AOAM530vOCNu8zQXcRsK7WNUPfHJegTNXQoQfMMnP2gd0hKt1Pb7q8WT
	5RLpaQqIZeDLf6YoLux38UXiQ0Xao6lqZkUpdPpoNFRzjaof6O8dG7Ndvguc5oJVRRdvhBvNGkv
	lhS3DM5dgxhyMgXIai7q2H8et8A==
X-Received: by 2002:a5d:588d:: with SMTP id n13mr553784wrf.690.1643204654463;
        Wed, 26 Jan 2022 05:44:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJybzQqjbMputeacc2RjhaPfXtnrHwBB3Q4bMgXV2bO3BAQz7ZnwzmTspSR3f1GLZrNkoUbXJg==
X-Received: by 2002:a5d:588d:: with SMTP id n13mr553763wrf.690.1643204654263;
        Wed, 26 Jan 2022 05:44:14 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
        by smtp.gmail.com with ESMTPSA id 11sm902476wrb.30.2022.01.26.05.44.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jan 2022 05:44:13 -0800 (PST)
Message-ID: <9b426301-bf41-0312-c34e-856938b196fd@redhat.com>
Date: Wed, 26 Jan 2022 14:44:12 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v1 0/4] fbtft: Unorphan the driver for maintenance
To: Andy Shevchenko <andy.shevchenko@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andy Shevchenko <andy@kernel.org>,
 "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>,
 Michael Hennerich <michael.hennerich@analog.com>,
 Helge Deller <deller@gmx.de>, linux-staging@lists.linux.dev,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Carlis <zhangxuezhi1@yulong.com>,
 Phillip Potter <phil@philpotter.co.uk>, Lee Jones <lee.jones@linaro.org>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Heiner Kallweit <hkallweit1@gmail.com>
References: <20220125202118.63362-1-andriy.shevchenko@linux.intel.com>
 <991e988b-7225-881b-a59a-33c3eae044be@suse.de>
 <CAHp75Vc2cjHkJwNSiJ-HSWBG=DYy68uvD7QQzNdRp3mQxoY1nw@mail.gmail.com>
 <CAHp75Vd7oaYPKx6bxjCqNnm6fieeQFrtq5K4YYrxYbXoXFy=+Q@mail.gmail.com>
 <20220126102858.GX1951@kadam>
 <1b665bb8-7acb-519b-0a02-ef0f2dd4b524@redhat.com>
 <YfFE61IQus3SMQRZ@kroah.com> <YfFKLfSKUdo1UVfF@smile.fi.intel.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <YfFKLfSKUdo1UVfF@smile.fi.intel.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/26/22 14:18, Andy Shevchenko wrote:
> On Wed, Jan 26, 2022 at 01:56:11PM +0100, Greg Kroah-Hartman wrote:
>> On Wed, Jan 26, 2022 at 01:37:00PM +0100, Javier Martinez Canillas wrote:
>>> On 1/26/22 11:28, Dan Carpenter wrote:
> 
> ...
> 
>>>    fb_hx8347d.c (DRM driver in drivers/gpu/drm/tiny/hx8357d.c)
>>>    fb_hx8357d.c (DRM driver in drivers/gpu/drm/tiny/hx8357d.c)
>>>    fb_ili9163.c (DRM driver in drivers/gpu/drm/tiny/ili9163.c)
>>>    fb_ili9341.c (DRM driver in drivers/gpu/drm/tiny/mi0283qt.c ?)
>>>    fb_ili9486.c (DRM driver in drivers/gpu/drm/tiny/ili9486.c)
>>>    fb_st7735r.c (DRM driver in drivers/gpu/drm/tiny/st7735r.c)
>>>    fb_st7789v.c (DRM driver in drivers/gpu/drm/panel/panel-sitronix-st7789v.c)
>>
>> I'll gladly take a patch that deletes the fb_* files that are already
>> handled by a DRM driver like you list here.
> 
> None of the DRM driver supports parallel interface for these devices.
> 

Thanks for the info. Then we can't remove any of these drivers indeed.

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

