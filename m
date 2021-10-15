Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC9A72C82
	for <linux-staging@lists.linux.dev>; Fri, 15 Oct 2021 18:07:22 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id e12so27889747wra.4
        for <linux-staging@lists.linux.dev>; Fri, 15 Oct 2021 11:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=nxtq8epWJL/jhmwohXGzfNuEJ0aADKyx5lNAaZVeTp0=;
        b=yWeEwuasIkiPhkjbn81eCjsbVr2dUyMx0cw0/wClB0RJZWbVFaoJCqOVezrI+EEN57
         jhu8bq2tYBQmyCZzX6qAXJzgR9b23fwmRd8316N0aSjduPo2isBHBKL24NIGqMP5OB3h
         YjjgJuQiNRln696MnY/HGV0T4MCAB0d+VLhMkEDUgAWu90N4cBoWYPI9jJvr+gGdtZCx
         YPgUvo19Xu9dc2nFKfd6ZGfq0Hdy4OKhSWkOtga/hHnkMIodF6CD5KkP6YIDS7JzWeRN
         +R/eCiui1zoFF8hRwPt4bJ+qSyy+9jLabNiFp+7tm2cA5m8PMGA+zInmWnX0GAc/Y4qh
         Ikyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=nxtq8epWJL/jhmwohXGzfNuEJ0aADKyx5lNAaZVeTp0=;
        b=lpEOO8bnvuGiJ5q2YezjhbI7koNVNKe/oixWFeLLXAVFg5PSCxiwP6PFsTPvViOqa4
         wVRLAUbCjJWXWDlLH7sH+Ivb+1eCpskLsXzOB8rwZ08dNIW8iJTZ5QzUYuQi9AMi+/bu
         uaxQyvCR/4rvFB0wCTLW81hSOuJnYxkv1IckmbWlVZMTE0QWU3Bep2vSDq6pRsmqDiD4
         brWS5k4uz+nOHBn4lqyVXTafx7RF5doojFIOJuDIVHMSHe/hVDsEkiAclgaN2dOBmpwf
         nmQ0ihpo9jHIIsR10cqMkL+scsqNmllKI0OqX59DFMBwcY07wsyMx6dnoOAzxdXUmQCI
         eHYg==
X-Gm-Message-State: AOAM5306p3yxR99R3y6sHdfoU203ycgJYtH7O62u9xzHVWtUW+fkzqeN
	1M96dmAsSJxMJsUSiKKTYsZakg==
X-Google-Smtp-Source: ABdhPJzHBqFfgVKb3EVdigfjWR1r041E4GoKwVYBmqQkOwKwzI8aovWBo+6Z7TSYzTDTWw6gC/6pLw==
X-Received: by 2002:a05:6000:18a3:: with SMTP id b3mr16312728wri.178.1634321241050;
        Fri, 15 Oct 2021 11:07:21 -0700 (PDT)
Received: from equinox (2.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:dfde:e1a0::2])
        by smtp.gmail.com with ESMTPSA id j1sm6536340wrb.56.2021.10.15.11.07.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 11:07:20 -0700 (PDT)
Date: Fri, 15 Oct 2021 19:07:18 +0100
From: Phillip Potter <phil@philpotter.co.uk>
To: Michael Straube <straube.linux@gmail.com>
Cc: Larry.Finger@lwfinger.net, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org
Subject: Re: [PATCH 0/7] staging: r8188eu: odm cleanups
Message-ID: <YWnDVkwcnVEEoxm4@equinox>
References: <20211015163507.9091-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211015163507.9091-1-straube.linux@gmail.com>

On Fri, Oct 15, 2021 at 06:35:00PM +0200, Michael Straube wrote:
> This series removes:
> - empty / unused functions from odm.c
> - two never set / unused fields from odm_dm_struct
> - the function ODM_CmnInfoPtrArrayHook()
> 
> Tested on x86_64 with Inter-Tech DMG-02.
> 
> Michael Straube (7):
>   staging: r8188eu: remove empty functions from odm.c
>   staging: r8188eu: remove ODM_SingleDualAntennaDefaultSetting()
>   staging: r8188eu: remove GetPSDData()
>   staging: r8188eu: remove ODM_AntselStatistics_88C()
>   staging: r8188eu: pBandType is never set
>   staging: r8188eu: pMacPhyMode is not used
>   staging: r8188eu: remove ODM_CmnInfoPtrArrayHook()
> 
>  drivers/staging/r8188eu/hal/HalPhyRf_8188e.c  |   2 +-
>  drivers/staging/r8188eu/hal/odm.c             | 144 ------------------
>  drivers/staging/r8188eu/hal/odm_HWConfig.c    |   7 +-
>  drivers/staging/r8188eu/hal/odm_interface.c   |   5 -
>  drivers/staging/r8188eu/hal/rtl8188e_dm.c     |   2 +-
>  .../staging/r8188eu/hal/rtl8188e_hal_init.c   |   5 +-
>  drivers/staging/r8188eu/include/odm.h         |  38 -----
>  .../staging/r8188eu/include/odm_interface.h   |   2 -
>  drivers/staging/r8188eu/include/odm_precomp.h |   2 -
>  9 files changed, 6 insertions(+), 201 deletions(-)
> 
> -- 
> 2.33.0
> 

Dear Michael,

Looks good to me. Built and tested on my USB-N10 Nano, works well. Many
thanks.

For whole series:
Acked-by: Phillip Potter <phil@philpotter.co.uk>

Regards,
Phil
