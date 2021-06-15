Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B67972
	for <linux-staging@lists.linux.dev>; Tue, 15 Jun 2021 21:05:58 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id q5so138295wrm.1
        for <linux-staging@lists.linux.dev>; Tue, 15 Jun 2021 14:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=2Wx+tcZvz91pXnw6InT/qEG2moWHuT1szhDanRgENzU=;
        b=q7X5wN73PsE/0wdrcnvqy58p30gqci/187A+7D6QCS3Ifuwa4NVOtbQc94lwbFC/MM
         up16BfbxkdIXi+GJ70F8/Ql6y9eHBgjDyD+hj51V6m9g7tVCe80Tb2Jh7xHG7+fWaX8O
         8iS8RaXyQXuU3VQG97xseJ0yKbnXY/Dllbl6ip7mvzfACgYtrpRZi5vyrxAAhHlhIoZz
         ZmPWXgV/w4jWoNL09L0JShha+sojoCLO5rNzlgBvGpmt3bAJfehcaj7cRpUvyQ2rd1pc
         jI8ytb0VgQUfkqivNyx+BzZtz/O4aI5B/LMEKwBCkqIpC90A3hL4/Z5gvxPWLIDG2mmu
         OVuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2Wx+tcZvz91pXnw6InT/qEG2moWHuT1szhDanRgENzU=;
        b=f0N4J+J3XvyUGa9WtOx5/HjBkXEtu1mE1z0OHEQ7V6Rni6S/NBcEKFK5x+dvydVv9Q
         TgyLRTFLfMEOPuEQjZCYU+GyWkLeMFRyrrDcXepWfV9ohg49J2DbMwLVTbgXu/QTRVP5
         drrSq75wtkpMYo7xzMdETYG/0wE6ooaPm2k4/8BvAZruiJPghOBoTWq2uPlz2Kv6u6tM
         tG24LTu+V9lKuz8DOTCBbHiyFi5zS0tDQiBaa7yrcgXACXgXxcOmT7W3E0Hf3jgG5lqN
         0Ua8i2SUvHJAidLnkLN32sr+lqFxYhpFodylAIDMITdrusCtAqD5A47T+0nHvyG7BSxz
         fLbA==
X-Gm-Message-State: AOAM533lbVKSvjq5w2K1UJSlXf2MFbZAtOHNlWR40ODeAM1OqKQkWn7d
	L8DM01p+9fY4SLGy207jesIiaw==
X-Google-Smtp-Source: ABdhPJxymK3GdbVzZZzHAQdd8YBUWaMFNr+5eWNHc7AD0J1uHlr7WKKeulRwm2UG/M3C+B+2i5APkA==
X-Received: by 2002:adf:ea4c:: with SMTP id j12mr1226600wrn.64.1623791156825;
        Tue, 15 Jun 2021 14:05:56 -0700 (PDT)
Received: from KernelVM (2.0.5.1.1.6.3.8.5.c.c.3.f.b.d.3.0.0.0.0.6.1.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:df16:0:3dbf:3cc5:8361:1502])
        by smtp.gmail.com with ESMTPSA id n7sm2943744wmq.37.2021.06.15.14.05.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jun 2021 14:05:56 -0700 (PDT)
Date: Tue, 15 Jun 2021 22:05:54 +0100
From: Phillip Potter <phil@philpotter.co.uk>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Larry.Finger@lwfinger.net, dan.carpenter@oracle.com,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 00/28] staging: rtl8188eu: remove DBG_88E callers and
 macro
Message-ID: <YMkWMsE/m99cM47/@KernelVM>
References: <20210615001507.1171-1-phil@philpotter.co.uk>
 <YMiVtgVTGQSb+iC2@kroah.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YMiVtgVTGQSb+iC2@kroah.com>

