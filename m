Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C8EB3B3E0
	for <linux-staging@lists.linux.dev>; Wed,  7 Jun 2023 23:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686179270;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NeyeiJwB2YnwAcLQJHG8HFbbrzLzOPay5XEB/Mwx9Ig=;
	b=Q7O/eetuouvy2gcuYezYcIyngXM2mQ4eZrYBbUwpgGo5p5GGU3SjzXY4fqYFJudu6IuOGm
	DkNrJXl5VyDTdgbzDyjoQqnOinuKPwxSz3BB1iWpj82QY22y3e3Ze4LEUw3pzuTSga1uh6
	8vfD+63UrPYuONpAFQb40/xaJh6p6jo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-656-0SjTbI_xMRqZaNtyfP5kJg-1; Wed, 07 Jun 2023 19:07:49 -0400
X-MC-Unique: 0SjTbI_xMRqZaNtyfP5kJg-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-3f7f52c99baso2851965e9.2
        for <linux-staging@lists.linux.dev>; Wed, 07 Jun 2023 16:07:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686179268; x=1688771268;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CzPJdjd02VNeNLl14O4tReNjsYBGUu/pZADGgCv1i2o=;
        b=j0XfHpCM3fbSdw5CxOltuRn6G/cmOgDZwPw0md+MJgR1iYEpM+rDkSniYnzcwms2pS
         lvwgJfuP2XNsvAqkWeaEdgK7PuWkL6Fev5Lv/L9Bk1PP08JcVyOLYBLFg19aImc2+YD7
         FfvMBKBSvUWthR4XYSvEsgjUp01pGOfhGwZSdr4CnIBRktp2XfFK8y4l9kPHLdsxNrLa
         ePesJRuXWkjK5JsSm5lB4Cix1Yq30JmPWGjk4FV0bgegoTYzhCjn5YB8S6HHGRzRXdxH
         URs94kNoKXizp5I7orvNYX1nnO6UYmDi66QcIlsjFhLOB9D8kJmDDz1gUaJzHxc7DkOu
         ZlVA==
X-Gm-Message-State: AC+VfDz2+bGRSloEohy/NGkxjB9xKtorbNs6OiAmev0eqOaylNgtNbG7
	UwZ5q+dmS/G3oZkoaImWcGhaSE2BtZdF6Jkc1KGnOQ3eFJbfv8fDqDGbSu/srUV6rHx6161UR/q
	lokhx6ig57o1CyaK4OYuYjZghew==
X-Received: by 2002:a05:600c:287:b0:3f6:f7c:b3fa with SMTP id 7-20020a05600c028700b003f60f7cb3famr5617451wmk.31.1686179268612;
        Wed, 07 Jun 2023 16:07:48 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7yuzlNYlFd9At+efr6s7V++AJjpo4wp6t37d3PBdQ42FjEQ40JOh3bqJjvNUUJHF19hKrWRw==
X-Received: by 2002:a05:600c:287:b0:3f6:f7c:b3fa with SMTP id 7-20020a05600c028700b003f60f7cb3famr5617443wmk.31.1686179268312;
        Wed, 07 Jun 2023 16:07:48 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id l8-20020a7bc448000000b003f42328b5d9sm96487wmi.39.2023.06.07.16.07.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 16:07:47 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>, Thomas Zimmermann
 <tzimmermann@suse.de>
Cc: daniel.thompson@linaro.org, linux-staging@lists.linux.dev,
 linux-sh@vger.kernel.org, jingoohan1@gmail.com, deller@gmx.de,
 lee@kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-omap@vger.kernel.org, sam@ravnborg.org
Subject: Re: [PATCH 30/30] fbdev: Make support for userspace interfaces
 configurable
