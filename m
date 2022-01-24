Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9F6F3FE7
	for <linux-staging@lists.linux.dev>; Mon, 24 Jan 2022 22:44:41 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id l12-20020a7bc34c000000b003467c58cbdfso364466wmj.2
        for <linux-staging@lists.linux.dev>; Mon, 24 Jan 2022 14:44:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=97GwBkpfkEyDXPs9Xg2PMr7/QxnDaM9vXKCUdcNdzlQ=;
        b=ch536Dq2+p5qGm7SDqd/7tTHbZh0/MFxbamVvJp4UwtA8hIEuzLVOkqNwojOiyNNvW
         l9lQ6Tt+02/My+3APjDxUWFMzpPRaRoQ3OFVuSD77hPQHfD66rGni0uTd0IlIX3k5tCx
         1alAT07eHhMe3THyARDSrF+cgxXvTeqQ4n4N/ivzVT7gU5nChQMBz7r3IOstkTyjO8oS
         6mpHk1SUFCDZ3mwfOVygBRiP/8DVdZHjArCgoaPOe/CS6q7RXs9fYXL5kr4OEesPmD5x
         jJKoSRgU5gVCOIc1SGwf07HiRfCMK4XlpuBmd+lGVoBx5KY4Zq3EymfcKQ0uHTgD9yDG
         Lx/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=97GwBkpfkEyDXPs9Xg2PMr7/QxnDaM9vXKCUdcNdzlQ=;
        b=zIbUFh7bg59iI1qSecNW0xlunS0ztgLHiZYQ49fxSpo4dxHwBin4J/k5tG3L5LIuzB
         CReebCl0IFG97NQQl32UiEcEEQIoEVO8wI31juuV0rlvr8lDD0uiLPZtPJuBK7RkquAM
         cvQUc2woyixcBEVZeKHHqZ3Sm9mIa2CQpknA8LfDXKpC88SV6EjaaX5P7EsywSSSEKxE
         WyHxMglRtJ+54C1ZQfdrFK8RkhOdeJjABVw43fUUFxWvkpq3MgWJgNnrv1NP0tQ4kJHv
         RVt0irlixlju0VYdjbTjziPkaOGVtfteM/KJI8Ml1xntEyI+V/YeyUUpOZDPG0b1t4/K
         8hUw==
X-Gm-Message-State: AOAM53096XFmZQUwSzHF5YXrzUkUNAYrnROjnIl9WxWvWRqriWXMuo/m
	BbIGXKsZjLN1uZwvCTdWZbL4EOmqhVF1vg==
X-Google-Smtp-Source: ABdhPJw1Pbz998Z2T97NBh6nX+rD2V4rXuGJTJn2mIfdxD5zRNSecpEGAL3kl6eKVmrz6OOv3S2pZg==
X-Received: by 2002:a1c:7303:: with SMTP id d3mr381891wmb.154.1643064280218;
        Mon, 24 Jan 2022 14:44:40 -0800 (PST)
Received: from localhost.localdomain (d.f.5.e.6.6.b.1.e.6.2.7.e.5.c.8.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:dfde:e1a0:8c5e:726e:1b66:e5fd])
        by smtp.gmail.com with ESMTPSA id i3sm15010613wru.33.2022.01.24.14.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jan 2022 14:44:39 -0800 (PST)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com,
	Larry.Finger@lwfinger.net,
	straube.linux@gmail.com,
	martin@kaiser.cx,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	paskripkin@gmail.com
Subject: [PATCH 10/10] staging: r8188eu: remove GlobalDebugLevel flag
Date: Mon, 24 Jan 2022 22:44:15 +0000
Message-Id: <20220124224415.831-11-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220124224415.831-1-phil@philpotter.co.uk>
References: <20220124224415.831-1-phil@philpotter.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove hal/odm_debug.c, to get rid of the GlobalDebugLevel flag,
and remove the two other lines that reference GlobalDebugLevel, as
the last remaining user (DBG_88E) is now gone. Also modify Makefile
to no longer build hal/odm_debug.c.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/r8188eu/Makefile            | 1 -
 drivers/staging/r8188eu/hal/odm_debug.c     | 6 ------
 drivers/staging/r8188eu/include/rtw_debug.h | 2 --
 drivers/staging/r8188eu/os_dep/os_intfs.c   | 1 -
 4 files changed, 10 deletions(-)
 delete mode 100644 drivers/staging/r8188eu/hal/odm_debug.c

diff --git a/drivers/staging/r8188eu/Makefile b/drivers/staging/r8188eu/Makefile
index a7a486cc16dd..ecd6fe5bd94c 100644
--- a/drivers/staging/r8188eu/Makefile
+++ b/drivers/staging/r8188eu/Makefile
@@ -10,7 +10,6 @@ r8188eu-y = \
 		hal/hal_intf.o \
 		hal/hal_com.o \
 		hal/odm.o \
-		hal/odm_debug.o \
 		hal/odm_HWConfig.o \
 		hal/odm_RegConfig8188E.o \
 		hal/odm_RTL8188E.o \
diff --git a/drivers/staging/r8188eu/hal/odm_debug.c b/drivers/staging/r8188eu/hal/odm_debug.c
deleted file mode 100644
index 7a134229fe39..000000000000
--- a/drivers/staging/r8188eu/hal/odm_debug.c
+++ /dev/null
@@ -1,6 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/* Copyright(c) 2007 - 2011 Realtek Corporation. */
-
-#include "../include/rtw_debug.h"
-
-u32 GlobalDebugLevel;
diff --git a/drivers/staging/r8188eu/include/rtw_debug.h b/drivers/staging/r8188eu/include/rtw_debug.h
index 959fb6bd25ca..01a7d987d6cc 100644
--- a/drivers/staging/r8188eu/include/rtw_debug.h
+++ b/drivers/staging/r8188eu/include/rtw_debug.h
@@ -52,6 +52,4 @@
 
 #define DRIVER_PREFIX	"R8188EU: "
 
-extern u32 GlobalDebugLevel;
-
 #endif	/* __RTW_DEBUG_H__ */
diff --git a/drivers/staging/r8188eu/os_dep/os_intfs.c b/drivers/staging/r8188eu/os_dep/os_intfs.c
index 17249b4fb7ad..8589de487289 100644
--- a/drivers/staging/r8188eu/os_dep/os_intfs.c
+++ b/drivers/staging/r8188eu/os_dep/os_intfs.c
@@ -155,7 +155,6 @@ static uint loadparam(struct adapter *padapter)
 {
 	struct registry_priv  *registry_par = &padapter->registrypriv;
 
-	GlobalDebugLevel = rtw_debug;
 	registry_par->chip_version = (u8)rtw_chip_version;
 	registry_par->rfintfs = (u8)rtw_rfintfs;
 	registry_par->lbkmode = (u8)rtw_lbkmode;
-- 
2.34.1

