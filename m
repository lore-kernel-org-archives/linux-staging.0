Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D721362
	for <linux-staging@lists.linux.dev>; Fri,  8 Apr 2022 08:20:10 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id dr20so15704834ejc.6
        for <linux-staging@lists.linux.dev>; Fri, 08 Apr 2022 01:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wA8IbfGSWA/LPNyziDBCK5VK56qWyjFyrwxoJLLumqM=;
        b=f4QztbglX7qsRUv1AamaKIQPC1zGaRggsSLfHGW+vNkRHY2LOMAu9S9f5QlcPVPQiM
         mz45UgVmOjkMW2YMJmNrVe3Q7nmMYT61OU6T1QIcKI9YFKy2Qz+GHa8y6Q0yi/1at0bh
         xzaZzftBTmDjPQ7MvMiwomEW+dqTMoCTEudoKGz0cFvrICOFzRJ4qAsKAZgzscKR2xLv
         0a/6cjYhvaHpJqMB1ZBbvINSLPaboaIunmiHr8Ungl0BSNpOslQMSjkIH3OpwsBhQn5q
         rSh3ef6w4Z7fjCs2VNEtv19BM+WypGPFV0Ic6/V6JGjlAfvStxBqb3SxqkU3XlyZ4CTn
         q+Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wA8IbfGSWA/LPNyziDBCK5VK56qWyjFyrwxoJLLumqM=;
        b=gU18A6eYuQV+Oax8ALGBhLzV7WiC1KlN1xK9dv8kLgoBxOOtNpFWprNzFSGCM3eOSh
         Zx6gOBPRI72a5L5m2Ke/Io5URqKCxcQbp+azD6vPDlHsBiyHjcjTJiQGo47qL8TTOyot
         ToO2NJhTtKonVmhuAYa107UFFqoKWm9eOAm/gGZaAxHA/GOkPw2uSNdpXclD2Z7sdwFG
         ABA7OHKeCpQeJitjHxHFCBPgLWPdZ0uUGD691N8H+MftFgyBYZOXz5Tpy5i4ECySWW4Z
         TS8cJxQBaZq3o7L7LI/PqX2QrJKj1hkgdf2YMh1JrSzZjR0Ny83AvJr4Zaw7UPu/uBAM
         9FCw==
X-Gm-Message-State: AOAM5322S7EAZODpqzpTeRvC3dzdgG1VwX6TbNMzLlLagYq11v7gQbW4
	sFdxBYjMAZdtSDjvUeZEfOQ=
X-Google-Smtp-Source: ABdhPJwOck7yEQaxgpFC3uQMXW6SzFTGGB88/AvvSIS3Ock5yTPLLNwngO5fRl9SaFiKFL9gniyTYw==
X-Received: by 2002:a17:907:1c0c:b0:6e0:9b15:29d5 with SMTP id nc12-20020a1709071c0c00b006e09b1529d5mr17404226ejc.416.1649406008459;
        Fri, 08 Apr 2022 01:20:08 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb55.dynamic.kabel-deutschland.de. [95.90.187.85])
        by smtp.gmail.com with ESMTPSA id u10-20020a170906b10a00b006e1004406easm8466546ejy.93.2022.04.08.01.20.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Apr 2022 01:20:07 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove header rtw_ioctl.h
Date: Fri,  8 Apr 2022 10:19:56 +0200
Message-Id: <20220408081956.1093-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Nothing from the header rtw_ioctl.h is used in the driver code.
Remove the header.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/rtl8723bs/include/drv_types.h |  1 -
 drivers/staging/rtl8723bs/include/rtw_ioctl.h | 72 -------------------
 2 files changed, 73 deletions(-)
 delete mode 100644 drivers/staging/rtl8723bs/include/rtw_ioctl.h

diff --git a/drivers/staging/rtl8723bs/include/drv_types.h b/drivers/staging/rtl8723bs/include/drv_types.h
index 0ce08c2a0755..0bbbdebdf157 100644
--- a/drivers/staging/rtl8723bs/include/drv_types.h
+++ b/drivers/staging/rtl8723bs/include/drv_types.h
@@ -42,7 +42,6 @@
 #include <rtw_mlme.h>
 #include <mlme_osdep.h>
 #include <rtw_io.h>
-#include <rtw_ioctl.h>
 #include <rtw_ioctl_set.h>
 #include <osdep_intf.h>
 #include <rtw_eeprom.h>
