Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5BEE2FA1
	for <linux-staging@lists.linux.dev>; Fri, 23 Apr 2021 14:59:07 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id r7so36707153wrm.1
        for <linux-staging@lists.linux.dev>; Fri, 23 Apr 2021 07:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5c1+Q0KzVEpEp4ZoM+JKnpzyHdyY1+xbVigGE4V/QiE=;
        b=JLOrBCzzBaqAtDEMPtX2WSu3/Z5y7BmKlTj3E9rHRIQXTBrgbMAc+WmN135CTXzuB2
         jPBoR2lMp8ucCKI7oD/IlbzE54lSBrj6K0eKPXtwYOB7k/KbPiOeGcseIveeo4nSTGGU
         VuLP1litkOkbxYmF6Qdmlv3UVul3xfXaP1xdd2Cyx05qQov8QB1KkOK3tijbV81T1PyV
         siAB/u5PP/DEM1rx9x7n+lkP2UapWcbdzm+wK9VWKXxyszDAOM5m9SLPTbYeB6mEgABU
         AtdfGJcLjZ3S39YRdqofAKQ6QT52eE/v6s1lhlDCy0SGVWz9TwPxWYsgnyP/MrD/mTsW
         p8tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5c1+Q0KzVEpEp4ZoM+JKnpzyHdyY1+xbVigGE4V/QiE=;
        b=tO4Lz0tCB1gJCTRi6ng2nUVszeMlAuef7j6ud3oYY9df4u2LXPHnkXtRWK1GHlrq3U
         LaO1MgWyagflBaFcOeOR8u1wvaf2N6Kna/Y7bGA1Jl2JfHQXt8ftmK5Odpm3PU0Msn91
         HbK45QBMF/lejx4q+rrG1g+DazcT8V+fheQ8RztTZTrWAcXIzHX7W31tyhnjeTVdAP/r
         iSc/9/Yn80Lz1ujL6Ou8V645LGOlwHRk9mdxAoJDiAUKgUysKqq732B/ABXfMLoKOj7P
         LOknO/ivZaoyKtKBZNbLF3M/m+UQ4HVACmxt7VfADyRA/sD9fcWTCRbvUXPy3r0mcnt7
         1NsA==
X-Gm-Message-State: AOAM530NdLKcU0SgPKZU+3RMcYqOUbD33oY1wBL1Ywmx1yUh3W1TcOA5
	Qt8cm/EZuy/j4UfaCUTJaArt1GQEbo4=
X-Google-Smtp-Source: ABdhPJxR1q87tbSkK0ms7o7IRgBPbDdSXCp2R15+ZNuiLNnplyQ3/EGOqGPcAdVlqBbUS0JuWx1zxw==
X-Received: by 2002:a5d:4850:: with SMTP id n16mr5289043wrs.294.1619189946620;
        Fri, 23 Apr 2021 07:59:06 -0700 (PDT)
Received: from agape ([5.171.72.99])
        by smtp.gmail.com with ESMTPSA id h10sm9341276wrt.40.2021.04.23.07.59.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 07:59:06 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 15/49] staging: rtl8723bs: remove debug macros related to core/rtw_recv.c tracing
Date: Fri, 23 Apr 2021 16:58:06 +0200
Message-Id: <d8c4a02f2c8199d8551dcc3f0c80dec2d25dd8e6.1619189489.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619189489.git.fabioaiuto83@gmail.com>
References: <cover.1619189489.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove debug macros definitions related to core/rtw_recv.c
obsolete tracing.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_recv.c     | 2 --
 drivers/staging/rtl8723bs/include/rtw_debug.h | 5 +----
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index 668a703dee7f..7432def1eb6f 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -4,8 +4,6 @@
  * Copyright(c) 2007 - 2012 Realtek Corporation. All rights reserved.
  *
  ******************************************************************************/
-#define _RTW_RECV_C_
-
 #include <drv_types.h>
 #include <rtw_debug.h>
 #include <linux/jiffies.h>
diff --git a/drivers/staging/rtl8723bs/include/rtw_debug.h b/drivers/staging/rtl8723bs/include/rtw_debug.h
index 6403a11d712d..422d6bcfcc6f 100644
--- a/drivers/staging/rtl8723bs/include/rtw_debug.h
+++ b/drivers/staging/rtl8723bs/include/rtw_debug.h
@@ -7,7 +7,6 @@
 #ifndef __RTW_DEBUG_H__
 #define __RTW_DEBUG_H__
 
-#define _module_rtl871x_recv_c_		BIT(2)
 #define _module_recv_osdep_c_		BIT(3)
 #define _module_rtl871x_mlme_c_		BIT(4)
 #define _module_mlme_osdep_c_		BIT(5)
@@ -41,9 +40,7 @@
 
 #undef _MODULE_DEFINE_
 
-#if defined _RTW_RECV_C_
-	#define _MODULE_DEFINE_	_module_rtl871x_recv_c_
-#elif defined _RECV_OSDEP_C_
+#if defined _RECV_OSDEP_C_
 	#define _MODULE_DEFINE_	_module_recv_osdep_c_
 #elif defined _RTW_MLME_C_
 	#define _MODULE_DEFINE_	_module_rtl871x_mlme_c_
-- 
2.20.1

