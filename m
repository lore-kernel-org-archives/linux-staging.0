Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A00113484
	for <linux-staging@lists.linux.dev>; Thu, 29 Jul 2021 17:09:48 +0000 (UTC)
Received: by mail-ot1-f48.google.com with SMTP id 19-20020a9d08930000b02904b98d90c82cso6588558otf.5
        for <linux-staging@lists.linux.dev>; Thu, 29 Jul 2021 10:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RicV499WZNq7QZbO+9Y5GGhbIPo1CGCHmOmkOGx7UNw=;
        b=i3SvBHm5SPIrtiAaCEphHFlTcSXChyk/iW276Xt/YnhddQFl6SEkPl/m7G02v0mmQm
         eY9R4KCwT7FsRaRQxNdlkF6+nk3nYyQEwsuS75YnMx3t91l3hQqRaWFVtpvjcIwnYLKr
         XvgHHZFBgn2zsMvyJygu0Pcxht/vrRnXAS9SVG9D9S0JG03Qg8GG0Jt0f5cqKLZIYPfD
         NfKfAcIeBicFE8Gus3KC6hkaQQ+cJscMf+imitVjWlcc3u9R6wZFshWOkggyOxdet+5o
         SREu2lIbGsaHo0BooLkl3i+q8g9zYlRkQqNp6+P4b3qx/UpB6xpZexHX3+9J3ZUw5PgV
         2gfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=RicV499WZNq7QZbO+9Y5GGhbIPo1CGCHmOmkOGx7UNw=;
        b=CT5gB2hng5nBNg1SVcy3gH0f/KPzoVSVf7aLYbx1Dl7lAVhknR5U44lTZSkLVABL3M
         oQnrwl+Zma23xFsKQnd1IichJ9w7UWoD7Jd6180NzIjDn7yEtzINDN/62rLq+lZuandO
         I9NcWMiIEw8+KUHAhXevHknpo9f6g6kV7vfw5qNXpb0bVeZ56WiLvPMGXSUG/Akp3tuo
         uH3uLTHY9GRJwh2a6uv07aGqWoXjiOzlGcl8Cepe2nEuZzLBqiJuwD8VthJakLKpTRX7
         /c5j+ykTS/pDi+Gc5RycXkQhzRcFMm1cZ4Ml8YuHOlzFbt3Sn47w/Bcs0e8IyWZDRUsa
         hFsQ==
X-Gm-Message-State: AOAM531qub62R69SCuOx6JKgi8R3PxgXyBJ01BRuabUdvur8in1qlHvF
	5/SfjlfsSZq5bqNz6H5TCgM=
X-Google-Smtp-Source: ABdhPJxHfQzhwoC+z4R/qNmK1tyK0AvQiaae9pe8CDbqbYzsQWRp5Q3vkremarDKZ8RV0IOO27nX0A==
X-Received: by 2002:a05:6830:1290:: with SMTP id z16mr4084701otp.28.1627578587949;
        Thu, 29 Jul 2021 10:09:47 -0700 (PDT)
Received: from 2603-8090-2005-39b3-0000-0000-0000-100a.res6.spectrum.com.com (2603-8090-2005-39b3-0000-0000-0000-100a.res6.spectrum.com. [2603:8090:2005:39b3::100a])
        by smtp.gmail.com with ESMTPSA id a23sm614358otv.79.2021.07.29.10.09.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jul 2021 10:09:47 -0700 (PDT)
Sender: Larry Finger <larry.finger@gmail.com>
From: Larry Finger <Larry.Finger@lwfinger.net>
To: gregkh@linuxfoundation.org
Cc: phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Larry Finger <Larry.Finger@lwfinger.net>
Subject: [PATCH 4/6] staging: r8188eu: Remove header file include/usb_hal.h
Date: Thu, 29 Jul 2021 12:09:28 -0500
Message-Id: <20210729170930.23171-5-Larry.Finger@lwfinger.net>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210729170930.23171-1-Larry.Finger@lwfinger.net>
References: <20210729170930.23171-1-Larry.Finger@lwfinger.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This header only includes one prototype and one define statement. The
new definition is used once, thus it can be removed. The prototype is
moved to a header that is already called by the supplier and the user
of that routine, thus the small header is removed.

