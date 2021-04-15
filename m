Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB6DC6D32
	for <linux-staging@lists.linux.dev>; Thu, 15 Apr 2021 10:07:27 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id n127so368144wmb.5
        for <linux-staging@lists.linux.dev>; Thu, 15 Apr 2021 03:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4qZemfQU/4MJfHXgxFlv8W+uvkCx98FuAwucXkOVDCo=;
        b=Rf+M/rd1eDo3FZLjaBf8zESvy3i0z/QB5GXK6qWZvpVhUlJNfuuYhK2BNze3mfQ4aZ
         s0vXXfYhwsLxAM5cFoDihF3Nn7yoFtUB87Y0uUKYCTq1nkCkfVUIok7EVB5WO2rRv7F9
         Avs7/gB4oNoPMeYBVSdw3h1KAD3Ic7Q8ss3SOiyq3GmVfUBOGpGp/d6rO+R0cObzwV0A
         BGO+yB6ZzyfPrftqdmL+D4ONMuRfEjh8agC/UEkr7xFRaD+KvvCXcn2mDkMGrhRMUrC0
         fP04469b7e2j0mu7X82VVgoxy6nyletjDJ3C6c/JSLHcmvVnM+QrCg+hmpyYNPGZ3nGZ
         RiJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4qZemfQU/4MJfHXgxFlv8W+uvkCx98FuAwucXkOVDCo=;
        b=MdVhkGbaeIqWZk+K2iyp3iCDkY+9IrMu1gsdmHV5/xwfvoYvHrWaJ6q6YckUjMLZ+Z
         YaBNGzkoPuTsXkgy94nIccw83VAS5i44Pk0xRAdw2utB+/f0VE/MAsQanBtU89HaixD4
         rntQECZN12iegUvSWCcFR3vdQSozoqnibPZUWf0MF4LpmEpB7pWMF8lQmG19prWLGTBQ
         MgrThmHw+GaP4BF1bakqb0XxkfBHRzpMKzqoRJtY7utqN7IilGy6yB/EuIMqlmyQTuGW
         X94Qat9RnDN9KN7XYBJKUg56CuUkoHHpEQgQcFDjFUcZet193s4LZSWU/w4mx2LczWqi
         jS0g==
X-Gm-Message-State: AOAM532yWR5uejxFtyw/L/m0BEg5gRpMofFFzW+AGgQgB9U+EbAl913S
	86adVkpgCo96lox2rAm0A+PtR/wQ0dg=
X-Google-Smtp-Source: ABdhPJz/9MWnqTVUOcIGhvNZ6r/2JvHXtlG2z2D/cF2ioC8ammmQtRq1W8PMB9+5NgyA6prG0ixtCw==
X-Received: by 2002:a7b:c2fa:: with SMTP id e26mr2371477wmk.118.1618481246214;
        Thu, 15 Apr 2021 03:07:26 -0700 (PDT)
Received: from agape ([5.171.72.223])
        by smtp.gmail.com with ESMTPSA id j30sm2309293wrj.62.2021.04.15.03.07.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Apr 2021 03:07:25 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/6] remove DBG_871X_LEVEL macro
Date: Thu, 15 Apr 2021 12:07:18 +0200
Message-Id: <cover.1618480688.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset removes DBG_871X_LEVEL macro.

It does a raw printk so replace it with the more
recommended netdev_*() functions.

Removal and replacement is done with the following
semantic patch:

@@
expression list args;
identifier padapter;
identifier func;
symbol _drv_always_, _drv_info_, _drv_warning_;
symbol _drv_err_, _drv_emerg_;
@@

func(..., struct adapter *padapter, ...) {
	<...
(
-	DBG_871X_LEVEL(_drv_always_, args);
+	netdev_dbg(padapter->pnetdev, args);
|
-	DBG_871X_LEVEL(_drv_info_, args);
+	netdev_info(padapter->pnetdev, args);
|
-	DBG_871X_LEVEL(_drv_warning_, args);
+	netdev_warn(padapter->pnetdev, args);
|
-	DBG_871X_LEVEL(_drv_err_, args);
+	netdev_err(padapter->pnetdev, args);
|
-	DBG_871X_LEVEL(_drv_emerg_, args);
+	netdev_emerg(padapter->pnetdev, args);
)
	...>
}

@rule@
identifier func, context, padapter;
@@

func(void *context)
{
	...
struct adapter *padapter = context;
	...
}

@@
expression list args;
identifier rule.padapter;
identifier rule.func, rule.context;
@@