diff --git a/drivers/staging/rtl8723bs/include/rtw_ioctl.h b/drivers/staging/rtl8723bs/include/rtw_ioctl.h
deleted file mode 100644
index 7179591cb01d..000000000000
--- a/drivers/staging/rtl8723bs/include/rtw_ioctl.h
+++ /dev/null
@@ -1,72 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/******************************************************************************
- *
- * Copyright(c) 2007 - 2011 Realtek Corporation. All rights reserved.
- *
- ******************************************************************************/
-#ifndef _RTW_IOCTL_H_
-#define _RTW_IOCTL_H_
-
-/* 	00 - Success */
-/* 	11 - Error */
-#define STATUS_SUCCESS				(0x00000000L)
-#define STATUS_PENDING				(0x00000103L)
-
-#define STATUS_UNSUCCESSFUL			(0xC0000001L)
-#define STATUS_INSUFFICIENT_RESOURCES		(0xC000009AL)
-#define STATUS_NOT_SUPPORTED			(0xC00000BBL)
-
-#define NDIS_STATUS_SUCCESS			((uint)STATUS_SUCCESS)
-#define NDIS_STATUS_PENDING			((uint)STATUS_PENDING)
-#define NDIS_STATUS_NOT_RECOGNIZED		((uint)0x00010001L)
-#define NDIS_STATUS_NOT_COPIED			((uint)0x00010002L)
-#define NDIS_STATUS_NOT_ACCEPTED		((uint)0x00010003L)
-#define NDIS_STATUS_CALL_ACTIVE			((uint)0x00010007L)
-
-#define NDIS_STATUS_FAILURE			((uint)STATUS_UNSUCCESSFUL)
-#define NDIS_STATUS_RESOURCES			((uint)STATUS_INSUFFICIENT_RESOURCES)
-#define NDIS_STATUS_CLOSING			((uint)0xC0010002L)
-#define NDIS_STATUS_BAD_VERSION			((uint)0xC0010004L)
-#define NDIS_STATUS_BAD_CHARACTERISTICS		((uint)0xC0010005L)
-#define NDIS_STATUS_ADAPTER_NOT_FOUND		((uint)0xC0010006L)
-#define NDIS_STATUS_OPEN_FAILED			((uint)0xC0010007L)
-#define NDIS_STATUS_DEVICE_FAILED		((uint)0xC0010008L)
-#define NDIS_STATUS_MULTICAST_FULL		((uint)0xC0010009L)
-#define NDIS_STATUS_MULTICAST_EXISTS		((uint)0xC001000AL)
-#define NDIS_STATUS_MULTICAST_NOT_FOUND		((uint)0xC001000BL)
-#define NDIS_STATUS_REQUEST_ABORTED		((uint)0xC001000CL)
-#define NDIS_STATUS_RESET_IN_PROGRESS		((uint)0xC001000DL)
-#define NDIS_STATUS_CLOSING_INDICATING		((uint)0xC001000EL)
-#define NDIS_STATUS_NOT_SUPPORTED		((uint)STATUS_NOT_SUPPORTED)
-#define NDIS_STATUS_INVALID_PACKET		((uint)0xC001000FL)
-#define NDIS_STATUS_OPEN_LIST_FULL		((uint)0xC0010010L)
-#define NDIS_STATUS_ADAPTER_NOT_READY		((uint)0xC0010011L)
-#define NDIS_STATUS_ADAPTER_NOT_OPEN		((uint)0xC0010012L)
-#define NDIS_STATUS_NOT_INDICATING		((uint)0xC0010013L)
-#define NDIS_STATUS_INVALID_LENGTH		((uint)0xC0010014L)
-#define NDIS_STATUS_INVALID_DATA		((uint)0xC0010015L)
-#define NDIS_STATUS_BUFFER_TOO_SHORT		((uint)0xC0010016L)
-#define NDIS_STATUS_INVALID_OID			((uint)0xC0010017L)
-#define NDIS_STATUS_ADAPTER_REMOVED		((uint)0xC0010018L)
-#define NDIS_STATUS_UNSUPPORTED_MEDIA		((uint)0xC0010019L)
-#define NDIS_STATUS_GROUP_ADDRESS_IN_USE	((uint)0xC001001AL)
-#define NDIS_STATUS_FILE_NOT_FOUND		((uint)0xC001001BL)
-#define NDIS_STATUS_ERROR_READING_FILE		((uint)0xC001001CL)
-#define NDIS_STATUS_ALREADY_MAPPED		((uint)0xC001001DL)
-#define NDIS_STATUS_RESOURCE_CONFLICT		((uint)0xC001001EL)
-#define NDIS_STATUS_NO_CABLE			((uint)0xC001001FL)
-
-#define NDIS_STATUS_INVALID_SAP			((uint)0xC0010020L)
-#define NDIS_STATUS_SAP_IN_USE			((uint)0xC0010021L)
-#define NDIS_STATUS_INVALID_ADDRESS		((uint)0xC0010022L)
-#define NDIS_STATUS_VC_NOT_ACTIVATED		((uint)0xC0010023L)
-#define NDIS_STATUS_DEST_OUT_OF_ORDER		((uint)0xC0010024L)  /*  cause 27 */
-#define NDIS_STATUS_VC_NOT_AVAILABLE		((uint)0xC0010025L)  /*  cause 35, 45 */
-#define NDIS_STATUS_CELLRATE_NOT_AVAILABLE	((uint)0xC0010026L)  /*  cause 37 */
-#define NDIS_STATUS_INCOMPATABLE_QOS		((uint)0xC0010027L)  /*  cause 49 */
-#define NDIS_STATUS_AAL_PARAMS_UNSUPPORTED	((uint)0xC0010028L)  /*  cause 93 */
-#define NDIS_STATUS_NO_ROUTE_TO_DESTINATION	((uint)0xC0010029L)  /*  cause 3 */
-
-extern struct iw_handler_def  rtw_handlers_def;
-
-#endif /*  #ifndef __INC_CEINFO_ */
-- 
2.35.1

