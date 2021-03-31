Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 829136F
	for <linux-staging@lists.linux.dev>; Wed, 31 Mar 2021 09:40:14 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id l4so29067137ejc.10
        for <linux-staging@lists.linux.dev>; Wed, 31 Mar 2021 02:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XMjq0EnNPHk8JnXWNq75o7oGRr8GJXa/YQ1PMp5WkcQ=;
        b=nY1manQxEnYQkBu1Wn2T0srrVqGqwEOQN1Ah4e330sQsQRapDFRGzQV4KnfCKhsnAS
         fM+rJS2nDNsSBdVCFkyWwQJbBWT5oZubQhoMAyv3GLf09h/U4YP8jl8ytSrisLFQ4zfY
         AbiGATh7n+wCs2jQc8bdi9ZF/kX9vbmqgwcV4+9ZpPJOvb1jjACKsvLnUcqdDovPfu8K
         2mHvnnIJPcw1nEo+ijzdOnXgJn82NX6WNnDtlFFsb9xOVafT0vgWPPvuszNwU8cXwmkQ
         BGZSJtjXdthq5UsizzQTSvDssLdfK1O2V41C0lm6UAWkREoykXbg+61/eNUc1HH33NJh
         YAUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XMjq0EnNPHk8JnXWNq75o7oGRr8GJXa/YQ1PMp5WkcQ=;
        b=iA3k0/kQ3RqJDUlCiKa7TKIfx/FUQb2UGJskIsjnSCXXIKhyDS1cCQQrAU49+fXnna
         hAypfrrHk1AlkzswH1x/6GeIQLNVgujkjq0RwGBlSYep6scR526Jem07S1h9p/QjxCvv
         LAsIEEmXTTFzirvNSHlhaL3tuLBuQJj3NpqaL5lot1dcwLtSjDdgbCuU1ObsObp4AZMT
         /k0b1V/6dfhu50yQGbrnIynNggUThG7Uqra8pdCMsIsCPHV+IHsXcG3Ff0qmZnyC41G7
         oXj2ae3Se3FiQeZLF8eaSOPPU6e1Q/s8q6rkE7I1qc6WiZenX9T6BBMNj6+3C+1gVEAn
         E27Q==
X-Gm-Message-State: AOAM532HK0sR8j50oLU/MrESr2bGtjGCKAlIeMiadIirOsA6iJc40N0Z
	1gBCOeGYVtcKNj4T5mFleQ0=
X-Google-Smtp-Source: ABdhPJz5WHF5f/iKq7TA6oJ54j2rDg2LDe5jpSIfig6wZw0GRAlXumoGdQYJ7RG6rdZjSjeOTnWx9A==
X-Received: by 2002:a17:906:36d1:: with SMTP id b17mr2635600ejc.235.1617183613058;
        Wed, 31 Mar 2021 02:40:13 -0700 (PDT)
Received: from agape ([5.171.73.44])
        by smtp.gmail.com with ESMTPSA id jj15sm831377ejc.99.2021.03.31.02.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 02:40:12 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH 00/40] staging: rtl8723bs: replace RT_TRACE private macro 
Date: Wed, 31 Mar 2021 11:39:28 +0200
Message-Id: <cover.1617183374.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

this patchset replace all RT_TRACE usages with public log functions
used for this pourpose

