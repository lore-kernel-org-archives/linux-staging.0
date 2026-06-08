Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A9838A73C
	for <linux-staging@lists.linux.dev>; Mon,  8 Jun 2026 07:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780902545; cv=none; b=D3J/zbGw8Ka30J4eD0jicFOdBvA95CFnFmH2Jk5+TvyWGnetwXFK2DcO6+hbJMcM7UQtOPZf6q7lUng0nmuCYtRGVQSC9J5oK//alp0y0za/sO69LOQe5WyxlDenr2smGp/dTHQqxrwzWnBps8le+eIbMkybvVr2ngvxMmORz2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780902545; c=relaxed/simple;
	bh=x4YGxnUH6nSF5/ZhKRoPbEMOQVVMlItMWOWI/c6CpGk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lAPe2MCGtg2bjdS0NdF8HgRIAR7fpiP17DmQ4pUJZXn9zkKuaohiHxnGeJ9r/QXhHr3d56tf83V6AW4q2P09Z2IwLmNSbxz4QspXOpVt3Zo/1b75jtA/KtnmTBNKE2sR7KVEhnZT7xCvKJzwvt38KXnaQSdxdRWHQEM/Vcfu+h4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gucimBa3; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gucimBa3"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-490bc6a7958so34447915e9.1
        for <linux-staging@lists.linux.dev>; Mon, 08 Jun 2026 00:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780902541; x=1781507341; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=otSzr2Y0wGW3RXTk64Kspnpz7/ygAtHA4NuNzYHMC48=;
        b=gucimBa3RGEH9szHORUyyMyGc2MjgiL+mJe27g/n1Tx08q7cB9dLLJ54xcVRbbL10x
         HiJ+MyKeMtQf5wA90zL8twC6sXW4VdodKoziAbkdVmeaK0nTf8v1+nRCuZ+CIBn+doRg
         rEmpnFG/qOr9qj/7ES7FUN4kXOrWQ6Mf8WDDdiT0ZrtxJpJJQRtp01XmN8axikxkhzH7
         NLxvXNjJSbeMNTkgvbPv9YJ1a6mQHiyzt4RLJufgG9mDAb8dpnubL8pHXN5JAFO1M5ph
         50kOnP3/HPbBlmKKpoOj1I2dpaErhWOzxR3CEAKRzoWY3xfLIkPap8z7cpHLunorE6Of
         9vAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780902541; x=1781507341;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=otSzr2Y0wGW3RXTk64Kspnpz7/ygAtHA4NuNzYHMC48=;
        b=Q+j9iNyHjLx7NUMXAnoG3V1/tYEtgmZTCm1278UnRhrgSQzl4KyC2YIn8yRNB0VzZL
         l+n6drL0bx/ad08qCzu+gLuEXcKU7w/v4ZlxNhN89aFNmjPRyeIOPrPYlVIT39zztu0A
         ILziLInAHATLBz/ypN1hv0qE49GrnVzHB8wb8UlVy7oUqn3snRcrTZuCTqAYO0Zj4CJu
         +c1ROZ8t1dcpAtKL+ZOoFX7Qrx9vzhJTiNoE038g3k+pPhzUBjDp+xuVza65JPGIKwK8
         WKst8/ADfltZLFlB+JmDnVMUx5VpTq1vs3hwi/tAEgiXTWDHz+RX6AvgIzZYGAV48POl
         /Skg==
X-Forwarded-Encrypted: i=1; AFNElJ/JKUuO4DVjHOBKeSrhzhED6Cbt3PTdxaA30YrIwtFIDZDcEseL0vH9V3y7hIDdtQkO14B9gDS4u+eBWe80@lists.linux.dev
X-Gm-Message-State: AOJu0YysPQ/0CPNX4i4/Iq9Dl/ClcsFg4H+gaSAt9Y8H5aTdoUFBAGHT
	2/NT4vUfYIVZir0xIY3xHdMqckpwvO+WG4uYqqJrh95M67BsbBV+dQRb
