Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C885C70
	for <linux-staging@lists.linux.dev>; Mon,  2 Aug 2021 17:19:52 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id x11so31128459ejj.8
        for <linux-staging@lists.linux.dev>; Mon, 02 Aug 2021 10:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Kgsw97NVFKM1NINGpazGJg2D+jbYM5Prts4Ms4WIhmw=;
        b=V24lPFLG2LkOzZKhAdjBSrv1m8CzKwqWczXzFUcQ9/0xznmVvi7sEd+mhQN6++WoBj
         +0Z8YejWKRUZplZqoI+L3jQtZeJJ/sDNpRIgxBClq77omFhDi8D1Vl7+6bakiZNv94MK
         DN54P3eRJfKX8Ne76B1WDUiRgfcMTfEhyaudW26C13CeODIAB1UXrlbHRAO3hMCpePlv
         MGuBRlP5HWXlcLpkEnOivm9qYt2n+uyhoB2L6TGVRPPj9D5e+7Sf0ZKCHqyghQF1HmS6
         ZYRqhDJ1ST2+Ogw8Win3DkrqtLzG/OB0aK/MDvI8KqZFjSYX8lxycD4lFtLLpFduJ2HS
         WFuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Kgsw97NVFKM1NINGpazGJg2D+jbYM5Prts4Ms4WIhmw=;
        b=tA3/4ziU9OZaNXFnwZM9vN7mUy1ChDQj0MU1DNUgRHhU2DE2RZP3s4wWedh0xsr9Of
         VT0GUqU4QymBNatLkK45Vu8Lsi9vg0SHiQpOMUJj5LI1y8gtzSXG8kwTNVLfze3IzGtG
         yns6xN6rqHOkRqJIS72LfFMZTSsiHjR+qS43t3KBpzkgzPXY5q/eoo4Pcql/IXGKw0F1
         5jw8CGaLzpRLZnsmFAcxXV9zqmkI5EUrssp3tg2WyjSRM4zVgcEhlN1FGr7iRywT6EBD
         uDg+0HdUuL/YcfRaHHQLH6iK49fSOAgSwQXfJweyxHgfbS3fmZjpc/fLm8ohdBLbD9Z/
         3n4w==
X-Gm-Message-State: AOAM533O94rv2wS0l8M8L/XIdq+zaW5oZTF9l+KSjub8ppUCgNU2wqAn
	LZAQlysj1f1gTcfjQMh5iJI=
X-Google-Smtp-Source: ABdhPJzfs+VXJzaVSlUOPcsjhzwAWXyway26QjidiyNlOSGXySMPb8uhUgvdTqr5iP10dop+aX6S4Q==
X-Received: by 2002:a17:906:e0ce:: with SMTP id gl14mr16496132ejb.168.1627924791169;
        Mon, 02 Aug 2021 10:19:51 -0700 (PDT)
Received: from agape.jhs ([5.171.8.39])
        by smtp.gmail.com with ESMTPSA id i16sm6516196edr.38.2021.08.02.10.19.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Aug 2021 10:19:50 -0700 (PDT)
Date: Mon, 2 Aug 2021 19:19:48 +0200
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>
Cc: gregkh@linuxfoundation.org, phil@philpotter.co.uk,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/6] Clean up some extraneous wrappers and some empty
 routines
Message-ID: <20210802171947.GA1405@agape.jhs>
References: <20210802151546.31797-1-Larry.Finger@lwfinger.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210802151546.31797-1-Larry.Finger@lwfinger.net>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Larry,

On Mon, Aug 02, 2021 at 10:15:40AM -0500, Larry Finger wrote:
> The original code created some wrappers to handle the differences between
> Linux and Windows. In a Linux-only version, these can be removed.
> 
> Larry Finger (6):
>   staging: r8188eu: Remove wrappers for kalloc() and kzalloc()
>   staging: r8188eu: Remove wrapper around vfree
>   staging: r8188eu: Remove wrappers for atomic operations
>   staging: r8188eu: Remove 4 empty routines from os_sep/service.c
>   staging: r8188eu: Remove all calls to _rtw_spinlock_free()
>   staging: r8188eu: Remove more empty routines
> 
>  drivers/staging/r8188eu/core/rtw_ap.c         |   8 +-
>  drivers/staging/r8188eu/core/rtw_br_ext.c     |   2 +-
>  drivers/staging/r8188eu/core/rtw_br_ext.c.rej |  11 ++

