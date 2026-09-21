Received: from mail-lr2-f35.google.com (mail-lr2-f35.google.com [74.125.230.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA7023BE141
	for <linux-staging@lists.linux.dev>; Mon, 21 Sep 2026 10:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789985293; cv=pass; b=I1z08MFwPrlsXFemIPegiKsmGgSXc4A9ep2JPMCgi3ffmx3ndtzN+q+BLvUFbtQzp5w3hrxpqaKJMoCwb+LEO5/JEXVEKBEMH7XXMreHE5j4C3zecUgv0hNJHBCNZYxeJT71HGygs7GERr+IIltKvX2QyKpwwR0DrrsyCtibgCE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789985293; c=relaxed/simple;
	bh=VIvwkAam9zTpoSK3o3ogyb7G3ggXPl8fp+Nj5qRGxdI=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=l5G7IEX2FGUH/6SqeqynLCVldXfPTXx9ubcT/8YLGqcUjYZBQunDwjcFKw8X0w4tDffekMbYzys5fz3BkbjsC2KPMzO2on0JzOLhpyTx6UhAfJNLUy5FpIeLTr58wSij2Lxq8aTS+9UwtEUa6o8vf3egXeutwvmAfGbddi0lPr8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wetterwald.eu; spf=pass smtp.mailfrom=wetterwald.eu; dkim=pass (2048-bit key) header.d=wetterwald.eu header.i=@wetterwald.eu header.b=sMtbriWx; arc=pass smtp.client-ip=74.125.230.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wetterwald.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wetterwald.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wetterwald.eu header.i=@wetterwald.eu header.b="sMtbriWx"
Received: by mail-lr2-f35.google.com with SMTP id 38308e7fff4ca-3a612404718so11241111fa.2
        for <linux-staging@lists.linux.dev>; Mon, 21 Sep 2026 03:08:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789985288; cv=none;
        d=google.com; s=arc-20260327;
        b=ZrRTFefDMpoKrGA+oQMdKQvGbIrhn+0OA6jV0VzOG0QNq3g6b+5grFRuYU9BOnoy1K
         25sjxfOZfndbRJiqZcS3yGz83Fxuo9nQce/fxBT+avn1LCHJtJW48DyI1SEbXhp/OfGn
         pDk/NO+92CR/NPgY6+X5d7jKyLz91LKrGt0x9xzPwv+YCzP+yClS5Qxw0Icy8pzwetiX
         9QdZ2x8mBD8yTm9dTLk7uTV0yYGd3ZYOspAKJYb8NZPdftVeouiM0sLzuPCaw0PJnTpd
         mtpf9B0CaAqCEmOeqzcZbHuzIYcgPVFZPI3/3oRx/fJd0bMsaZ0ycYAcknEEjQ/IrFZB
         iHow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=ckZuYoeTTPMvdxoAoxaz030ABxaViXfjKjKNmd00MIU=;
        fh=aThPOd4MSR314X0jFPYsozZf4Zng+LGjX3c99zw1icY=;
        b=AcfzaQiFmeRSSfrFidColxD2w5vv2fRIa3N7y9I90x5uGIKhieOi1BVOHzueOVrhoz
         CZLv7Z94TbGuHq3H2XZCBLHbegvoYqYXfVNmpNlaiV+iqzvrQQkbaNg9ihIQSEfohYUL
         oXMD3TS1Auxk0UiZo0wwv5BXlX/HY5FodTgZX/IoE/9Kf0XbDhQK+150v/MKLoK4fA2L
         t3pASIBdFflT4enxd23tdaoaOH1jXA1ItvQsUXjlLnBt3LGJGo4BFS28NHhCdCoeKeq7
         Fhi5OenuTMNLvfC4C663S1oMkRSs7r0UGX32vhJx9dF4ro9AUbL80qhf2w8spNipNGXp
         ZOOA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wetterwald.eu; s=wetter; t=1789985288; x=1790590088; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ckZuYoeTTPMvdxoAoxaz030ABxaViXfjKjKNmd00MIU=;
        b=sMtbriWxI/cVKNAxgA/I6nbKymmzljj9qhHHvfTpY9r1CQFMF9KmkHJDsUbqaXWnIL
         AgdzJv4pOYLrduA9Qp1/9fabk9T5APqbOq9F2k+DzPNO4g8ppvgFRjJhTWOUytYR2WWX
         8M4lvVrv9n7wkWHWTLoBBbAXE4T9RiYbomS+AUOCLeeMPlDTn4zOv011o+J9LJE7cMJK
         FABUpe/idO5vRjVB0OdVQLXST0ZCvVpFvgFBzsUblhPH/X6ZBYeL7adMcfd6+/lzwi3A
         mzOep7w4P2IG3PZ8rEPAejsQJrTie3RyGYvBvm3VJcx7nRYH5Pz6ABbl3RT/LyL7Wpxm
         8Uyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789985288; x=1790590088;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ckZuYoeTTPMvdxoAoxaz030ABxaViXfjKjKNmd00MIU=;
        b=R9m/PzMZmuj/Cs8U4Y3vGjan3+SdlOHUuRSvypiGTUYbt+E3l9woEH0rSih78109Ik
         cOHaJZY85FYbC4VJopNHI7ic5GixjO6x/fwZ7dGR/ogTarDFDRlGjl8VBLvQKPBm550l
         SVZ5pv2jXXA1UvnEB+ckf2Wyx1J80ipnjwtk3ZsPAJjo0OukAM00FwVVnJzKmWiIVkHf
         MAOXTazu5ebQQdfl46u4FgUrdKsRuQyIaOnpbsAwP/LRxOYwAu9kL+sSg9B6Zm3ViA/H
         vg4lN6f3VhocYQ0N8MGG3p5ar7UTvq63Fa2iazf4sxZ+nOkxPDlpuffhO4GX5faSZJVc
         0Wng==
X-Forwarded-Encrypted: i=1; AKwUvBxlILFRXqevfEGh9rYDkBvBSeY29tkdVy+LbxPAONA5vRWWWglYRaZQt6blFR3VgbKmJkKKitDvwfHn16Oc@lists.linux.dev
X-Gm-Message-State: AFuF++nUGVrhbX0LnnmUCOGyz0XNFHeEAQUigkMLvyQ9Y/dBORTmXZEw
	9tZQhgtkpRKgiYWcM9mGE+08FSiN7sfunfpoYb8McszTqjb7s2OwjLUbDfRku+po3ZN4i1Mxt2h
	Oz6eJrM7v4dinq9VcZ3fbc7ChBijhZg9ZTTg3UsKwig==
X-Gm-Gg: AYBFou2ruXc1tZ5IFSkcfM9rcCRCLedQbuV8ZcAe6B0r/pApqBlwgUNsIoo2Bmjy2HS
	dzTVdCNuDcqSWSxfFHgu3d9+xjQIapM+xgCnwKtfXuhSFpoE4nUWY9fo8LkGlpyj/3wv0ERnDDn
	IWMYqQg92HLY9p6evVk5HN/DBOI7fjWyeZa0hY8wJiUql8b3hy3Vnv38HgBNVJyQ4SX9KfmNy6D
	HOcL8+EUzc+3PwU9pD5rTDAo0o674KiD4lj6N/3XIf89Gjj5iLC7auytuq3bhlmcA2+w6b7jw2o
	1tApIdiYZV5yIbF6XmJ5fXT/hZsmZbpV0ttPqR9kTOui9hwKeUPVkBg9cFVf4XwTob0IHqdekIY
	xh+tQDgMd0sw=
X-Received: by 2002:a05:651c:1443:b0:3a1:f671:b2ee with SMTP id
 38308e7fff4ca-3a5fbe5b98emr24185481fa.8.1789985288242; Mon, 21 Sep 2026
 03:08:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Martin Wetterwald <martin@wetterwald.eu>
Date: Mon, 21 Sep 2026 12:07:56 +0200
X-Gm-Features: AcwNN1W58pSJb1Gm5FiYd6G15BwFUBJt5i6mO7kwx-kG9sYBZhWnHxQTgaZWe90
Message-ID: <CAFERDQ0FpdVvA5VJxOyRAE_pgxnPVmFx1tkZio5R272j6Bs4tg@mail.gmail.com>
Subject: [REGRESSION] bcm2835-audio fails to register on vchiq-bus in
 monolithic kernels since 6.19 (VCHIQ destaging?)
To: florian.fainelli@broadcom.com, gregkh@linuxfoundation.org, 
	jai.luthra@ideasonboard.com
Cc: uajain@igalia.com, Stefan Wahren <wahrenst@gmx.net>, linux-staging@lists.linux.dev, 
	linux-rpi-kernel@lists.infradead.org, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi,

After moving from 6.18.52 to 6.19 (still present in 7.2.6), the bcm2835
Headphones sound card no longer appears on my Raspberry Pi 3 Model B Rev 1.2
(arm64). 6.18.52 works with the exact same userspace.

dmesg shows:

  Driver 'bcm2835-audio' was unable to register with bus_type 'vchiq-bus'
  because the bus was not initialized.

and /proc/asound/cards reports "--- no soundcards ---".

My kernel is monolithic (no module support), with:

  CONFIG_BCM2835_VCHIQ=y
  CONFIG_SND_BCM2835=y
  CONFIG_BCM2835_VCHIQ_MMAL is not set
  CONFIG_VCHIQ_CDEV is not set

Analysis: both drivers are built in and use module_init(), i.e. the same
initcall level (6), so they run in link order.
vchiq_driver_init() registers vchiq_bus_type, and bcm2835_alsa_driver_init()
registers a driver on that bus, so VCHIQ must run first. In 6.18 it does, but
in 6.19 the order is reversed.
System.map (same initcall level, lower address runs first):

  6.18: vchiq_driver_init            ffff800080646704
        bcm2835_alsa_driver_init     ffff800080646708

  6.19: bcm2835_alsa_driver_init     ffff800080646698
        vchiq_driver_init            ffff80008064669c

In 6.18 both drivers lived under drivers/staging/vc04_services/. In 6.19 the
VCHIQ interface lives in drivers/platform/raspberrypi/, while bcm2835-audio
stayed in drivers/staging/. drivers/Makefile links staging/ before platform/
(line 154/155 in v6.19), which matches the flipped order.

After boot the bus does exist (/sys/bus/vchiq-bus is present); it is only
registered after the audio driver has already failed. Without module support
there is no way to retry.

My suspect is this commit:

  aa125180c673881f88b528600b57865dc158b3a7
  ("platform/raspberrypi: Destage VCHIQ interface")

I could not bisect to a single commit, but what I know for sure is: v6.18.52
works, v6.19 and v7.2.6 fail, and the initcall ordering above explains the
failure.

#regzbot introduced: v6.18..v6.19

Possible fixes I can think of, none tested yet: register the bus earlier (e.g.
postcore_initcall or subsys_initcall for the bus registration in the VCHIQ
interface), or defer the bcm2835-audio registration to a later initcall level.

I'm happy to test patches and I can do it on 1B rev 2, 1B+, 2B, 3B and 4B if
necessary.

Thanks!
Martin
