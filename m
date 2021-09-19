Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 717413FC0
	for <linux-staging@lists.linux.dev>; Sun, 19 Sep 2021 20:27:29 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id y198-20020a1c7dcf000000b0030b69a49fe9so1957008wmc.1
        for <linux-staging@lists.linux.dev>; Sun, 19 Sep 2021 13:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=PcjFfxcrjteANGpGF7D5h5Ro2oR8eemHGlF4IkMGOLA=;
        b=xGzFp8r1r0uOS42WicW6cab3um5XLbPkFQJQm8JIU0K3l+0J6Z42tRvbq09SJlOnax
         fuaeLB43yebhaS/4O+SpR1uEhJxIiXYskAXKUt5+G9oTJnzYPJVBDQ58VGFrAYBbWtGC
         CPqw0pxp0BJncoFFI2h+8MV61GmQle4NOuEgcsCO/BC5rIp0wwd+1uH/uRe89qe+TdPo
         /PqY1YCIrC3+XzG1EbYnd8vUZ95a/IwiuSHneUVdAo7XKG3iyYppgsBNjLD6oVrsyuRU
         Mymko/6EBQdLpJN1/d0vpVk05JtLaqDr1mYb1JBbTmPjJNGPwDfqFDxkF3TlWkSmjMOs
         PrEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=PcjFfxcrjteANGpGF7D5h5Ro2oR8eemHGlF4IkMGOLA=;
        b=XfTiJ+6z2yq9Wg2GaoopharYubllFOhBWdLmDW8Tvq2y1IwUwT86KqunLCi5/4h80B
         9bVT8AEmZt4rB3QMjgoWYh6ZEb0+EJn6oai7CSsFIs9yb1TNdTiStJIbyXnM9XABAiKH
         9ZNqieIc1PDFm3Jhl4jAI9wXdY6xKBLySPYm9WCZcQRIjnIFTGkNDEZGNXomDXfWZWHo
         2EVhh41bKdrmpJP3okNLOYiQXJ0bX9okv76XRxCW8oXDZEhasqAB/jBkO6X36ePqvaVW
         a3CngN2jBDTyQDdCBOFLgUMtWAqFV1PNV4Tr0BD+QycLN7d4Dg8w5KyAJRHjnXXKaMke
         /h4Q==
X-Gm-Message-State: AOAM530eGb2KnwnHUSvTiV59+klGl1rNSwqkwVdE9QS+m8I3dIsekjvw
	AfxkUTnescY/CPux8l7eMfgzNg==
X-Google-Smtp-Source: ABdhPJy4enHG97or0jjruzghXKph7A17B5yf1KXMX+/obgR+oI9hpHXdapukTthLw77i5Vt3cksTJg==
X-Received: by 2002:a1c:7f11:: with SMTP id a17mr3130088wmd.166.1632083247680;
        Sun, 19 Sep 2021 13:27:27 -0700 (PDT)
Received: from equinox (2.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:dfde:e1a0::2])
        by smtp.gmail.com with ESMTPSA id y8sm13407878wrh.44.2021.09.19.13.27.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Sep 2021 13:27:27 -0700 (PDT)
Date: Sun, 19 Sep 2021 21:27:25 +0100
From: Phillip Potter <phil@philpotter.co.uk>
To: Michael Straube <straube.linux@gmail.com>
Cc: gregkh@linuxfoundation.org, Larry.Finger@lwfinger.net, martin@kaiser.cx,
	fmdefrancesco@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/6] staging: r8188eu: remove unused functions from
 rtw_ap.c
Message-ID: <YUedLaAAp1jZiUvL@equinox>
References: <20210919153659.20826-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210919153659.20826-1-straube.linux@gmail.com>

On Sun, Sep 19, 2021 at 05:36:53PM +0200, Michael Straube wrote:
> This series removes all unused functions from rtw_ap.c.
> 
> Michael Straube (6):
>   staging: r8188eu: remove ap_sta_info_defer_update()
>   staging: r8188eu: remove rtw_acl_add_sta()
>   staging: r8188eu: remove rtw_acl_remove_sta()
>   staging: r8188eu: remove rtw_ap_inform_ch_switch()
>   staging: r8188eu: remove rtw_check_beacon_data()
>   staging: r8188eu: remove rtw_set_macaddr_acl()
> 
>  drivers/staging/r8188eu/core/rtw_ap.c    | 584 -----------------------
>  drivers/staging/r8188eu/include/rtw_ap.h |   6 -
>  2 files changed, 590 deletions(-)
> 
> -- 
> 2.33.0
> 

Dear Michael,

Looks good to me, built and tested here with no warnings and driver
working fine still. Many thanks.

For all six patches:
Acked-by: Phillip Potter

Regards,
Phil
