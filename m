Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB19971
	for <linux-staging@lists.linux.dev>; Tue, 22 Jun 2021 13:22:14 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id i94so23634245wri.4
        for <linux-staging@lists.linux.dev>; Tue, 22 Jun 2021 06:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=LUO6vg1QrRDDYmaaeflr/Aky3r2WNn95OnvTztYnmaI=;
        b=Z3u+dk4dOtPg+/eVwdjRdKkc/q9o+rFa/dSefQfkpl2kqBi7CKNHmV/VXFrLuxR9uM
         wCTo3YDoDK8UYT+oMF0FRCXLrea4xmjP6Z97hOA4PrP7LKHLdZQvLvRpwnewUU+pAdTw
         goGUYKwfUm5Zttvy9sIcxxiUpwhemeY31+FdSaHXYUYL0AvLKxBUetMsAWwBnRZC8zSp
         /jpY5euPRlbdGEJ/Tt7xdqxNpx64Cz3GE9HkRLQTwM4OB7ibfqLBtB8XHwEXbOZHOuWQ
         qITECbkMUqiX1Is2p60dd8o9WtxddhA2B+TFKBdD8f88R/EmdykKCxd4XmneJwuW/qXu
         14mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=LUO6vg1QrRDDYmaaeflr/Aky3r2WNn95OnvTztYnmaI=;
        b=kQu9q7DGIAzzOIgXPX+tPJN8Uo0xMLdiw+S7oaslqcX2FjrH5PtMPWxj71yXrBHhVG
         5TYJANtEqdSx3GO6f3g7rv6qVkVNRlAUWMlPUrmLS4QwTiD54Iz2/aXyDmbszC/UfIzn
         TYJpiKVkujNP6xKiKBDpjKQG49dmPtlfEHzSjL0NxNgIO6Fkw5E1p9/uW8FU2zTbQmSn
         WVSmQpYoR1xn2b73f8ZPTQDLjAuJaLE8kTRPgLLT4AAdTPX3S0eUlebRjwudLzxEFM0l
         WPPXIL+8j+xFzVdfJR0Md0zSasGWnUMMuAG0b1cmMW5By4PU/xQKyXHC16rPGBn4LUAt
         /AZg==
X-Gm-Message-State: AOAM5312Zh8UfiRJ6xlLwKN1GrSIV+LpxpPEqaR7v6X8DB9sJ7lEq8vt
	PgtdF0tB/Haf1tvVIeTAKo0=
X-Google-Smtp-Source: ABdhPJz8AOoDpkCX0YewEVrDNZdxyVtkiLBRsF5iUFOyshOwZYWonAuxF3yqtJs6MMMfAVnCpUclbg==
X-Received: by 2002:a5d:6485:: with SMTP id o5mr4711440wri.91.1624368133350;
        Tue, 22 Jun 2021 06:22:13 -0700 (PDT)
Received: from agape.jhs ([5.171.73.108])
        by smtp.gmail.com with ESMTPSA id o26sm2334517wms.27.2021.06.22.06.22.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jun 2021 06:22:13 -0700 (PDT)
Date: Tue, 22 Jun 2021 15:22:10 +0200
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: gregkh@linuxfoundation.org, Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 00/17] staging: rtl8723bs: remove 5Ghz code
Message-ID: <20210622132210.GB1410@agape.jhs>
References: <cover.1624367071.git.fabioaiuto83@gmail.com>
 <20bed383-adca-e2f0-bede-762707d052ac@redhat.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20bed383-adca-e2f0-bede-762707d052ac@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Hans,

On Tue, Jun 22, 2021 at 03:19:45PM +0200, Hans de Goede wrote:
> Hi,
> 
> On 6/22/21 3:09 PM, Fabio Aiuto wrote:
> > This patch series removes all occurences of 5Ghz code over the
> > driver as required from driver's TODO list:
> > 
> >         - find and remove remaining code valid only for 5 GHz.
> >           most of the obvious one have been removed, but things
> >           like channel > 14 still exist.
> > 
> > rtl8723bs work on 2.4Ghz band and supports 802.11bgn standards.
> > So all code related to 802.11a/ac standard is removed, as well
> > as code related to channel numbers above 14.
> > 
> > VHT code is deleted as well, for it's related to 802.11ac.
> > 
> > Comments are fixed accordingly and many unused variables are
> > deleted.
> > 
> > Every single patch of this series has been tested on a
> > Lenovo Ideapad MIIX 300-10IBY except for the last one,
> > for obvious reason (it deletes just the TODO item).
> > So:
> > 
> > Tested-by: Fabio Auto <fabioaiuto83@gmail.com>
> 
> From a quick scan the series looks ok to me now:
> 
> Acked-by: Hans de Goede <hdegoede@redhat.com>
> 
> Regards,
> 
> Hans

thank you,

fabio


