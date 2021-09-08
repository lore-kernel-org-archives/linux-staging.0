Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64DAD72
	for <linux-staging@lists.linux.dev>; Wed,  8 Sep 2021 23:10:17 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id q26so5580949wrc.7
        for <linux-staging@lists.linux.dev>; Wed, 08 Sep 2021 16:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Bck3GxM/smuWPP1BN2oyn2huDSeUCK8vvjWeb+leiQk=;
        b=OJ6wttDqNyKkGNxg8MNgwxQayIgUMQxKm+MI/X5bR0AFTYdkt7jVJlOy5sGCnvtwGV
         A9Ae2BqXvcCFLpQnWknKXzjC5WGbjCFOv361MK2YVo+UNg9UcQwN5SAHLRroth6X3UOm
         aWHA1Kjgv3PaVBuUvpmff28lPiZvPJXiaXYpz9r2KZIhZfbDjzmpj3Hl3vS1nX089eNS
         /MoorYx8g6mF7GQBiduC2jSlWm3SD/j9mk1KMMU3II6vhOKLyTFa07wOfS6q1y4IlcLP
         QN0VkTEk842XxXzV3qvUHqSnWhT+ekkzK0vkPUq7AHSGYlXDv4DJhp2FeE888RgGthEa
         vx8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Bck3GxM/smuWPP1BN2oyn2huDSeUCK8vvjWeb+leiQk=;
        b=iBXT6k/S9Mvpd2ZYoMKW4LeSVR9YKdT24MxORfe0COsnrqXpDI51bi+J/LhxfeLi9S
         EOzc3WgR5Xy0N12D3DW9Rv/npb+fSn/TMjVMi4ThY/G6mhcZ6MDTGoJdlPdaQm1GC+hv
         YImxpeSFGikMVEMnHrvNx8j/eF/t2Vg3LjCs+n9PNnVg6MjanfWk7raKsjkyiAjZP4PZ
         2tkqKAKW2XErDZWCK9vlO4hpXM/CD+Xh8+sn57LKUHHr3Ydif9HPEuvpx1L6Vkhl7VTA
         Ke1+X/FVB9NzF/PByNZTphODT8WDEl+J4VSPAbSswILcu5xNgNp4IuGFh9EzZswaZ7jd
         PBow==
X-Gm-Message-State: AOAM531g3zDlJM7BRbDSS23z1QO8gGC1UgOUMC2cbPjqyNKyfJdmfaOT
	wIi0jcHxyRbg80jCmlK9Drk=
X-Google-Smtp-Source: ABdhPJzhdAmgitEAHjHd4q7oxUOqHssQvkjGp8GQZVP8dwRoTSHGoKBoYquguQfk1hCgOdjr4LbIDg==
X-Received: by 2002:adf:f101:: with SMTP id r1mr47110wro.355.1631142615891;
        Wed, 08 Sep 2021 16:10:15 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::8fe1])
        by smtp.gmail.com with ESMTPSA id l21sm348393wmh.31.2021.09.08.16.10.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Sep 2021 16:10:15 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 2/2] staging: r8188eu: remove unused ODM_MacStatusQuery()
Date: Thu,  9 Sep 2021 01:09:53 +0200
Message-Id: <20210908230953.16931-3-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210908230953.16931-1-straube.linux@gmail.com>
References: <20210908230953.16931-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function ODM_MacStatusQuery() is unused and empty, remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/odm_HWConfig.c     | 8 --------
 drivers/staging/r8188eu/include/odm_HWConfig.h | 7 -------
 2 files changed, 15 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/odm_HWConfig.c b/drivers/staging/r8188eu/hal/odm_HWConfig.c
index db4c072ec6c5..0a07795e3912 100644
--- a/drivers/staging/r8188eu/hal/odm_HWConfig.c
+++ b/drivers/staging/r8188eu/hal/odm_HWConfig.c
@@ -519,14 +519,6 @@ void ODM_PhyStatusQuery(struct odm_dm_struct *dm_odm,
 	ODM_PhyStatusQuery_92CSeries(dm_odm, pPhyInfo, pPhyStatus, pPktinfo, adapt);
 }
 
-/*  For future use. */
-void ODM_MacStatusQuery(struct odm_dm_struct *dm_odm, u8 *mac_stat,
-			u8 macid, bool pkt_match_bssid,
-			bool pkttoself, bool pkt_beacon)
-{
-	/*  2011/10/19 Driver team will handle in the future. */
-}
-
 enum HAL_STATUS ODM_ConfigRFWithHeaderFile(struct odm_dm_struct *dm_odm,
 					   enum rf_radio_path content,
 					   enum rf_radio_path rfpath)
diff --git a/drivers/staging/r8188eu/include/odm_HWConfig.h b/drivers/staging/r8188eu/include/odm_HWConfig.h
index 790ab4d1eff5..e2edcb7dbad6 100644
--- a/drivers/staging/r8188eu/include/odm_HWConfig.h
+++ b/drivers/staging/r8188eu/include/odm_HWConfig.h
@@ -95,13 +95,6 @@ void ODM_PhyStatusQuery(struct odm_dm_struct *pDM_Odm,
 			struct odm_per_pkt_info *pPktinfo,
 			struct adapter *adapt);
 
-void ODM_MacStatusQuery(struct odm_dm_struct *pDM_Odm,
-			u8 *pMacStatus,
-			u8	MacID,
-			bool	bPacketMatchBSSID,
-			bool	bPacketToSelf,
-			bool	bPacketBeacon);
-
 enum HAL_STATUS ODM_ConfigRFWithHeaderFile(struct odm_dm_struct *pDM_Odm,
 					   enum rf_radio_path Content,
 					   enum rf_radio_path eRFPath);
-- 
2.33.0

