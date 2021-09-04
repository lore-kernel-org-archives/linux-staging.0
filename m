Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF0C63FC7
	for <linux-staging@lists.linux.dev>; Sat,  4 Sep 2021 05:58:49 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id u6so1203577pfi.0
        for <linux-staging@lists.linux.dev>; Fri, 03 Sep 2021 22:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=f/n2nxuDHHhZ11WJWH1zIlD9cd3WmDx7yPKho8Os6hw=;
        b=LjUuzuQVdKjipEN2HiXMhHaHtudEzYHRvcJnqfs0vWkUitj1LMLoQZcKIkvBzB+Xed
         1qzvhzGnXJkO8S/5XUgq4B4Te2lxgP2Qtf27F57OSHz24RxZCu13mNa17cAtaIXstmss
         dYeVSWpFb/JRD9w4Y4JruCSnCkoKFprbuD08uoR/SApfFCxPK4EkCa7tVWxG37oiOcLz
         zOVvD9koX4x20oUdHL/HU+Pw/XtGQtUA2B/91birEDb+baLWB0XvOuEsRsNVvnQzrH5D
         x/91lbI03+KU6mfsivAF0k4iiQBwiYhAbnFN41z8AgBZqS4Q9mIowPMdC7XZD9VTyY+D
         QwPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=f/n2nxuDHHhZ11WJWH1zIlD9cd3WmDx7yPKho8Os6hw=;
        b=KdDG9+OofSRfcsegzp3/OgY8mjqZUp0DnsW6lD3WLpVL2TA5vpDU+u8Fatrg6N+Gjx
         HIHa5jBdlqZIX2PRZ94hFGwV5Bkz+sM73DBFnbX46VUnPF3sBCi0e5P1Jnk04mf59mb5
         YPp0HzGVYh+8eH1Io+ecmGDN6tEzLTGAezSauvIKzsLoqu2882btb3IlhBUXhonmFJJn
         2TCD4gc7W/JukF6k8nl67i2Ios+x00TNJpCx+E6HqGMuERgHSoA1vSQ91XspwmyPRD6w
         eAOkZYIrf8THyoeiJAagC21Ed4VJyqIZ/jYmqWx1ug1xBn6DLZcBuxHTg77VSqfM5Vp1
         Estw==
X-Gm-Message-State: AOAM533T/WtM5Wegr5N9OWsyI9VPwcBNd4/GsKcUjBUtvIGRWtkr/FOv
	bBQXTGah/R9szvQH6ulKV6c=
X-Google-Smtp-Source: ABdhPJy9L0JX9a9KbH7pkZ2BFzJGUNJlWX2uQNcel6crBH60SUmj0Aw0+gOqLX/1uAsXm7g3jN42dw==
X-Received: by 2002:aa7:90c8:0:b029:32c:935f:de5f with SMTP id k8-20020aa790c80000b029032c935fde5fmr2207340pfk.79.1630735129318;
        Fri, 03 Sep 2021 22:58:49 -0700 (PDT)
Received: from user ([117.98.200.228])
        by smtp.gmail.com with ESMTPSA id b20sm1057325pfl.9.2021.09.03.22.58.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 22:58:48 -0700 (PDT)
Date: Sat, 4 Sep 2021 11:28:43 +0530
From: SAURAV GIREPUNJE <saurav.girepunje@gmail.com>
To: Michael Straube <straube.linux@gmail.com>
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	gregkh@linuxfoundation.org, fabioaiuto83@gmail.com,
	ross.schm.dev@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, saurav.girepunje@hotmail.com
Subject: Re: [PATCH v4] staging: r8188eu: core: remove null check before vfree
Message-ID: <YTMLE9tIYCv6uNeE@user>
References: <YSu9GQa1A3s6FYQx@user>
 <bf3547a3-bca0-cb81-b086-0d7a9bfe6e7c@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bf3547a3-bca0-cb81-b086-0d7a9bfe6e7c@gmail.com>

On 30 Aug 2021 14:09, Michael Straube wrote:
> On 8/29/21 19:00, Saurav Girepunje wrote:
> > Remove NULL check. NULL check before freeing function is not needed.
> > Correct the indentation.
> >
> > Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
> > ---
> >
>
> Acked-by: Michael Straube <straube.linux@gmail.com>
>
> Thanks,
> Michael


Thanks for Review Michael


Saurav