Fabio Aiuto (40):
  staging: rtl8723bs: replace RT_TRACE with public printk wrappers in
    core/rtw_xmit.c
  staging: rtl8723bs: replace RT_TRACE with public printk wrappers in
    core/rtw_security.c
  staging: rtl8723bs: replace RT_TRACE with public printk wrappers in
    core/rtw_eeprom.c
  staging: rtl8723bs: replace RT_TRACE with public printk wrappers in
    core/rtw_pwrctrl.c
  staging: rtl8723bs: replace RT_TRACE with public printk wrappers in
    core/rtw_cmd.c
  staging: rtl8723bs: remove commented RT_TRACE calls in core/rtw_mlme.c
  staging: rtl8723bs: replace RT_TRACE with public printk wrappers in
    core/rtw_mlme.c
  staging: rtl8723bs: replace RT_TRACE with public printk wrappers in
    core/rtw_mlme_ext.c
  staging: rtl8723bs: remove commented RT_TRACE calls in core/rtw_recv.c
  staging: rtl8723bs: replace RT_TRACE with public printk wrappers in
    core/rtw_recv.c
  staging: rtl8723bs: remove commented RT_TRACE call in
    core/rtw_ioctl_set.c
  staging: rtl8723bs: replace RT_TRACE with public printk wrappers in
    core/rtw_ioctl_set.c
  staging: rtl8723bs: replace RT_TRACE with public printk wrappers in
    core/rtw_wlan_util.c
  staging: rtl8723bs: replace RT_TRACE with public printk wrappers in
    core/rtw_sta_mgt.c
  staging: rtl8723bs: replace RT_TRACE with public printk wrappers in
    core/rtw_ieee80211.c
  staging: rtl8723bs: replace RT_TRACE with public printk wrappers in
    hal/HalPwrSeqCmd.c
  staging: rtl8723bs: fix constant name in hal/rtl8723b_hal_init.c
  staging: rtl8723bs: added driver prefix in log messages
  staging: rtl8723bs: remove commented RT_TRACE call in
    hal/rtl8723b_hal_init.c
  staging: rtl8723bs: replace RT_TRACE with public printk wrappers in
    hal/rtl8723b_hal_init.c
  staging: rtl8723bs: replace RT_TRACE with public printk wrappers in
    hal/sdio_ops.c
  staging: rtl8723bs: remove commented code block in
    hal/hal_com_phycfg.c
  staging: rtl8723bs: replace RT_TRACE with public printk wrappers in
    hal/rtl8723b_phycfg.c
  staging: rtl8723bs: replace RT_TRACE with public printk wrappers in
    hal/hal_intf.c
  staging: rtl8723bs: replace RT_TRACE with public printk wrappers in
    hal/rtl8723bs_xmit.c
  staging: rtl8723bs: replace RT_TRACE with public printk wrappers in
    hal/sdio_halinit.c
  staging: rtl8723bs: replace RT_TRACE with public printk wrappers in
    hal/rtl8723bs_recv.c
  staging: rtl8723bs: remove commented RT_TRACE calls in
    hal/HalPhyRf_8723B.c
  staging: rtl8723bs: remove commented RT_TRACE calls in
    hal/rtl8723b_rf6052.c
  staging: rtl8723bs: remove commented RT_TRACE calls in
    os_dep/ioctl_linux.c
  staging: rtl8723bs: replace RT_TRACE with public printk wrappers in
    os_dep/ioctl_linux.c
  staging: rtl8723bs: replace RT_TRACE with public printk wrappers in
    os_dep/mlme_linux.c
  staging: rtl8723bs: fix string format in os_dep/ioctl_cfg80211.c
  staging: rtl8723bs: replace RT_TRACE with public printk wrappers in
    os_dep/ioctl_cfg80211.c
  staging: rtl8723bs: replace RT_TRACE with public printk wrappers in
    os_dep/os_intfs.c
  staging: rtl8723bs: replace RT_TRACE with public printk wrappers in
    os_dep/recv_linux.c
  staging: rtl8723bs: replace RT_TRACE with public printk wrappers in
    os_dep/sdio_intf.c
  staging: rtl8723bs: replace RT_TRACE with public printk wrappers in
    os_dep/xmit_linux.c
  staging: rtl8723bs: replace RT_TRACE with public printk wrappers in
    os_dep/osdep_service.c
  staging: rtl8723bs: remove obsolete debug macro

 drivers/staging/rtl8723bs/core/rtw_cmd.c      |  55 ++--
 drivers/staging/rtl8723bs/core/rtw_eeprom.c   |  26 +-
 .../staging/rtl8723bs/core/rtw_ieee80211.c    | 116 +++++---
 .../staging/rtl8723bs/core/rtw_ioctl_set.c    | 129 +++++----
 drivers/staging/rtl8723bs/core/rtw_mlme.c     | 128 +++++----
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c |  39 +--
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c  |  62 ++---
 drivers/staging/rtl8723bs/core/rtw_recv.c     | 252 +++++++++++-------
 drivers/staging/rtl8723bs/core/rtw_security.c |  38 ++-
 drivers/staging/rtl8723bs/core/rtw_sta_mgt.c  |  45 ++--
 .../staging/rtl8723bs/core/rtw_wlan_util.c    |  28 +-
 drivers/staging/rtl8723bs/core/rtw_xmit.c     | 168 ++++++++----
 .../staging/rtl8723bs/hal/HalPhyRf_8723B.c    |   3 -
 drivers/staging/rtl8723bs/hal/HalPwrSeqCmd.c  |  61 ++---
 .../staging/rtl8723bs/hal/hal_com_phycfg.c    |  20 --
 drivers/staging/rtl8723bs/hal/hal_intf.c      |   2 +-
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 155 +++++------
 .../staging/rtl8723bs/hal/rtl8723b_phycfg.c   |  48 ++--
 .../staging/rtl8723bs/hal/rtl8723b_rf6052.c   |   2 -
 .../staging/rtl8723bs/hal/rtl8723bs_recv.c    |   5 +-
 .../staging/rtl8723bs/hal/rtl8723bs_xmit.c    |  42 +--
 drivers/staging/rtl8723bs/hal/sdio_halinit.c  |  49 ++--
 drivers/staging/rtl8723bs/hal/sdio_ops.c      |  42 +--
 drivers/staging/rtl8723bs/include/rtw_debug.h |  17 --
 .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c |  14 +-
 .../staging/rtl8723bs/os_dep/ioctl_linux.c    |  87 +++---
 drivers/staging/rtl8723bs/os_dep/mlme_linux.c |   4 +-
 drivers/staging/rtl8723bs/os_dep/os_intfs.c   |  65 +++--
 .../staging/rtl8723bs/os_dep/osdep_service.c  |   2 +-
 drivers/staging/rtl8723bs/os_dep/recv_linux.c |  22 +-
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c  |  19 +-
 drivers/staging/rtl8723bs/os_dep/xmit_linux.c |  10 +-
 32 files changed, 914 insertions(+), 841 deletions(-)

-- 
2.20.1

