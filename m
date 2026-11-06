Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793985023;
	b=YmJx2xG+y5Txl9bkVmc4dok4f/Q13PvmPgxutoLtnF2E/2z7tXQYugkC4eRdFpiezNBo
	 wfCzhXQHe6/PJqvHeVOetY7Tkj4BRoUHCmMMrDI5Z/fDlOuPdd0kLsikT7+0ufUQQYUmJ
	 yDqEAJom/QrV42LvJYs2S6ZU3DhpK1TMYSofqnfuuHgXrXChFdzWLZfnJEQ9e8VM3MpYT
	 q0KGCUw9FVFbr728n4btDkgGQ6vAP7Y1jXAQZcweYORZ8XG1H6CgYbbesrvl6t1FZ+uSE
	 DqJcplgi1GnREPTf8mYo9WjutMpD8Vlh7hiMZU0UzYrXtUYbNawonG85FcZYJ5yE5zA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793985023;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-Mailer;
	bh=V9n1CV17mWoyinWHCGFvDxtvvBlrLNzZtRYoJJeVLOM=;
	b=VJzlFV/PUTUsC70GcgXiEUJepPKMnNBHWxbYtMeoc/jjovJ9aRf12i+2pwtcvECCP0W+
	 YOUbyIFyvtx/KjRYiTdOf2jKY0YRX5DSVipFWcZQsi+bSi6IxZIU9o5qCDavcpAwJk2Oq
	 q9RA/kLyOo2hI4ureC1sFUGlwFVqRlO6Aqbr1BCKdZac9MABnQ3N05WeGFIBxt5dThM+g
	 F4UFMb7NVP/f6r5zZqIhaqG9f03MO0Tun/wGPU8Lh8oFOKqQjZdRN7L8KGaUP5VldxjAK
	 lZHhBcBw/aCCUxUdQfk+rlMKpRlu64c75KN/NxFp4vEtgZuBQIjRFPbLFjPRc8Nflhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DJxEP2Ku;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF753606A32E
	for <linux-staging@lists.linux.dev>; Fri,  6 Nov 2026 17:10:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF753606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DJxEP2Ku
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so6360115e9.2
        for <linux-staging@lists.linux.dev>; Fri, 06 Nov 2026 09:10:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793985021; x=1794589821; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=V9n1CV17mWoyinWHCGFvDxtvvBlrLNzZtRYoJJeVLOM=;
        b=DJxEP2KuRCDYGvjUkgsVY+s+wgi0cpgAba8OP8+6tjOsLQ6I8tTf90y/HKLP3vdouW
         8ct7tq6oQ81ezUR2mwIQ6LsePGw4ElDi2P0jdueBtP/+noKiOylwGtbV81mqgUre6AJQ
         wOSGT9968cUB9qcYaeOCd3fvSrydkITIeLC5ZwGnbYAf9/f98wftzKmCvy11OWpC434H
         Uf+x+A4+JH03v109ezPqohzTUj1Jas1otectBzMxbfQfBcUekMh06iDBkImUm20YTveT
         4OpvKpu48Wl7PnvDgCCz3ROgDt2Bgj31cHfyGbWCut0Tuh5ZwN0Yju7auIhpConFLL7I
         plTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793985021; x=1794589821;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V9n1CV17mWoyinWHCGFvDxtvvBlrLNzZtRYoJJeVLOM=;
        b=iiATZ559usB7nf5lIQWazicuJ7eqegfJmrRazj6mnm3BjtICiI2YpdWeOPT93cpJx5
         HD4FPRywdrhTiR8fKRFCz6tOIQuhwzxmz+AyLkXN39xeSOD95Xhi6U60KhsbyKvk8mkZ
         SoEV1vfrmK8xFa53P2x8yaupj/XjL/Fk1Kx+VM3gvBlltjxL5NQdpIYB/UNeV5IXj359
         mL0d7PNZW6cUm8Q5U5+hMlqgrKTaRytU4K31FM30pSm/gT+klhjsblyYzxus8rg9rX18
         cFnkDA583AsRPaQoa10jDwzoDij7Df9Mgpt8GUmV+zOkAXUhDe+3ItPaQvm1OYjL9S2q
         dveg==
