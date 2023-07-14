Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C0F611CA4
	for <linux-staging@lists.linux.dev>; Fri, 14 Jul 2023 10:29:54 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-3fbea14700bso15968295e9.3
        for <linux-staging@lists.linux.dev>; Fri, 14 Jul 2023 03:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689330592; x=1691922592;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Mh5IM3hcbkTlsZ0QohBnPm9+/WljTdptQDAe3KRHGao=;
        b=O5ufoN9bQiWKXDmCStIX+Io10WRu2B69Deqb5KVzrXV2sqgY9JCnNvyATagBuE+ark
         IS32r2PfYWd5XlLUlJoSJAAAXm5+hxTEjMb0ZCe5fK3NGofpUv7OKY9G8Xf6nBs65XhV
         mN24wwtq2SFoDgOh1XzRQP48JVgtE3qQg6DtMC8WgMhj9t2D3law3WPvQE1ujYDEF2HF
         HQ2Wfv1wVIeu2S+ZqWDReHbCASDvhIqXVdLZ+6qiMuNgb/mQI71489JITRwjOarUlIKd
         T4bv/caHqvEm2PmjsCWaoXFBLjd4pTJ0r4FnJChubfG5R2bSvz1FrPJ8nXiDNobJSVlf
         ylLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689330592; x=1691922592;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mh5IM3hcbkTlsZ0QohBnPm9+/WljTdptQDAe3KRHGao=;
        b=BLp6m8LAk9STZxJCyeQciWRbnOi8fAgaZj1DtYzYes3JjoH73Wk7u5CdTCSCCmDuM7
         +hJ8Mub0grHpR6RrBYywYDKQ+E689HzAFVylDIontOn2KHlIAoeZ7UjI3LYyh1AzPN1T
         9dSyCFkqxJAOHJuS03uE0BP5gyKFgFppTpd8ow/wr3iORXz3IHDZQfhMs164OXbiaJRt
         rMJ5LCuPjbzm4utBpW/xuZbkVcQEVkqDzqwbffN17z+PfOD5brcIjwL7fcj5Y9IibSs6
         /s8Q89rxzUzsbORRKK4DF1w/J4mP5Vyhs7r5vGymgGVz9yrThLwrJdqV2XNrBANzLeQ9
         WXow==
X-Gm-Message-State: ABy/qLaxDdqk9e1+eYzCyYouYIfHzHRN6d1gbyJyDzetD4stLbgTDQqP
	h/yhBx7HgxN3DvC5OpA+rXG/ew==
X-Google-Smtp-Source: APBJJlFnsQ9uvLjsHZQ9SREHQ216HPPGjASy9AiZYJZlWwyGhQieiRuOjHKJ7s1mAu1WpSfMQoCtmw==
X-Received: by 2002:a05:600c:2254:b0:3fa:984d:7e9f with SMTP id a20-20020a05600c225400b003fa984d7e9fmr3534844wmm.6.1689330592448;
        Fri, 14 Jul 2023 03:29:52 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id p26-20020a7bcc9a000000b003fbb5506e54sm1094832wma.29.2023.07.14.03.29.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jul 2023 03:29:50 -0700 (PDT)
Date: Fri, 14 Jul 2023 13:29:47 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-fbdev@vger.kernel.org,
	kvm@vger.kernel.org, linux-hyperv@vger.kernel.org,
	linux-sh@vger.kernel.org, deller@gmx.de,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	amd-gfx@lists.freedesktop.org, javierm@redhat.com,
	dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
	linux-nvidia@lists.surfsouth.com, linux-omap@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-geode@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v3 00/18] fbdev: Remove FBINFO_DEFAULT and
 FBINFO_FLAG_DEFAULT flags
Message-ID: <b3c23ea3-f46c-43b9-b12a-9f55de2294c6@kadam.mountain>
References: <20230714075155.5686-1-tzimmermann@suse.de>
 <CAMuHMdWoeyJPAgPgFi545SJFcaVCgZi1-zW2N5cBeU9BnHgo1w@mail.gmail.com>
 <47a3ab8d-5e8c-db2c-fcde-5c2b1bac32aa@suse.de>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <47a3ab8d-5e8c-db2c-fcde-5c2b1bac32aa@suse.de>

On Fri, Jul 14, 2023 at 12:24:05PM +0200, Thomas Zimmermann wrote:
> > 
> > >    fbdev: Remove flag FBINFO_DEFAULT from fbdev drivers
> > >    fbdev: Remove flag FBINFO_DEFAULT from fbdev drivers
> > >    fbdev: Remove flag FBINFO_DEFAULT from fbdev drivers
> > >    fbdev: Remove flag FBINFO_DEFAULT from fbdev drivers
>
>
> I wasn't happy about this either. But I could not come up with a description
> that fits into the 74-char limit for each commit. They only differ in the
> method of memory allocation. Do you have any ideas?

fbdev: Remove FBINFO_DEFAULT from static structs
fbdev: Remove FBINFO_DEFAULT from kzalloc() structs
fbdev: Remove FBINFO_DEFAULT from devm_kzalloc() structs

regards,
dan carpenter

