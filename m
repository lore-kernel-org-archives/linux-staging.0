Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 986652CA1
	for <linux-staging@lists.linux.dev>; Sun,  2 Jan 2022 13:11:59 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id p1-20020a1c7401000000b00345c2d068bdso17308001wmc.3
        for <linux-staging@lists.linux.dev>; Sun, 02 Jan 2022 05:11:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rBqNjqn4ratnz3OyUl7TnUbMi4nb+9LcWvMhjK/T2CY=;
        b=G/IMpXEp0LsMzHeKywJu0GR/DA38lf/KhQ63EESx3VycRW7sIGh6pfhSr+L9PmYFXL
         vk/4GVfYhWCn/gkOXU4ACum9KR7pQjWjX5MtDUNPaQjBMjHsGEk8Svs1vdnccW3jEIKS
         CKlvFTLKFG8ib5KSYHjFTsnqL+yvbDc8wCA+U6Krpuqopsc0UL6qt80NOzhYjPdixkW3
         IhSofZbpl6skArmcdvWJEDDB3J6FV4Ay6ZDgcC+v+uqhO0JXWBEjWJKguZSMccE1IRqe
         2LQjOH6axb11PI1yqyhyoPGSE1M4TT8VDTzXU0sa5XEz9U8cUzb0ulhjg8ruFfSuGrC8
         UcKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rBqNjqn4ratnz3OyUl7TnUbMi4nb+9LcWvMhjK/T2CY=;
        b=iUFYoTPrm4EZ8M4im/EP3uXlH4JyDwp+PTBnWmWYwmQIXIpe0vpfcU83lw5J19toh7
         nBZPMFy7F6gja7FLm2cRAEyqiQ820rAZYhzEWs66xMc3lwgc7lLf1hr+7jSZgbEFGgU3
         VA8m0E9ueReO4J2mSMUYlzwOhqkwvb2+JxSrtsOZM6cX4bnNnSGlWuiihX6es4Fnp8uh
         xWuVwdN8n4OOqnicKFIbfo3adBYBgOTld6JcPd0jb4o/LofK/ADaEot4THKDNKD+QkgT
         xcPY3IlcUNQEcrf4+AKOv/rYdsCTBUh9favOLU7Me3ihQde4cbYdbFPzq+WVlHGoTPoI
         yZNQ==
X-Gm-Message-State: AOAM533YSBJ56TBxLvMEopnzI566S1oGc2HgJUfYbuNCw0UbYDtdHG9F
	48qs8uEEWoicZQ7bPdBBIPE=
X-Google-Smtp-Source: ABdhPJwywnsDbu9L8JUlMK9sBFQF+lUiVSlYVdPEoqaFWMeZfHaWJId1b13UYpp3L8Nc+tp/x0EyTA==
X-Received: by 2002:a05:600c:1c90:: with SMTP id k16mr35451761wms.40.1641129118070;
        Sun, 02 Jan 2022 05:11:58 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::6619])
        by smtp.gmail.com with ESMTPSA id m35sm65640044wms.1.2022.01.02.05.11.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jan 2022 05:11:57 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 06/11] staging: r8188eu: clean up struct sw_ant_switch
Date: Sun,  2 Jan 2022 14:11:36 +0100
Message-Id: <20220102131141.12310-7-straube.linux@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220102131141.12310-1-straube.linux@gmail.com>
References: <20220102131141.12310-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unused fields from struct sw_ant_switch.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/include/odm.h | 28 +--------------------------
 1 file changed, 1 insertion(+), 27 deletions(-)

diff --git a/drivers/staging/r8188eu/include/odm.h b/drivers/staging/r8188eu/include/odm.h
index 065f2ec91a38..d81aff9c9467 100644
--- a/drivers/staging/r8188eu/include/odm.h
+++ b/drivers/staging/r8188eu/include/odm.h
@@ -56,34 +56,8 @@ struct false_alarm_stats {
 #define ODM_ASSOCIATE_ENTRY_NUM	32 /*  Max size of AsocEntry[]. */
 
 struct sw_ant_switch {
-	u8	try_flag;
-	s32	PreRSSI;
 	u8	CurAntenna;
-	u8	PreAntenna;
-	u8	RSSI_Trying;
-	u8	TestMode;
-	u8	bTriggerAntennaSwitch;
-	u8	SelectAntennaMap;
-	u8	RSSI_target;
-
-	/*  Before link Antenna Switch check */
-	u8	SWAS_NoLink_State;
-	u32	SWAS_NoLink_BK_Reg860;
-
-	s32	RSSI_sum_A;
-	s32	RSSI_sum_B;
-	s32	RSSI_cnt_A;
-	s32	RSSI_cnt_B;
-	u64	lastTxOkCnt;
-	u64	lastRxOkCnt;
-	u64	TXByteCnt_A;
-	u64	TXByteCnt_B;
-	u64	RXByteCnt_A;
-	u64	RXByteCnt_B;
-	u8	TrafficLoad;
-	struct timer_list SwAntennaSwitchTimer;
-	u8	TxAnt[ODM_ASSOCIATE_ENTRY_NUM];
-	u8	TargetSTA;
+	u8	SWAS_NoLink_State; /* Before link Antenna Switch check */
 	u8	RxIdleAnt;
 };
 
-- 
2.34.1

