Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C1C423B5
	for <linux-staging@lists.linux.dev>; Wed, 16 Feb 2022 19:40:49 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id f17so5775689edd.2
        for <linux-staging@lists.linux.dev>; Wed, 16 Feb 2022 11:40:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hIetRY0N3Tc8vtUPVcMmtLpbSdsBJjNbfMqC+x0xhhQ=;
        b=kio1RXMpE5tPkojoIMpf7bOyNBXGabZsUb5ZgZQqNfjxI44MKGh5Gt4urUvUENBDwa
         vNSGS9vo1VYRrr6Rh29cFBg79fbmoxTV3VHGmZb3Rl6l8ruZqOnJiLz+q+l7aP8ChMVQ
         t2//fylfNNDBVWQxjDpCMqDvphFtG6VNkb4mqE4m83l7rwfaXALo7e49wCgVcH0kOVHN
         +OwCRKq0sNxhve91Ab+gcMOCYm1Ygf06CVWyDn2R8RNpYhSyBKSSKeWuZpMSlnrhb2sR
         Xh7AyYdfyS3PfUJREt3LincMHZBVewPcQu7RjStayiHGsn0mINHNoAP38J8cMtNsA7EE
         FzUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hIetRY0N3Tc8vtUPVcMmtLpbSdsBJjNbfMqC+x0xhhQ=;
        b=jvZlYeF6G3w+0UXKZttFCeyZ7fKktkybrZbh6hDzu9tnzOvOBBpIthM2eZTEOb00au
         8yAMfjw8aZMO6qZ36B6+1XYsxJ9j1/3mu6gqrBspGx+r/1/ac8ZXjD3Q7m6zKEZgdnc/
         ztsrQ6V/YeK7JJYbj7Fm7FV6Rj6TWtL5TKefzuOwQldRxA2aUXGBm6MPwEmNNDLA4Ehh
         WMHERnsnaP8hss9dTn8L50q/1Sgd2QSuZG4YCoWHa7xe+cBWjUHB8zaxoFZDHymdH0nu
         PblKwF54fpN66epTCJedD+MAFBQT03i1iaBhh76xE8F/0qXz0128Vvl4nwGS9EWbp0Cv
         rG9Q==
X-Gm-Message-State: AOAM531zqSHZ8qBNpr831cdQ0cSNCXfqA6eYK306lnLkZGJNE0ki3+0J
	AdSmo72B4QG0ooWBQR8GGd0=
X-Google-Smtp-Source: ABdhPJzAdaa+a+WRxPxVnqLLB2swvy05SbVRB0MWnCJI+6ZSWHdQKRyC1p09r6XDnq8RpmZ2sfobJQ==
X-Received: by 2002:aa7:c612:0:b0:40f:2a41:bddb with SMTP id h18-20020aa7c612000000b0040f2a41bddbmr4667647edq.291.1645040447756;
        Wed, 16 Feb 2022 11:40:47 -0800 (PST)
Received: from localhost.localdomain (ip5f5abb8c.dynamic.kabel-deutschland.de. [95.90.187.140])
        by smtp.gmail.com with ESMTPSA id z18sm276910ejl.78.2022.02.16.11.40.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Feb 2022 11:40:47 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 2/3] staging: r8188eu: bCCKinCH14 is read-only
Date: Wed, 16 Feb 2022 20:40:37 +0100
Message-Id: <20220216194038.6762-3-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220216194038.6762-1-straube.linux@gmail.com>
References: <20220216194038.6762-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The variable bCCKinCH14 in struct odm_rf_cal is never set. It stays
at its default value 0. Remove bCCKinCH14 from struct odm_rf_cal and
remove related dead code.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/HalPhyRf_8188e.c | 16 +++------
 drivers/staging/r8188eu/hal/odm.c            | 36 --------------------
 drivers/staging/r8188eu/include/odm.h        |  2 --
 3 files changed, 4 insertions(+), 50 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/HalPhyRf_8188e.c b/drivers/staging/r8188eu/hal/HalPhyRf_8188e.c
