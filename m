Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F0B1844
	for <linux-staging@lists.linux.dev>; Wed, 16 Feb 2022 01:07:22 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id o24so855998wro.3
        for <linux-staging@lists.linux.dev>; Tue, 15 Feb 2022 17:07:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PMyMSUP7asF/s/oKu8jRzLvnYQUdmW1URZT8HnFSQy0=;
        b=jTJuJoASvQOgDzLtakBXSmhb4VYtpwi36BD8mZavRx52KG560ZXf8dEKL+hsksqAHK
         skNexb+VDcvR6BlgA8yWRO+H2u1Pq/sOl/itQHRk/I8xY2Mz6WeGDP02utMKPEVWgcsm
         bWKZDhDqDih2sZT1dpIzyBo7m4AUrG4wdLWTQlqHfZk1iQ5wd4o6uTdTAfk+1GkkupBa
         tYOxUX7tskRABT8uRquoNebIGAJX7yTOVy58vrytFhk2NTorGjRfDCXlGdnhndpqxJM1
         1jqGbJpxLpxlX+hrGl4jqa1ZGnD1Nry8xO9b/oWVxh2hHEsE4Be9YZRv5Ze6Ves/CsKo
         ICdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PMyMSUP7asF/s/oKu8jRzLvnYQUdmW1URZT8HnFSQy0=;
        b=t2gxLZGbGXd96edwtJQAb9iBoHA4CAfn71D2UiFNjYZZjPuUonzMPntR2WY46vA+eZ
         eUGXOYOmdKboA8cIv5D0g3Xg7qtiUCqTNZ/RsBvH6O9X/poEHS98i751vCk1m1ubiQVR
         WpKbzJO/EeoaxU93SFklhTxu8EDo/8b/DDrwQ0L4Lezz6rlDI4O/K6vUUl4QFQnJtvQ/
         fKFoh+yqE2frwi/WjdZhNb1Er8l55Ss/uAPwMm5yHyIYrsfYIxjz7O9tAw4j2a0480+a
         wYOHAPHmTbM17CZdsFtbfEx1Wqp5Ti5Gz/x9s8DGh2DnkR2+uGPCjKDkJ+XDu1V8maTy
         RrUQ==
X-Gm-Message-State: AOAM531XI2U4PZ7bXeR725lnCHvDqOnsW40a3eG0/inrhptlHwCI2Cwr
	J4aibsODtsptjiRJOjakHbquQw==
X-Google-Smtp-Source: ABdhPJwKg5di3jjMCxCFW200EG/nexWDgvCjwt97MfKEHu2CrXJMwunEAx2zz3adAtk3IhDo6Bas2Q==
X-Received: by 2002:a05:6000:1847:b0:1e6:2783:b3e6 with SMTP id c7-20020a056000184700b001e62783b3e6mr371068wri.163.1644973640528;
        Tue, 15 Feb 2022 17:07:20 -0800 (PST)
Received: from localhost.localdomain (3.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.6.1.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:df16::3])
        by smtp.gmail.com with ESMTPSA id m8sm10551185wms.4.2022.02.15.17.07.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Feb 2022 17:07:20 -0800 (PST)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com,
	Larry.Finger@lwfinger.net,
	straube.linux@gmail.com,
	martin@kaiser.cx,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	paskripkin@gmail.com
Subject: [PATCH v2 11/15] staging: r8188eu: remove rtw_debug module parameter
Date: Wed, 16 Feb 2022 01:07:05 +0000
Message-Id: <20220216010709.791-12-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220216010709.791-1-phil@philpotter.co.uk>
References: <20220216010709.791-1-phil@philpotter.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove rtw_debug module parameter, and also the internal GlobalDebugLevel
flag and all places where it is referenced. As hal/odm_debug.c is now
essentially empty, also remove this file and edit the Makefile to no
longer reference it. The DBG_88E macro was the last user of these and
has now been removed, making the parameter and flag redundant.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/r8188eu/Makefile            | 1 -
 drivers/staging/r8188eu/hal/odm_debug.c     | 6 ------
 drivers/staging/r8188eu/include/rtw_debug.h | 2 --
 drivers/staging/r8188eu/os_dep/os_intfs.c   | 4 ----
 4 files changed, 13 deletions(-)
 delete mode 100644 drivers/staging/r8188eu/hal/odm_debug.c

diff --git a/drivers/staging/r8188eu/Makefile b/drivers/staging/r8188eu/Makefile
index 84627fc89ec9..1d7982b618ba 100644
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
index 4230819cbf8c..9884dbc6eab5 100644
--- a/drivers/staging/r8188eu/os_dep/os_intfs.c
+++ b/drivers/staging/r8188eu/os_dep/os_intfs.c
@@ -45,7 +45,6 @@ static int rtw_smart_ps = 2;
 module_param(rtw_ips_mode, int, 0644);
 MODULE_PARM_DESC(rtw_ips_mode, "The default IPS mode");
 
-static int rtw_debug = 1;
 static int rtw_radio_enable = 1;
 static int rtw_long_retry_lmt = 7;
 static int rtw_short_retry_lmt = 7;
@@ -148,14 +147,11 @@ MODULE_PARM_DESC(rtw_80211d, "Enable 802.11d mechanism");
 static uint rtw_notch_filter = RTW_NOTCH_FILTER;
 module_param(rtw_notch_filter, uint, 0644);
 MODULE_PARM_DESC(rtw_notch_filter, "0:Disable, 1:Enable, 2:Enable only for P2P");
-module_param_named(debug, rtw_debug, int, 0444);
-MODULE_PARM_DESC(debug, "Set debug level (1-9) (default 1)");
 
 static uint loadparam(struct adapter *padapter)
 {
 	struct registry_priv  *registry_par = &padapter->registrypriv;
 
-	GlobalDebugLevel = rtw_debug;
 	registry_par->chip_version = (u8)rtw_chip_version;
 	registry_par->rfintfs = (u8)rtw_rfintfs;
 	registry_par->lbkmode = (u8)rtw_lbkmode;
-- 
2.34.1

