Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF96A2063C9
	for <linux-staging@lists.linux.dev>; Mon, 16 Dec 2024 14:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734360096; cv=none; b=ERM2dHl2xl4VKW+mepCbnX1+Nth2cLT8LUxxzujKhVcnCM5CBjte5bXTdxqi5N1hpM/MudCYfy/gZfFFqLgIQ5xl8Q/U1ZTbgwXMbnvUvGIsExm8iotjkM/m4Oz+gmD3QRJh0DKgsbfDSCpxflN9ka/CPsFR4nLSXWkccxqhEMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734360096; c=relaxed/simple;
	bh=ZkTcKDsd9BdbAnRGxaGqA8Jgxq5P1M+PcZ2ULpoGr4M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aF4f2GXGDYY4HZgdixvqUpJRSZHnxhUf8dDT+4PzTtpQRxa2MivzjvL+6wQr+6+bKw4bWqDHiwNESMJGtl69drr2q/G8P7p283xmdAQF+p7tr8AtdBEoJ27NcVJwmlBdNOi4hJAVfr5isBJxQ3XWYvxuSTDjkNTARbzZRrz/7n8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=dQV/4tQw; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="dQV/4tQw"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-385f06d0c8eso2000879f8f.0
        for <linux-staging@lists.linux.dev>; Mon, 16 Dec 2024 06:41:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1734360093; x=1734964893; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=h4e0o/EChopge9iHDGlCcrGi54fhpHon4WXwZ2Or538=;
        b=dQV/4tQwOxokW3bNZJAux4SutsYuqLN7+2YrRo4HOMJs9GiHKhGW40X32N+QN4IKXK
         xBpu+Y5Ukp2eexeMd+FJ2wJM2ZVwSJ6wmK3/x83CjCdeq2l6W0SvsMsmNCMLCUjFJm3b
         DccqfMK6Zk7V+RG9I4OdNci2xH8NWjDwNgwyE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734360093; x=1734964893;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h4e0o/EChopge9iHDGlCcrGi54fhpHon4WXwZ2Or538=;
        b=hxfpVuFeJ6T6nm4yUKcEvTQaDAzxpgNGHY+m/TJXUzAsxdn2PghDQUMOJOQbRZXcI6
         Jtnfbll8wdJ/DgHij0YrSwWddNaI3gJHADTkMbj69T/YnYC/7Oq8erPiPy5mXrOwNEtV
         ArKNxVwAM7kKtbwlcqIKYW82v26MS93Mz2CFRAw+8gJXicwAaoh9WCuAm+y0HVywoqv2
         veXz9d+H6YSf7S756VyJQbL55BMvSLIcOvvacDeDuJXReaTDTbEBsozHVM1nflnkflSt
         Sd1xFXfX109h5/OYsF4QBqJIL/SxHCDk4WTMvZRFv3uEiNIQ7vfWv4atPuLdGVmOz80c
         T/5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWuvBzd32dly+W0nr92zj4Sx28v1vTKvwgMKyb88HJGEV/6X4RSthUNe8zcTOfFR2XtzPgvGl1Xri3UESCO@lists.linux.dev
X-Gm-Message-State: AOJu0YwkhkjoQwpLd+taN0sQ7cT7jzH3mjMoMsdxpVazcKg7Kf9hGSoH
	HvgS1CcIiAcO8WWWhGW3g0/PUzVEd7iLtYyzddDeJyhqG6G+zWTbeYodxdkozYk=
X-Gm-Gg: ASbGncs0Fl6GJtmU45kBPhcxIcI3oz8alypj5bQMQ/KOiWhhjlWJ+HNvy/QrKU25bTe
	vOeb6K29befTTr5vpgGpgYhrYxaj32CWkfxbOoBFXyPH0JMxKIrL767VLV1IbPQ3VfrtNcmC+Kv
	12hBDpHumX2iiIlWks6PAARENZ2B6BCEUWxQ35Vf2TzR6W4p0xJ3nANd83L48I1iprwXS7LIQKV
	0V1hTIIxYeWtVM67QTRRr1/kattaIjNyHlmYGQdUr84JVjDFXY2mGxzmbiacmNgKgzz
