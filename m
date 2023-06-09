Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9686E13AE9
	for <linux-staging@lists.linux.dev>; Fri,  9 Jun 2023 09:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686304784;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ro28qLwMycjBPd4B2CfnKUVLQYPM9zhy62Il4fiHOKA=;
	b=H4rp5VYwtWSnkLYlz8b9ul/s1C2/7nh35yCXnswZroRa16qFBSISKJE3Gm5pSK0Gka9nSg
	pgvHtoq0XtB/mIrGFYfJ3+bKU+cf7xa3LV3t80n4yxg+9YOBjexxkyLZSSpDxqb3Dq/6z3
	4DIp6PpH++Y/UT9ft2ng7B+0KvLnso8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-439-nySpbapCPViqKkMg8eAw6A-1; Fri, 09 Jun 2023 05:59:43 -0400
X-MC-Unique: nySpbapCPViqKkMg8eAw6A-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-30c3ad3238bso683404f8f.0
        for <linux-staging@lists.linux.dev>; Fri, 09 Jun 2023 02:59:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686304782; x=1688896782;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ro28qLwMycjBPd4B2CfnKUVLQYPM9zhy62Il4fiHOKA=;
        b=BDHBiUpEWH7wIH2JxS1wKb+iGSZXJkclXRGUTQ5S9dk0081Zy0lnY4cfwrgnSASOO5
         qeQ36Hv1cR01gnkG9kLBokDTNXl32fvg2mwPnerb3t6WvpDpHAWY6UusCzSFvCaaxhix
         i57AHgu0SF8EC/q5YBUuaFBwnAvPqhl0E9/Cuq9VX4AqceNuV7P9CDZ2PTDVJUS6ZFzs
         h0YxmLF+X7VVCP+mFthe5wq132LyevAML96wdBavFnwpr1nabGOHooI0w9VHNu9PFzS+
         p0FgaGvq7g222OLDXk9AloeXjB7fong3nu2wYndks5Gmb+0opDXnoZVki1fn7v2QoPz2
         9lMQ==
X-Gm-Message-State: AC+VfDxPC5csqKRlab+u36lTbgQY4m6UdYCJ5zGqxLBcxvEkmSwzf1Kq
	8z940BIIdK953ZgDm3+JsI4ZETYpEb3DNr0rmmCfXlQeeOCkrTh41ozY9zVTnuoM46OOK2LgkFT
	gRDNCV9WT6EY/IMxHlh7w7A19MPdDJwBO4Q==
X-Received: by 2002:a05:6000:1cc1:b0:30d:981d:a049 with SMTP id bf1-20020a0560001cc100b0030d981da049mr475561wrb.4.1686304782623;
        Fri, 09 Jun 2023 02:59:42 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5mbChq3eZ0n/KPDmx58FVgNTALqSeH3ETuPMsy/BuQZAfQWRgbheMcufPP8W0/LTSPFhyPxg==
X-Received: by 2002:a05:6000:1cc1:b0:30d:981d:a049 with SMTP id bf1-20020a0560001cc100b0030d981da049mr475549wrb.4.1686304782266;
        Fri, 09 Jun 2023 02:59:42 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id d17-20020a5d6dd1000000b003095bd71159sm4029755wrz.7.2023.06.09.02.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 02:59:41 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Geert Uytterhoeven
 <geert@linux-m68k.org>
Cc: daniel.thompson@linaro.org, linux-staging@lists.linux.dev,
 linux-sh@vger.kernel.org, jingoohan1@gmail.com, deller@gmx.de,
 lee@kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-omap@vger.kernel.org, sam@ravnborg.org
Subject: Re: [PATCH 30/30] fbdev: Make support for userspace interfaces
 configurable
In-Reply-To: <4df23439-462f-47da-890d-2dd2092eea35@suse.de>
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-31-tzimmermann@suse.de>
 <CAMuHMdVP2hrgXaZvASnHJ4M+VXaTCtfbeVXrq2dsEJqcs3G6ZA@mail.gmail.com>
 <e5d88ca8-66fe-b5ee-cb6b-2dc8f3a3fb26@suse.de>
 <CAMuHMdWBUKTgfCD9VLDFh_Tm1J-NJQHpxODs-TuYM7V-dtmGjA@mail.gmail.com>
 <873532eurg.fsf@minerva.mail-host-address-is-not-set>
 <77252bc9-e08e-fcee-d140-2b78ab768b42@suse.de>
 <CAMuHMdWUkZDcYfndf1A+cgcN5Fz1hmst4LrpA7iYCFqWSRTNDA@mail.gmail.com>
 <4df23439-462f-47da-890d-2dd2092eea35@suse.de>
Date: Fri, 09 Jun 2023 11:59:41 +0200
Message-ID: <87h6rh552q.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

Thomas Zimmermann <tzimmermann@suse.de> writes:

Hello Thomas,

> Hi
>

[...]
 
>>> I'd also question the argument that there's even fbdev userspace out
>>> there. It was never popular in it's heyday and definitely hasn't
>>> improved since then. Even the 3 people who still ask for fbdev support
>> 
>> There's X.org, DirectFB, SDL, ...
>
> None of these examples has a dependency on fbdev. They can freely switch 
> backends and have moved to DRM. Anything program utilizing these 
> examples has no dependency on fbdev either.
>
> When I say "userspace" in this context, it's the one old program that 
> supports nothing but fbdev. TBH I'm having problems to come up with 
> examples.
>

I personally have two real world examples that can give to you :)

1) I've a IoT device at home that has a bunch of sensors (temperatury,
   humidity, etc) and a SSD1306 display panel to report that. It just
   has small fbdev program to print that info. I could probably port
   to KMS but didn't feel like it. Found a fbdev program that I could
   modify and got the job done.

2) I built a portable retro console for my kids, that uses a ST7735R
   LCD panel. The software I use is https://www.retroarch.com/ which
   uses fbdev by default (I believe that supports a KMS mode but out
   of the box it works with fbdev and that's better tested by them.
   
So even when I'm not interested and don't want to enable any of the
fbdev drivers, I want to use the ssd130x and st7735r DRM drivers and
the DRM fbdev emulation layer.

In other words, there's real use cases for supporting fbdev programs
with DRM drivers. Now, I agree with this patch-set and probably will
disable the user-space fbdev interface in Fedora, but on my embedded
projects I will probably keep it enabled.

That's why I think that we should support the following combinations:

* fbdev drivers + DRM fbdev emulation + fbdev user-space
* only DRM drivers without fbdev emulation nor fbdev user-space (your series)
* only DRM fbdev emulation + fbdev user-space enabled (FB_CORE)

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

