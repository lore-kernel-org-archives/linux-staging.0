Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5868E70
	for <linux-staging@lists.linux.dev>; Fri, 30 Jul 2021 09:24:34 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B2BCF60F5C;
	Fri, 30 Jul 2021 09:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1627637074;
	bh=LYWEN7tK2xeyNGCsRr0byu6gVw+v9lTZ/d/ghEpCIyo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DNtN2O6ePGLxqH5hNEudVgG5/MWcLUO67v8NsNhd7b2AcX12ka9E/lnnPiXjs+sm3
	 oto1O5dR+RIU8EDSZNnPs1kZFySL6WPxh2UZHHNn3qFnCP29W++5vjQ5O9z9rKyMWo
	 rV2AMrlCrVi9ilT70BecKDy+0fLWO6fBmDHiU8eA=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-staging@lists.linux.dev
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 05/12] staging: r8188eu: remove include/autoconf.h
Date: Fri, 30 Jul 2021 11:24:10 +0200
Message-Id: <20210730092417.1014392-5-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210730092417.1014392-1-gregkh@linuxfoundation.org>
References: <20210730092417.1014392-1-gregkh@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1850; h=from:subject; bh=LYWEN7tK2xeyNGCsRr0byu6gVw+v9lTZ/d/ghEpCIyo=; b=owGbwMvMwCRo6H6F97bub03G02pJDInMRx3WuChYXVvE4SX443XkudMWM7Y5yyjdcH6aaiYUrHmm +JVyRywLgyATg6yYIsuXbTxH91ccUvQytD0NM4eVCWQIAxenAEzEK4ZhfsVmwzl/bXmWr917VITP+t 6HjREvHjLMs857/6Zomd7JI58/rP6csIb1guOjbAA=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit

No one uses this file, so just remove it.

Also remove the pointless Makefile rule that was attempting to create
it.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/staging/r8188eu/Makefile           |  7 ------
 drivers/staging/r8188eu/include/autoconf.h | 26 ----------------------
 2 files changed, 33 deletions(-)
 delete mode 100644 drivers/staging/r8188eu/include/autoconf.h

diff --git a/drivers/staging/r8188eu/Makefile b/drivers/staging/r8188eu/Makefile
index ea455b0939bf..a97cced2e61a 100644
--- a/drivers/staging/r8188eu/Makefile
+++ b/drivers/staging/r8188eu/Makefile
@@ -15,8 +15,6 @@ EXTRA_CFLAGS += -I$(src)/include
 
 ccflags-y += -D__CHECK_ENDIAN__
 
-CONFIG_AUTOCFG_CP = n
-
 CONFIG_R8188EU = m
 
 CONFIG_USB_HCI = y
@@ -72,11 +70,6 @@ _OS_INTFS_FILES :=				\
 
 _HAL_INTFS_FILES += $(OUTSRC_FILES)
 
-ifeq ($(CONFIG_AUTOCFG_CP), y)
-
-$(shell cp $(TopDIR)/autoconf_rtl8188e_usb_linux.h $(TopDIR)/include/autoconf.h)
-endif
-
 ifeq ($(CONFIG_BT_COEXIST), y)
 EXTRA_CFLAGS += -DCONFIG_BT_COEXIST
 endif
diff --git a/drivers/staging/r8188eu/include/autoconf.h b/drivers/staging/r8188eu/include/autoconf.h
deleted file mode 100644
index fcbfc60fad5a..000000000000
--- a/drivers/staging/r8188eu/include/autoconf.h
+++ /dev/null
@@ -1,26 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause */
-/* Copyright(c) 2007 - 2011 Realtek Corporation.*/
-
-/*  temporarily flag ******* */
-/*
- * Public  General Config
- */
-#define RTL871X_MODULE_NAME "88EU"
-#define DRV_NAME "rtl8188eu"
-
-/*
- * Internal  General Config
- */
-
-#define CONFIG_AP_MODE
-
-#define CONFIG_P2P
-
-#define RTW_NOTCH_FILTER 0 /* 0:Disable, 1:Enable, */
-
-#define CONFIG_BR_EXT_BRNAME	"br0"
-
-/*
- * Debug Related Config
- */
-#define DBG	1
-- 
2.32.0