X-Google-Smtp-Source: AGHT+IHNuXaQbcaOzWDlJLVdH2VVVV7M1p7IawdDEoc0b+Y3XGEWD6gvsewijzhv1O9NvZ73cJsOkA==
X-Received: by 2002:a05:6000:1544:b0:385:f47a:e9d1 with SMTP id ffacd0b85a97d-38880ac7641mr8437760f8f.17.1734360092860;
        Mon, 16 Dec 2024 06:41:32 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c8016c0bsm8410974f8f.42.2024.12.16.06.41.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 06:41:32 -0800 (PST)
Date: Mon, 16 Dec 2024 15:41:30 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Helge Deller <deller@gmx.de>, Jani Nikula <jani.nikula@linux.intel.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Simona Vetter <simona@ffwll.ch>, Dave Airlie <airlied@gmail.com>,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2 1/3] fbdev: Fix recursive dependencies wrt
 BACKLIGHT_CLASS_DEVICE
Message-ID: <Z2A8Guea5d7cZoBj@phenom.ffwll.local>
References: <20241212100636.45875-1-tzimmermann@suse.de>
 <20241212100636.45875-2-tzimmermann@suse.de>
 <09edb59a-527a-4ddb-bfaf-ea74fb5a3023@gmx.de>
 <88ce6863-4458-47cb-9b28-274c91bd8764@app.fastmail.com>
 <87frmstrhd.fsf@intel.com>
 <2701e824-d330-49c0-88fa-a26658a9710c@gmx.de>
 <5566a3f5-496a-4b39-a0fa-6a1a5af9a67a@suse.de>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5566a3f5-496a-4b39-a0fa-6a1a5af9a67a@suse.de>
X-Operating-System: Linux phenom 6.12.3-amd64 

