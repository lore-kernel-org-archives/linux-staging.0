Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 729FD19BDA
	for <linux-staging@lists.linux.dev>; Thu, 11 May 2023 13:34:20 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-64388cf3263so6137506b3a.3
        for <linux-staging@lists.linux.dev>; Thu, 11 May 2023 06:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683812060; x=1686404060;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nFOqkcQLLXbcUCNMC4nXxtnD0IYkCz/oJKuj034INls=;
        b=ZCUHyyVcvAAoCdOafCtA4n7c8liYHGSBLP/9JWCiIyfBsuOFYnb9Od2VddtQTddZsB
         tSZdSk7DSwOjGdyyZAqeYlijt6hojNfFE9q+yFk2EvKYTCzx0UEv7g3XyibLY81uTKaa
         o4AZJt2FbG4isB7qvKcMsxVon1NizgL13UxUJaWMwemV/epyrmm6IrXao1eYUrabtyRp
         MOZ4P5hGjVnMhCXIwpGBAp+rGz86SHC0XtIl7cC3iFruuaXK+pZ+R4Db9QVFVxjFiUTB
         vx6puMKL8dLHZqnrsnHVyysyczSXGGLH9GmpAda5Os8zbpmx0AQLNgPvUxmQxiIugo85
         IGag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683812060; x=1686404060;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nFOqkcQLLXbcUCNMC4nXxtnD0IYkCz/oJKuj034INls=;
        b=fXXNEhxv+wukM0IEdqIVZOCE5zWKuw++25HkW5bl5nwyksd9MmqEdVtBtJQ2QeBWbK
         Nrou/uSgeD5UwIK/8HY5eQnN9RIngvwUl3DQ5SD6d62GW0gRG02D8oRFSz9/EmDMyWid
         Clp9QuDYpGL6jUeUVtzn5vwkGyp0Njl2uERCtsFsZftsW0MR+aYMuGgpQ5b8SS153eK7
         aKHxC7jBQRaT1kGWkUWmum4hx+NG3RBH0OO2tNjbkcURjVj02wO9C3M8DsiveffDw46c
         o57dSyKZApwTt46zoeTHUG5bIrX3HI8CGgEcBmEo1fO/fMzw/nwvUbOvQ5adzLJeXOZn
         RTgw==
X-Gm-Message-State: AC+VfDxd5xSXKyqXEcYD3boszv7yMyuD+ViMu7p5nMG+ia+x6g0q5S3t
	o4pmqvftwHyeLsEOzDpD94Q=
X-Google-Smtp-Source: ACHHUZ5Yi06llRCu2mM9uS4jssvYi6G9YBgC/4EKP+eX38MkFDoX6HanBhqoBSMudy9nftfmGF4Umg==
X-Received: by 2002:a05:6a00:24d1:b0:646:ec88:998c with SMTP id d17-20020a056a0024d100b00646ec88998cmr14586028pfv.15.1683812059640;
        Thu, 11 May 2023 06:34:19 -0700 (PDT)
Received: from debian.me (subs02-180-214-232-92.three.co.id. [180.214.232.92])
        by smtp.gmail.com with ESMTPSA id u18-20020aa78492000000b006470a6ef529sm4895458pfn.88.2023.05.11.06.34.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 06:34:18 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id CE01210680B; Thu, 11 May 2023 20:34:10 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux DRI Development <dri-devel@lists.freedesktop.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Networking <netdev@vger.kernel.org>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	Linux Staging Drivers <linux-staging@lists.linux.dev>,
	Linux Watchdog Devices <linux-watchdog@vger.kernel.org>,
	Linux Kernel Actions <linux-actions@lists.infradead.org>