what these .rej files are?

>  drivers/staging/r8188eu/core/rtw_cmd.c        |  16 +--
>  drivers/staging/r8188eu/core/rtw_efuse.c      |   4 +-
>  drivers/staging/r8188eu/core/rtw_efuse.c.rej  |  20 ++++
>  drivers/staging/r8188eu/core/rtw_mlme.c       |  15 +--
>  drivers/staging/r8188eu/core/rtw_mlme_ext.c   |  44 +++----
>  .../staging/r8188eu/core/rtw_mlme_ext.c.rej   | 107 ++++++++++++++++++
>  drivers/staging/r8188eu/core/rtw_mp.c         |   5 +-
>  drivers/staging/r8188eu/core/rtw_p2p.c        |   8 +-
>  drivers/staging/r8188eu/core/rtw_p2p.c.rej    |  18 +++
>  drivers/staging/r8188eu/core/rtw_recv.c       |  16 +--
>  drivers/staging/r8188eu/core/rtw_sta_mgt.c    |  48 +-------
>  drivers/staging/r8188eu/core/rtw_wlan_util.c  |   2 +-
>  drivers/staging/r8188eu/core/rtw_xmit.c       |  26 +----
>  drivers/staging/r8188eu/hal/odm_interface.c   |   2 +-
>  drivers/staging/r8188eu/hal/rtl8188e_cmd.c    |   2 +-
>  .../staging/r8188eu/hal/rtl8188e_cmd.c.rej    |  11 ++
>  .../staging/r8188eu/hal/rtl8188e_hal_init.c   |  10 +-
>  .../r8188eu/hal/rtl8188e_hal_init.c.rej       |  34 ++++++
>  drivers/staging/r8188eu/hal/rtl8188eu_recv.c  |   3 +-
>  .../staging/r8188eu/hal/rtl8188eu_recv.c.rej  |  12 ++
>  drivers/staging/r8188eu/hal/usb_halinit.c     |   2 +-
>  drivers/staging/r8188eu/hal/usb_halinit.c.rej |  11 ++
>  drivers/staging/r8188eu/include/drv_types.h   |   2 +-
>  .../staging/r8188eu/include/odm_precomp.h.rej |  19 ++++
>  .../staging/r8188eu/include/osdep_service.h   |  28 -----
>  drivers/staging/r8188eu/include/rtw_cmd.h     |   2 +-
>  .../staging/r8188eu/include/rtw_mlme_ext.h    |   2 +-
>  drivers/staging/r8188eu/include/usb_ops.h     |   4 +-
>  drivers/staging/r8188eu/os_dep/ioctl_linux.c  |  70 ++++++------
>  drivers/staging/r8188eu/os_dep/mlme_linux.c   |   3 +-
>  drivers/staging/r8188eu/os_dep/os_intfs.c     |   2 -
>  .../staging/r8188eu/os_dep/osdep_service.c    | 105 +----------------
>  drivers/staging/r8188eu/os_dep/rtw_android.c  |   2 -
>  drivers/staging/r8188eu/os_dep/usb_intf.c     |  10 +-
>  drivers/staging/r8188eu/os_dep/xmit_linux.c   |   2 +-
>  .../staging/r8188eu/os_dep/xmit_linux.c.rej   |  11 ++
>  39 files changed, 366 insertions(+), 333 deletions(-)
>  create mode 100644 drivers/staging/r8188eu/core/rtw_br_ext.c.rej
>  create mode 100644 drivers/staging/r8188eu/core/rtw_efuse.c.rej
>  create mode 100644 drivers/staging/r8188eu/core/rtw_mlme_ext.c.rej
>  create mode 100644 drivers/staging/r8188eu/core/rtw_p2p.c.rej
>  create mode 100644 drivers/staging/r8188eu/hal/rtl8188e_cmd.c.rej
>  create mode 100644 drivers/staging/r8188eu/hal/rtl8188e_hal_init.c.rej
>  create mode 100644 drivers/staging/r8188eu/hal/rtl8188eu_recv.c.rej
>  create mode 100644 drivers/staging/r8188eu/hal/usb_halinit.c.rej
>  create mode 100644 drivers/staging/r8188eu/include/odm_precomp.h.rej
>  create mode 100644 drivers/staging/r8188eu/os_dep/xmit_linux.c.rej
> 
> -- 
> 2.32.0
> 
> 

thank you,

fabio
