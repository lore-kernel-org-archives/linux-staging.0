Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E03A8442D
	for <linux-staging@lists.linux.dev>; Mon,  4 Sep 2023 13:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693833011;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=N/mSHv5PMuG3bI81Fi8Qqn5MlLsevMB4uVfb4i+YDH0=;
	b=C4tJGItN/UauhqaXpI2ukzVQAh0x4+kiSoXLWdi8vIbKc7c9POFdrl9CgXY62yTsM3SGY8
	qsqXKQ63CRmNXBh2HKHBqo5YYs/gIpIQUZh1+F0AWv5WkNcojEV+JB8j+DspXKwNXYHYyg
	SIXz2OyL1VV9WQJ+FvNOou5aMjkWovo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-475-yHWgU0KCPXqA8tn9Z_rn9A-1; Mon, 04 Sep 2023 09:10:10 -0400
X-MC-Unique: yHWgU0KCPXqA8tn9Z_rn9A-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3176fe7b67bso675894f8f.2
        for <linux-staging@lists.linux.dev>; Mon, 04 Sep 2023 06:10:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693833009; x=1694437809;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N/mSHv5PMuG3bI81Fi8Qqn5MlLsevMB4uVfb4i+YDH0=;
        b=iHQeMDZDc9eX0BCIX+Jju68fV00F/eACiEIwJB49wqwjXVzLZyQEh3LHJlnnP9mHjg
         lxFoytKy4Nr5alXr1KtXJBkTC9Uwrc8UmNGhNePDrQZX7GJrNy0wvcD7hp5JIKN+wDGC
         +GTpD8W80VxpoHq587k9mREQLD5TZFE1+WVVeXUGF1E/55rDv1qg7cwtgWs4aNyoKO3K
         XTi9KuKScOhONjBT0+LEkT6gy+DD88mRFbASrNQUrZq6xCor/rIehQbW4Apaq+ieUOqj
         oC8ulnVyElV0cbbnZs5s0Nw0xqsVNj/KivF5JhMvKyoKplQ47hHBPl6iO5cLv209HFgI
         73hg==
X-Gm-Message-State: AOJu0YwgW4jiLlCteMQhtlV60HyKt+DpDC9g6Ym3TAZ77vKQ8RQJ2PoL
	pOfYBRl0NUJdRxmmmQRFP2vpcOdJsfsIbIRaJWt9xFEuIy+71sKiXTt3yG7DvBRucNf1dXv8o7T
	UvAzijk1Jm18yNRuYdBtBR3lCCw==
X-Received: by 2002:adf:ef8b:0:b0:30f:c5b1:23ef with SMTP id d11-20020adfef8b000000b0030fc5b123efmr7031991wro.41.1693833009062;
        Mon, 04 Sep 2023 06:10:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9JbWJdgeGtQs+F3OoOwIvoZMV5mY5Ox6E+5wzrokFqlNDGFgExFwmjqyHm8xhQbFKERp1rA==
X-Received: by 2002:adf:ef8b:0:b0:30f:c5b1:23ef with SMTP id d11-20020adfef8b000000b0030fc5b123efmr7031980wro.41.1693833008804;
        Mon, 04 Sep 2023 06:10:08 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id r5-20020a5d4985000000b00319779ee691sm14461672wrq.28.2023.09.04.06.10.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Sep 2023 06:10:08 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de, daniel@ffwll.ch,
 sam@ravnborg.org
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-staging@lists.linux.dev, linux-hyperv@vger.kernel.org,
 linux-input@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 3/8] fbdev: Add Kconfig macro FB_IOMEM_HELPERS_DEFERRED
In-Reply-To: <20230828132131.29295-4-tzimmermann@suse.de>
References: <20230828132131.29295-1-tzimmermann@suse.de>
 <20230828132131.29295-4-tzimmermann@suse.de>
Date: Mon, 04 Sep 2023 15:10:07 +0200
Message-ID: <87il8qcceo.fsf@minerva.mail-host-address-is-not-set>
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

> The new Kconfig macro FB_IOMEM_HELPERS_DEFERRED selects fbdev's
> helpers for device I/O memory and deferred I/O. Drivers should
> use it if they perform damage updates on device I/O memory.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

