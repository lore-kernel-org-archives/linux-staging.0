Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 330BA3B7756
	for <linux-staging@lists.linux.dev>; Mon, 29 Jun 2026 10:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782728012; cv=none; b=VFd3TgMjp0HutekbyBWMvB+umw4Yb4w01kskovQfvOpipnWgFGVVatnTb7uqj2sosci5ME7jDxbu2K/WWJP+IVZlx0hXGkuKov3XPoh0LqhWzr0Q3wq/e0GfHWHM0ZiVxKlqaY5b3PMMu/afFNbtGX/wXSgYkopJpBnvZK9AlW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782728012; c=relaxed/simple;
	bh=q5jIXaSxCjuxSv6Etj3isb1WoEQFQTRoZE/y/N6SYms=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ISHkSvKGe3cYl4+VAkppO4d7jS/vg31dFgX3BUoxAT98C6Db+I2FvLTfFgCA0zD+ipAAUO5px/gKnPtB9n5feleSiHON/4K7s7+S1UAMnwPzLYn6Nipho5/8H7+zWIMW7wiXFMN22Cvxs059nJOz/6Uc40voEwjegMdVuAsNXtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=D/drcOTe; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="D/drcOTe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782728009;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xm3lnF8OGUYYjPMf1XDMCVfIs1+U/YDcq+T0Pc20cjo=;
	b=D/drcOTeMth0uxGeaihuQGZll0SbVNu1KnCSULdUvTTXQsOTWRwmd5jy4pze52WFojNaxt
	Pj1NhNsxLvrktmTumR+743cBkwIR9k8WTDAvY4S3tQsuZIm8OjugToUnH/41CsOv7WzE2B
	ClfntYZcTybKiZWqJQXkJngRp60KFm8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-672-l9XEON-bOymLjj1PETMjag-1; Mon, 29 Jun 2026 06:13:27 -0400
X-MC-Unique: l9XEON-bOymLjj1PETMjag-1
X-Mimecast-MFC-AGG-ID: l9XEON-bOymLjj1PETMjag_1782728007
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-490bae3a39bso23000775e9.1
        for <linux-staging@lists.linux.dev>; Mon, 29 Jun 2026 03:13:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782728006; x=1783332806;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xm3lnF8OGUYYjPMf1XDMCVfIs1+U/YDcq+T0Pc20cjo=;
        b=Xljt0WjTn2jdd/+wt6nGHGrL+javaHB/Wq6/jFfyI0vP1nSe5CFMWD2LE45wFmq+sc
         0QPNxNnStpydbRttWr9LGE+A6VOrhXGRtCxNe0xPvfLrUmuY5aP3ElM5YpaE+SM2Ozam
         HbjP13Uh2rkkO/9Ce+jOzh8Mk1YkJnmJkkXHt3Jwfyb71Yub2DGvTjWJmaDHg2b2kWkv
         EehJyHExqX6RskfMB6Mh3QUboefYHJbA5YY6Ev7fNtp0AG3fEhHrE80nDXkjYEC6zGRo
         eUcxjiX5+GxIKVx3GiZvlQAa+kttXw3TzdtxF5U/ZupjyjPDu3LKwa7WQ733jnJB7uce
         FsAA==
X-Forwarded-Encrypted: i=1; AFNElJ81RbN8Jk7ekjfbCNL0zoHYN4GVRzSzZls+7CPdXINRiI27//TK8SYzTGITzrMe0j8trmpLZUpm291a3MC+@lists.linux.dev
X-Gm-Message-State: AOJu0YyzXcBLtbOXtEOCgrjVS7k7bIQrakTOHJs9RGok8qqOwixabItU
	iUV7dehs6lmRdIcqiF8vQeooS1MSg7FkExTkk9l1cIgPEnAEFt691e9n5U1awzxLS9CwnWZkaLC
	JRU8/s0HypQDylmSLmCGeUZPELI3n2v9LLZvSLZrGHcqeOcKBeyBxnulYo11TqDmTm+B5ead0Wi
	k=
