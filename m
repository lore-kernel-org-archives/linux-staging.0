Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 966418C05
	for <linux-staging@lists.linux.dev>; Wed,  7 Jun 2023 08:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686127671;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zDz69+oFYWXX1BmnVAcHgBw7nzJBGz38VxVt62J1FoQ=;
	b=RuEld8eDXoU2w3kOBIdcX5OySp2s3PWlgYi9CReAGTXYH9VwxCmZ79DBzRdD9o6td1aMqh
	71kaTIR2B7c5qoWcByAJVhgC3xA8KktytlcafXb3TC+Mvm9x7LOdq/SieKu6ysTvaoAPLS
	jm6nePnjpDlBM1ddR6ej/wB2UQB0Slg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-444-XPo3N1S7OgGSdNN4y1ASOQ-1; Wed, 07 Jun 2023 04:47:49 -0400
X-MC-Unique: XPo3N1S7OgGSdNN4y1ASOQ-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3079c6648e3so3861617f8f.2
        for <linux-staging@lists.linux.dev>; Wed, 07 Jun 2023 01:47:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686127668; x=1688719668;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zDz69+oFYWXX1BmnVAcHgBw7nzJBGz38VxVt62J1FoQ=;
        b=gZ2AKzgH9HjR+YeCQIwt7xd8mC5VRvWgo8wsubpQEHk1mSm5iskx5cp09TF5K4jF0B
         G1qJ14kyWGXZj9VIn4zM0J5o9warCoQ0VMoM7De4D2K8CpJhawoJ26nHmkcFgIXKoyAr
         1youiLTTf5c86zujKOjEcKoKtlBTghHGxAH+8ktnl1SPqFkbpO3/VumQqfwWMGcGG+sM
         1onjieJVjE2bFkiUZvcbmeYbIDTLbNyUlYCG5of23eKMxrTDy90PBh/zlA2rDklLZVL0
         bZMmg9zt9ToXbMU5040zJSqEnIxCNNM8zpuE1epoJQZAIO29p9NsdRXDG/ZOeyB921uy
         Z3qQ==
X-Gm-Message-State: AC+VfDzAT8jMwqvjzq8V3iQy74C2z5yAL1vrdGx9wb3yqTnQesvvEB5p
	3EU6PZPpJCSjP0n25r4eiE/+xV5v6EDpYYlis4zR/etycbyAt38M2JaXIxfT5/fFtzFjSq16+Xt
	IeGPMJ2srhZZpAkoy4sXTEXJthg==
X-Received: by 2002:a5d:45c6:0:b0:30a:e495:2544 with SMTP id b6-20020a5d45c6000000b0030ae4952544mr3492881wrs.23.1686127668651;
        Wed, 07 Jun 2023 01:47:48 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4HyIAuVGnzEFE0Y0RegoBmQPKta0aQoYnV+QnWWgwUwsjGZISbQLbaBPCUULIqP84aItfwIg==
X-Received: by 2002:a5d:45c6:0:b0:30a:e495:2544 with SMTP id b6-20020a5d45c6000000b0030ae4952544mr3492862wrs.23.1686127668360;
        Wed, 07 Jun 2023 01:47:48 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id n1-20020a5d6601000000b0030e5b1fffc3sm1029071wru.9.2023.06.07.01.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 01:47:48 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 sam@ravnborg.org, deller@gmx.de, geert+renesas@glider.be, lee@kernel.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-sh@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-staging@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 09/30] fbdev/ep93xx-fb: Alloc DMA memory from hardware
 device
In-Reply-To: <20230605144812.15241-10-tzimmermann@suse.de>
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-10-tzimmermann@suse.de>
Date: Wed, 07 Jun 2023 10:47:47 +0200
Message-ID: <87o7lrfyks.fsf@minerva.mail-host-address-is-not-set>
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

> Pass the hardware device to the DMA helpers dma_alloc_wc(), dma_mmap_wc()
> and dma_free_coherent(). The fbdev device that is currently being used is
> a software device and does not provide DMA memory.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

