Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F1A882D
	for <linux-staging@lists.linux.dev>; Wed,  7 Jun 2023 08:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686128374;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jAHIJ4eh7v+dqxg6uWyXvuAZ3noGOIESAVR0yVwLrLw=;
	b=cAtfEIfFo/duoG78EKIjpktGqrXxRn4LPb3ZD+YVJbLAsgDs8GJs6D/wQ07kFmwyb9CGt2
	T7dWfzXsPGY5b7ETQErnNF6afgP/4fUNytIA4Cv1o/NfTBMinK2gpE6iwNiB7kjjMyj34o
	oqyRG9cuscEK2kMVH60Ay7vfeukx3NY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-641-FYiFrM0DO7Wf82xJxa_bPg-1; Wed, 07 Jun 2023 04:59:31 -0400
X-MC-Unique: FYiFrM0DO7Wf82xJxa_bPg-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-3f6f58e269eso40363375e9.1
        for <linux-staging@lists.linux.dev>; Wed, 07 Jun 2023 01:59:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686128370; x=1688720370;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jAHIJ4eh7v+dqxg6uWyXvuAZ3noGOIESAVR0yVwLrLw=;
        b=cL6dfaq+N59JDvtujp2xRS1b74sUvf/wTxLF+l5jiwCPqt2wtcjifALC4Ly8+A5Ryd
         bMn+zRTUjUgvZBevoMWJZ64ywVqz4Vb66rVjBApQVhH7T55IgHMAPTtWt5mSBQCbJ1mF
         rwssF3wzxYuX85mApQ43BeWQ2HMVZSlGoeecsVrQ1NptVtxOaJ6AXk0rSkb/jD/0/Ql1
         8JJ+X/kYimQysYliW8OSihSaGFIILFn5+5jIIH28lN7GVUz9CIXKytSZMLag5PANm5FI
         7CIi20RAux/dpgDWdhW8eoc9h+QlBagFDfrc+2vZVA5XVbb8CsLHMJBKFMEfh0QQDQMM
         3qBQ==
X-Gm-Message-State: AC+VfDwt7enzGIK1+/cxbUhFJ6ASdIriDo28J22hEJ0mmMmu6z/slwe6
	h33oxVI135GU6ins9fAxPqVfGj5EbWbNadRyvw1lEkpYuIud3oHw8JPuxphtAiVshRINv2OVuwU
	tokAO6Y3jD1s3DNkpvLrfx50+4g==
X-Received: by 2002:a1c:4b0d:0:b0:3f7:5e07:ea54 with SMTP id y13-20020a1c4b0d000000b003f75e07ea54mr4233937wma.13.1686128370565;
        Wed, 07 Jun 2023 01:59:30 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4Qn3iTdYPwZ2PEqyICfVMTtkj5C/L8grzoRqC+iaiUjGk+XghGobRkAfICwnQ/2eAeuKuydg==
X-Received: by 2002:a1c:4b0d:0:b0:3f7:5e07:ea54 with SMTP id y13-20020a1c4b0d000000b003f75e07ea54mr4233912wma.13.1686128370260;
        Wed, 07 Jun 2023 01:59:30 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id v10-20020a05600c470a00b003f1978bbcd6sm6448319wmo.3.2023.06.07.01.59.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 01:59:30 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 sam@ravnborg.org, deller@gmx.de, geert+renesas@glider.be, lee@kernel.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-sh@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-staging@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 10/30] fbdev/ep93xx-fb: Output messages with fb_info()
 and fb_err()
In-Reply-To: <20230605144812.15241-11-tzimmermann@suse.de>
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-11-tzimmermann@suse.de>
Date: Wed, 07 Jun 2023 10:59:29 +0200
Message-ID: <87legvfy1a.fsf@minerva.mail-host-address-is-not-set>
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

> Fix cases were output helpers are called with struct fb_info.dev.
> Use fb_info() and fb_err() instead.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

