Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DCBF5F
	for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 18:38:55 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id w203-20020a1c49d40000b029010c706d0642so3203247wma.0
        for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 11:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RcJT69StK3zCxer+PUCrairhkv5NW4JYx4JIYLIVYZY=;
        b=JU5j5N0AN9EItmJr6DOTJ9YEdYvVC0bkfSOA7Kee8hdE7n2xU7KUpxuS5+iyCZqjuQ
         1kYbut0OcFoW05WvWtoKW8JiDph6ydcGGDZSrLU8d+BBWXRo4OsnVrLeXBT7bVOFuR2V
         L+8rLCft9Ppg3HnBjOaLcoLA81lmf6mJ+/FE2BN11lhHxLsRKmKAOza5VBqOm8v2JZJ4
         JpIvllghgxaWSw/KVCRei2McMfqVd+1Z5F7GDZpIWkAGPMJFv3gFy7Bib8lYd9W6hFWr
         ghpN6YwdYAWvaQXRlVncvCQUfWPan4zuaGEZGn1PTGEGLeKlqY3QcIZg9X/+AfCK8elh
         +Bjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RcJT69StK3zCxer+PUCrairhkv5NW4JYx4JIYLIVYZY=;
        b=uSYkjjLT2psN5tSldtpU88mtixLFktoRPcyWa1Ie8dTFOTvT8+ddWbABLdZa58hXHm
         Nx2yCBBlcKy81vVPLSOJVTwWMaU4GPPQiQd/ft14F4mSmDtCwI2x/p1AdJyvI+jFVBP6
         p2a9cOXpS4riiguX8VebHmr2LjVjxfhnGyR1Tk4tkv7Qif/mc/QZZthnxEhQgasVznnU
         /+Q3EFzxCl6cjQCDwsGplsz332bT8dkZmIke06yertffx0wH6pRnqAvBk1lKOUVxogRZ
         ODQzySZtuTJisljoF+GVGPGDVUjsOAgz5zmWHfQZ2WA5Whlpy8Mggl3YQemtMyxZunMq
         BSzw==
X-Gm-Message-State: AOAM533Ft4pi3WokbMrrf420i7xoraN2YSVB9MWsBlcJbaAGWXjJZGt/
	rVW/cjpNqnESFRbojdDfwHQNZsjORf0=
X-Google-Smtp-Source: ABdhPJx9t23+ljasBkfxSTQ6JwECvTO0KwdxtqtEIiJPvH5GkHt4F6B9L3uxX6Aw5EfClQaGyLLkjA==
X-Received: by 2002:a7b:c407:: with SMTP id k7mr4356098wmi.136.1616611133773;
        Wed, 24 Mar 2021 11:38:53 -0700 (PDT)
Received: from gimli.home (93-48-145-141.ip257.fastwebnet.it. [93.48.145.141])
        by smtp.gmail.com with ESMTPSA id z2sm4358040wrm.0.2021.03.24.11.38.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 11:38:53 -0700 (PDT)
From: Marco Cesati <marcocesati@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	linux-staging@lists.linux.dev
Subject: [PATCH 18/21] Staging: rtl8723bs: remove enums in odm_types.h
Date: Wed, 24 Mar 2021 19:38:44 +0100
Message-Id: <20210324183847.5595-19-marcocesati@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324183847.5595-1-marcocesati@gmail.com>
References: <20210324183847.5595-1-marcocesati@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the following unnecessary enum definition in
hal/odm_types.h:

	enum rt_spinlock_type

Signed-off-by: Marco Cesati <marcocesati@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm_types.h | 41 -----------------------
 1 file changed, 41 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm_types.h b/drivers/staging/rtl8723bs/hal/odm_types.h
index 0b1b3e14d451..8168dc14e879 100644
--- a/drivers/staging/rtl8723bs/hal/odm_types.h
+++ b/drivers/staging/rtl8723bs/hal/odm_types.h
@@ -27,47 +27,6 @@ enum hal_status {
 };
 
 
-/*  */
-/*  Declare for ODM spin lock definition temporarily from compile pass. */
-/*  */
-enum rt_spinlock_type {
-	RT_TX_SPINLOCK = 1,
-	RT_RX_SPINLOCK = 2,
-	RT_RM_SPINLOCK = 3,
-	RT_CAM_SPINLOCK = 4,
-	RT_SCAN_SPINLOCK = 5,
-	RT_LOG_SPINLOCK = 7,
-	RT_BW_SPINLOCK = 8,
-	RT_CHNLOP_SPINLOCK = 9,
-	RT_RF_OPERATE_SPINLOCK = 10,
-	RT_INITIAL_SPINLOCK = 11,
-	RT_RF_STATE_SPINLOCK = 12, /*  For RF state. Added by Bruce, 2007-10-30. */
-	/* Shall we define Ndis 6.2 SpinLock Here ? */
-	RT_PORT_SPINLOCK = 16,
-	RT_H2C_SPINLOCK = 20, /*  For H2C cmd. Added by tynli. 2009.11.09. */
-
-	RT_BTData_SPINLOCK = 25,
-
-	RT_WAPI_OPTION_SPINLOCK = 26,
-	RT_WAPI_RX_SPINLOCK = 27,
-
-	/*  add for 92D CCK control issue */
-	RT_CCK_PAGEA_SPINLOCK = 28,
-	RT_BUFFER_SPINLOCK = 29,
-	RT_CHANNEL_AND_BANDWIDTH_SPINLOCK = 30,
-	RT_GEN_TEMP_BUF_SPINLOCK = 31,
-	RT_AWB_SPINLOCK = 32,
-	RT_FW_PS_SPINLOCK = 33,
-	RT_HW_TIMER_SPIN_LOCK = 34,
-	RT_MPT_WI_SPINLOCK = 35,
-	RT_P2P_SPIN_LOCK = 36,	/*  Protect P2P context */
-	RT_DBG_SPIN_LOCK = 37,
-	RT_IQK_SPINLOCK = 38,
-	RT_PENDED_OID_SPINLOCK = 39,
-	RT_CHNLLIST_SPINLOCK = 40,
-	RT_INDIC_SPINLOCK = 41,	/* protect indication */
-};
-
 	#if defined(__LITTLE_ENDIAN)
 		#define	ODM_ENDIAN_TYPE			ODM_ENDIAN_LITTLE
 	#else
-- 
2.30.2

