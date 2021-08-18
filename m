Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7871173
	for <linux-staging@lists.linux.dev>; Wed, 18 Aug 2021 23:48:56 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id k29so6061000wrd.7
        for <linux-staging@lists.linux.dev>; Wed, 18 Aug 2021 16:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pwyfaAFBG7iF6Ne2wRkdGUfEMQvIBJdIimvJvjzDTvs=;
        b=lmgx4Z4x6WxFk09qXEzPSyExDLZpd8BFeun/m2tpV8JuAAwFF3vrs7kcsm0e4T249X
         GabXevNSule3ap36OXGmcQOZi4izl4CXz+10Bp4Nv7AtrOSSTmAMIJprxiWJI7cczjry
         ihFObI83BdH371MSHxVfQGADn16c8687GD/5OzRRNslazvuoljz4cW+3MzUkm0UlltrJ
         4fg9EaOlLjpqD0wp1qsSMIn9OLu/J5CuOj6T7xX5HeKydqUpMWGEfTnBmH5x263O8NEe
         MvtRZlvafbUN+/Gg+doyCLLu8j9Wrv03o7BzYqOh6FpRcee01BN2XHzu17VdehyohFO9
         Nf7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pwyfaAFBG7iF6Ne2wRkdGUfEMQvIBJdIimvJvjzDTvs=;
        b=GtbVOmPESn/tbwIkRJcz8Pdg+mLLmhUqIHSzc99t4K9xaUcd5lTiiDltTsR7xRlgv4
         xfGiE2LHZtc+rCeX9HASCMkonPlKH9MS0aNLPGLG21A4g55QbMeD/Xo70iVNQGjv+zZq
         wEUbrn61frufV3rRAo9KK0E9aPxp2Vb+GXEuo3dIg5w4HWNW+SSMnBAUu2w2vM2D2IxN
         t8n14pBjDe233qHPUFQfaWJdVS2OsMpTx9aI/NmDnix69ryb60qBqfxRPMDnCa/hVwEL
         KBROF4EXN+i57DCYXfJ1o+VedCYXmNMYePWelbSSc+qVxKf4qCRQ/xXHILGBj+um1UKc
         2cFg==
X-Gm-Message-State: AOAM530qJY+mYFigXO6cOlNrv6Of8xA13dmQ84UyqsC+B4MkWXlCDimN
	OkhC1Qh+4gPlJMdYv5/UFMMdrw==
X-Google-Smtp-Source: ABdhPJxv5E6+j8K8oDVVmmAefegysXo+i6oHXbIT9pUMt27wG2HDkY/F82oScr0oTlpG2S46TEZZpg==
X-Received: by 2002:adf:d4c7:: with SMTP id w7mr74386wrk.301.1629330535225;
        Wed, 18 Aug 2021 16:48:55 -0700 (PDT)
Received: from localhost.localdomain (3.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.6.1.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:df16::3])
        by smtp.gmail.com with ESMTPSA id z8sm1205916wrt.77.2021.08.18.16.48.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 16:48:54 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	martin@kaiser.cx,
	straube.linux@gmail.com,
	Larry.Finger@lwfinger.net
Subject: [PATCH 0/7] staging: r8188eu: memory allocation cleanup series
Date: Thu, 19 Aug 2021 00:48:46 +0100
Message-Id: <20210818234853.208448-1-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.31.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series does some cleanup on the memory allocation paths within the
driver, by converting all callers of rtw_vmalloc and rtw_zvmalloc to use
vmalloc and vzalloc respectively, and then removing the functions and
associated declarations and macro definitions. It also removes an unused
macro (rtw_update_mem_stat) and its associated flags.

Phillip Potter (7):
  staging: r8188eu: convert only rtw_vmalloc call to vmalloc
  staging: r8188eu: remove rtw_vmalloc preprocessor definition
  staging: r8188eu: remove function _rtw_vmalloc
  staging: r8188eu: convert all rtw_zvmalloc calls to vzalloc calls
  staging: r8188eu: remove rtw_zvmalloc preprocessor definition
  staging: r8188eu: remove function _rtw_zvmalloc
  staging: r8188eu: remove rtw_update_mem_stat macro and associated
    flags

 drivers/staging/r8188eu/core/rtw_mlme.c       |  4 ++--
 drivers/staging/r8188eu/core/rtw_mp.c         |  2 +-
 drivers/staging/r8188eu/core/rtw_recv.c       |  2 +-
 drivers/staging/r8188eu/core/rtw_sta_mgt.c    |  2 +-
 drivers/staging/r8188eu/core/rtw_xmit.c       |  8 +++----
 drivers/staging/r8188eu/hal/odm_interface.c   |  2 +-
 .../staging/r8188eu/hal/rtl8188e_hal_init.c   |  2 +-
 .../staging/r8188eu/include/osdep_service.h   | 24 -------------------
 drivers/staging/r8188eu/os_dep/ioctl_linux.c  |  2 +-
 .../staging/r8188eu/os_dep/osdep_service.c    | 18 +-------------
 drivers/staging/r8188eu/os_dep/usb_intf.c     |  2 +-
 11 files changed, 14 insertions(+), 54 deletions(-)

-- 
2.31.1