On Fri, Dec 13, 2024 at 08:26:19AM +0100, Thomas Zimmermann wrote:
> Hi
> 
> 
> Am 13.12.24 um 00:56 schrieb Helge Deller:
> > On 12/13/24 00:24, Jani Nikula wrote:
> > > On Thu, 12 Dec 2024, "Arnd Bergmann" <arnd@arndb.de> wrote:
> > > > On Thu, Dec 12, 2024, at 19:44, Helge Deller wrote:
> > > > > On 12/12/24 11:04, Thomas Zimmermann wrote:
> > > > > > Do not select BACKLIGHT_CLASS_DEVICE from FB_BACKLIGHT. The latter
> > > > > > only controls backlight support within fbdev core code and data
> > > > > > structures.
> > > > > > 
> > > > > > Make fbdev drivers depend on BACKLIGHT_CLASS_DEVICE and let users
> > > > > > select it explicitly. Fixes warnings about recursive dependencies,
> > > > > > such as [...]
> > > > > 
> > > > > I think in the fbdev drivers themselves you should do:
> > > > >     select BACKLIGHT_CLASS_DEVICE
> > > > > instead of "depending" on it.
> > > > > This is the way as it's done in the DRM tiny and the
> > > > > i915/gma500 DRM drivers.
> > > > > 
> > > > > So, something like:
> > > > > 
> > > > > --- a/drivers/staging/fbtft/Kconfig
> > > > >          tristate "Support for small TFT LCD display modules"
> > > > >          depends on FB && SPI
> > > > >          depends on FB_DEVICE
> > > > >     +    select BACKLIGHT_DEVICE_CLASS
> > > > >          depends on GPIOLIB || COMPILE_TEST
> > > > >          select FB_BACKLIGHT
> > > > > 
> > > > > config FB_BACKLIGHT
> > > > >             tristate
> > > > >             depends on FB
> > > > >     -      select BACKLIGHT_CLASS_DEVICE
> > > > >     +       depends on BACKLIGHT_CLASS_DEVICE
> > > > > 
> > > > > 
> > > > > Would that fix the dependency warning?
> > > > 
> > > > The above is generally a mistake and the root cause of the
> > > > dependency loops. With very few exceptions, the solution in
> > > > these cases is to find the inconsistent 'select' and change
> > > > it into 'depends on'.
> > > 
> > > Agreed.
> > 
> > That's fine, but my point is that it should be consistent.
> > For example:
> > 
> > ~:/git-kernel/linux$ grep -r "select.*BACKLIGHT_CLASS_DEVICE"
> > drivers/gpu/
> > drivers/gpu/drm/tilcdc/Kconfig: select BACKLIGHT_CLASS_DEVICE
> > drivers/gpu/drm/nouveau/Kconfig:        select BACKLIGHT_CLASS_DEVICE if
> > DRM_NOUVEAU_BACKLIGHT
> > drivers/gpu/drm/nouveau/Kconfig:        select BACKLIGHT_CLASS_DEVICE if
> > ACPI && X86
> > drivers/gpu/drm/tiny/Kconfig:   select BACKLIGHT_CLASS_DEVICE
> > drivers/gpu/drm/tiny/Kconfig:   select BACKLIGHT_CLASS_DEVICE
> > drivers/gpu/drm/tiny/Kconfig:   select BACKLIGHT_CLASS_DEVICE
> > drivers/gpu/drm/tiny/Kconfig:   select BACKLIGHT_CLASS_DEVICE
> > drivers/gpu/drm/tiny/Kconfig:   select BACKLIGHT_CLASS_DEVICE
> > drivers/gpu/drm/tiny/Kconfig:   select BACKLIGHT_CLASS_DEVICE
> > drivers/gpu/drm/tiny/Kconfig:   select BACKLIGHT_CLASS_DEVICE
> > drivers/gpu/drm/fsl-dcu/Kconfig:        select BACKLIGHT_CLASS_DEVICE
> > drivers/gpu/drm/i915/Kconfig:   select BACKLIGHT_CLASS_DEVICE if ACPI
> > drivers/gpu/drm/gma500/Kconfig: select BACKLIGHT_CLASS_DEVICE if ACPI
> > drivers/gpu/drm/amd/amdgpu/Kconfig:     select BACKLIGHT_CLASS_DEVICE
> > drivers/gpu/drm/xe/Kconfig:     select BACKLIGHT_CLASS_DEVICE if ACPI
> > drivers/gpu/drm/solomon/Kconfig:        select BACKLIGHT_CLASS_DEVICE
> > drivers/gpu/drm/radeon/Kconfig: select BACKLIGHT_CLASS_DEVICE
> > drivers/gpu/drm/renesas/shmobile/Kconfig:       select
> > BACKLIGHT_CLASS_DEVICE
> > drivers/gpu/drm/gud/Kconfig:    select BACKLIGHT_CLASS_DEVICE
> > drivers/gpu/drm/bridge/Kconfig: select BACKLIGHT_CLASS_DEVICE
> > 
> > All major drm graphics drivers *select* BACKLIGHT_CLASS_DEVICE.
> > Are you changing them to "depend on" as well?
> 
> All these drivers should be changed to either 'depends on' or maybe 'imply'.

Yeah, select on non-leaf/library function Kconfig symbols tends to be a
complete pain. There's some push to use select so it's easier for people
to enable complex drivers, but I honestly don't think it's worth it.
menuconfig can give you a list of things you need to enable first, so it's
all discoverable enough (but a bit painful to get them all if it's a
really complex driver with lots of dependencies).

tldr; I concur fully, please no more select but instead less.
-Sima

> 
> Best regards
> Thomas
> 
> > 
> > Helge
> 
> -- 
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstrasse 146, 90461 Nuernberg, Germany
> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> HRB 36809 (AG Nuernberg)
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
