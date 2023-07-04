Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 789CA53B6
	for <linux-staging@lists.linux.dev>; Tue,  4 Jul 2023 16:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688488026;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4kQnHD6yHzrEv/r8EzHQhBzLicpYH1qRl0henJBZG6I=;
	b=Z6CH8M/ZHLDAsTQWumfqlri6yGfrN9KELZP890xgtCuklwIsMGmMDn09WAHhfk2xEjzjfD
	qhk78IjJ2/UYwcq1sAu29w8pXpqRpLE7Hn6ZmK+SUsLSQv1RpDhxL09GJzU2163kyhjlAj
	8fZnVV1iBxX4B2wH75F2llP4f0VjsZQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-163-aS7JDRMTPzuQsjlmNa9_cg-1; Tue, 04 Jul 2023 12:27:03 -0400
X-MC-Unique: aS7JDRMTPzuQsjlmNa9_cg-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-3f5fa06debcso40149345e9.0
        for <linux-staging@lists.linux.dev>; Tue, 04 Jul 2023 09:27:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688488022; x=1691080022;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4kQnHD6yHzrEv/r8EzHQhBzLicpYH1qRl0henJBZG6I=;
        b=RX1vm9pxI45s+7qc/VKJ1IgqsfSYnsTYbv82FUjhVkurBmTxckVm1E0yM8EbTjsemu
         KSSSjY/PG17yVzxXPECQ8dZpEtwOW1ExvvzjxPHKQ4pXAjQZBWh+z91yyLTtuan5HPlH
         xofUtMjRm+i8GjcSshlyU/+E/+oWjDTMiQXaYfkZbsfcXaSwvRdJ4HiVla5MLHKehiEr
         cbMbyF0uwUIt0LXPtT82AMX82w31P0A5RQrfeVkdoSAMaJup2JGwtVJWPFedrBKb+pMd
         VUVwVgAhCur/FpEtUD3uGThYiLEhbdV6mj6JrJFyEaReLqEHGvpLrt0a/dGKkY48V657
         Rqmw==
X-Gm-Message-State: AC+VfDw6Uq8hGid2T+I0HvX+64wCDkjdzAxPghyD10ejcibxmhB7HENv
	tYwHUJ5IuInYNXhq3lcLbW2bujSaIkSJy0j1njy2DJHTHCo8biyHagSh9tj88sQvqBssrCbbCg4
	pYryX6dZaX7jroewzdFcyDAYf2w==
X-Received: by 2002:a05:600c:22cc:b0:3fb:40ee:5465 with SMTP id 12-20020a05600c22cc00b003fb40ee5465mr13432840wmg.22.1688488022230;
        Tue, 04 Jul 2023 09:27:02 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5NuEVxTetvep8Gr1fgiFutV/xXoEkUhrAhQSPThqJdTuxw2Km/uBAzmwN3pOgdQUZIHRImng==
X-Received: by 2002:a05:600c:22cc:b0:3fb:40ee:5465 with SMTP id 12-20020a05600c22cc00b003fb40ee5465mr13432831wmg.22.1688488021988;
        Tue, 04 Jul 2023 09:27:01 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id f3-20020a5d58e3000000b00314329f7d8asm7499354wrd.29.2023.07.04.09.27.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jul 2023 09:27:01 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, arnd@arndb.de, deller@gmx.de,
 daniel@ffwll.ch, airlied@gmail.com
Cc: linux-arch@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-efi@vger.kernel.org, linux-ia64@vger.kernel.org, Thomas Zimmermann
 <tzimmermann@suse.de>, linux-sh@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, loongarch@lists.linux.dev,
 linux-alpha@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, Sudip
 Mukherjee <sudipm.mukherjee@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Teddy Wang
 <teddy.wang@siliconmotion.com>
Subject: Re: [PATCH 04/12] staging/sm750fb: Do not include
 <linux/screen_info.h>
In-Reply-To: <20230629121952.10559-5-tzimmermann@suse.de>
References: <20230629121952.10559-1-tzimmermann@suse.de>
 <20230629121952.10559-5-tzimmermann@suse.de>
Date: Tue, 04 Jul 2023 18:27:01 +0200
Message-ID: <87a5wblk16.fsf@minerva.mail-host-address-is-not-set>
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

> The sm750fb driver does not need anything from <linux/screen_info.h>.
> Remove the include statements.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
> Cc: Teddy Wang <teddy.wang@siliconmotion.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

