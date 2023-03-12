Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3F47185F
	for <linux-staging@lists.linux.dev>; Sun, 12 Mar 2023 07:32:55 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id cn21so6684046edb.0
        for <linux-staging@lists.linux.dev>; Sat, 11 Mar 2023 23:32:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678606373;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tqixGIH6dUSPWHgAy8PJhWrG354k6op6O7lKYsRXNZk=;
        b=jOA6wgpbss8RrRhWQyTSJC8ekJaIHjG+xSIiq0tEuSBkRhDhch4EwPyKjxmSVwXFlB
         kjz/Ly1Wd0auj9C85IBRMBlzuHL/xnnD8mZDgnHb5mphUfN3b/OSwmhp8KZ/nL8JHd3P
         eGggXDkBdm4Bn+upcNXQ5sglziK6U8V2okfnjXgrMOCvXYeB6Pi6i6kimqAL8AfA+Fpy
         dpUF4T6aAkP/HdbeAj1/CczvMPvyVZdsvpCAe2cXvPS0BOpDP2LWXwM5MX1BE81x0dqB
         NFmYi+NvBXKAAbHwIsxeocsFUppHGAcJsmBFmhFij01ABqy9cJeMXMPFPXKXlhjPvg/S
         MW6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678606373;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tqixGIH6dUSPWHgAy8PJhWrG354k6op6O7lKYsRXNZk=;
        b=xC1xokly5N0U3isPPPKL4C4uSPdJLm76DAv9z3NBYeEUVlSLhnMOOqlXYbsonnmY0h
         PtJs+IV709vYEwDjz2FY6TeTnCzFkQv/nQGDVj+QnmA5UeYp5oH7ImcN6/5cdSgNmLd9
         fYzR48zVIUxWwhuf0bX8JK7A8zOr+fjq+ahnPVNpp9M6j2LZ5zEEBnlTrta5b2gj7L5U
         uqkyUuaxBNUMSRhHdrUYGVdsYORFVN8wnUKqFK+qd7sdnoxknL1RVsJ3s1062aNhNGDb
         uhQt0G+2b8E5vcUmx3zY8lMJFVzhgXoeajb5htxBH2mA/UXcLbnu28BwJjSdmw4B2IWk
         aIuQ==
X-Gm-Message-State: AO0yUKXhYHEY7DeWxDlz7rAvcJxjxwhnSAkeY0wjHGokbZ9CzxKInADt
	BifWdODeFcnhCA562T5+UjvmEMSFq10=
X-Google-Smtp-Source: AK7set/+pEOPJ/iBNBwobhh2O0o6I57oaix6+c25P1XNSlRonBQaIJSn/IP6QsT5b/5eDoBWOphBcQ==
X-Received: by 2002:a17:907:728e:b0:8b1:807e:d4d2 with SMTP id dt14-20020a170907728e00b008b1807ed4d2mr40826053ejc.34.1678606372830;
        Sat, 11 Mar 2023 23:32:52 -0800 (PST)
Received: from localhost.localdomain (ip5f5abbfa.dynamic.kabel-deutschland.de. [95.90.187.250])
        by smtp.gmail.com with ESMTPSA id dc8-20020a170906c7c800b008d1dc5f5692sm1928841ejb.76.2023.03.11.23.32.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Mar 2023 23:32:52 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 2/2] staging: rtl8192u: dm_shadow_init() is not used
Date: Sun, 12 Mar 2023 08:32:47 +0100
Message-Id: <20230312073247.9822-3-straube.linux@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230312073247.9822-1-straube.linux@gmail.com>
References: <20230312073247.9822-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function dm_shadow_init() is not used anywhere, remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/rtl8192u/r8192U_dm.c | 38 ----------------------------
 drivers/staging/rtl8192u/r8192U_dm.h |  1 -
 2 files changed, 39 deletions(-)

diff --git a/drivers/staging/rtl8192u/r8192U_dm.c b/drivers/staging/rtl8192u/r8192U_dm.c
index 00fc8fd344db..6a33ca02c3dc 100644
--- a/drivers/staging/rtl8192u/r8192U_dm.c
+++ b/drivers/staging/rtl8192u/r8192U_dm.c
@@ -2859,44 +2859,6 @@ void dm_check_fsync(struct net_device *dev)
 	}
 }
 
-/*-----------------------------------------------------------------------------
- * Function:	dm_shadow_init()
- *
- * Overview:	Store all NIC MAC/BB register content.
- *
- * Input:		NONE
- *
- * Output:		NONE
- *
- * Return:		NONE
- *
- * Revised History:
- *	When		Who		Remark
- *	05/29/2008	amy		Create Version 0 porting from windows code.
- *
- *---------------------------------------------------------------------------
- */
-void dm_shadow_init(struct net_device *dev)
-{
-	u8	page;
-	u16	offset;
-
-	for (page = 0; page < 5; page++)
-		for (offset = 0; offset < 256; offset++) {
-			read_nic_byte(dev, offset + page * 256, &dm_shadow[page][offset]);
-			/*DbgPrint("P-%d/O-%02x=%02x\r\n", page, offset, DM_Shadow[page][offset]);*/
-		}
-
-	for (page = 8; page < 11; page++)
-		for (offset = 0; offset < 256; offset++)
-			read_nic_byte(dev, offset + page * 256, &dm_shadow[page][offset]);
-
-	for (page = 12; page < 15; page++)
-		for (offset = 0; offset < 256; offset++)
-			read_nic_byte(dev, offset + page * 256, &dm_shadow[page][offset]);
-
-}   /* dm_shadow_init */
-
 /*---------------------------Define function prototype------------------------*/
 /*-----------------------------------------------------------------------------
  * Function:	DM_DynamicTxPower()
diff --git a/drivers/staging/rtl8192u/r8192U_dm.h b/drivers/staging/rtl8192u/r8192U_dm.h
index 2159018b4e38..f4eb18216677 100644
--- a/drivers/staging/rtl8192u/r8192U_dm.h
+++ b/drivers/staging/rtl8192u/r8192U_dm.h
@@ -168,7 +168,6 @@ void dm_rf_operation_test_callback(unsigned long data);
 void dm_rf_pathcheck_workitemcallback(struct work_struct *work);
 void dm_fsync_work_callback(struct work_struct *work);
 void dm_cck_txpower_adjust(struct net_device *dev, bool  binch14);
-void dm_shadow_init(struct net_device *dev);
 void dm_initialize_txpower_tracking(struct net_device *dev);
 /*--------------------------Exported Function prototype---------------------*/
 
-- 
2.39.2

