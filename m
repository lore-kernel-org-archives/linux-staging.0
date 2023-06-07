Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55D4C1C3A
	for <linux-staging@lists.linux.dev>; Wed,  7 Jun 2023 07:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686124516;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zrMzVIVwuoeUQwH5hpliW2Jq51XgxuMBmmo9TGjEBeo=;
	b=dQ+LGMm3qhCBheOFOJsgUvhyj/4bCJKIG1eoZQa+lHQu8F7AP+p72iFmSAF+f/v56LzgIF
	maiOiEihhXCvhi14r+WGY6cb3OVmZc+0MRQFnDGmTdBFxyFIsK5AAeVburilz9z/YVAIGl
	8BLPkTUt6sWqQGMudZ9d6CWl4jeyVqU=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-44-1WX1MZyUOpOQAZTwK-wBPQ-1; Wed, 07 Jun 2023 03:55:15 -0400
X-MC-Unique: 1WX1MZyUOpOQAZTwK-wBPQ-1
Received: by mail-lf1-f69.google.com with SMTP id 2adb3069b0e04-4f3f9e8a855so4465149e87.0
        for <linux-staging@lists.linux.dev>; Wed, 07 Jun 2023 00:55:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686124513; x=1688716513;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zrMzVIVwuoeUQwH5hpliW2Jq51XgxuMBmmo9TGjEBeo=;
        b=fMy0e5Q2pZ/rq/mPtp2wMs9R/7F4+jR/cQQzLDOfO2+q6dOY16SeUe6uz5AjMjm50s
         0/GQ8Ban4AW6tlrRN6DwjogRul6iqlC8oG9Z1TWKZOOhXKsnD2co990DGDQF6TmUxd8G
         8FZuC3skmC/yTxt3LcYU7CgR0x3gzSVOlLSeQj+7l2QZziFNpWiNnBye2yJW4idvbSU3
         H+j72GGQmE1ZTJ5msAgK5r0VMyHYhj+wVNt3mKh1YCAQY1u6LguHykLYQJlkMtkWThve
         nKYuYiTFbAPSaFovtuUPrERoVnw3mtuxmtfe0oN9x2FDa0xXhgPrtf12x+XZxkXNmiOy
         IW1g==
X-Gm-Message-State: AC+VfDzP8yRc37oRpHh+CvhWjwdKoz5doOUklq+y7VThMS5W7NYcrSL5
	2EejIfhGCCoZj6JQyrUKszQ+e8M5FYCjBfaP1G74a0bAfHmb7vIHjlmuZY42TZswgrDUHMbLRSz
	L7WWsiEpRBxU1CqjTwvOEdl/I2w==
X-Received: by 2002:ac2:5a19:0:b0:4f3:bb14:bd40 with SMTP id q25-20020ac25a19000000b004f3bb14bd40mr1643617lfn.36.1686124513741;
        Wed, 07 Jun 2023 00:55:13 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5iJQ/YOY5BYJYpCuij2Dk8TuMWnzRrrUQf5oe61hk5gDfo5VjRa0aD7EjgG4gko6svJeBZBA==
X-Received: by 2002:ac2:5a19:0:b0:4f3:bb14:bd40 with SMTP id q25-20020ac25a19000000b004f3bb14bd40mr1643602lfn.36.1686124513442;
        Wed, 07 Jun 2023 00:55:13 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id z9-20020a5d4d09000000b0030e5c8d55f2sm480065wrt.6.2023.06.07.00.55.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 00:55:13 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 sam@ravnborg.org, deller@gmx.de, geert+renesas@glider.be, lee@kernel.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-sh@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-staging@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 07/30] fbdev/aty128fb: Use hardware device as backlight
 parent
In-Reply-To: <20230605144812.15241-8-tzimmermann@suse.de>
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-8-tzimmermann@suse.de>
Date: Wed, 07 Jun 2023 09:55:12 +0200
Message-ID: <87ttvjg10f.fsf@minerva.mail-host-address-is-not-set>
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

> Use the hardware device in struct fb_info.device as parent of the
> backlight device. Aligns the driver with the rest of the codebase
> and prepares fbdev for making struct fb_info.dev optional.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

