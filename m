Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC1E7B
	for <linux-staging@lists.linux.dev>; Mon, 21 Feb 2022 07:33:18 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id r13so7805199ejd.5
        for <linux-staging@lists.linux.dev>; Sun, 20 Feb 2022 23:33:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=O6E3mVixruLxdZHjJ1wxRBvkKpRcoOQJ1soEUthx7X8=;
        b=gUQMEEqFDEmmcDfzQK4o4ZPd3s+UQuFOc+Zi9aGoY4O9z4ClQqvVxUQKAp84YpPBNy
         BM+t/PtQ76A2WSBqY3SoOh1ZsaLIfjOqC4TexkXAyjPiJLcyBIp2NsIgEOrV5u4t91MG
         NXffr3x/r3eBumnMs8Cefeo2RwA/35zjl1ikjnym6ZxGZAgr+lMf5J618Rms6eUX9GFM
         3BwDy6Q8AfjVRmv7EiYNcU/CApBEF+Q+G/hCSe1Y0/WsKwIISG9q0bHIwLiZxoPgvElB
         4VLmCzRidd1PO53gsCfXp/E4ikpWLwS9b8zQ9X+uz5HsJwqrcGkcf4SAAiztXlI8TuiS
         J4LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=O6E3mVixruLxdZHjJ1wxRBvkKpRcoOQJ1soEUthx7X8=;
        b=FrfyayZyu7vWKf78WwQeOM9u7/8ShwWzrA8mvThDW16zHMq6knOvfLjS0nSR0JeCOS
         HKAA9udI9AC+jdZqX/iGZhBoI7+5dmUQGZGHWS1tANodDgJCnp5V/zFir/eA1bZkbuqe
         1DJcf8Bl+gAEvG3MJucSdk33YRcZThpTFWO41VukDIt2Q5jLnJTVKJAAhb9WkPBIliga
         pTdO5QCwK9/NHQweWnczxJyi336yKLRGADxhPtVpvB+NWTPXVghnr5WMRlf4kqRuu/vB
         IgV2X4j8xRwjWJK+MTYIi3wBVvNvrh6G/r8tjyvCS0X2t0mKFGYCJMHIzOaRmeyAs596
         Cq9A==
X-Gm-Message-State: AOAM533btLeOyGSv0wJiVSLGdEyS6RKQMDo7JWo6Yzw+28Q/Tyur8BTh
	BLVEr6ZlgIp3dURXRYMFfX0=
X-Google-Smtp-Source: ABdhPJxTNUhzfwuSfieA7KUNxbkpK3lwDok77gr9+EbSnDej9/2n495FaAXct4sPOB+LaEklpGVrKw==
X-Received: by 2002:a17:906:407:b0:6cd:472b:2d5f with SMTP id d7-20020a170906040700b006cd472b2d5fmr14530079eja.573.1645428797278;
        Sun, 20 Feb 2022 23:33:17 -0800 (PST)
Received: from localhost.localdomain (ip5f5abb8f.dynamic.kabel-deutschland.de. [95.90.187.143])
        by smtp.gmail.com with ESMTPSA id c11sm8673128edx.42.2022.02.20.23.33.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Feb 2022 23:33:17 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 3/5] staging: r8188eu: remove enum odm_bw
Date: Mon, 21 Feb 2022 08:33:04 +0100
Message-Id: <20220221073306.16636-4-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220221073306.16636-1-straube.linux@gmail.com>
References: <20220221073306.16636-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The enums odm_bw and ht_channel_width are redundant. Keep
ht_channel_width and remove odm_bw.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
v2:
no changes

 drivers/staging/r8188eu/hal/odm.c     | 4 ++--
 drivers/staging/r8188eu/include/odm.h | 6 ------
 2 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/odm.c b/drivers/staging/r8188eu/hal/odm.c
index 6f594ae33c6e..5d2f934d78ae 100644
--- a/drivers/staging/r8188eu/hal/odm.c
+++ b/drivers/staging/r8188eu/hal/odm.c
@@ -266,7 +266,7 @@ static void odm_CommonInfoSelfUpdate(struct odm_dm_struct *pDM_Odm)
 	u8 i;
 	struct sta_info *pEntry;
 
-	if (*pDM_Odm->pBandWidth == ODM_BW40M) {
+	if (*pDM_Odm->pBandWidth == HT_CHANNEL_WIDTH_40) {
 		if (*pDM_Odm->pSecChOffset == 1)
 			pDM_Odm->ControlChannel = *pDM_Odm->pChannel - 2;
 		else if (*pDM_Odm->pSecChOffset == 2)
@@ -766,7 +766,7 @@ u32 ODM_Get_Rate_Bitmap(struct odm_dm_struct *pDM_Odm, u32 macid, u32 ra_mask, u
 		} else if (rssi_level == DM_RATR_STA_MIDDLE) {
 			rate_bitmap = 0x000ff000;
 		} else {
-			if (*pDM_Odm->pBandWidth == ODM_BW40M)
+			if (*pDM_Odm->pBandWidth == HT_CHANNEL_WIDTH_40)
 				rate_bitmap = 0x000ff015;
 			else
 				rate_bitmap = 0x000ff005;
diff --git a/drivers/staging/r8188eu/include/odm.h b/drivers/staging/r8188eu/include/odm.h
index 0e85bd88ab8a..fed12203c558 100644
--- a/drivers/staging/r8188eu/include/odm.h
+++ b/drivers/staging/r8188eu/include/odm.h
@@ -166,12 +166,6 @@ enum odm_wireless_mode {
 	ODM_WM_AUTO	= BIT(5),
 };
 
-/*  ODM_CMNINFO_BW */
-enum odm_bw {
-	ODM_BW20M		= 0,
-	ODM_BW40M		= 1,
-};
-
 struct odm_ra_info {
 	u8 RateID;
 	u32 RateMask;
-- 
2.35.1

