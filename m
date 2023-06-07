Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E24B56FC2
	for <linux-staging@lists.linux.dev>; Wed,  7 Jun 2023 07:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686123401;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VCpM3n9uxiNBqWYphesbEdJfBdCBdNVjlNpr9KooViE=;
	b=IXtZa3k9G+j2InWFcIipN6/AtSQoZyrLaSy9r0BLgAmFyrJ+HDripo8AV/zugNQ0+zoyGm
	fgRT3oWOrLtNrt1rqHwbxn6TH1O9/8gm9zJC2sMiFCE25OM0Z6VX2zi+6iCbd69PBQpxzB
	ctOc10/YsT5b72Gqbbq+SPsulkWtINc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-349-a9FcKN3zPw-GN67HInROFg-1; Wed, 07 Jun 2023 03:36:40 -0400
X-MC-Unique: a9FcKN3zPw-GN67HInROFg-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-3f41a04a297so33625345e9.3
        for <linux-staging@lists.linux.dev>; Wed, 07 Jun 2023 00:36:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686123399; x=1688715399;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VCpM3n9uxiNBqWYphesbEdJfBdCBdNVjlNpr9KooViE=;
        b=EiUerFkobIuFcrwfQvYM6k2uyj9RnnPFIrUKoUvdc+neEJsg66l4R2ZsNWdD7hu9XT
         eUP8aSrRdBv+P+2YhakgNY5DoYuhlHRTOP4jg6znwE6i1vAHHLPe839i5hhFwLGJHXWy
         Dy24cdOq2qUYRP1+xvCJIaUOB2HVlbSJVG1w2KZrfmqemyrH7HwR61zu7s+SnXAVQe0S
         UqdBRHyqwTBRMuASA5Q3uW8+EOQx4j9N6+3l82SYQCTt+pKja4nMnUD4GZwkXd6dJvVu
         C5DB8hREGUBZ4I9JqZxQ8BuX/6Z0UeH27od8dX6/j0QiyA1geRCr0bu5Z009avg5+/r6
         MBPQ==
X-Gm-Message-State: AC+VfDyFb4Q+uAVyVXT0bCrG+PA0g2snDAsN1D5GaaiLQlD7i3kSv4+U
	+nCL/KTKuSXT5PLQdB7FeKGknYq3kNUb1p4xi3grHy5ZCHJ6F/VnaXIXs07Ayf8gYNGnmbyuIfB
	wg+bUEws0jfGgn0yjePCs+Iq18W+nLoWyDA==
X-Received: by 2002:adf:fc48:0:b0:30a:f0fd:dca4 with SMTP id e8-20020adffc48000000b0030af0fddca4mr3438816wrs.3.1686123399229;
        Wed, 07 Jun 2023 00:36:39 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4QHTJetA/ydYNcZpnkz18WI9SIVhHJpnswtj0+WuXSdy2RjUolx7XRR0vsMR7cmSEWXP1qKQ==
X-Received: by 2002:adf:fc48:0:b0:30a:f0fd:dca4 with SMTP id e8-20020adffc48000000b0030af0fddca4mr3438803wrs.3.1686123398984;
        Wed, 07 Jun 2023 00:36:38 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id t7-20020a1c7707000000b003f6cf9afc25sm1125337wmi.40.2023.06.07.00.36.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 00:36:38 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 sam@ravnborg.org, deller@gmx.de, geert+renesas@glider.be, lee@kernel.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-sh@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-staging@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 04/30] fbdev/atyfb: Reorder backlight and framebuffer
 init/cleanup
In-Reply-To: <20230605144812.15241-5-tzimmermann@suse.de>
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-5-tzimmermann@suse.de>
Date: Wed, 07 Jun 2023 09:36:37 +0200
Message-ID: <873533hgfu.fsf@minerva.mail-host-address-is-not-set>
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

> The driver's backlight code requires the framebuffer to be
> registered. Therefore reorder the init and cleanup calls for
> both data structures.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