Cc: Diederik de Haas <didi.debian@cknow.org>,
	Kate Stewart <kstewart@linuxfoundation.org>,
	David Airlie <airlied@redhat.com>,
	Karsten Keil <isdn@linux-pingi.de>,
	Jay Vosburgh <j.vosburgh@gmail.com>,
	Andy Gospodarek <andy@greyhouse.net>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Sam Creasey <sammy@sammy.net>,
	Dominik Brodowski <linux@dominikbrodowski.net>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Jan Kara <jack@suse.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Tom Rix <trix@redhat.com>,
	Simon Horman <simon.horman@corigine.com>,
	Yang Yingliang <yangyingliang@huawei.com>,
	"Steven Rostedt (Google)" <rostedt@goodmis.org>,
	Pavel Machek <pavel@ucw.cz>,
	Minghao Chi <chi.minghao@zte.com.cn>,
	Kalle Valo <kvalo@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Deepak R Varma <drv@mailo.com>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Thomas Gleixner <tglx@linutronix.de>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Gaosheng Cui <cuigaosheng1@huawei.com>,
	Dan Carpenter <error27@gmail.com>,
	Archana <craechal@gmail.com>,
	Ray Lehtiniemi <rayl@mail.com>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Andrey Panin <pazke@donpac.ru>,
	Oleg Drokin <green@crimea.edu>,
	Marc Zyngier <maz@kernel.org>,
	Jonas Jensen <jonas.jensen@gmail.com>,
	Sylver Bruneau <sylver.bruneau@googlemail.com>,
	Andrew Sharp <andy.sharp@lsi.com>,
	Denis Turischev <denis@compulab.co.il>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 08/10] drivers: watchdog: Replace GPL license notice with SPDX identifier
Date: Thu, 11 May 2023 20:34:04 +0700
Message-Id: <20230511133406.78155-9-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230511133406.78155-1-bagasdotme@gmail.com>
References: <20230511133406.78155-1-bagasdotme@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=9182; i=bagasdotme@gmail.com; h=from:subject; bh=48g2oyfhDHzUYBcXnko4ERoWGH+5mzIFU4TjL0WXw5E=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDCkx706EdjQ3Bpu1Twi42FI6vT95XrVWDUdKo+Hmoq+Bp R2m/7Z3lLIwiHExyIopskxK5Gs6vctI5EL7WkeYOaxMIEMYuDgFYCJqUxkZ2pLttPzk0g/vXPhS MiFKNqeiidehNv92k+mC+nWTpsgfYfjvZ5//pTFbMiRnzwGOuooo1XJXIwnOZy0ZVfO3H11z5gs vAA==
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Many watchdog drivers's source files has already SPDX license
identifier, while some remaining doesn't.

Convert notices on remaining files to SPDX identifier.

Cc: Ray Lehtiniemi <rayl@mail.com>
Cc: Alessandro Zummo <a.zummo@towertech.it>
Cc: Andrey Panin <pazke@donpac.ru>
Cc: Oleg Drokin <green@crimea.edu>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Jonas Jensen <jonas.jensen@gmail.com>
Cc: Sylver Bruneau <sylver.bruneau@googlemail.com>
Cc: Andrew Sharp <andy.sharp@lsi.com>
Cc: Denis Turischev <denis@compulab.co.il>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 drivers/watchdog/ep93xx_wdt.c     | 5 +----
 drivers/watchdog/ibmasr.c         | 3 +--
 drivers/watchdog/m54xx_wdt.c      | 4 +---
 drivers/watchdog/max63xx_wdt.c    | 5 +----
 drivers/watchdog/moxart_wdt.c     | 4 +---
 drivers/watchdog/octeon-wdt-nmi.S | 5 +----
 drivers/watchdog/orion_wdt.c      | 4 +---
 drivers/watchdog/rtd119x_wdt.c    | 2 +-
 drivers/watchdog/sb_wdog.c        | 5 +----
 drivers/watchdog/sbc_fitpc2_wdt.c | 4 +---
 drivers/watchdog/ts4800_wdt.c     | 4 +---
 drivers/watchdog/ts72xx_wdt.c     | 4 +---
 12 files changed, 12 insertions(+), 37 deletions(-)