X-Gm-Gg: AfdE7clUcqlKqaIpmR7cXhFQSdad2KEpwtUchdB486l+yDg3+zJlGeg+KqSsPFkwWs+
	VM7aDywKk2mn6ZMk34buYjFgoiTsPwHE3glhamutJvg1plj1FfDbqYGbYp8WTVlTUPb/5QOcvEl
	juLrk7Uks2wiscqMBkenFeSM1TDrmox1+NSuXrWjNzwdvEAKO+UGPg8kVgWkT0BGQUY7fSpOBar
	k+iJtbsA6ypbKUwWRU/7V/nmiAO/2CUgrtRrJXUClJWH0oMlh0DJnWXW+a4OkfGtpadaz8mN1n9
	Xz0IBVm8mlCT72rE8ZD8TVopkPQEo3bIasi4/6kHqELRkLC9DO5+xD+RAV9+zYiMlJx/ku32PF0
	p151rbeZ0JiapBi1TVvc4iL+hrmdqcfz5ElPG2j9iZRg3qP3iwRqJSJyi9e0RRUoFcPDzbg==
X-Received: by 2002:a05:600c:6218:b0:492:700b:deea with SMTP id 5b1f17b1804b1-493b71a21c5mr1717765e9.13.1782728006551;
        Mon, 29 Jun 2026 03:13:26 -0700 (PDT)
X-Received: by 2002:a05:600c:6218:b0:492:700b:deea with SMTP id 5b1f17b1804b1-493b71a21c5mr1717385e9.13.1782728006067;
        Mon, 29 Jun 2026 03:13:26 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4734df60acesm11346521f8f.25.2026.06.29.03.13.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 03:13:25 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Amit Barzilai <amit.barzilai22@gmail.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andy@kernel.org,
 gregkh@linuxfoundation.org, deller@gmx.de
Cc: azuddinadam@gmail.com, chintanlike@gmail.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, Amit Barzilai <amit.barzilai22@gmail.com>
Subject: Re: [PATCH v2 2/4] drm/ssd130x: Add RGB565 support to SSD133X family
In-Reply-To: <20260622152506.78627-3-amit.barzilai22@gmail.com>
References: <20260622152506.78627-1-amit.barzilai22@gmail.com>
 <20260622152506.78627-3-amit.barzilai22@gmail.com>
Date: Mon, 29 Jun 2026 12:13:24 +0200
Message-ID: <87jyrhd58b.fsf@ocarina.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xco1eJ_42G8vNiLqx-CKB-nwCuNEHrdJohUA4ggGjho_1782728007
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

Amit Barzilai <amit.barzilai22@gmail.com> writes:

Hello Amit,

Thanks for doing a re-spin and adding the SSD1351 support to the
ssd130x driver. This is much closer to what I had in mind than v1.

[...]

>  
>  const struct ssd130x_deviceinfo ssd130x_variants[] = {
> @@ -206,6 +212,7 @@ const struct ssd130x_deviceinfo ssd130x_variants[] = {
>  	[SSD1331_ID] = {
>  		.default_width = 96,
>  		.default_height = 64,
> +		.format_rgb565 = 1,
>  		.family_id = SSD133X_FAMILY,
>  	}

[...]

>  
>  	iosys_map_set_vaddr(&dst, data_array);
> -	drm_fb_xrgb8888_to_rgb332(&dst, &dst_pitch, vmap, fb, rect, fmtcnv_state);
> +	if (ssd130x->device_info->format_rgb565)
> +		drm_fb_xrgb8888_to_rgb565be(&dst, &dst_pitch, vmap, fb, rect, fmtcnv_state);
> +	else
> +		drm_fb_xrgb8888_to_rgb332(&dst, &dst_pitch, vmap, fb, rect, fmtcnv_state);
>

Since you are changing the SSD1331_ID to use .format_rgb565, what's the
value of keeping the RGB323 support ? It's not used by any other Solomon
family supported by the driver.

Ideally, we would like the driver to expose native formats besides the
virtualized XRGB8888. Geert posted some patches for SSD1301 some time ago:

https://lists.freedesktop.org/archives/dri-devel/2023-August/419937.html

but that never landed.

If that was the case, then SSD130X could expose DRM_FORMAT_XRGB8888 and
DRM_FORMAT_R1; SSD132X would expose DRM_FORMAT_XRGB8888 and DRM_FORMAT_R4 and
SSD133X expose DRM_FORMAT_XRGB8888, DRM_FORMAT_RGB332 and DRM_FORMAT_RGB565.

Given that we don't have that, I suppose that we could just get rid of the
DRM_FORMAT_RGB332 support for SSD133X and just default to DRM_FORMAT_RGB565.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

