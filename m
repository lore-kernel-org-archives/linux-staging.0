Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B485D3F88BB
	for <linux-staging@lists.linux.dev>; Thu, 11 Jun 2026 12:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781182100; cv=none; b=Un7w6vdWpD+6KSyRJHm+K9Z5u3G/CRm/1uE+6GDZGZiXpKOoNjUDi0h1Q92pjFDAqVKPjbe6PmSc4MddLvDYgMiU0z6j1fA4CUqhuRy81zisTgZbWPZVgdg2GcgPfsIaGapZPg1MqlE2UnbnhSXxm2B3g6UVaYXdnLH5LGCDhJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781182100; c=relaxed/simple;
	bh=jswscyQO7qxXCvv4Y1PfbCoSNO4Ch1dNjHJqtmcgpNQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DXo10BdElA6uv5awnlYhkyEhFbwit6n2jjA+q+iCz647pqaKBBZcfQQv79IDwcfhb9vqJE9AJqWVj317qhr86VI8v/Un+ki4Uvi2B7r6JJBHwdfjK3ZocvVEJs2IfSz2HCWLU6N+cdKJBf5w3T3zE/ZwBARBHFX34KHU8LMlr+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y4TFUL/u; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y4TFUL/u"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-9157b949fc7so847754285a.3
        for <linux-staging@lists.linux.dev>; Thu, 11 Jun 2026 05:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781182098; x=1781786898; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=T+pTu6sknGcI/PaeXRmshhqG/nGTT+PmPs7yDZdMNV8=;
        b=Y4TFUL/uDNwN9jQfUp0+Q6RG+TK+ujLxgD5H0LLXCHdzq/YQ7yEeFIHmSI0pwpOLu6
         98lSYCOt38Dudx4O5E7iYK6b972uVp0drYqnEyWunce1c3ZQVbryrGi58yCGFfXa0SFI
         Ln2fOEaqNQhTMYHIIOoIr7Ej0M4wMFg7xZeYxToWol5z/QQ7ITJuGI2PL9RC5WDz8ilA
         WTZB7Gq5hYUA7ou8PpCU5+dAKZiCp7/7uvEZdXcNWnyROkBbOdkJbVAd96IK7UZOv5zJ
         9umqGNC8fO6xpsIZHKTRFPNs2kjMAScY6SmPW6CP6nfvUL0LYF0gJzMxiad7pmt7vTFy
         cxmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781182098; x=1781786898;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T+pTu6sknGcI/PaeXRmshhqG/nGTT+PmPs7yDZdMNV8=;
        b=XK6U1fI2MXgP8m6PUobW6kRuH7gHiLYIR5fPWUlX6up4FZn9mclCDoFf1pW4HiZTl/
         UZxMgOZ72yYmZxAM+GjujG4f4TcwIJnZWrEbmH3UcfRqfgXBaGt4frT7OK+xeIVObHqK
         yyUHHzKMvyCdN/cCoGoP34vQ9ryWwxZdyr6e50M7VBz3gF/miaz7R+38Iu9xmTaCfloB
         7kuWW4y3fYdz4KOVikgUK70Te3n9HHYCo++1tOVq0lvUX+b1OUas6lMqhtO09NHBgkQ3
         YpEqsuUM+0AjHBJs2/vxMnAb83Dy0zIVkTqvitxQiui+gLA269GUjiul0f4KoBBBaIn0
         n6fQ==
X-Forwarded-Encrypted: i=1; AFNElJ9YTRn1qukGDkZe/J8MxH0mREt47U7tRpHSOQ2mpBTgUxjLNvsv3+FJaoPFIuEUAnFMMVlLIQxeDr0PUege@lists.linux.dev
X-Gm-Message-State: AOJu0YwIAtQTLmeRyQWjUOuJ/yW9St9SEn8gPt0wwIfZlk6nohvat5A0
	ZoHvq3KcYtOjn3MMtLfOlKKyswKzxPILL9i8XgLIs2sROkIhTJJ8RDI8
X-Gm-Gg: Acq92OF/me+M0NG50GRE7DhKVFuWDOJhSDfd+T2CtRSsebgdk3Pmk0ws7cRB4uv61Fr
	C7/eq8146sJ+jVJ9egxW3BGGbdr/CYTJcf1o7L3XvzPJnJr7i1iBhBh4cB9KhN22fOw1M6eW+fa
	9MrRY2usS0hioABjlO8nhU3tFz/bAlM7zf+8Ew8ghsduYGLm12SX+hrA3iQrQzgeSVT8DUbPkuq
	9b+J1dB3GDJ8m6EmQonrVpEcucGNx566MEAYuzaa7htvsiMfCqpwjeIkCKNHOv+AjsE1rNTEeBD
	s+4GOrGXnASTUdt6CkG2b/cNFRONDFtd7aELUmL0xex2ZDPbQ+s0Mk1DMN5q8k05aOwOiodDIK4
	lmcTZTsOXLrlvBZ1FP3/EKGONTUQDi6FcU3JIc3CB/OH9llVkohxTCgNvO7+kIGOrjrlHoWmDO+
	FG7hGx0SEq3lpGy3YzxhprAIWclYS4coe75zGsqw==