> 
> 
> 
> 
> > ------------------------------------------------
> > Changes in v3:
> > 	- delete a condition in patch 1 as pointed out by
> > 	  Hans
> > 	- fix in 'Changes in v2' text (pointed out).
> > Changes in v2:
> >         - drop v1 15/18 patch, for it deliberately
> >           does register writes as pointed out by Hans.
> > 
> > Fabio Aiuto (17):
> >   staging: rtl8723bs: remove all 5Ghz network types
> >   staging: rtl8723bs: remove code related to unsupported channel
> >     bandwidth
> >   staging: rtl8723bs: remove unused enum items related to channel
> >     bonding
> >   staging: rtl8723bs: rename enum items related to channel bonding
> >   staging: rtl8723bs: remove 5Ghz field in struct registry_priv
> >   staging: rtl8723bs: remove struct rt_channel_plan_5g
> >   staging: rtl8723bs: remove all branchings between 2.4Ghz and 5Ghz band
> >     types
> >   staging: rtl8723bs: beautify prototypes in include/hal_com_phycfg.h
> >   staging: rtl8723bs: remove 5Ghz code related to channel plan
> >     definition
> >   staging: rtl8723bs: remove some unused 5Ghz macro definitions
> >   staging: rtl8723bs: remove 5Ghz code related to RF power calibration
> >   staging: rtl8723bs: remove VHT dead code
> >   staging: rtl8723bs: remove unused ODM_CMNINFO_BOARD_TYPE enum item
> >   staging: rtl8723bs: fix macro value for 2.4Ghz only device
> >   staging: rtl8723bs: remove obsolete 5Ghz comments
> >   staging: rtl8723bs: fix check allowing 5Ghz settings
> >   staging: rtl8723bs: remove item from TODO list
> > 
> >  drivers/staging/rtl8723bs/TODO                |    2 -
> >  drivers/staging/rtl8723bs/core/rtw_ap.c       |   11 +-
> >  .../staging/rtl8723bs/core/rtw_ieee80211.c    |   22 +-
> >  drivers/staging/rtl8723bs/core/rtw_mlme.c     |   10 -
> >  drivers/staging/rtl8723bs/core/rtw_mlme_ext.c |  328 ++---
> >  .../staging/rtl8723bs/core/rtw_wlan_util.c    |   29 +-
> >  drivers/staging/rtl8723bs/core/rtw_xmit.c     |    5 +-
> >  .../staging/rtl8723bs/hal/HalBtc8723b1Ant.c   |    4 +-
> >  .../staging/rtl8723bs/hal/HalBtc8723b2Ant.c   |    5 +-
> >  drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h  |    1 -
> >  .../staging/rtl8723bs/hal/HalHWImg8723B_BB.c  |   17 +-
> >  .../staging/rtl8723bs/hal/HalHWImg8723B_RF.c  |  595 ++++-----
> >  .../staging/rtl8723bs/hal/HalPhyRf_8723B.c    |   19 +-
> >  drivers/staging/rtl8723bs/hal/hal_btcoex.c    |    4 -
> >  drivers/staging/rtl8723bs/hal/hal_com.c       |  241 ----
> >  .../staging/rtl8723bs/hal/hal_com_phycfg.c    | 1059 +++--------------
> >  drivers/staging/rtl8723bs/hal/odm.c           |   50 -
> >  drivers/staging/rtl8723bs/hal/odm.h           |   42 +-
> >  drivers/staging/rtl8723bs/hal/odm_DIG.c       |    2 -
> >  .../rtl8723bs/hal/odm_EdcaTurboCheck.c        |    4 +-
> >  .../rtl8723bs/hal/odm_RegConfig8723B.c        |    5 +-
> >  .../rtl8723bs/hal/odm_RegConfig8723B.h        |    2 -
> >  drivers/staging/rtl8723bs/hal/rtl8723b_dm.c   |    1 -
> >  .../staging/rtl8723bs/hal/rtl8723b_hal_init.c |   41 +-
> >  .../staging/rtl8723bs/hal/rtl8723b_phycfg.c   |   43 +-
> >  drivers/staging/rtl8723bs/hal/sdio_halinit.c  |    5 -
> >  .../rtl8723bs/include/Hal8192CPhyReg.h        |    2 -
> >  drivers/staging/rtl8723bs/include/drv_types.h |   10 +-
> >  drivers/staging/rtl8723bs/include/hal_com.h   |   62 +-
> >  .../rtl8723bs/include/hal_com_phycfg.h        |  198 +--
> >  .../staging/rtl8723bs/include/hal_com_reg.h   |    1 -
> >  drivers/staging/rtl8723bs/include/hal_data.h  |   40 +-
> >  drivers/staging/rtl8723bs/include/hal_pg.h    |    2 -
> >  drivers/staging/rtl8723bs/include/hal_phy.h   |   10 -
> >  drivers/staging/rtl8723bs/include/ieee80211.h |   67 +-
> >  .../staging/rtl8723bs/include/rtl8723b_xmit.h |   21 -
> >  drivers/staging/rtl8723bs/include/rtw_ht.h    |    4 -
> >  .../staging/rtl8723bs/include/rtw_mlme_ext.h  |   52 +-
> >  drivers/staging/rtl8723bs/include/rtw_rf.h    |   33 +-
> >  drivers/staging/rtl8723bs/include/wifi.h      |    1 -
> >  .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c |    4 -
> >  .../staging/rtl8723bs/os_dep/ioctl_linux.c    |    8 +-
> >  drivers/staging/rtl8723bs/os_dep/os_intfs.c   |   13 +-
> >  drivers/staging/rtl8723bs/os_dep/wifi_regd.c  |    4 -
> >  44 files changed, 640 insertions(+), 2439 deletions(-)
> > 
> 