In-Reply-To: <CAMuHMdWBUKTgfCD9VLDFh_Tm1J-NJQHpxODs-TuYM7V-dtmGjA@mail.gmail.com>
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-31-tzimmermann@suse.de>
 <CAMuHMdVP2hrgXaZvASnHJ4M+VXaTCtfbeVXrq2dsEJqcs3G6ZA@mail.gmail.com>
 <e5d88ca8-66fe-b5ee-cb6b-2dc8f3a3fb26@suse.de>
 <CAMuHMdWBUKTgfCD9VLDFh_Tm1J-NJQHpxODs-TuYM7V-dtmGjA@mail.gmail.com>
Date: Thu, 08 Jun 2023 01:07:47 +0200
Message-ID: <873532eurg.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Geert Uytterhoeven <geert@linux-m68k.org> writes:

Hello Geert and Thomas,

> Hi Thomas,
>
> On Wed, Jun 7, 2023 at 5:15=E2=80=AFPM Thomas Zimmermann <tzimmermann@sus=
e.de> wrote:
>> Am 07.06.23 um 10:48 schrieb Geert Uytterhoeven:
>> > On Mon, Jun 5, 2023 at 4:48=E2=80=AFPM Thomas Zimmermann <tzimmermann@=
suse.de> wrote:
>> >> --- a/drivers/video/fbdev/Kconfig
>> >> +++ b/drivers/video/fbdev/Kconfig
>> >> @@ -57,6 +57,15 @@ config FIRMWARE_EDID
>> >>            combination with certain motherboards and monitors are kno=
wn to
>> >>            suffer from this problem.
>> >>
>> >> +config FB_DEVICE
>> >> +        bool "Provide legacy /dev/fb* device"
>> >
>> > Perhaps "default y if !DRM", although that does not help for a
>> > mixed drm/fbdev kernel build?
>>
>> We could simply set it to "default y".  But OTOH is it worth making it a
>> default? Distributions will set it to the value they need/want. The very
>> few people that build their own kernels to get certain fbdev drivers
>> will certainly be able to enable the option by hand as well.
>
> Defaulting to "n" (the default) means causing regressions when these
> few people use an existing defconfig.
>

Having "dfault y if !DRM" makes sense to me. I guess is a corner case but
at least it won't silently be disabled for users that only want fbdev as
Geert mentioned.

I wouldn't call it a regression though, because AFAIK the Kconfig options
are not a stable API ?

>> > Or reserve "FB" for real fbdev drivers, and introduce a new FB_CORE,
>> > to be selected by both FB and DRM_FBDEV_EMULATION?
>> > Then FB_DEVICE can depend on FB_CORE, and default to y if FB.

Funny that you mention because it's exactly what I attempted in the past:

https://lore.kernel.org/all/20210827100531.1578604-1-javierm@redhat.com/T/#=
u

>>
>> That wouldn't work. In Tumbleweed, we still have efifb and vesafb
>> enabled under certain conditions; merely for the kernel console. We'd
>> have to enable CONFIG_FB, which would bring back the device.
>
> "Default y" does not mean that you cannot disable FB_DEVICE, so
> you are not forced to bring back the device?
>

I think we can have both to make the kernel more configurable:

1) Allow to only disable fbdev user-space APIs (/dev/fb?, /proc/fb, etc),
   which is what the series is doing with the new FB_DEVICE config symbol.

2) Allow to disable all "native" fbdev drivers and only keep the DRM fbdev
   emulation layer. That's what my series attempted to do with the FB_CORE
   Kconfig symbol.

I believe that there are use cases for both, for example as Thomas' said
many distros are disabling all the fbdev drivers and their user-space only
requires DRM/KMS, so makes sense to not expose any fbdev uAPI at all.

But may be that other users want the opposite, they have an old user-space
that requires fbdev, but is running on newer hardware that only have a DRM
driver. So they will want DRM fbdev emulation but none fbdev driver at all.

That's why I think that FB_DEVICE and FB_CORE are complementary and we can
support any combination of the two, if you agree there are uses for either.

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

