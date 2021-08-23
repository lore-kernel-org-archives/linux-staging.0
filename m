Received: from mail-40136.protonmail.ch (mail-40136.protonmail.ch [185.70.40.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A96D83FC2
	for <linux-staging@lists.linux.dev>; Mon, 23 Aug 2021 22:12:38 +0000 (UTC)
Date: Mon, 23 Aug 2021 22:12:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bryanbrattlof.com;
	s=protonmail; t=1629756750;
	bh=50FeX9ibMRexduiJPC7ZruLY3uInaCBLMCqmvNkS5U0=;
	h=Date:To:From:Cc:Reply-To:Subject:From;
	b=n87t4/uzOd24l/bpzoR+J5L318JBRkh11+3dYkaJUAjslnpOk0+WAZ0x/fyuDql8Y
	 pxuJ4lu4uRfM/wJT2Xsb5EZsHGtjNuF4ZiOsHoMz94HGU8THrddZaLNtTCR2RsD8xw
	 5oOee2H2JDOxYHdshb0G5z9EfGwUhZRxs9IJtpOxj+wt8QrZ0/tFSrEzc/pI/aN9ip
	 OklGQuwZFnCb41mxkhlCOCUBRBW2OfuxiMzPCm9ntiHb9PCP1C4WGu/gZ6xS30aK0p
	 QRR4k73im/ndLpvCCmj1JkxXz6MyJsOyJPblcymJDHR2vayID1IwMMsYtFlIzZgRmB
	 z5gnWCBxU834g==
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
From: Bryan Brattlof <hello@bryanbrattlof.com>
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, Bryan Brattlof <hello@bryanbrattlof.com>
Reply-To: Bryan Brattlof <hello@bryanbrattlof.com>
Subject: [PATCH] staging: rtl8723bs: remove sdio_osintf.h
Message-ID: <20210823221156.3353972-1-hello@bryanbrattlof.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
	autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
	mailout.protonmail.ch

All definitions inside sdio_osintf.h are unused. Remove it.

Signed-off-by: Bryan Brattlof <hello@bryanbrattlof.com>
---
 drivers/staging/rtl8723bs/include/drv_types.h   |  1 -
 drivers/staging/rtl8723bs/include/sdio_osintf.h | 16 ----------------
 2 files changed, 17 deletions(-)
 delete mode 100644 drivers/staging/rtl8723bs/include/sdio_osintf.h

diff --git a/drivers/staging/rtl8723bs/include/drv_types.h b/drivers/stagin=
g/rtl8723bs/include/drv_types.h
index 580028d28c42..0e6741db95bf 100644
--- a/drivers/staging/rtl8723bs/include/drv_types.h
+++ b/drivers/staging/rtl8723bs/include/drv_types.h
@@ -489,7 +489,6 @@ static inline u8 *myid(struct eeprom_priv *peepriv)
 }

 /*  HCI Related header file */
-#include <sdio_osintf.h>
 #include <sdio_ops.h>
 #include <sdio_hal.h>

diff --git a/drivers/staging/rtl8723bs/include/sdio_osintf.h b/drivers/stag=
ing/rtl8723bs/include/sdio_osintf.h
deleted file mode 100644
index 146b44f95e29..000000000000
--- a/drivers/staging/rtl8723bs/include/sdio_osintf.h
+++ /dev/null
@@ -1,16 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*************************************************************************=
*****
- *
- * Copyright(c) 2007 - 2011 Realtek Corporation. All rights reserved.
- *
- *************************************************************************=
*****/
-#ifndef __SDIO_OSINTF_H__
-#define __SDIO_OSINTF_H__
-
-
-
-u8 sd_hal_bus_init(struct adapter *padapter);
-u8 sd_hal_bus_deinit(struct adapter *padapter);
-void sd_c2h_hdl(struct adapter *padapter);
-
-#endif
--
2.30.2


