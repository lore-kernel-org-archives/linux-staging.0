Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 225912CA3
	for <linux-staging@lists.linux.dev>; Wed, 29 Dec 2021 20:51:40 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id i22so46525692wrb.13
        for <linux-staging@lists.linux.dev>; Wed, 29 Dec 2021 12:51:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nUh0l/NYOhj5OYFcmzELhPCuQaaICzcNcx63DNkni6g=;
        b=hIJ4JRYlTB0kHe3wLXvHB4scgsvr7loW9HPSajWN9dLsxK0AG8FoLHle822Fl93MTu
         /+Byiqt/FJKsfx/t4nH8K0m4VupvEJ4fgLjhc3qg/dSSN8V5aB7LCU3zg1aqdpEgg8SX
         Y/qrNh0kutXh0HhZNau/giIdg23+3yeaNDk8N4oHVlKVces4ZrP4rEa1M0FeOxKQ5eRm
         BU3gRKxwf8GBwOoaeslkNvrEImQDqfbhQOcQwP7UH0a8IamrqicyUyRxnWpPCo/ejMIR
         0X4pDx2FWQH557JeAzjvHMohwxum01j8HAD59/bw6Q7tramPH6lC7OzkrdbbtBrpKLZN
         2R9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nUh0l/NYOhj5OYFcmzELhPCuQaaICzcNcx63DNkni6g=;
        b=m4P52MH5bBYN8Zpe9TmkOdkdqjJjvvryi4YbMZzuDvCQ87ej39S4EPMNvM5ZW1hi8h
         Blf7SfXDkdJJaq9RY9iGkEkVcntxq8scT1c9lWxfx5QsYx9kkozJr/FZHco4kjs4Gzjp
         gP46I6pNE49aB76E2EyWA5+O7Wgg6uwBUk5KF003/UDwj6HbrUgj0OMdjeUUdoRwWNwE
         PBOTJyG0qTRykK35fIuG48btdfRio1Rw24caGDFlSGmGkYqyt68ULXS04f/NgfQ3petJ
         lkY1GkUCm94Eh9sg3VtMfm4kgytQjn8HSRS2n258f4vJ6Y4A0VJprtGtKEU55i9XGCDX
         pVUw==
X-Gm-Message-State: AOAM5302xvIu9XFuX17DaZYhLtZywH8vbndp1sB/Wes5acc8XNb96/uN
	R8ANY3U7CDT5aJQf/oVY/dU=
X-Google-Smtp-Source: ABdhPJy4fE6IVVaUmAU6YFArInmcRwCB7cm+Lv4GLJF7oRjqM26W1GxJAZiY3vmDueJQqCzkyRJILg==
X-Received: by 2002:adf:df81:: with SMTP id z1mr22757078wrl.668.1640811098594;
        Wed, 29 Dec 2021 12:51:38 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::6619])
        by smtp.gmail.com with ESMTPSA id l12sm27421989wmq.2.2021.12.29.12.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Dec 2021 12:51:38 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 17/32] staging: r8188eu: make odm_CommonInfoSelfInit() static
Date: Wed, 29 Dec 2021 21:50:53 +0100
Message-Id: <20211229205108.26373-18-straube.linux@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211229205108.26373-1-straube.linux@gmail.com>
References: <20211229205108.26373-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function odm_CommonInfoSelfInit() is only used in odm.c.
Make it static.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/odm.c             | 16 ++++++++--------
 drivers/staging/r8188eu/include/odm_precomp.h |  1 -
 2 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/odm.c b/drivers/staging/r8188eu/hal/odm.c
index 6f94954ba987..d62ae3e021be 100644
--- a/drivers/staging/r8188eu/hal/odm.c
+++ b/drivers/staging/r8188eu/hal/odm.c
@@ -303,6 +303,14 @@ static void odm_DIG(struct odm_dm_struct *pDM_Odm)
 	pDM_DigTable->DIG_Dynamic_MIN_0 = DIG_Dynamic_MIN;
 }
 
+static void odm_CommonInfoSelfInit(struct odm_dm_struct *pDM_Odm)
+{
+	struct adapter *adapter = pDM_Odm->Adapter;
+
+	pDM_Odm->bCckHighPower = (bool)rtl8188e_PHY_QueryBBReg(adapter, 0x824, BIT(9));
+	pDM_Odm->RFPathRxEnable = (u8)rtl8188e_PHY_QueryBBReg(adapter, 0xc04, 0x0F);
+}
+
 /* 3 Export Interface */
 
 /*  2011/09/21 MH Add to describe different team necessary resource allocate?? */
@@ -426,14 +434,6 @@ void ODM_CmnInfoUpdate(struct odm_dm_struct *pDM_Odm, u32 CmnInfo, u64 Value)
 	}
 }
 
-void odm_CommonInfoSelfInit(struct odm_dm_struct *pDM_Odm)
-{
-	struct adapter *adapter = pDM_Odm->Adapter;
-
-	pDM_Odm->bCckHighPower = (bool)rtl8188e_PHY_QueryBBReg(adapter, 0x824, BIT(9));
-	pDM_Odm->RFPathRxEnable = (u8)rtl8188e_PHY_QueryBBReg(adapter, 0xc04, 0x0F);
-}
-
 void odm_CommonInfoSelfUpdate(struct odm_dm_struct *pDM_Odm)
 {
 	u8 EntryCnt = 0;
diff --git a/drivers/staging/r8188eu/include/odm_precomp.h b/drivers/staging/r8188eu/include/odm_precomp.h
index ea9fe7044314..b92e5b68161e 100644
--- a/drivers/staging/r8188eu/include/odm_precomp.h
+++ b/drivers/staging/r8188eu/include/odm_precomp.h
@@ -39,7 +39,6 @@ void odm_CommonInfoSelfUpdate(struct odm_dm_struct *pDM_Odm);
 void odm_FalseAlarmCounterStatistics(struct odm_dm_struct *pDM_Odm);
 void odm_CCKPacketDetectionThresh(struct odm_dm_struct *pDM_Odm);
 void odm_EdcaTurboCheck(struct odm_dm_struct *pDM_Odm);
-void odm_CommonInfoSelfInit(struct odm_dm_struct *pDM_Odm);
 void odm_RSSIMonitorCheck(struct odm_dm_struct *pDM_Odm);
 void odm_RefreshRateAdaptiveMask(struct odm_dm_struct *pDM_Odm);
 void odm_TXPowerTrackingThermalMeterInit(struct odm_dm_struct *pDM_Odm);
-- 
2.34.1

