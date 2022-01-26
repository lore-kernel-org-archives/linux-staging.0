Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44FFE2CA8
	for <linux-staging@lists.linux.dev>; Wed, 26 Jan 2022 13:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1643203182;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kYqBTg039yG6KmQki1vnfW07McLgJNXZp1LNPPbwRyU=;
	b=SUq0iGjLWrlL2Lek4X/myBf+pnR7TSfWKCDBrrW5aum17rISRYeSvdKm7JjjImEDQlz+Ck
	dceOtMYWWDNM1Zl59HP/ws6Yy9ezvtVBwiFgt4vQMpMDbD/3QEU4QgSymbuX2uK66DDjKs
	d14l4xU/NT4ILHUnHvls2X5yp6xUMNE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-417-xt-YsXx2NOqWGuYrjUivxQ-1; Wed, 26 Jan 2022 08:19:40 -0500
X-MC-Unique: xt-YsXx2NOqWGuYrjUivxQ-1
Received: by mail-wr1-f71.google.com with SMTP id q4-20020adfbb84000000b001dd3cfddb2dso1828932wrg.11
        for <linux-staging@lists.linux.dev>; Wed, 26 Jan 2022 05:19:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=kYqBTg039yG6KmQki1vnfW07McLgJNXZp1LNPPbwRyU=;
        b=0RK+aNKD1CxnIFwmzpCqcacojyrOxyW1ThalJszt8fS0qXF3q+xzKSESSSYTplQ4ZX
         Q8KmZxCesgwnb6fLHVd/WWPblSST5bgNOTdTHHWlIwPNjR3dK3Jjqtgvo9XzmYISk9Ce
         +Jlfeay5ytfx59QuuPb9jv5OwaF1tOnLYVMBd6vrXwPcZZ5Nt6Gl+U8//pHkRLo1M03E
         48RAvDc7Ie6DLrUzhdBVk/PNdYwc3vmgM3Mj6wERZ5DVRFl46HQ/N92Tt+f5TEmYsUm1
         U3HeBUBs0GL408oJyYcR1b488YO0YPkWiMIpV+1SFDclTmxDlg4mygUUZfsL52LDXNCc
         1gzA==
X-Gm-Message-State: AOAM531uclbeUuZBUuvibfvXOh1b6N+GRvyOtVXmE7uSyme3IB3aaX7w
	Cqgo7sRaSyiXPkBbAA68GXYRCV3kCy/8tDszcpmAtBw+IrHQMpW28n7OpnvbHJeGbgPM68v3Kgv
	HKQ3UeWwymXGjO37l7XPQDCTISA==
X-Received: by 2002:a05:600c:2906:: with SMTP id i6mr7384002wmd.14.1643203179717;
        Wed, 26 Jan 2022 05:19:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyhzLOqHtQwaIpauLzMMgIbq+NXnLWl8IbD9oWCl1awOJ7DEu7sTaSS8Umh6aandrR9my5u6A==
X-Received: by 2002:a05:600c:2906:: with SMTP id i6mr7383980wmd.14.1643203179526;
        Wed, 26 Jan 2022 05:19:39 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
        by smtp.gmail.com with ESMTPSA id n8sm3264381wmk.18.2022.01.26.05.19.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jan 2022 05:19:39 -0800 (PST)
Message-ID: <afb68b5c-8d1a-17c4-a62b-be985c5bc613@redhat.com>
Date: Wed, 26 Jan 2022 14:19:37 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v1 0/4] fbtft: Unorphan the driver for maintenance
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@oracle.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Andy Shevchenko <andy@kernel.org>,
 "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>,
 Michael Hennerich <michael.hennerich@analog.com>,
 Helge Deller <deller@gmx.de>, linux-staging@lists.linux.dev,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Phillip Potter <phil@philpotter.co.uk>,
 Thomas Zimmermann <tzimmermann@suse.de>, Carlis <zhangxuezhi1@yulong.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Lee Jones <lee.jones@linaro.org>, Heiner Kallweit <hkallweit1@gmail.com>
References: <20220125202118.63362-1-andriy.shevchenko@linux.intel.com>
 <991e988b-7225-881b-a59a-33c3eae044be@suse.de>
 <CAHp75Vc2cjHkJwNSiJ-HSWBG=DYy68uvD7QQzNdRp3mQxoY1nw@mail.gmail.com>
 <CAHp75Vd7oaYPKx6bxjCqNnm6fieeQFrtq5K4YYrxYbXoXFy=+Q@mail.gmail.com>
 <20220126102858.GX1951@kadam>
 <1b665bb8-7acb-519b-0a02-ef0f2dd4b524@redhat.com>
 <YfFE61IQus3SMQRZ@kroah.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <YfFE61IQus3SMQRZ@kroah.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/26/22 13:56, Greg Kroah-Hartman wrote:

[snip]

>>    fb_ili9341.c (DRM driver in drivers/gpu/drm/tiny/mi0283qt.c ?)

This was a copy and paste error. It should had been:

                   (DRM driver in drivers/gpu/drm/tiny/ili9341.c)

>>    fb_ili9481.c
>>    fb_ili9486.c (DRM driver in drivers/gpu/drm/tiny/ili9486.c)
>>    fb_pcd8544.c
>>    fb_ra8875.c
>>    fb_s6d02a1.c
>>    fb_s6d1121.c
>>    fb_seps525.c
>>    fb_sh1106.c
>>    fb_ssd1289.c
>>    fb_ssd1305.c
>>    fb_ssd1306.c
>>    fb_ssd1325.c
>>    fb_ssd1331.c
>>    fb_ssd1351.c
>>    fb_st7735r.c (DRM driver in drivers/gpu/drm/tiny/st7735r.c)
>>    fb_st7789v.c (DRM driver in drivers/gpu/drm/panel/panel-sitronix-st7789v.c)
> 
> I'll gladly take a patch that deletes the fb_* files that are already
> handled by a DRM driver like you list here.
>

Sure, I'll post a patch later today. If there's something missing in
the DRM driver, anyone can get the needed bits from the git history.
 
Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

