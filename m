Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F25F3D9F
	for <linux-staging@lists.linux.dev>; Mon,  4 Sep 2023 13:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693833896;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xPaq3CuDZRpQmuDqucr0HZhD9ZzK56uaUpku88i4nOk=;
	b=OQVg5s8TUYNUhczp7b+AX7o0osHbI7hvP83FPdfMdrUXxScedWqOVc5gYQVi9SM7Fi1syp
	JY32+6CzutwCS7qtkpupDrRs2FPj9ODHEKnIsw40+GC415HbEPP51bR1+B1wmtVfTmK1rH
	v5uOgJV7kXqewAW3Luk+DKeit2e0M4k=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-327-PfhhvYSBMLi4ZnOvfBZ8Ug-1; Mon, 04 Sep 2023 09:24:54 -0400
X-MC-Unique: PfhhvYSBMLi4ZnOvfBZ8Ug-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-402cba95486so7082515e9.0
        for <linux-staging@lists.linux.dev>; Mon, 04 Sep 2023 06:24:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693833893; x=1694438693;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xPaq3CuDZRpQmuDqucr0HZhD9ZzK56uaUpku88i4nOk=;
        b=Agzhp2zk6kgr/lEjVvhdqKC5QKwY2Sff0Huy9ICVjMLQisPradbT/mfSWaDPwNbocS
         wMiGQqB238QI1/ucsmu6GMbi3EXWfdRU3Rtr9TWVThMrilZ/BMJ8M82QnWPcIEFPd1Rh
         Kp6yEDt73tQ5udH0OF4w1jB1nwT92yLEMEgPLhp+mFFyycOjEMOtk8oCYoas6eI7yl8l
         /nIXZt1adXH5TN6tXyfU9qAi4SDPBpzrieffGUNm9qUjldNaDNGlAEBXp0dX9YUC/fHZ
         FbAfgjN8WSgVI2wypkmt4fnVxeQneTKdzZmKwhpieLc+MQJH6nkyTGhAvZC5FTObW78e
         qPhg==
X-Gm-Message-State: AOJu0YyhicLiLGXWzqOLwhbaxxpMmFlMC2ggy8NgUKWq5I7UE2DiN+oe
	yYHO5zeVyfDnHPZrFhhEaRrMikRCjhMnz13qdvjVMz6/ExNKQegv2nQgGuF/flUX5R72sxr6fB7
	O3mzzmK82XDVU7Ngh91ea22hhng==
X-Received: by 2002:a7b:ce18:0:b0:3fb:f0ef:4669 with SMTP id m24-20020a7bce18000000b003fbf0ef4669mr7620181wmc.17.1693833893702;
        Mon, 04 Sep 2023 06:24:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGVceTFRRCJx3QEHC1v0Fwwk5gpR/JTxujmvjvpSbrcXuud5RQf6XSV8UmJ3S8NFK1PJ6NVpQ==
X-Received: by 2002:a7b:ce18:0:b0:3fb:f0ef:4669 with SMTP id m24-20020a7bce18000000b003fbf0ef4669mr7620172wmc.17.1693833893448;
        Mon, 04 Sep 2023 06:24:53 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id m13-20020a7bce0d000000b003fed630f560sm14111682wmc.36.2023.09.04.06.24.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Sep 2023 06:24:53 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de, daniel@ffwll.ch,
 sam@ravnborg.org
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-staging@lists.linux.dev, linux-hyperv@vger.kernel.org,
 linux-input@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>, Jiri
 Kosina <jikos@kernel.org>, Benjamin Tissoires
 <benjamin.tissoires@redhat.com>
Subject: Re: [PATCH 5/8] hid: Remove trailing whitespace
In-Reply-To: <20230828132131.29295-6-tzimmermann@suse.de>
References: <20230828132131.29295-1-tzimmermann@suse.de>
 <20230828132131.29295-6-tzimmermann@suse.de>
Date: Mon, 04 Sep 2023 15:24:52 +0200
Message-ID: <87cyyycbq3.fsf@minerva.mail-host-address-is-not-set>
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

> Fix coding style in Kconfig. No functional changes.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Jiri Kosina <jikos@kernel.org>
> Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> ---

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

