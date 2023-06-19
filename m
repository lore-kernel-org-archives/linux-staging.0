Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 232DA12B91
	for <linux-staging@lists.linux.dev>; Mon, 19 Jun 2023 15:52:22 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-51a2160a271so4634533a12.1
        for <linux-staging@lists.linux.dev>; Mon, 19 Jun 2023 08:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687189941; x=1689781941;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F7Sy5uyS4+3x47XHnoFiJXjC2wHKZ9yU1dlAX2FPVgA=;
        b=jltWjB7rpxGtsoZ3hQ45GSilkS/zyUMUgXjKWFvPjgqxOWSZ3/c9EJpZzx123KJHdZ
         ToDjJ4RxRxZTSu9wwxPIqIwxDh0ncMlaPxLdsSmUeK76QlzcFewF/LCPcS3yKptWLK9a
         Udi0VwSu4PsS3Zsz64f2wR7gdyzl54Tfm+bRJ0t/DazFZskXuYpzjFpeK1+F0QsbdVxD
         IrbabYTjzARI2VdXfDhQEPCHEU/xWiufL1spyHqH2mT25Mj0u8yj3oC8aZUbwtSGLcO/
         WVBoIzNj9P821buYvUYzds/GsR2V11qFofVcCOQJrr/fCYSn+wTwWS47Y6rpb+1wp5eH
         SH4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687189941; x=1689781941;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F7Sy5uyS4+3x47XHnoFiJXjC2wHKZ9yU1dlAX2FPVgA=;
        b=IxqplNzYWSZisU1RxLBu9uNKrxiJ0B8oiaWP22RRNz4ajMKiBw/mJGslLhg+xLfj+7
         e9pFytZ5aT31AQC7cpUPFFaUgYeeRyhCX5+5Yjxd+63gsYUUW21bxR1eZgNrjPqs1UQI
         8X6QKweo04CY/fqyOO1lH/iar5Kltg+YyD8w4m9dOSYjTrOG1/h8W9aujJFQHav+h1bC
         cYcBNdo4u8kjaooDIH7q6Z8bSNE4pDXVwBXXKhv0pzPGaqw03PwPRvZP/JWZvbtdvlhk
         1wNVTd9bultaF8s9whgb87vYUm8QgPxuuctNMO841fy3bG/cZ1GcjGc2TGENxIeQt1WG
         zXrg==
X-Gm-Message-State: AC+VfDxd6l9rxaGCpY8CWkwirC2n1M6Fl1AhsSVp8UKR2Dk8eAquZ3WM
	gbh4pTAMuOHWc2iMiIsXJt0=
X-Google-Smtp-Source: ACHHUZ57tCmYCfO9AfOAzRUrTXHGU0OAJ6O4W2mTxTgcjw386hpFzIdIxDdK9C6mNBwiQQgAsyoqjA==
X-Received: by 2002:aa7:d9cf:0:b0:516:459d:d913 with SMTP id v15-20020aa7d9cf000000b00516459dd913mr7305823eds.37.1687189941043;
        Mon, 19 Jun 2023 08:52:21 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abbd5.dynamic.kabel-deutschland.de. [95.90.187.213])
        by smtp.gmail.com with ESMTPSA id d16-20020a056402001000b0051849ba515esm8562430edu.13.2023.06.19.08.52.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 08:52:20 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH] staging: rtl8192e: remove 5G related code
Date: Mon, 19 Jun 2023 17:52:03 +0200
Message-ID: <20230619155203.6039-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In previous patches we removed 5G code since the hardware that uses this
driver does not support 5G. There is still some 5G related code, remove it.
All the removed defines are unused and we can safely remove "N-5G" from the
rtllib_modes array.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
Compile-tested only, due to lack of hardware.

 drivers/staging/rtl8192e/rtl8192e/r8192E_hw.h     | 1 -
 drivers/staging/rtl8192e/rtl8192e/r8192E_phyreg.h | 2 --
 drivers/staging/rtl8192e/rtllib.h                 | 1 -
 drivers/staging/rtl8192e/rtllib_wx.c              | 2 +-
 4 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_hw.h b/drivers/staging/rtl8192e/rtl8192e/r8192E_hw.h
index f4d4b01630a2..09f8c76b7e65 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_hw.h
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_hw.h
@@ -159,7 +159,6 @@ enum _RTL8192PCI_HW {
 	WFCRC2		  = 0x2f8,
 
 	BW_OPMODE		= 0x300,
-#define	BW_OPMODE_5G			BIT1
 #define	BW_OPMODE_20MHZ			BIT2
 	IC_VERRSION		= 0x301,
 	MSR			= 0x303,
diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_phyreg.h b/drivers/staging/rtl8192e/rtl8192e/r8192E_phyreg.h
index 65365ebe4e85..24fb0ca539ea 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_phyreg.h
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_phyreg.h
@@ -266,7 +266,6 @@
 #define b3WireAddressLength		0x400
 #define b3WireRFPowerDown		0x1
 /*#define bHWSISelect			0x8 */
-#define b5GPAPEPolarity			0x40000000
 #define b2GPAPEPolarity			0x80000000
 #define bRFSW_TxDefaultAnt		0x3
 #define bRFSW_TxOptionAnt		0x30
@@ -284,7 +283,6 @@
 #define bRFSI_ANTSW			0x100
 #define bRFSI_ANTSWB			0x200
 #define bRFSI_PAPE			0x400
-#define bRFSI_PAPE5G			0x800
 #define bBandSelect			0x1
 #define bHTSIG2_GI			0x80
 #define bHTSIG2_Smoothing		0x01
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index dbf78b60dd78..e3ce4431d460 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -427,7 +427,6 @@ enum wireless_mode {
 	WIRELESS_MODE_G = 0x04,
 	WIRELESS_MODE_AUTO = 0x08,
 	WIRELESS_MODE_N_24G = 0x10,
-	WIRELESS_MODE_N_5G = 0x20
 };
 
 #ifndef ETH_P_PAE
diff --git a/drivers/staging/rtl8192e/rtllib_wx.c b/drivers/staging/rtl8192e/rtllib_wx.c
index 538cedb1dc02..e9469bfef3dd 100644
--- a/drivers/staging/rtl8192e/rtllib_wx.c
+++ b/drivers/staging/rtl8192e/rtllib_wx.c
@@ -19,7 +19,7 @@
 #include "rtllib.h"
 
 static const char * const rtllib_modes[] = {
-	"a", "b", "g", "?", "N-24G", "N-5G"
+	"a", "b", "g", "?", "N-24G"
 };
 
 #define MAX_CUSTOM_LEN 64
-- 
2.41.0

