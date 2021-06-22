Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5902D71
	for <linux-staging@lists.linux.dev>; Tue, 22 Jun 2021 13:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1624367993;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P7hvkjVoX7nA4LkIgT/epacZuUu6mq3WKB16xhJMj/Q=;
	b=cBbm2Xmy0CXdBHiQPsR62uWoJO54AtPulMQfMvzjmq8YgTtfWJMTA+h8hbhuOH6G0c51PI
	A1WB2k803j64nDV6/bW/DbnckMJ9SVyhnS0Att5inX7tfnTlUA2pVRCK2jbeXsAbM1kkZz
	nDiB1/3qq38RzNa9SiX50luZYVU5rSI=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-10-RS71oH0vNdSFTw3PocR1nw-1; Tue, 22 Jun 2021 09:19:49 -0400
X-MC-Unique: RS71oH0vNdSFTw3PocR1nw-1
Received: by mail-ej1-f72.google.com with SMTP id j26-20020a170906411ab02904774cb499f8so5212949ejk.6
        for <linux-staging@lists.linux.dev>; Tue, 22 Jun 2021 06:19:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=P7hvkjVoX7nA4LkIgT/epacZuUu6mq3WKB16xhJMj/Q=;
        b=B4dcCLg+0HUrMRXwMbWtQncMFVSsMVbw2rzxJ5ztPLx794bKKXiYgVi/6ktY18Z7OE
         toE0PSh/RxehkX9HjlrmzoPyri78KqN9qPajLvJdV8b7QJ85qka9Vb87/HzVBsYCI5xl
         SeRADAVwhZui2Aw0t9jpSkmYWYdiIvjW/mJTd3yLN7BlzDwIVBaFdFtqiGEb6rQefQD2
         BRFg8s60PAECR3tC/2ZYHluUy4h8SHJZs7SW5JE6D1PqTu4ip53+A5LBTEQ4qV694l+s
         ga9ROdyE+B8VN9fL2/RAOjzV9v8v34oWIgSK6KueuKLs+JV0loZA+iw6L5SuRLMja3TP
         Cq3g==
X-Gm-Message-State: AOAM530lOefFiwk6OVCOE02dA5MCSYeq5l+7lzJwNyLEXwhLBJ+j5cnJ
	6XvGvyM2eAPbmnb9iGEKBM6C/jO713sBOHNz2M5UnQV3up6KJ2dpX6ZGX2QwhGdwx+23OQamaVM
	caZFjGLSiQektpDvhkTCW7GoZ8w==
X-Received: by 2002:a17:907:7662:: with SMTP id kk2mr3942771ejc.218.1624367988231;
        Tue, 22 Jun 2021 06:19:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzxGs8tyjiS6e/ACjl9DJlMwqXHbHjSQZe3hOXmRLiiRdxDcNwgREnpsaVM/Avb57F49L8D+g==
X-Received: by 2002:a17:907:7662:: with SMTP id kk2mr3942746ejc.218.1624367987995;
        Tue, 22 Jun 2021 06:19:47 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id h16sm11939327edb.23.2021.06.22.06.19.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jun 2021 06:19:46 -0700 (PDT)
Subject: Re: [PATCH v3 00/17] staging: rtl8723bs: remove 5Ghz code
To: Fabio Aiuto <fabioaiuto83@gmail.com>, gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <cover.1624367071.git.fabioaiuto83@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <20bed383-adca-e2f0-bede-762707d052ac@redhat.com>
Date: Tue, 22 Jun 2021 15:19:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <cover.1624367071.git.fabioaiuto83@gmail.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi,

On 6/22/21 3:09 PM, Fabio Aiuto wrote:
> This patch series removes all occurences of 5Ghz code over the
> driver as required from driver's TODO list:
> 
>         - find and remove remaining code valid only for 5 GHz.
>           most of the obvious one have been removed, but things
>           like channel > 14 still exist.
> 
> rtl8723bs work on 2.4Ghz band and supports 802.11bgn standards.
> So all code related to 802.11a/ac standard is removed, as well
> as code related to channel numbers above 14.
> 
> VHT code is deleted as well, for it's related to 802.11ac.
> 
> Comments are fixed accordingly and many unused variables are
> deleted.
> 
> Every single patch of this series has been tested on a
> Lenovo Ideapad MIIX 300-10IBY except for the last one,
> for obvious reason (it deletes just the TODO item).
> So:
> 
> Tested-by: Fabio Auto <fabioaiuto83@gmail.com>

From a quick scan the series looks ok to me now:

Acked-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans




