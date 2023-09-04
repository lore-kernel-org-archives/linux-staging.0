Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B0CAD5F
	for <linux-staging@lists.linux.dev>; Mon,  4 Sep 2023 13:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693834098;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=z8BbS0VR+viLE45lChE7wLN6LwznzmsTUr7hWT6afTU=;
	b=ZiAZFSGOxYgxpFBYbTMXDXXXhXWGWdpyuSB/p7MK4lE9bcU45hBJFEO5k0zohlJSXT+TZx
	JMPWokm687TDw79vaWBM7OfVdJl/MyOvKyp39MgOoImVH7de2rMQ2FW44OV+e8A4aldo45
	FsQ7DI5fhBpOSL6bA9zRFWenDE+M2Z8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-267-e3Mt2wKhPYi1nQK6T_Guxw-1; Mon, 04 Sep 2023 09:28:17 -0400
X-MC-Unique: e3Mt2wKhPYi1nQK6T_Guxw-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-402c46c4a04so9491675e9.2
        for <linux-staging@lists.linux.dev>; Mon, 04 Sep 2023 06:28:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693834096; x=1694438896;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z8BbS0VR+viLE45lChE7wLN6LwznzmsTUr7hWT6afTU=;
        b=ALliEi5DTPm0uOwbx7eSO64NvZQuCRKjWMmliURLN2/504AReMF+wPhEv6DbE9rUJt
         GE1Y6SRfzhLRTLD7diXfiqsb8uaBtzPzBrzYbhKkh3bWl1AxLC4zkTMwmMXwXNX+ewb6
         7SZRjtZ8nly3zeBZq/lXKGi9IUpUSj/ihcSVjsfzQjWzW92DtaxL2udognlIsPqJi3qm
         tI5XnqgCPJXXEp/wubetsxTVgPaMWRVAjuxvkWdJvnBijKqd8FgBULtzCcLT6jByO8B1
         rSsbgxSvXWQiV4OskfHgngJQAHRE40lKsrE71E+wVAREWMm5v7KffOSxIFnvhRrtGCpN
         jfWg==
X-Gm-Message-State: AOJu0YyQBd1wQlyB+u3lWX9pRlevtVYSjlKDzcHYEbQibOTYWTCmj0jl
	BJ7YiTsKbM1tW8vPDDz23dcEwsYCocGqh4EOnFV/V9t3KjzENKFQ95UE9qV0qBho9kYWXxQphmd
	ez7oymk+XnqD0+S387xEN/kt0Ow==
X-Received: by 2002:a05:600c:2945:b0:3fe:89be:cd3 with SMTP id n5-20020a05600c294500b003fe89be0cd3mr7455266wmd.22.1693834095944;
        Mon, 04 Sep 2023 06:28:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHl7VfR/OsiuaD0NLKpcBP58yIezvg5tTwL4OjRo81CSensP8glNKF1MPDnFaTMcS52nY0Kpw==
X-Received: by 2002:a05:600c:2945:b0:3fe:89be:cd3 with SMTP id n5-20020a05600c294500b003fe89be0cd3mr7455246wmd.22.1693834095589;
        Mon, 04 Sep 2023 06:28:15 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id p9-20020a1c7409000000b003fee53feab5sm14253513wmc.10.2023.09.04.06.28.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Sep 2023 06:28:15 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de, daniel@ffwll.ch,
 sam@ravnborg.org
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-staging@lists.linux.dev, linux-hyperv@vger.kernel.org,
 linux-input@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 7/8] staging/fbtft: Initialize fb_op struct as static const
In-Reply-To: <20230828132131.29295-8-tzimmermann@suse.de>
References: <20230828132131.29295-1-tzimmermann@suse.de>
 <20230828132131.29295-8-tzimmermann@suse.de>
Date: Mon, 04 Sep 2023 15:28:14 +0200
Message-ID: <877cp6cbkh.fsf@minerva.mail-host-address-is-not-set>
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

> Replace dynamic allocation of the fb_ops instance with static
> allocation. Initialize the fields at module-load time. The owner
> field changes to THIS_MODULE, as in all other fbdev drivers.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

