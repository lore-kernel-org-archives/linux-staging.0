Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D6B5CB0
	for <linux-staging@lists.linux.dev>; Tue, 13 Jun 2023 10:38:49 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-30fc42fcbc7so1425626f8f.1
        for <linux-staging@lists.linux.dev>; Tue, 13 Jun 2023 03:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686652728; x=1689244728;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6d+VLj6m3MAAbwrIUd63IBRinbYN+a8k/C8reDLCUoA=;
        b=hgjHCdmVZj17ygZWDKclgn2+Ytse1qSnmaG4LRvuBitz3LJyh5HgOVAUSo0/r7wbdt
         fdSIKGBQtVODe5/DiwzNAY75tQn14eC3cn9Q2yhq2toPlE76Oa5oFJdV9l1XnL0YG0RH
         fxvfeGPQ4hK4wvvH1FIqK7kR5+J3EkpRC2wIwVTAmEGdctNMUqczSpR/pqHqlcdrvXNx
         w+5FbTeVgBNFZVVGyto35QUzWBVlGziPVY46F9DgTYoTMe+PwdW3jVov2buriiM7Vv2s
         PvmiMKy9I+IiUkPF6osBSwKSkROBznVLomANfzqMBfERLZUvUZy0htIwFzMk6D4nAIGS
         /3Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686652728; x=1689244728;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6d+VLj6m3MAAbwrIUd63IBRinbYN+a8k/C8reDLCUoA=;
        b=cw66toOqFX4dyYwMUfkwGCPwzKfmV6Bnlb07gnGzP+SR3IVY814NSBrAn3FcW5jheg
         C9TkOarjFE72A3ij5haNicLlbAcrE5LUSC/Z/lt0irN20U+QIp6X/AfaY5D8aNZ1MJJV
         cqx98IqbdD50pD3NeYS3Ffts9vH7Fnv3U9PBfNvZboD8XEz1EVPaUcXKtAbs/jTOwDcC
         OhC6Aqx+2RJWO8WEVHV+K/moTQ/JG6G4KcXUcrvVraMOA3Q9IW9dLpzfxJtDFWCElZl6
         OinToLvObv3tVsDnSUs8f2a3YXrnHPxLS4ZQLCubAypw7pW5YLKisra/BfwpTmCBzk/b
         6hBg==
X-Gm-Message-State: AC+VfDxWbPmBEtbc/3rVBzrQuygek+R4UXPsoh0iW+VqdsM42H4OyDBO
	zGD+IH3eOxC1kOlKsndd2v16OA==
X-Google-Smtp-Source: ACHHUZ5HGIJRgD5nl4Qh50NEPcobvGP0CTVSW1VYZZsJoGlj0SicoFaUzO4TaUafxBw4qtclMnMW2w==
X-Received: by 2002:a5d:6a0b:0:b0:309:46a4:6378 with SMTP id m11-20020a5d6a0b000000b0030946a46378mr5778964wru.12.1686652727984;
        Tue, 13 Jun 2023 03:38:47 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id f9-20020a5d6649000000b0030f9dc63ff1sm13001387wrw.88.2023.06.13.03.38.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jun 2023 03:38:47 -0700 (PDT)
Date: Tue, 13 Jun 2023 11:38:45 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: daniel@ffwll.ch, javierm@redhat.com, sam@ravnborg.org, deller@gmx.de,
	geert+renesas@glider.be, lee@kernel.org, jingoohan1@gmail.com,
	dan.carpenter@linaro.org, michael.j.ruhl@intel.com,
	linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-sh@vger.kernel.org, linux-omap@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 03/38] backlight/gpio_backlight: Compare against
 struct fb_info.device
Message-ID: <20230613103845.GC169438@aspen.lan>
References: <20230612141352.29939-1-tzimmermann@suse.de>
 <20230612141352.29939-4-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230612141352.29939-4-tzimmermann@suse.de>

On Mon, Jun 12, 2023 at 04:07:41PM +0200, Thomas Zimmermann wrote:
> Struct gpio_backlight_platform_data refers to a platform device within
> the Linux device hierarchy. The test in gpio_backlight_check_fb()
> compares it against the fbdev device in struct fb_info.dev, which
> is different. Fix the test by comparing to struct fb_info.device.
>
> Fixes a bug in the backlight driver and prepares fbdev for making
> struct fb_info.dev optional.
>
> v2:
> 	* move renames into separate patch (Javier, Sam, Michael)
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: 8b770e3c9824 ("backlight: Add GPIO-based backlight driver")
> Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Cc: Rich Felker <dalias@libc.org>
> Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
> Cc: Lee Jones <lee@kernel.org>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Jingoo Han <jingoohan1@gmail.com>
> Cc: linux-sh@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: <stable@vger.kernel.org> # v3.12+

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