> ------------------------------------------------
> Changes in v3:
> 	- delete a condition in patch 1 as pointed out by
> 	  Hans
> 	- fix in 'Changes in v2' text (pointed out).
> Changes in v2:
>         - drop v1 15/18 patch, for it deliberately
>           does register writes as pointed out by Hans.
> 
> Fabio Aiuto (17):
>   staging: rtl8723bs: remove all 5Ghz network types
>   staging: rtl8723bs: remove code related to unsupported channel
>     bandwidth
>   staging: rtl8723bs: remove unused enum items related to channel
>     bonding
>   staging: rtl8723bs: rename enum items related to channel bonding
>   staging: rtl8723bs: remove 5Ghz field in struct registry_priv
>   staging: rtl8723bs: remove struct rt_channel_plan_5g
>   staging: rtl8723bs: remove all branchings between 2.4Ghz and 5Ghz band
>     types
>   staging: rtl8723bs: beautify prototypes in include/hal_com_phycfg.h
>   staging: rtl8723bs: remove 5Ghz code related to channel plan
>     definition
>   staging: rtl8723bs: remove some unused 5Ghz macro definitions
>   staging: rtl8723bs: remove 5Ghz code related to RF power calibration
>   staging: rtl8723bs: remove VHT dead code
>   staging: rtl8723bs: remove unused ODM_CMNINFO_BOARD_TYPE enum item
>   staging: rtl8723bs: fix macro value for 2.4Ghz only device
>   staging: rtl8723bs: remove obsolete 5Ghz comments
>   staging: rtl8723bs: fix check allowing 5Ghz settings
>   staging: rtl8723bs: remove item from TODO list
> 
>  drivers/staging/rtl8723bs/TODO                |    2 -
>  drivers/staging/rtl8723bs/core/rtw_ap.c       |   11 +-
>  .../staging/rtl8723bs/core/rtw_ieee80211.c    |   22 +-
>  drivers/staging/rtl8723bs/core/rtw_mlme.c     |   10 -
>  drivers/staging/rtl8723bs/core/rtw_mlme_ext.c |  328 ++---
>  .../staging/rtl8723bs/core/rtw_wlan_util.c    |   29 +-
>  drivers/staging/rtl8723bs/core/rtw_xmit.c     |    5 +-
>  .../staging/rtl8723bs/hal/HalBtc8723b1Ant.c   |    4 +-
>  .../staging/rtl8723bs/hal/HalBtc8723b2Ant.c   |    5 +-
>  drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h  |    1 -
>  .../staging/rtl8723bs/hal/HalHWImg8723B_BB.c  |   17 +-
>  .../staging/rtl8723bs/hal/HalHWImg8723B_RF.c  |  595 ++++-----
>  .../staging/rtl8723bs/hal/HalPhyRf_8723B.c    |   19 +-
>  drivers/staging/rtl8723bs/hal/hal_btcoex.c    |    4 -
>  drivers/staging/rtl8723bs/hal/hal_com.c       |  241 ----
>  .../staging/rtl8723bs/hal/hal_com_phycfg.c    | 1059 +++--------------
>  drivers/staging/rtl8723bs/hal/odm.c           |   50 -
>  drivers/staging/rtl8723bs/hal/odm.h           |   42 +-
>  drivers/staging/rtl8723bs/hal/odm_DIG.c       |    2 -
>  .../rtl8723bs/hal/odm_EdcaTurboCheck.c        |    4 +-
>  .../rtl8723bs/hal/odm_RegConfig8723B.c        |    5 +-
>  .../rtl8723bs/hal/odm_RegConfig8723B.h        |    2 -
>  drivers/staging/rtl8723bs/hal/rtl8723b_dm.c   |    1 -
>  .../staging/rtl8723bs/hal/rtl8723b_hal_init.c |   41 +-
>  .../staging/rtl8723bs/hal/rtl8723b_phycfg.c   |   43 +-
>  drivers/staging/rtl8723bs/hal/sdio_halinit.c  |    5 -
>  .../rtl8723bs/include/Hal8192CPhyReg.h        |    2 -
>  drivers/staging/rtl8723bs/include/drv_types.h |   10 +-
>  drivers/staging/rtl8723bs/include/hal_com.h   |   62 +-
>  .../rtl8723bs/include/hal_com_phycfg.h        |  198 +--
>  .../staging/rtl8723bs/include/hal_com_reg.h   |    1 -
>  drivers/staging/rtl8723bs/include/hal_data.h  |   40 +-
>  drivers/staging/rtl8723bs/include/hal_pg.h    |    2 -
>  drivers/staging/rtl8723bs/include/hal_phy.h   |   10 -
>  drivers/staging/rtl8723bs/include/ieee80211.h |   67 +-
>  .../staging/rtl8723bs/include/rtl8723b_xmit.h |   21 -
>  drivers/staging/rtl8723bs/include/rtw_ht.h    |    4 -
>  .../staging/rtl8723bs/include/rtw_mlme_ext.h  |   52 +-
>  drivers/staging/rtl8723bs/include/rtw_rf.h    |   33 +-
>  drivers/staging/rtl8723bs/include/wifi.h      |    1 -
>  .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c |    4 -
>  .../staging/rtl8723bs/os_dep/ioctl_linux.c    |    8 +-
>  drivers/staging/rtl8723bs/os_dep/os_intfs.c   |   13 +-
>  drivers/staging/rtl8723bs/os_dep/wifi_regd.c  |    4 -
>  44 files changed, 640 insertions(+), 2439 deletions(-)
> 

