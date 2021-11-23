Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B760A2C81
	for <linux-staging@lists.linux.dev>; Tue, 23 Nov 2021 23:49:27 +0000 (UTC)
Received: by mail-ot1-f44.google.com with SMTP id r10-20020a056830080a00b0055c8fd2cebdso1350651ots.6
        for <linux-staging@lists.linux.dev>; Tue, 23 Nov 2021 15:49:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vZ6pBwF1NuzbVzImJ7QGAdV4gsNd/T58S8MXtt6omVM=;
        b=fTZoFX+cx6Va5ji4D3zVGwUKeZ7E43iQgDaAthrMbfJ/BnhQgQQezOW/3JzdS706xs
         yJ4BS2xbfbXrjhLLyoLJ+e3HjWQDuAo3imKP7N/kJlY9nj3S3hVulW5NKlHgLK1pL3AW
         Qi73arkCJGSEl3iaVZfWIYmFFKFu7tamViUAsQqZxGgsr+6fb5wzhgajXs/+Vw0V0Zvk
         UT+MTYotGQtc/DMu4pTvkqLZjDvlak+qtBpNBY8Ly8W61azJ4n/+uDoBagGKTnZWgJP7
         R07ebBr2j2XDbk7X7EGja1KiQqj2vHwOKNOsqTiALniuaTup2mxiXsigfxWo/K1IFXT/
         Ps3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vZ6pBwF1NuzbVzImJ7QGAdV4gsNd/T58S8MXtt6omVM=;
        b=QFvH8lbrMCh1Hv96gXjjMX1ccc026YdQf0f8dYUn5W0opwCAmfbaMe7JFdQciELu2P
         aNfPUFVeYztVVorBDifL4P0V8moF47nghgWem7oJiNwlm3ts8anVPNkoeIY3BX11bfZV
         i0ys4dzjkA+9pwZikVJbHcfJTvo/wQhKpSwlgCXV059/T86ZOz8IBsphOBhIqDUxaieX
         wRCsr/plI5Mqib3ULaGdP9zfyb8c9lYdgUScEboW6Ve99/iv4M/PVTls90yAQncp/F9H
         CmYRMsDR6BLxqsHtrZg+05sq2YsO7AToTqvsfcp4omYCfC/uVkRiYsvdlrLdFdqnYsJ8
         HYdg==
X-Gm-Message-State: AOAM532VqdCvKkTwnWgt3TRTMmanGEnRx9WdcNOtSnokZId/llNxH4lc
	hsvLQ+Gxtu/OwPQ2v1mXBid88uHS3e/KWEfHWeI=
X-Google-Smtp-Source: ABdhPJzxS4DBIwjcle3VRvJgjdsTQlL8lgfqIB5O/DV/uuvWrOs3nV3ub0rGc64u01tfzkD5jS0UyX8oBFWgH69kgjU=
X-Received: by 2002:a05:6830:2646:: with SMTP id f6mr8631680otu.182.1637711366923;
 Tue, 23 Nov 2021 15:49:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211122195350.GA166134@makvihas> <52ad7e4f-7164-e868-ca49-2f0fecda3395@gmail.com>
In-Reply-To: <52ad7e4f-7164-e868-ca49-2f0fecda3395@gmail.com>
From: Vihas Mak <makvihas@gmail.com>
Date: Wed, 24 Nov 2021 05:19:15 +0530
Message-ID: <CAH1kMwQz3=1uf5cR2sgNrWq6f+6x9icCYXXZLO4V41kS_mTr+w@mail.gmail.com>
Subject: Re: [PATCH] staging: r8188eu: remove unnecessary NULL check
To: Pavel Skripkin <paskripkin@gmail.com>
Cc: Larry.Finger@lwfinger.net, Phillip Potter <phil@philpotter.co.uk>, 
	Greg KH <gregkh@linuxfoundation.org>, straube.linux@gmail.com, martin@kaiser.cx, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

>> BTW, same can be done in rtw_usb_if1_init().

Yea, I noticed that too. But the NULL check  in rtw_usb_if1_init() has
a follow up "else if", so I didn't change it.

Thanks,
Vihas

On Tue, Nov 23, 2021 at 2:52 AM Pavel Skripkin <paskripkin@gmail.com> wrote:
>
> On 11/22/21 22:53, Vihas Mak wrote:
> > remove unnecessary NULL check surrounding rtw_free_netdev(), as the check
> > is already performed inside rtw_free_netdev() in
> > drivers/staging/r8188eu/os_dep/osdep_service.c.
> >
> > Signed-off-by: Vihas Mak <makvihas@gmail.com>
>
> Reviewed-by: Pavel Skripkin <paskripkin@gmail.com>
>
> BTW, same can be done in rtw_usb_if1_init().
>
>
>
> With regards,
> Pavel Skripkin