X-Received: by 2002:a05:620a:19a6:b0:915:8c48:4975 with SMTP id af79cd13be357-9160ad9784fmr371779485a.34.1781182097698;
        Thu, 11 Jun 2026 05:48:17 -0700 (PDT)
Received: from localhost ([149.40.50.215])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9160adf5118sm180036285a.24.2026.06.11.05.48.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 05:48:16 -0700 (PDT)
Date: Thu, 11 Jun 2026 15:48:11 +0300
From: Dan Carpenter <error27@gmail.com>
To: WenTao Liang <vulab@iscas.ac.cn>
Cc: parthiban.veerasooran@microchip.com, christian.gromm@microchip.com,
	gregkh@linuxfoundation.org, hverkuil+cisco@kernel.org,
	laurent.pinchart+renesas@ideasonboard.com, s9430939@naver.com,
	kees@kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] staging: most: video: fix refcount leak in
 comp_probe_channel()
Message-ID: <aiquiwEtXTmSpyJf@stanley.mountain>
References: <20260611114335.77216-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611114335.77216-1-vulab@iscas.ac.cn>

On Thu, Jun 11, 2026 at 07:43:35PM +0800, WenTao Liang wrote:
> If v4l2_device_register() fails in comp_probe_channel(), the
> function frees the allocated mdev with kfree() without releasing the
> reference count held by the embedded v4l2_device.  Because
> v4l2_device_register() initializes a kref in the v4l2_device, the
> reference count is already 1 on failure.  Dropping the last reference
> must be done with v4l2_device_put() so that the release callback can
> unregister the v4l2_device and free mdev.

What are you talking about here?

	kref_init(&v4l2_dev->ref);

This is just a "refcount = 1" assignment.  There is no allocation or
need to free anything.

> 
> Replace the kfree(mdev) with v4l2_device_put(&mdev->v4l2_dev).  The
> error path for comp_register_videodev() failure already does this
> correctly.

This is a weird and confusing to say.  In comp_register_videodev()
we call video_device_release() which is a wrapper around kfree() and
here the original code calls kfree() directly...  The original code
is more similar to comp_register_videodev() than the new code.

> 
> Cc: stable@vger.kernel.org

CCing stable isn't necessary since v4l2_device_register() can't actually
fail here in real life.

drivers/media/v4l2-core/v4l2-device.c
    17  int v4l2_device_register(struct device *dev, struct v4l2_device *v4l2_dev)
    18  {
    19          if (v4l2_dev == NULL)

v4l2_dev is non-NULL.

    20                  return -EINVAL;
    21  
    22          INIT_LIST_HEAD(&v4l2_dev->subdevs);
    23          spin_lock_init(&v4l2_dev->lock);
    24          v4l2_prio_init(&v4l2_dev->prio);
    25          kref_init(&v4l2_dev->ref);
    26          get_device(dev);
    27          v4l2_dev->dev = dev;
    28          if (dev == NULL) {

dev is NULL

    29                  /* If dev == NULL, then name must be filled in by the caller */
    30                  if (WARN_ON(!v4l2_dev->name[0]))

The name is filled in.

    31                          return -EINVAL;
    32                  return 0;
                        ^^^^^^^^
We return success.

    33          }

> Fixes: 3d31c0cb6c12 ("Staging: most: add MOST driver's aim-v4l2 module")
> Signed-off-by: WenTao Liang <vulab@iscas.ac.cn>

Please put in the commit message if this that this was discovered via AI
and not tested or whatever...

> ---
>  drivers/staging/most/video/video.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/most/video/video.c b/drivers/staging/most/video/video.c
> index 04351f8ccccf..aa846959b217 100644
> --- a/drivers/staging/most/video/video.c
> +++ b/drivers/staging/most/video/video.c
> @@ -491,7 +491,7 @@ static int comp_probe_channel(struct most_interface *iface, int channel_idx,
>  	ret = v4l2_device_register(NULL, &mdev->v4l2_dev);
>  	if (ret) {
>  		pr_err("v4l2_device_register() failed\n");
> -		kfree(mdev);
> +		v4l2_device_put(&mdev->v4l2_dev);

v4l2_device_put() will call comp_v4l2_dev_release() which is calls:

	v4l2_device_unregister(v4l2_dev);
	kfree(mdev);

The call to v4l2_device_unregister() is a no-op since the register
failed (pretending that were possible) so at runtime this is the exact
same as calling kfree(mdev);

So this is not a bug.  The original code is fine.  We could argue
about readability, but I feel like the original code is in some ways
more readable.  I don't like calling unregister() when the device
is not registered.

regards,
dan carpenter

>  		return ret;
>  	}
>  
> -- 
> 2.50.1 (Apple Git-155)