diff --git a/drivers/watchdog/ep93xx_wdt.c b/drivers/watchdog/ep93xx_wdt.c
index 38e26f160b9a57..f5d70842617fe9 100644
--- a/drivers/watchdog/ep93xx_wdt.c
+++ b/drivers/watchdog/ep93xx_wdt.c
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
 /*
  * Watchdog driver for Cirrus Logic EP93xx family of devices.
  *
@@ -11,10 +12,6 @@
  * Copyright (c) 2012 H Hartley Sweeten <hsweeten@visionengravers.com>
  *	Convert to a platform device and use the watchdog framework API
  *
- * This file is licensed under the terms of the GNU General Public
- * License version 2. This program is licensed "as is" without any
- * warranty of any kind, whether express or implied.
- *
  * This watchdog fires after 250msec, which is a too short interval
  * for us to rely on the user space daemon alone. So we ping the
  * wdt each ~200msec and eventually stop doing it if the user space
diff --git a/drivers/watchdog/ibmasr.c b/drivers/watchdog/ibmasr.c
index 4a22fe15208630..df03f3b2659a3e 100644
--- a/drivers/watchdog/ibmasr.c
+++ b/drivers/watchdog/ibmasr.c
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-1.0-or-later */
 /*
  * IBM Automatic Server Restart driver.
  *
@@ -6,8 +7,6 @@
  * Based on driver written by Pete Reynolds.
  * Copyright (c) IBM Corporation, 1998-2004.
  *
- * This software may be used and distributed according to the terms
- * of the GNU Public License, incorporated herein by reference.
  */
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
diff --git a/drivers/watchdog/m54xx_wdt.c b/drivers/watchdog/m54xx_wdt.c
index f388a769dbd33d..9ca80b6c1790b6 100644
--- a/drivers/watchdog/m54xx_wdt.c
+++ b/drivers/watchdog/m54xx_wdt.c
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
 /*
  * drivers/watchdog/m54xx_wdt.c
  *
@@ -11,9 +12,6 @@
  *  Copyright 2004 (c) MontaVista, Software, Inc.
  *  Based on sa1100 driver, Copyright (C) 2000 Oleg Drokin <green@crimea.edu>
  *
- * This file is licensed under  the terms of the GNU General Public
- * License version 2. This program is licensed "as is" without any
- * warranty of any kind, whether express or implied.
  */
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
diff --git a/drivers/watchdog/max63xx_wdt.c b/drivers/watchdog/max63xx_wdt.c
index 9e1541cfae0d89..811f6dabad2c08 100644
--- a/drivers/watchdog/max63xx_wdt.c
+++ b/drivers/watchdog/max63xx_wdt.c
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
 /*
  * drivers/char/watchdog/max63xx_wdt.c
  *
@@ -5,10 +6,6 @@
  *
  * Copyright (C) 2009 Marc Zyngier <maz@misterjones.org>
  *
- * This file is licensed under the terms of the GNU General Public
- * License version 2. This program is licensed "as is" without any
- * warranty of any kind, whether express or implied.
- *
  * This driver assumes the watchdog pins are memory mapped (as it is
  * the case for the Arcom Zeus). Should it be connected over GPIOs or
  * another interface, some abstraction will have to be introduced.
diff --git a/drivers/watchdog/moxart_wdt.c b/drivers/watchdog/moxart_wdt.c
index 6340a1f5f471b2..c87873c7d13f86 100644
--- a/drivers/watchdog/moxart_wdt.c
+++ b/drivers/watchdog/moxart_wdt.c
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
 /*
  * MOXA ART SoCs watchdog driver.
  *
@@ -5,9 +6,6 @@
  *
  * Jonas Jensen <jonas.jensen@gmail.com>
  *
- * This file is licensed under the terms of the GNU General Public
- * License version 2.  This program is licensed "as is" without any
- * warranty of any kind, whether express or implied.
  */
 
 #include <linux/clk.h>
diff --git a/drivers/watchdog/octeon-wdt-nmi.S b/drivers/watchdog/octeon-wdt-nmi.S
index 97f6eb7b5a8e04..e308cc74392018 100644
--- a/drivers/watchdog/octeon-wdt-nmi.S
+++ b/drivers/watchdog/octeon-wdt-nmi.S
@@ -1,8 +1,5 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * This file is subject to the terms and conditions of the GNU General Public
- * License.  See the file "COPYING" in the main directory of this archive
- * for more details.
- *
  * Copyright (C) 2007-2017 Cavium, Inc.
  */
 #include <asm/asm.h>
