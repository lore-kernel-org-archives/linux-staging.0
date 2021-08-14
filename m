Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 749F72FAD
	for <linux-staging@lists.linux.dev>; Sat, 14 Aug 2021 07:40:35 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id x14so204997wrs.5
        for <linux-staging@lists.linux.dev>; Sat, 14 Aug 2021 00:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ssbrzr2nx0rE0JNE1VJsrKipba9hb+pFtUvZYUXY/LU=;
        b=DtNuDkOrsCOjybj26b0uPRs5N4qE1y5gum8Xm7eQgZXsNGjQO/6j7rI5axD9jcxqLL
         yyRkjeenp6feIqil8jhspnZB1+1tl+WYkm1utHzd+qgwrzMXK9MHxH7vD44FXYWUaADu
         ormpol1hnmmRUjOc+kaIR2p1NMDIqVsgX5Z9loLEvjCLPxT8p8hlHkgayOYJkbyo8OoV
         9XeKaOCpr79C8vhuE1nHjIbKfQFbvViLYiFTURNyjiEGoSQ34YVqa/CXOBTA9cybmlYh
         jqBiY1Jk0oQWmWF6PSGKjw8uP5KY2MC08W1WpGYnUpaNfamysLh0SsRQv8BvJYAtZY0i
         seow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ssbrzr2nx0rE0JNE1VJsrKipba9hb+pFtUvZYUXY/LU=;
        b=GMH27c+L8TX9Pseys+oIqahH9A/RB+Ooow4upB3jbBDdW8iK635I7XAuiyWRmlmtPL
         BpPfaz2tf7g3jdsUacT4guexGqkDG6+h7t5LBwb/K9uydeyk6seQz9qjZNiMFd0mwfWW
         dz8k3q8RdN5YgNpsMRi35fQfM1d8XPu/8LVJb/X7cxPX35v24YIMjo3pASqG67uem/aP
         RqcUum23uUNPdeJtGA1tN45OiOzeNd1w7uj2svTkpmiCWHq0xHNEBVCBIyXOtUVPOQoL
         CPpjKrXp8PQw03iadBFFHFEB3oXTdzdEIRs7kleeE8oJPuQA+QMN7XsEwSmOJb3pjZk/
         wz7A==
X-Gm-Message-State: AOAM531W0f9hhr3GneJcpJWj6TzaprItHXeOZWgJFWKnS9t2LR1fpByb
	Y0ENlL98j14Z00FUnId+D+4=
X-Google-Smtp-Source: ABdhPJxVOEE1AU4br+nyhnQEp/0WNXHPiWetLqZKce7RrxrL8Lq5eBB8yIkdTlz4pHHEqtfz5tH7Jg==
X-Received: by 2002:adf:df08:: with SMTP id y8mr7261054wrl.124.1628926833841;
        Sat, 14 Aug 2021 00:40:33 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::4058])
        by smtp.gmail.com with ESMTPSA id l21sm3258750wmh.31.2021.08.14.00.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Aug 2021 00:40:33 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH] staging: r8188eu: remove ODM_GetRightChnlPlaceforIQK()
Date: Sat, 14 Aug 2021 09:39:20 +0200
Message-Id: <20210814073920.3551-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function ODM_GetRightChnlPlaceforIQK() returns always zero for
channels <= 14. The driver is for chips that do not support 5 GHz,
so remove the function and replace the usage of its return value
with zero.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/HalPhyRf_8188e.c | 29 ++------------------
 1 file changed, 3 insertions(+), 26 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/HalPhyRf_8188e.c b/drivers/staging/r8188eu/hal/HalPhyRf_8188e.c
index 643a4d348b2e..c92a76aebc11 100644
--- a/drivers/staging/r8188eu/hal/HalPhyRf_8188e.c
+++ b/drivers/staging/r8188eu/hal/HalPhyRf_8188e.c
@@ -1004,27 +1004,6 @@ static void phy_IQCalibrate_8188E(struct adapter *adapt, s32 result[][8], u8 t,
 	}
 }
 
-#define ODM_TARGET_CHNL_NUM_2G_5G	59
-static u8 ODM_GetRightChnlPlaceforIQK(u8 chnl)
-{
-	u8	channel_all[ODM_TARGET_CHNL_NUM_2G_5G] = {
-		1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14,
-		36, 38, 40, 42, 44, 46, 48, 50, 52, 54, 56, 58, 60, 62, 64,
-		100, 102, 104, 106, 108, 110, 112, 114, 116, 118, 120, 122,
-		124, 126, 128, 130, 132, 134, 136, 138, 140, 149, 151, 153,
-		155, 157, 159, 161, 163, 165
-	};
-	u8	place = chnl;
-
-	if (chnl > 14) {
-		for (place = 14; place < sizeof(channel_all); place++) {
-			if (channel_all[place] == chnl)
-				return place-13;
-		}
-	}
-	return 0;
-}
-
 static void phy_LCCalibrate_8188E(struct adapter *adapt, bool is2t)
 {
 	u8 tmpreg;
@@ -1088,7 +1067,7 @@ void PHY_IQCalibrate_8188E(struct adapter *adapt, bool recovery)
 	struct odm_dm_struct *dm_odm = &pHalData->odmpriv;
 	struct mpt_context *pMptCtx = &adapt->mppriv.MptCtx;
 	s32 result[4][8];	/* last is final result */
-	u8 i, final_candidate, Indexforchannel;
+	u8 i, final_candidate;
 	bool pathaok, pathbok;
 	s32 RegE94, RegE9C, RegEA4, RegEB4, RegEBC, RegEC4;
 	bool is12simular, is13simular, is23simular;
@@ -1200,14 +1179,12 @@ void PHY_IQCalibrate_8188E(struct adapter *adapt, bool recovery)
 			pathb_fill_iqk(adapt, pathbok, result, final_candidate, (RegEC4 == 0));
 	}
 
-	Indexforchannel = ODM_GetRightChnlPlaceforIQK(pHalData->CurrentChannel);
-
 /* To Fix BSOD when final_candidate is 0xff */
 /* by sherry 20120321 */
 	if (final_candidate < 4) {
 		for (i = 0; i < IQK_Matrix_REG_NUM; i++)
-			dm_odm->RFCalibrateInfo.IQKMatrixRegSetting[Indexforchannel].Value[0][i] = result[final_candidate][i];
-		dm_odm->RFCalibrateInfo.IQKMatrixRegSetting[Indexforchannel].bIQKDone = true;
+			dm_odm->RFCalibrateInfo.IQKMatrixRegSetting[0].Value[0][i] = result[final_candidate][i];
+		dm_odm->RFCalibrateInfo.IQKMatrixRegSetting[0].bIQKDone = true;
 	}
 
 	_PHY_SaveADDARegisters(adapt, IQK_BB_REG_92C, dm_odm->RFCalibrateInfo.IQK_BB_backup_recover, 9);
-- 
2.32.0

