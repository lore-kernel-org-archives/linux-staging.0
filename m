Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E757C28E4
	for <linux-staging@lists.linux.dev>; Wed, 16 Feb 2022 19:40:49 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id b13so5832830edn.0
        for <linux-staging@lists.linux.dev>; Wed, 16 Feb 2022 11:40:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xbXARzhtH3QOWgRRPGrSYM+TBaIkAjRMKIK2lUHXdUQ=;
        b=aeTblRuGs8dcHA4wMchgTThkGnuq2fTSdlxzklbCIvmLwUpS8ShDhEX4p/EYZAM17D
         eebmW4UELfnrywrhWpQjXPLCdKWDjQ0ixHOAIlLZ74M5E32t4Ox5H4/1FWK30j8JSY+C
         33pr6j3UbrgWDKfShPn/akSE9u0yxoEmVGdLj9QRSIYZCFekUG85m899lHeqrgTd/OGo
         n+DGOhlT452avHjCPGgGU195WSj7OW4kMXN0o3zNT+JTuDhQ/SddXuz7Bk4XxsT3oe58
         nchO5Ofvoqh9tUYYPxSsU3TcaQLAX7FYQbEGG7SeHFap4R71jcaA3001iW0/gvO+T3w7
         b0OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xbXARzhtH3QOWgRRPGrSYM+TBaIkAjRMKIK2lUHXdUQ=;
        b=Dv9pUVmyvqVvCBOPlNRz+kEpPh6dUEWawMJ/H7e0wsAGkyHe+A/+61E8fDvyWsvM0q
         W0f8LIVkIebplkBrKzKn91R+AMRg4Yn6ZrqqBe3yaX2b2khVWSbl1spRHYWtUC8G4hHA
         RziPP1I0XOVwGzzUmE+Sbuf2aiPcd7JBS4l+/1yp+AFcto5PSZHyemOCufwa4zZ+EsUm
         EsPKTf/satGnMjbb7ZuepMxouMA0rzqYZyvozQy3J8trF+X0jid8NQVi+Wmw7TX0ZFgn
         o9vfSqLrVWOb/U2F4h/yitz3A+OFYIGWrx3/BoA6FZQvX5t3FB7OYmIn59c0akr3FnnN
         yukw==
X-Gm-Message-State: AOAM531HcpH5m9cHlrvm1UY3pgkmb6eb+SWWDWlT/JjoMYbvhwEgTdSq
	A1HBokhgYyqqMjpDOZMEgeYZ3g1Rpmc=
X-Google-Smtp-Source: ABdhPJyRNIU/fXJS6CqwzSVFThzW41KIIFGEku02f0WfTQmRjhAulbs7ExESaR8z0IzNwYlowEcKow==
X-Received: by 2002:a05:6402:4c6:b0:406:d579:2c4 with SMTP id n6-20020a05640204c600b00406d57902c4mr4769016edw.52.1645040448391;
        Wed, 16 Feb 2022 11:40:48 -0800 (PST)
Received: from localhost.localdomain (ip5f5abb8c.dynamic.kabel-deutschland.de. [95.90.187.140])
        by smtp.gmail.com with ESMTPSA id z18sm276910ejl.78.2022.02.16.11.40.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Feb 2022 11:40:48 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 3/3] staging: r8188eu: rename CCKSwingTable_Ch1_Ch13
Date: Wed, 16 Feb 2022 20:40:38 +0100
Message-Id: <20220216194038.6762-4-straube.linux@gmail.com>
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

After removing CCKSwingTable_Ch14 there is only one table left and we
can rename CCKSwingTable_Ch1_Ch13 to simply cck_swing_table.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/HalPhyRf_8188e.c | 2 +-
 drivers/staging/r8188eu/hal/odm.c            | 2 +-
 drivers/staging/r8188eu/include/odm.h        | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/HalPhyRf_8188e.c b/drivers/staging/r8188eu/hal/HalPhyRf_8188e.c
index 523d4fedb3cc..b944c8071a3b 100644
--- a/drivers/staging/r8188eu/hal/HalPhyRf_8188e.c
+++ b/drivers/staging/r8188eu/hal/HalPhyRf_8188e.c
@@ -149,7 +149,7 @@ odm_TXPowerTrackingCallback_ThermalMeter_8188E(
 		TempCCk = dm_odm->RFCalibrateInfo.RegA24;
 
 		for (i = 0; i < CCK_TABLE_SIZE; i++) {
-			if (memcmp((void *)&TempCCk, (void *)&CCKSwingTable_Ch1_Ch13[i][2], 4)) {
+			if (memcmp((void *)&TempCCk, (void *)&cck_swing_table[i][2], 4)) {
 				CCK_index_old = (u8)i;
 				dm_odm->BbSwingIdxCckBase = (u8)i;
 				break;
diff --git a/drivers/staging/r8188eu/hal/odm.c b/drivers/staging/r8188eu/hal/odm.c
index 24a884bcea3b..e0824eefd83a 100644
--- a/drivers/staging/r8188eu/hal/odm.c
+++ b/drivers/staging/r8188eu/hal/odm.c
@@ -65,7 +65,7 @@ u32 OFDMSwingTable[OFDM_TABLE_SIZE_92D] = {
 	0x0b40002d,/*  42, -15.0dB */
 };
 
-u8 CCKSwingTable_Ch1_Ch13[CCK_TABLE_SIZE][8] = {
+u8 cck_swing_table[CCK_TABLE_SIZE][8] = {
 	{0x36, 0x35, 0x2e, 0x25, 0x1c, 0x12, 0x09, 0x04}, /*  0, +0dB */
 	{0x33, 0x32, 0x2b, 0x23, 0x1a, 0x11, 0x08, 0x04}, /*  1, -0.5dB */
 	{0x30, 0x2f, 0x29, 0x21, 0x19, 0x10, 0x08, 0x03}, /*  2, -1.0dB */
diff --git a/drivers/staging/r8188eu/include/odm.h b/drivers/staging/r8188eu/include/odm.h
index f17c707f2cde..9fb09e0a0df9 100644
--- a/drivers/staging/r8188eu/include/odm.h
+++ b/drivers/staging/r8188eu/include/odm.h
@@ -447,7 +447,7 @@ enum dm_swas {
 #define	CCK_TABLE_SIZE		33
 
 extern	u32 OFDMSwingTable[OFDM_TABLE_SIZE_92D];
-extern	u8 CCKSwingTable_Ch1_Ch13[CCK_TABLE_SIZE][8];
+extern u8 cck_swing_table[CCK_TABLE_SIZE][8];
 
 /*  check Sta pointer valid or not */
 #define IS_STA_VALID(pSta)		(pSta)
-- 
2.35.1