index 0fcf094ae594..523d4fedb3cc 100644
--- a/drivers/staging/r8188eu/hal/HalPhyRf_8188e.c
+++ b/drivers/staging/r8188eu/hal/HalPhyRf_8188e.c
@@ -149,18 +149,10 @@ odm_TXPowerTrackingCallback_ThermalMeter_8188E(
 		TempCCk = dm_odm->RFCalibrateInfo.RegA24;
 
 		for (i = 0; i < CCK_TABLE_SIZE; i++) {
-			if (dm_odm->RFCalibrateInfo.bCCKinCH14) {
-				if (memcmp((void *)&TempCCk, (void *)&CCKSwingTable_Ch14[i][2], 4)) {
-					CCK_index_old = (u8)i;
-					dm_odm->BbSwingIdxCckBase = (u8)i;
-					break;
-				}
-			} else {
-				if (memcmp((void *)&TempCCk, (void *)&CCKSwingTable_Ch1_Ch13[i][2], 4)) {
-					CCK_index_old = (u8)i;
-					dm_odm->BbSwingIdxCckBase = (u8)i;
-					break;
-				}
+			if (memcmp((void *)&TempCCk, (void *)&CCKSwingTable_Ch1_Ch13[i][2], 4)) {
+				CCK_index_old = (u8)i;
+				dm_odm->BbSwingIdxCckBase = (u8)i;
+				break;
 			}
 		}
 
diff --git a/drivers/staging/r8188eu/hal/odm.c b/drivers/staging/r8188eu/hal/odm.c
index b4be706545ff..24a884bcea3b 100644
--- a/drivers/staging/r8188eu/hal/odm.c
+++ b/drivers/staging/r8188eu/hal/odm.c
@@ -101,42 +101,6 @@ u8 CCKSwingTable_Ch1_Ch13[CCK_TABLE_SIZE][8] = {
 	{0x09, 0x08, 0x07, 0x06, 0x04, 0x03, 0x01, 0x01}	/*  32, -16.0dB */
 };
 
-u8 CCKSwingTable_Ch14[CCK_TABLE_SIZE][8] = {
-	{0x36, 0x35, 0x2e, 0x1b, 0x00, 0x00, 0x00, 0x00}, /*  0, +0dB */
-	{0x33, 0x32, 0x2b, 0x19, 0x00, 0x00, 0x00, 0x00}, /*  1, -0.5dB */
-	{0x30, 0x2f, 0x29, 0x18, 0x00, 0x00, 0x00, 0x00}, /*  2, -1.0dB */
-	{0x2d, 0x2d, 0x17, 0x17, 0x00, 0x00, 0x00, 0x00}, /*  3, -1.5dB */
-	{0x2b, 0x2a, 0x25, 0x15, 0x00, 0x00, 0x00, 0x00}, /*  4, -2.0dB */
-	{0x28, 0x28, 0x24, 0x14, 0x00, 0x00, 0x00, 0x00}, /*  5, -2.5dB */
-	{0x26, 0x25, 0x21, 0x13, 0x00, 0x00, 0x00, 0x00}, /*  6, -3.0dB */
-	{0x24, 0x23, 0x1f, 0x12, 0x00, 0x00, 0x00, 0x00}, /*  7, -3.5dB */
-	{0x22, 0x21, 0x1d, 0x11, 0x00, 0x00, 0x00, 0x00}, /*  8, -4.0dB */
-	{0x20, 0x20, 0x1b, 0x10, 0x00, 0x00, 0x00, 0x00}, /*  9, -4.5dB */
-	{0x1f, 0x1e, 0x1a, 0x0f, 0x00, 0x00, 0x00, 0x00}, /*  10, -5.0dB */
-	{0x1d, 0x1c, 0x18, 0x0e, 0x00, 0x00, 0x00, 0x00}, /*  11, -5.5dB */
-	{0x1b, 0x1a, 0x17, 0x0e, 0x00, 0x00, 0x00, 0x00}, /*  12, -6.0dB */
-	{0x1a, 0x19, 0x16, 0x0d, 0x00, 0x00, 0x00, 0x00}, /*  13, -6.5dB */
-	{0x18, 0x17, 0x15, 0x0c, 0x00, 0x00, 0x00, 0x00}, /*  14, -7.0dB */
-	{0x17, 0x16, 0x13, 0x0b, 0x00, 0x00, 0x00, 0x00}, /*  15, -7.5dB */
-	{0x16, 0x15, 0x12, 0x0b, 0x00, 0x00, 0x00, 0x00}, /*  16, -8.0dB */
-	{0x14, 0x14, 0x11, 0x0a, 0x00, 0x00, 0x00, 0x00}, /*  17, -8.5dB */
-	{0x13, 0x13, 0x10, 0x0a, 0x00, 0x00, 0x00, 0x00}, /*  18, -9.0dB */
-	{0x12, 0x12, 0x0f, 0x09, 0x00, 0x00, 0x00, 0x00}, /*  19, -9.5dB */
-	{0x11, 0x11, 0x0f, 0x09, 0x00, 0x00, 0x00, 0x00}, /*  20, -10.0dB */
-	{0x10, 0x10, 0x0e, 0x08, 0x00, 0x00, 0x00, 0x00}, /*  21, -10.5dB */
-	{0x0f, 0x0f, 0x0d, 0x08, 0x00, 0x00, 0x00, 0x00}, /*  22, -11.0dB */
-	{0x0e, 0x0e, 0x0c, 0x07, 0x00, 0x00, 0x00, 0x00}, /*  23, -11.5dB */
-	{0x0d, 0x0d, 0x0c, 0x07, 0x00, 0x00, 0x00, 0x00}, /*  24, -12.0dB */
-	{0x0d, 0x0c, 0x0b, 0x06, 0x00, 0x00, 0x00, 0x00}, /*  25, -12.5dB */
-	{0x0c, 0x0c, 0x0a, 0x06, 0x00, 0x00, 0x00, 0x00}, /*  26, -13.0dB */
-	{0x0b, 0x0b, 0x0a, 0x06, 0x00, 0x00, 0x00, 0x00}, /*  27, -13.5dB */
-	{0x0b, 0x0a, 0x09, 0x05, 0x00, 0x00, 0x00, 0x00}, /*  28, -14.0dB */
-	{0x0a, 0x0a, 0x09, 0x05, 0x00, 0x00, 0x00, 0x00}, /*  29, -14.5dB */
-	{0x0a, 0x09, 0x08, 0x05, 0x00, 0x00, 0x00, 0x00}, /*  30, -15.0dB */
-	{0x09, 0x09, 0x08, 0x05, 0x00, 0x00, 0x00, 0x00}, /*  31, -15.5dB */
-	{0x09, 0x08, 0x07, 0x04, 0x00, 0x00, 0x00, 0x00}  /*  32, -16.0dB */
-};
-
 #define		RxDefaultAnt1		0x65a9
 #define	RxDefaultAnt2		0x569a
 
diff --git a/drivers/staging/r8188eu/include/odm.h b/drivers/staging/r8188eu/include/odm.h
index 698d61d5fc40..f17c707f2cde 100644
--- a/drivers/staging/r8188eu/include/odm.h
+++ b/drivers/staging/r8188eu/include/odm.h
@@ -252,7 +252,6 @@ struct odm_rf_cal {
 	bool	bReloadtxpowerindex;
 	u8	bRfPiEnable;
 
-	u8	bCCKinCH14;
 	u8	CCK_index;
 	u8	OFDM_index;
 	bool bDoneTxpower;
@@ -449,7 +448,6 @@ enum dm_swas {
 
 extern	u32 OFDMSwingTable[OFDM_TABLE_SIZE_92D];
 extern	u8 CCKSwingTable_Ch1_Ch13[CCK_TABLE_SIZE][8];
-extern	u8 CCKSwingTable_Ch14 [CCK_TABLE_SIZE][8];
 
 /*  check Sta pointer valid or not */
 #define IS_STA_VALID(pSta)		(pSta)
-- 
2.35.1