X-Forwarded-Encrypted: i=1; AKwUvByf0+5dz2y25fm/JMpn9e5e+PpBmt/mmi6Q5vua6JYZg34eSqKTgO47WgrXPDQUKrfxEP9Mt0Vpz+BMC6QA@lists.linux.dev
X-Gm-Message-State: APuU4Z8TEDkhdg9bLhLp1T9KyzX1o2IWnUWAVWjHS7thEjVS4yrB6o/c
	D0aIb470f7bXtAD6s6IjYY3fcets440AwlA9wJPT8BHXhmxiuOW8ARsE
X-Gm-Gg: AYBFou25rPbHpm2Iu+prgNAGAxSRlIRm+pdGWG/c1fOa0Vxqy5zW80kKGcDZNk1l9vU
	K2WF01u47QJLK44voFTadg1ZgnaeZXluM41KkpDOrx8H1sxo9+UgnrgasIUczNDSD9lSiUeHPFD
	kHxnI4WRb2sr4eaou3GNdsiWXREUZpTHzdvGV+d34gTk+rZ3KHdawHej3r5X4keN1+sd+17tyNh
	Ef8bCXzojVQkkTNqDMspp8xKU5VMdr61WGrXokj055Y2N6ZGmh7wRNejTKnicv93OZ/V+HdjwFg
	kbhbZZZB69LMY3Clhdb2Jq5Tu7s8cWHlc17YaO1xZ1LXByaNekC5++Ubi4lO4ohdjsNEUqVhXF6
	Xx8zSkMs8SU2wFXxblysYJ6gpGKAlIHBmD179EC5hQhKEhRREZePeTBWxUvxPfAmalPyDqOSekx
	m9VzKedeeFfKZeLFPpu5vmjHOS5vlzhWyoAFo+miCkOQZT2Wuz6ivMiK8rPowdaRAq0/DP8dk2u
	52a/GB8UkuPz/pdy5aR7bunQPQ+D1BLRq7RAnf1XGpwc9NS8MDwB/L3UOqf6f4O1qAqLK16ufCf
	5Hot+Wc9l2I7alnr9EOztzO8sBFqoFV5
X-Received: by 2002:a05:600c:64c5:b0:4b0:a7aa:843 with SMTP id 5b1f17b1804b1-4b6df4f1dfdmr55413875e9.25.1793985021160;
        Fri, 06 Nov 2026 09:10:21 -0800 (PST)
Received: from localhost ([82.77.126.113])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b57317cae5sm238886225e9.12.2026.11.06.09.10.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 09:10:20 -0800 (PST)
Date: Fri, 6 Nov 2026 19:10:19 +0200
From: Daniel Matyas <matyasdaniel006@gmail.com>
To: Nam Cao <namcao@linutronix.de>
Cc: dri-devel@lists.freedesktop.org, linux-staging@lists.linux.dev,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alex Lanzano <lanzano.alex@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [RFC] staging: fbtft: Moving fb_ili9341 (and others) to DRM
Message-ID: <au4J-0GOUuueHLZe@rabbit>
References: <20261105201154.37294-2-matyasdaniel006@gmail.com>
 <874idv2bol.fsf@yellow.woof>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <874idv2bol.fsf@yellow.woof>
X-Mailer: mutt

On Thu, Nov 05, 2026 at 10:47:06PM +0100, Nam Cao wrote:
> Daniel Matyas <matyasdaniel006@gmail.com> writes:
> > Questions:
> >  a) Is removing fb_ili9341 acceptable, pointing users of other ILI9341
> >     modules to panel-mipi-dbi? The KD233 node would then have no driver.
> >  b) Or should KD233 panel support go into a DRM driver first? I don't have
> >     its init sequence or physical size, or the board...
> >  c) Is removal of all of fbtft already planned?
> >  d) Several other fbtft drivers have drm counterparts. Should I inspect those
> >  to see if removal is needed?
> 
> IIRC the main reason fbtft needs to stay is because it supports parallel
> interface which is missing in the DRM drivers.
> 
> Nam

Thank you for clarifying. However, the fb_ili9341 driver uses only the
SPI interface. Is it alright then to move (or remove) those drivers that only use
SPI interface and have DRM counterparts?

Furthermore, would there be a need to enable parallel interface support
in the DRM subsystem?

Daniel M