Signed-off-by: Larry Finger <Larry.Finger@lwfinger.net>
---
 drivers/staging/r8188eu/hal/hal_intf.c     |  1 -
 drivers/staging/r8188eu/hal/usb_halinit.c  |  1 -
 drivers/staging/r8188eu/include/hal_intf.h |  1 +
 drivers/staging/r8188eu/include/usb_hal.h  | 10 ----------
 drivers/staging/r8188eu/os_dep/os_intfs.c  |  1 -
 drivers/staging/r8188eu/os_dep/usb_intf.c  |  3 +--
 6 files changed, 2 insertions(+), 15 deletions(-)
 delete mode 100644 drivers/staging/r8188eu/include/usb_hal.h

diff --git a/drivers/staging/r8188eu/hal/hal_intf.c b/drivers/staging/r8188eu/hal/hal_intf.c
index 4dda247e386a..02d76ac782d8 100644
--- a/drivers/staging/r8188eu/hal/hal_intf.c
+++ b/drivers/staging/r8188eu/hal/hal_intf.c
@@ -5,7 +5,6 @@
 #include <osdep_service.h>
 #include <drv_types.h>
 #include <hal_intf.h>
-#include <usb_hal.h>
 
 void rtw_hal_chip_configure(struct adapter *adapt)
 {
diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index 8ecb94728462..f784d8dcdd34 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -11,7 +11,6 @@
 #include <rtl8188e_led.h>
 #include <rtw_iol.h>
 #include <usb_ops.h>
-#include <usb_hal.h>
 #include <usb_osintf.h>
 
 #define		HAL_MAC_ENABLE	1
diff --git a/drivers/staging/r8188eu/include/hal_intf.h b/drivers/staging/r8188eu/include/hal_intf.h
index c829aee518dd..d64fcda37100 100644
--- a/drivers/staging/r8188eu/include/hal_intf.h
+++ b/drivers/staging/r8188eu/include/hal_intf.h
@@ -309,6 +309,7 @@ enum hardware_type {
 
 #define is_boot_from_eeprom(adapter) (adapter->eeprompriv.EepromOrEfuse)
 
+void rtl8188eu_set_hal_ops(struct adapter *padapter);
 void rtw_hal_def_value_init(struct adapter *padapter);
 
 void	rtw_hal_free_data(struct adapter *padapter);
diff --git a/drivers/staging/r8188eu/include/usb_hal.h b/drivers/staging/r8188eu/include/usb_hal.h
deleted file mode 100644
index 584602c40cca..000000000000
--- a/drivers/staging/r8188eu/include/usb_hal.h
+++ /dev/null
@@ -1,10 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause */
-/* Copyright(c) 2007 - 2011 Realtek Corporation. */
-
-#ifndef __USB_HAL_H__
-#define __USB_HAL_H__
-
-void rtl8188eu_set_hal_ops(struct adapter *padapter);
-#define hal_set_hal_ops	rtl8188eu_set_hal_ops
-
-#endif /* __USB_HAL_H__ */
diff --git a/drivers/staging/r8188eu/os_dep/os_intfs.c b/drivers/staging/r8188eu/os_dep/os_intfs.c
index 454b94b037f3..34af5237d9e6 100644
--- a/drivers/staging/r8188eu/os_dep/os_intfs.c
+++ b/drivers/staging/r8188eu/os_dep/os_intfs.c
@@ -12,7 +12,6 @@
 #include <rtw_version.h>
 
 #include <usb_osintf.h>
-#include <usb_hal.h>
 #include <rtw_br_ext.h>
 #include <linux/version.h>
 
diff --git a/drivers/staging/r8188eu/os_dep/usb_intf.c b/drivers/staging/r8188eu/os_dep/usb_intf.c
index 9be70ed65072..905a08ebd80d 100644
--- a/drivers/staging/r8188eu/os_dep/usb_intf.c
+++ b/drivers/staging/r8188eu/os_dep/usb_intf.c
@@ -15,7 +15,6 @@
 #include <usb_vendor_req.h>
 #include <usb_ops.h>
 #include <usb_osintf.h>
-#include <usb_hal.h>
 #include <rtw_ioctl.h>
 
 int ui_pid[3] = {0, 0, 0};
@@ -628,7 +627,7 @@ static struct adapter *rtw_usb_if1_init(struct dvobj_priv *dvobj,
 	padapter = rtw_netdev_priv(pnetdev);
 
 	/* step 2. hook HalFunc, allocate HalData */
-	hal_set_hal_ops(padapter);
+	rtl8188eu_set_hal_ops(padapter);
 
 	padapter->intf_start = &usb_intf_start;
 	padapter->intf_stop = &usb_intf_stop;
-- 
2.32.0

