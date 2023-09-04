Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B9B27471
	for <linux-staging@lists.linux.dev>; Mon,  4 Sep 2023 13:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693834032;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zxZkq0it8hCbAJaaXiECPzcax9Qu561b49DP/zFJ1B0=;
	b=RpkcatcZze8FSd1aXxYm+TxnJ4pf+TugslB6i1+rcDLfmuwvtrkZB5ux7yaYm8SDelklIA
	5LnHaKviumrOFZHbB+17qUpOXYUxipHzQ6E5wmZVZibFK8BVOW0yhbMbdZy+6X3Ntle/lk
	pG5Fuw2TbOVVzS7B3WWAOgk0tp/CwRI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-426-QZuSPjajOwGcNuNnr_mT-g-1; Mon, 04 Sep 2023 09:27:10 -0400
X-MC-Unique: QZuSPjajOwGcNuNnr_mT-g-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-317d5b38194so643031f8f.0
        for <linux-staging@lists.linux.dev>; Mon, 04 Sep 2023 06:27:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693834029; x=1694438829;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zxZkq0it8hCbAJaaXiECPzcax9Qu561b49DP/zFJ1B0=;
        b=AYvWNAhYEidP0ZN0313MGz3e1G+PQuQiaRfPZxT6HzCERZYbNM7GrFrFr5E/3pVcRi
         jMWCAckL9BuXXtt4hx3Iv2Tl3h+IQf3E8/6WNMt5snN+0EbmuyN3aq7PJ+RdOXdCbSKh
         ha8uxMVHvEoUHqGXko+IceUuxhj306YHBsUHtf4kBBWYRVUUX+Q8VBk/pSBktabYorEA
         dSaGPDhrenZH2L3cLw+tuWmZvsf33c2ZlclQvifq+IwP0kDYE/L8QGRSh5UP+rhiM25O
         J4LvQ69PmtxxfsC1hAcVj67h908i8pUkFK38i7qkP4ChWvfhoRN2S5eVT0xxR1qmHYWL
         4+Eg==
X-Gm-Message-State: AOJu0Yxk7m1Wz78ipvJE7UK9okuZ5hLKmoEyjoMsvcPzflKGOpUb07P9
	PxTB7dQWQRRzsRr/81PKNNHGzYW7IZ1ryaw1Z2be2ks1A3ukf9bN2gzR7upu2UuMKdoZi+6/G02
	qXfot6uXZ8MXmGm8xmFFRM7igQQ==
X-Received: by 2002:a5d:4612:0:b0:317:ce01:fe99 with SMTP id t18-20020a5d4612000000b00317ce01fe99mr7234105wrq.9.1693834029681;
        Mon, 04 Sep 2023 06:27:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFaqwNGWlc6zhQO+ObluvLtHBcvGlX5RhgjUyBHLBy+K84UjEg1PZVnv6fvBEAk50QZ/mL+mA==
X-Received: by 2002:a5d:4612:0:b0:317:ce01:fe99 with SMTP id t18-20020a5d4612000000b00317ce01fe99mr7234089wrq.9.1693834029373;
        Mon, 04 Sep 2023 06:27:09 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id y1-20020adff6c1000000b00317a29af4b2sm14399476wrp.68.2023.09.04.06.27.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Sep 2023 06:27:09 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de, daniel@ffwll.ch,
 sam@ravnborg.org
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-staging@lists.linux.dev, linux-hyperv@vger.kernel.org,
 linux-input@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>, Jiri
 Kosina <jikos@kernel.org>, Benjamin Tissoires
 <benjamin.tissoires@redhat.com>, Bruno =?utf-8?Q?Pr=C3=A9mont?=
 <bonbons@linux-vserver.org>
Subject: Re: [PATCH 6/8] hid/picolcd: Use fb_ops helpers for deferred I/O
In-Reply-To: <20230828132131.29295-7-tzimmermann@suse.de>
References: <20230828132131.29295-1-tzimmermann@suse.de>
 <20230828132131.29295-7-tzimmermann@suse.de>
Date: Mon, 04 Sep 2023 15:27:08 +0200
Message-ID: <87a5u2cbmb.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Generate callback functions for struct fb_ops with the fbdev macro
> FB_GEN_DEFAULT_DEFERRED_SYSMEM_OPS(). Initialize struct fb_ops to
> the generated functions with an fbdev initializer macro.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Jiri Kosina <jikos@kernel.org>
> Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> Cc: "Bruno Pr=C3=A9mont" <bonbons@linux-vserver.org>
> ---

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