diff --git a/drivers/watchdog/orion_wdt.c b/drivers/watchdog/orion_wdt.c
index 5ec2dd8fd5fa3d..938b357a12b911 100644
--- a/drivers/watchdog/orion_wdt.c
+++ b/drivers/watchdog/orion_wdt.c
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
 /*
  * drivers/watchdog/orion_wdt.c
  *
@@ -5,9 +6,6 @@
  *
  * Author: Sylver Bruneau <sylver.bruneau@googlemail.com>
  *
- * This file is licensed under  the terms of the GNU General Public
- * License version 2. This program is licensed "as is" without any
- * warranty of any kind, whether express or implied.
  */
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
diff --git a/drivers/watchdog/rtd119x_wdt.c b/drivers/watchdog/rtd119x_wdt.c
index 95c8d7abce42e6..1c3c36e9779739 100644
--- a/drivers/watchdog/rtd119x_wdt.c
+++ b/drivers/watchdog/rtd119x_wdt.c
@@ -1,9 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
 /*
  * Realtek RTD129x watchdog
  *
  * Copyright (c) 2017 Andreas Färber
  *
- * SPDX-License-Identifier: GPL-2.0+
  */
 
 #include <linux/bitops.h>
diff --git a/drivers/watchdog/sb_wdog.c b/drivers/watchdog/sb_wdog.c
index 504be461f992a9..00b35eddf9395f 100644
--- a/drivers/watchdog/sb_wdog.c
+++ b/drivers/watchdog/sb_wdog.c
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-1.0 OR GPL-2.0 */
 /*
  * Watchdog driver for SiByte SB1 SoCs
  *
@@ -38,10 +39,6 @@
  *	(c) Copyright 1996 Alan Cox <alan@lxorguk.ukuu.org.uk>,
  *						All Rights Reserved.
  *
- *	This program is free software; you can redistribute it and/or
- *	modify it under the terms of the GNU General Public License
- *	version 1 or 2 as published by the Free Software Foundation.
- *
  */
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
diff --git a/drivers/watchdog/sbc_fitpc2_wdt.c b/drivers/watchdog/sbc_fitpc2_wdt.c
index 13db71e165836e..141fcbd11c4c82 100644
--- a/drivers/watchdog/sbc_fitpc2_wdt.c
+++ b/drivers/watchdog/sbc_fitpc2_wdt.c
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
 /*
  * Watchdog driver for SBC-FITPC2 board
  *
@@ -5,9 +6,6 @@
  *
  * Adapted from the IXP2000 watchdog driver by Deepak Saxena.
  *
- * This file is licensed under  the terms of the GNU General Public
- * License version 2. This program is licensed "as is" without any
- * warranty of any kind, whether express or implied.
  */
 
 #define pr_fmt(fmt) KBUILD_MODNAME " WATCHDOG: " fmt
diff --git a/drivers/watchdog/ts4800_wdt.c b/drivers/watchdog/ts4800_wdt.c
index 0ea554c7cda579..9d7d7ad876a788 100644
--- a/drivers/watchdog/ts4800_wdt.c
+++ b/drivers/watchdog/ts4800_wdt.c
@@ -1,11 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
 /*
  * Watchdog driver for TS-4800 based boards
  *
  * Copyright (c) 2015 - Savoir-faire Linux
  *
- * This file is licensed under the terms of the GNU General Public
- * License version 2. This program is licensed "as is" without any
- * warranty of any kind, whether express or implied.
  */
 
 #include <linux/kernel.h>
diff --git a/drivers/watchdog/ts72xx_wdt.c b/drivers/watchdog/ts72xx_wdt.c
index bf918f5fa13175..bb53dc481006c9 100644
--- a/drivers/watchdog/ts72xx_wdt.c
+++ b/drivers/watchdog/ts72xx_wdt.c
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
 /*
  * Watchdog driver for Technologic Systems TS-72xx based SBCs
  * (TS-7200, TS-7250 and TS-7260). These boards have external
@@ -8,9 +9,6 @@
  *
  * This driver is based on ep93xx_wdt and wm831x_wdt drivers.
  *
- * This file is licensed under the terms of the GNU General Public
- * License version 2. This program is licensed "as is" without any
- * warranty of any kind, whether express or implied.
  */
 
 #include <linux/platform_device.h>
-- 
An old man doll... just what I always wanted! - Clara