On Tue, Jun 15, 2021 at 01:57:42PM +0200, Greg KH wrote:
> On Tue, Jun 15, 2021 at 01:14:39AM +0100, Phillip Potter wrote:
> > This patch series removes DBG_88E calls from all places in the driver,
> > and then removes the DBG_88E macro definition itself. It also takes two
> > prior patches where I convered DBG_88E calls into netdev_dbg calls, and
> > removes these calls too.
> > 
> > It cleans up subsuently unused local variables along the way, removes an
> > unused static function too, and also contains a reissue of my previous
> > patch to remove core/rtw_debug.c which is entirely unused by the driver
> > and thus is dead code.
> > 
> > Phillip Potter (28):
> >   staging: rtl8188eu: remove all DBG_88E calls from core/rtw_efuse.c
> >   staging: rtl8188eu: remove all DBG_88E calls from core/rtw_xmit.c
> >   staging: rtl8188eu: remove all DBG_88E calls from core/rtw_mlme_ext.c
> >   staging: rtl8188eu: remove all DBG_88E calls from core/rtw_wlan_util.c
> >   staging: rtl8188eu: remove all DBG_88E calls from core/rtw_ap.c
> >   staging: rtl8188eu: remove all DBG_88E calls from core/rtw_pwrctrl.c
> >   staging: rtl8188eu: remove all DBG_88E calls from core/rtw_ieee80211.c
> >   staging: rtl8188eu: remove all DBG_88E calls from core/rtw_security.c
> >   staging: rtl8188eu: remove all DBG_88E calls from core/rtw_ioctl_set.c
> >   staging: rtl8188eu: remove all DBG_88E calls from core/rtw_mlme.c
> >   staging: rtl8188eu: remove all DBG_88E calls from os_dep/ioctl_linux.c
> >   staging: rtl8188eu: remove all DBG_88E calls from os_dep/usb_intf.c
> >   staging: rtl8188eu: remove all DBG_88E calls from os_dep/os_intfs.c
> >   staging: rtl8188eu: remove all DBG_88E calls from os_dep/mlme_linux.c
> >   staging: rtl8188eu: remove all DBG_88E calls from os_dep/xmit_linux.c
> >   staging: rtl8188eu: remove all DBG_88E calls from os_dep/rtw_android.c
> >   staging: rtl8188eu: remove all DBG_88E calls from hal/hal_intf.c
> >   staging: rtl8188eu: remove all DBG_88E calls from hal/rtl8188e_cmd.c
> >   staging: rtl8188eu: remove all DBG_88E calls from hal/pwrseqcmd.c
> >   staging: rtl8188eu: remove all DBG_88E calls from
> >     hal/rtl8188e_hal_init.c
> >   staging: rtl8188eu: remove all DBG_88E calls from hal/rtl8188e_xmit.c
> >   staging: rtl8188eu: remove all DBG_88E calls from hal/usb_halinit.c
> >   staging: rtl8188eu: remove all DBG_88E calls from hal/rtl8188eu_recv.c
> >   staging: rtl8188eu: remove all DBG_88E calls from hal/rtl8188eu_xmit.c
> >   staging: rtl8188eu: remove converted netdev_dbg calls from
> >     core/rtw_recv.c
> >   staging: rtl8188eu: remove converted netdev_dbg calls from
> >     core/rtw_sta_mgt.c
> >   staging: rtl8188eu: remove core/rtw_debug.c
> >   staging: rtl8188eu: remove DBG_88E macro definition
> > 
> >  drivers/staging/rtl8188eu/Makefile            |   1 -
> >  drivers/staging/rtl8188eu/core/rtw_ap.c       |  78 +-----
> >  drivers/staging/rtl8188eu/core/rtw_debug.c    | 187 -------------
> >  drivers/staging/rtl8188eu/core/rtw_efuse.c    |  15 +-
> >  .../staging/rtl8188eu/core/rtw_ieee80211.c    |  38 +--
> >  .../staging/rtl8188eu/core/rtw_ioctl_set.c    |   8 -
> >  drivers/staging/rtl8188eu/core/rtw_mlme.c     |  54 +---
> >  drivers/staging/rtl8188eu/core/rtw_mlme_ext.c | 262 ++----------------
> >  drivers/staging/rtl8188eu/core/rtw_pwrctrl.c  |  40 +--
> >  drivers/staging/rtl8188eu/core/rtw_recv.c     |  66 +----
> >  drivers/staging/rtl8188eu/core/rtw_security.c |   2 -
> >  drivers/staging/rtl8188eu/core/rtw_sta_mgt.c  |   9 -
> >  .../staging/rtl8188eu/core/rtw_wlan_util.c    |  80 ++----
> >  drivers/staging/rtl8188eu/core/rtw_xmit.c     |  40 +--
> >  drivers/staging/rtl8188eu/hal/hal_intf.c      |   3 -
> >  drivers/staging/rtl8188eu/hal/pwrseqcmd.c     |   4 +-
> >  drivers/staging/rtl8188eu/hal/rtl8188e_cmd.c  |  42 +--
> >  .../staging/rtl8188eu/hal/rtl8188e_hal_init.c |  45 +--
> >  drivers/staging/rtl8188eu/hal/rtl8188e_xmit.c |  15 -
> >  .../staging/rtl8188eu/hal/rtl8188eu_recv.c    |   8 -
> >  .../staging/rtl8188eu/hal/rtl8188eu_xmit.c    |   5 -
> >  drivers/staging/rtl8188eu/hal/usb_halinit.c   |  51 +---
> >  drivers/staging/rtl8188eu/include/rtw_debug.h |  31 ---
> >  .../staging/rtl8188eu/os_dep/ioctl_linux.c    | 144 +---------
> >  drivers/staging/rtl8188eu/os_dep/mlme_linux.c |   4 -
> >  drivers/staging/rtl8188eu/os_dep/os_intfs.c   |  26 --
> >  .../staging/rtl8188eu/os_dep/rtw_android.c    |  15 +-
> >  drivers/staging/rtl8188eu/os_dep/usb_intf.c   |   1 -
> >  drivers/staging/rtl8188eu/os_dep/xmit_linux.c |   8 +-
> >  29 files changed, 86 insertions(+), 1196 deletions(-)
> >  delete mode 100644 drivers/staging/rtl8188eu/core/rtw_debug.c
> 
> Deleting that many lines of code is always nice, thanks for doing this,
> now all applied.
> 
> greg k-h

Dear Greg,

Thanks for taking the patches, happy to help.

Regards,
Phil