X-Gm-Gg: Acq92OFsTmPtH6MYGjk3OOZlBHPGJ8C5GTX8FRBk4QMh7kNu/qwbkRFS+9Fm02tzK+s
	Elf7KOVebCBz/6RWLvuml2xDRyI/QvmeOVF3HbNQqJ5sUtqcr16yX76FN6/IdCbo4brF72EGpg1
	0Gz+mETKTjjVAbuHAiLHY6QgBK5XF9NOWh0FCvrezyUzFRhyRVuMGnbAQHuir0N6moznw/lv1pz
	1mQ/vuCaPs5+KVP10QUl2kSsYhg9Of1+kXSF04xB2qS9BM2ZErSKyZexlEQKGhc0T0hjzP1Bu6y
	NF3f6lPstfRK804kYvuKgJy1T/sYpjG/sYu27fQCGM1YydpNQdyKH5TRLWz0RsuhXv7ZVCmFKkj
	3N7BlIbEokyO/t2ReVQwMEU3BSVRMeFVrxIb1IizicxOz7UDML6gq+c4KsQpS6G1ioc1eiQBISK
	vqqY2NP/vZATz68XfooMc6TsDXKc65B0VrmOvfaz4b
X-Received: by 2002:a05:600c:8208:b0:490:ad1e:1846 with SMTP id 5b1f17b1804b1-490c2cf6718mr175596575e9.9.1780902541391;
        Mon, 08 Jun 2026 00:09:01 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490c2d37edbsm276118055e9.2.2026.06.08.00.09.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 00:09:00 -0700 (PDT)
Date: Mon, 8 Jun 2026 10:08:57 +0300
From: Dan Carpenter <error27@gmail.com>
To: Andrew Soto <linux@notrealandy.dev>
Cc: hansg@kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org,
	andy@kernel.org, sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: media: atomisp: prefer kcalloc over kzalloc
 with multiply
Message-ID: <aiZqiXR5Z3Mt-CFk@stanley.mountain>
References: <20260606234427.9902-1-linux@notrealandy.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260606234427.9902-1-linux@notrealandy.dev>

On Sat, Jun 06, 2026 at 11:44:27PM +0000, Andrew Soto wrote:
> Optimize memory allocation layout

This part of the commit message is techno-bable.  It's just
words that don't mean anything.  I suppose teally they do
mean something, but it's not what the patch does...

> in sh_css_params.c by replacing the raw multiplication inside kzalloc() with a type-safe kcalloc() array allocation wrapper.
> 
> This prevents potential integer overflow vulnerabilities by validating the array size calculations before interacting with the kernel heap allocator, aligning the driver with modern kernel memory allocation standards.
> 

There is no risk of integer overflow when we multiply by 1.

> Signed-off-by: Andrew Soto <linux@notrealandy.dev>
> ---
>  drivers/staging/media/atomisp/pci/sh_css_params.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/sh_css_params.c b/drivers/staging/media/atomisp/pci/sh_css_params.c
> index fcebace11..9147ca047 100644
> --- a/drivers/staging/media/atomisp/pci/sh_css_params.c
> +++ b/drivers/staging/media/atomisp/pci/sh_css_params.c
> @@ -3716,7 +3716,7 @@ ia_css_ptr sh_css_store_sp_group_to_ddr(void)
>  
>  	IA_CSS_ENTER_LEAVE_PRIVATE("void");
>  
> -	write_buf = kzalloc(sizeof(u8) * 8192, GFP_KERNEL);
> +	write_buf = kcalloc(8192, sizeof(u8), GFP_KERNEL);

This should just be:

	write_buf = kzalloc(8192, GFP_KERNEL);

If we weren't allocating a text buffer then the new way to write this
would be using kzalloc_objs().

regards,
dan carpenter

