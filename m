Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 953772FA1
	for <linux-staging@lists.linux.dev>; Fri, 23 Apr 2021 14:59:42 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id p10-20020a1c544a0000b02901387e17700fso1398674wmi.2
        for <linux-staging@lists.linux.dev>; Fri, 23 Apr 2021 07:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WXZjzbZRHK0jBwgvuHcL9uMISPcQ6vFSZC1gma0GKcY=;
        b=rOBdAoE3zso+Tc92VqoqOnE7f9NdI+SCp31UCmeWL5KyTdG2VOwcoBPT7dvolJTN9h
         0o6HTRIPUIc4JXJK3U+ovZpO5UbpOqTMxZF8gCAzTKZd69VormYa3tix67/k4Pi1EHko
         /B202K+cQjNWB/VLIieBz3mWazDCbiO3j6DpTbE52ITVnOGAGhZTaZ7pNRayiDx93RXU
         BZ0Z6v6dtinDIjaYrRSEUNyY8fhjpUsKZs3ioAE3/9uo/DdwlqjOmJYH+u+nB7ef6wxU
         6ty10kdfS46CRcFe6pgvNlCFaYPj1gtoDTcKQFsw38fMXQSMEmAXlTdjWJbMX/uFh/N2
         ZA8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WXZjzbZRHK0jBwgvuHcL9uMISPcQ6vFSZC1gma0GKcY=;
        b=T/Bb7TMXfVeNMcrpM0QykzTOTYc/r0KaTPlLV2kGE4wV5m3j4cr6GTzNT8FKYTWCEc
         ewjimWmHpDxSEyNnNqG1G4/g2iUZyuWi+28FJNdIlFEUQ8HCjSG3PfTbxviySLz3Dlki
         kiTFgrGOZmzaECAou/pcW7BnVHEC0y1UNOwn9jd4i2tuIvPBgJ9r3jpCCg5LHywTX9hh
         Q6B+yMjvpazRdx2YrarR4i2cJ/MGbP0DFM/wBgGsaL1Y99HTzWCoIOBdvBOQrVBU5JzR
         QWfrKeYUQfYvqsunthwYk8wROaP/XZq7Kj5b/nZjzuL1Fj+uT4HoaM2nSunQzyWAuRJy
         6mXQ==
X-Gm-Message-State: AOAM530+qcRunXjYLN8xbMS/h+dW8J/rUU0D5/fPK5z2i/dCxvH/GT6B
	R8cWOcCUnKLzWuHgzR+Rkd4=
X-Google-Smtp-Source: ABdhPJwgg8zwbBNKGLU8zdTwt1S/UQPkwMZAUlC2/2Qkz0ZhTfTeO5IhAjJsQFm4yT9Moqzx90Hhdw==
X-Received: by 2002:a05:600c:4fd4:: with SMTP id o20mr6203003wmq.166.1619189981258;
        Fri, 23 Apr 2021 07:59:41 -0700 (PDT)
Received: from agape ([5.171.72.99])
        by smtp.gmail.com with ESMTPSA id 200sm8469131wmb.1.2021.04.23.07.59.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 07:59:40 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 36/49] staging: rtl8723bs: remove unused macros tied to os_dep/sdio_intf.c debug
Date: Fri, 23 Apr 2021 16:58:27 +0200
Message-Id: <5129ca34b24f01f93f1e8315aba65eabfda628a6.1619189489.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619189489.git.fabioaiuto83@gmail.com>
References: <cover.1619189489.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove unused macro definitions tied to
os_dep/sdio_intf.c debug.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_debug.h | 7 +------
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c  | 2 --
 2 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_debug.h b/drivers/staging/rtl8723bs/include/rtw_debug.h
index a7f6827c282f..130cfe3d2032 100644
--- a/drivers/staging/rtl8723bs/include/rtw_debug.h
+++ b/drivers/staging/rtl8723bs/include/rtw_debug.h
@@ -7,7 +7,6 @@
 #ifndef __RTW_DEBUG_H__
 #define __RTW_DEBUG_H__
 
-#define _module_hci_intfs_c_			BIT(20)
 #define _module_hci_ops_c_			BIT(21)
 #define _module_osdep_service_c_			BIT(22)
 #define _module_mp_			BIT(23)
@@ -23,14 +22,10 @@
 
 #undef _MODULE_DEFINE_
 
-#if defined _HCI_INTF_C_
-	#define	_MODULE_DEFINE_	_module_hci_intfs_c_
-#elif defined _HCI_OPS_C_
+#if defined _HCI_OPS_C_
 	#define	_MODULE_DEFINE_	_module_hci_ops_c_
 #elif defined _SDIO_OPS_C_
 	#define	_MODULE_DEFINE_ 1
-#elif defined _OSDEP_HCI_INTF_C_
-	#define	_MODULE_DEFINE_	_module_hci_intfs_c_
 #elif defined _OSDEP_SERVICE_C_
 	#define	_MODULE_DEFINE_	_module_osdep_service_c_
 #elif defined _HCI_OPS_OS_C_
diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
index d2bf444117b8..5e484344e172 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
@@ -4,8 +4,6 @@
  * Copyright(c) 2007 - 2012 Realtek Corporation. All rights reserved.
  *
  ******************************************************************************/
-#define _HCI_INTF_C_
-
 #include <drv_types.h>
 #include <rtw_debug.h>
 #include <hal_btcoex.h>
-- 
2.20.1