func(void *context)
{
	<...
(
-	DBG_871X_LEVEL(_drv_always_, args);
+	netdev_dbg(padapter->pnetdev, args);
|
-	DBG_871X_LEVEL(_drv_info_, args);
+	netdev_info(padapter->pnetdev, args);
|
-	DBG_871X_LEVEL(_drv_warning_, args);
+	netdev_warn(padapter->pnetdev, args);
|
-	DBG_871X_LEVEL(_drv_err_, args);
+	netdev_err(padapter->pnetdev, args);
|
-	DBG_871X_LEVEL(_drv_emerg_, args);
+	netdev_emerg(padapter->pnetdev, args);
)
	...>
}

@@
expression list args;
expression get_dev;
identifier func, dev;
@@

func(...)
{
	...
	struct net_device *dev = get_dev;
	<...
(
-	DBG_871X_LEVEL(_drv_always_, args);
+	netdev_dbg(dev, args);
|
-	DBG_871X_LEVEL(_drv_info_, args);
+	netdev_info(dev, args);
|
-	DBG_871X_LEVEL(_drv_warning_, args);
+	netdev_warn(dev, args);
|
-	DBG_871X_LEVEL(_drv_err_, args);
+	netdev_err(dev, args);
|
-	DBG_871X_LEVEL(_drv_emerg_, args);
+	netdev_emerg(dev, args);
)
	...>
}

@@
expression list args;
identifier func, dev;
@@

func(struct net_device *dev)
{
	<...
(
-	DBG_871X_LEVEL(_drv_always_, args);
+	netdev_dbg(dev, args);
|
-	DBG_871X_LEVEL(_drv_info_, args);
+	netdev_info(dev, args);
|
-	DBG_871X_LEVEL(_drv_warning_, args);
+	netdev_warn(dev, args);
|
-	DBG_871X_LEVEL(_drv_err_, args);
+	netdev_err(dev, args);
|
-	DBG_871X_LEVEL(_drv_emerg_, args);
+	netdev_emerg(dev, args);
)
	...>
}

@@
expression list args;
identifier func, dvobj;
@@

func(struct dvobj_priv *dvobj)
{
	<...
(
-	DBG_871X_LEVEL(_drv_always_, args);
+	netdev_dbg(dvobj->if1->pnetdev, args);
|
-	DBG_871X_LEVEL(_drv_info_, args);
+	netdev_info(dvobj->if1->pnetdev, args);
|
-	DBG_871X_LEVEL(_drv_warning_, args);
+	netdev_warn(dvobj->if1->pnetdev, args);
|
-	DBG_871X_LEVEL(_drv_err_, args);
+	netdev_err(dvobj->if1->pnetdev, args);
|
-	DBG_871X_LEVEL(_drv_emerg_, args);
+	netdev_emerg(dvobj->if1->pnetdev, args);
)
	...>
}

@@
@@

-	DBG_871X_LEVEL(...);

Some code cleaning done as well.

Fabio Aiuto (6):
  staging: rtl8723bs: replace DBG_871X_LEVEL logs with netdev_*()
  staging: rtl8723bs: fix code indent issue
  staging: rtl8723bs: fix indentation in if block
  staging: rtl8723bs: split too long line
  staging: rtl8723bs: remove unused DBG_871X_LEVEL macro declarations
  staging: rtl8723bs: remove empty #ifdef block

 drivers/staging/rtl8723bs/core/rtw_cmd.c      | 30 +++++---
 drivers/staging/rtl8723bs/core/rtw_io.c       |  4 +-
 .../staging/rtl8723bs/core/rtw_ioctl_set.c    | 10 +--
 drivers/staging/rtl8723bs/core/rtw_mlme.c     |  3 +-
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 72 ++++++++++++-------
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c  |  9 ++-
 drivers/staging/rtl8723bs/core/rtw_security.c | 40 +++++++----
 .../staging/rtl8723bs/core/rtw_wlan_util.c    | 21 +++---
 drivers/staging/rtl8723bs/core/rtw_xmit.c     |  2 +-
 drivers/staging/rtl8723bs/hal/hal_com.c       | 26 ++++---
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c |  4 +-
 .../staging/rtl8723bs/hal/rtl8723bs_xmit.c    | 14 ++--
 drivers/staging/rtl8723bs/hal/sdio_ops.c      |  3 +-
 drivers/staging/rtl8723bs/include/rtw_debug.h | 14 ----
 .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c |  8 ++-
 .../staging/rtl8723bs/os_dep/ioctl_linux.c    |  2 +-
 drivers/staging/rtl8723bs/os_dep/os_intfs.c   | 32 +++++----
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c  | 15 +---
 18 files changed, 181 insertions(+), 128 deletions(-)

-- 
2.20.1

