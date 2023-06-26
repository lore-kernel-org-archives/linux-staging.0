Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25CE8C04
	for <linux-staging@lists.linux.dev>; Mon, 26 Jun 2023 12:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1687782435;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Q7A4QtIPQ46OJKI9lflLzm3DTzPmnZrWIQG2/OeQ3hc=;
	b=E40kuhyeeJn+memFc4h8hHi9mddsNPlOd953mDRSvscvBcf5NU/bQmOlvuP7q/BGrMFe5Z
	g+nwJr9/dgM+xEv7IteGQB6cYLSiRuX5HTFX/K7vvzSjTBrCuWS/l7pVQZZXpBVl7w1u2h
	M08dtx7zAFeW96v/DGscvYb5crW1pMM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-352-FwxpWXZ5N4ux2fAIcR3_aQ-1; Mon, 26 Jun 2023 08:27:12 -0400
X-MC-Unique: FwxpWXZ5N4ux2fAIcR3_aQ-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3112e243c68so2466802f8f.0
        for <linux-staging@lists.linux.dev>; Mon, 26 Jun 2023 05:27:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687782431; x=1690374431;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q7A4QtIPQ46OJKI9lflLzm3DTzPmnZrWIQG2/OeQ3hc=;
        b=av8j4AF//AVNcx8QDj2Z7yRLExv4M/z7C9fEET7tLIGVKCBHGziwnDJiZld+xNHGv+
         vA0EAMjCJp7p18vIPjbhm1SjaUfbYCsmQu2eQjmn1ICO/bQnzIMuhd7LCE+ux6OzBMaU
         pBEp4VW0JZGuIO/AucRxI63RabpQ/n0C6RlE4oyrouosEDP64o5+pN88HUdI+Sya24cW
         XntiIsNUjkkqW1x1zdMG5Y6JQkh1+uZ7ySXb7E2+4mxGOK8PW6Ii8ORdhwubpWJ783n8
         BqqHBEiTD1qcp0Tt5DVDCEopn/eoGll0gqEgmzzbtt8NYFWa/t/NWsu9hbfMFjLh4hYj
         z45Q==
X-Gm-Message-State: AC+VfDzwYvbrezgEv5zOYRX0L0t9UmVI0dN65uqrdIT0bOIAkO11xXUs
	4grqQ6tJMq5hqe/plkZqh2t0yzSKhWrSpeKAOrjo1snOVsohGwMpFDlcmUozo2n5R9Ckd9VYUrF
	Gdnq/83OGI+FzzgVZQsMbsFd52g==
X-Received: by 2002:adf:e98b:0:b0:30f:befc:d864 with SMTP id h11-20020adfe98b000000b0030fbefcd864mr25143861wrm.62.1687782431247;
        Mon, 26 Jun 2023 05:27:11 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5s+xo+3GocfRAN2ddT936OL6TbSjlftKvOe/WQg4sXaYYvHxhA/vC/T+Q/4yNgIvb7WBFVgw==
X-Received: by 2002:adf:e98b:0:b0:30f:befc:d864 with SMTP id h11-20020adfe98b000000b0030fbefcd864mr25143851wrm.62.1687782430944;
        Mon, 26 Jun 2023 05:27:10 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id s11-20020a5d69cb000000b00313f07ccca4sm3108010wrw.117.2023.06.26.05.27.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 05:27:10 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 sam@ravnborg.org, deller@gmx.de, geert+renesas@glider.be, lee@kernel.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com,
 dan.carpenter@linaro.org, michael.j.ruhl@intel.com
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-sh@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Thomas
 Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 27/38] fbdev/sh7760fb: Alloc DMA memory from hardware
 device
In-Reply-To: <20230613110953.24176-28-tzimmermann@suse.de>
References: <20230613110953.24176-1-tzimmermann@suse.de>
 <20230613110953.24176-28-tzimmermann@suse.de>
Date: Mon, 26 Jun 2023 14:27:09 +0200
Message-ID: <87sfaeh0iq.fsf@minerva.mail-host-address-is-not-set>
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

> Pass the hardware device to the DMA helpers dma_alloc_coherent() and
> dma_free_coherent(). The fbdev device that is currently being used is
> a software device and does not provide DMA memory. Also update the
> related dev_*() output statements similarly.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

