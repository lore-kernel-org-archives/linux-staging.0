Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E828F72
	for <linux-staging@lists.linux.dev>; Sun, 29 Aug 2021 17:56:40 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id x2-20020a1c7c02000000b002e6f1f69a1eso13061772wmc.5
        for <linux-staging@lists.linux.dev>; Sun, 29 Aug 2021 10:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hct9WXGwxi0kZfiuUFWEyJRcWk1ylxYCbKFr9whU4ko=;
        b=Tfz4rdVeJAZl+sVPZFCBt3g3JGm2EOUJ6T/vkhfzPegFePaNRo0o8JO7vvRjCOLb0B
         FVI6oEYZxTEl8rgzKTy6ZCACc2Uiza4wBFzF7nSAI7c+VvIUYvznsbBh0UDRl9OKqFa+
         QpHhdrouIm+VAYNEyNR6VHRV/vvBrVjXd58V5cD1vZTkxv2k3f6uN3ypUYZORFCFBNSS
         6scMiV/SiKCYLkFEwUOQgNf7a2EA7JshYDJ56l2xQ3fMJHr4YDsFPITtmsCp+67a5/II
         42mTsVCwTNH3AzesDHtytG6Ad51FDzgFTv9p/sBhPnNALhPaOuHGnErT4F/SXYDRklav
         V0rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hct9WXGwxi0kZfiuUFWEyJRcWk1ylxYCbKFr9whU4ko=;
        b=eCeHKqEZTMgIM2mNcoi45lSda9y38fJskB7oFKUD5MIZUuA+qM7v9Fi5rZD78sgib6
         FSEcnj0qgq+VV9z4NEBehXtviWLYfK0uIqDjQ1lQWzyXrSsEbjTmey8VSu6cv2qHngUj
         hfLktDfKQB9jrInbezZGWHFvuGvHITaBonh7xORZ8eu8cQf1KBxQ8urEkt9MYE4UHDul
         An+Y0bxzbQ7YjPU5NkCQahX2tmFNtn9T6Y3Eje3QI95pZr71iK4rbVUPv+Xlat6Jsh1p
         TGkDWZggEiU3JnWn5cKb/8B2qQn/ijyCBYW/P3kE4fP9DFF7BGr2IGkr3s3L1ONEzuO/
         DlUA==
X-Gm-Message-State: AOAM530T2fL4QyjRU1271Zmrqpylw3hwGDGAg/n2NJeQIv7sRJ0T2uBt
	VG2JG77c6nI6rgK+Z4ypEoE=
X-Google-Smtp-Source: ABdhPJy29m6zeYLEm3R+Yq5EgHSyLOREcHE5ZqfoPiGat2oWSCmOzYh7GY2v2IBRNwA+1Eeu9GjnmA==
X-Received: by 2002:a1c:d4:: with SMTP id 203mr18658456wma.67.1630259799319;
        Sun, 29 Aug 2021 10:56:39 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::16fa])
        by smtp.gmail.com with ESMTPSA id k25sm13765256wrd.42.2021.08.29.10.56.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Aug 2021 10:56:38 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 1/2] staging: r8188eu: remove local variable Indexforchannel
Date: Sun, 29 Aug 2021 19:56:23 +0200
Message-Id: <20210829175624.5915-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The local variable Indexforchannel in function
odm_TXPowerTrackingCallback_ThermalMeter_8188E() is initilaized to 0
and never changed. Remove the variable and replace its usage with 0.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/HalPhyRf_8188e.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/HalPhyRf_8188e.c b/drivers/staging/r8188eu/hal/HalPhyRf_8188e.c
index 356885e27edd..1b0e1e7307cd 100644
--- a/drivers/staging/r8188eu/hal/HalPhyRf_8188e.c
+++ b/drivers/staging/r8188eu/hal/HalPhyRf_8188e.c
@@ -110,7 +110,6 @@ odm_TXPowerTrackingCallback_ThermalMeter_8188E(
 	bool is2t = false;
 
 	u8 OFDM_min_index = 6, rf; /* OFDM BB Swing should be less than +3.0dB, which is required by Arthur */
-	u8 Indexforchannel = 0/*GetRightChnlPlaceforIQK(pHalData->CurrentChannel)*/;
 	s8 OFDM_index_mapping[2][index_mapping_NUM_88E] = {
 		{0, 0, 2, 3, 4, 4, 		/* 2.4G, decrease power */
 		5, 6, 7, 7, 8, 9,
@@ -280,8 +279,8 @@ odm_TXPowerTrackingCallback_ThermalMeter_8188E(
 
 				/* Adujst OFDM Ant_A according to IQK result */
 				ele_D = (OFDMSwingTable[(u8)OFDM_index[0]] & 0xFFC00000) >> 22;
-				X = dm_odm->RFCalibrateInfo.IQKMatrixRegSetting[Indexforchannel].Value[0][0];
-				Y = dm_odm->RFCalibrateInfo.IQKMatrixRegSetting[Indexforchannel].Value[0][1];
+				X = dm_odm->RFCalibrateInfo.IQKMatrixRegSetting[0].Value[0][0];
+				Y = dm_odm->RFCalibrateInfo.IQKMatrixRegSetting[0].Value[0][1];
 
 				/*  Revse TX power table. */
 				dm_odm->BbSwingIdxOfdm		= (u8)OFDM_index[0];
@@ -315,8 +314,8 @@ odm_TXPowerTrackingCallback_ThermalMeter_8188E(
 					ele_D = (OFDMSwingTable[(u8)OFDM_index[1]] & 0xFFC00000) >> 22;
 
 					/* new element A = element D x X */
-					X = dm_odm->RFCalibrateInfo.IQKMatrixRegSetting[Indexforchannel].Value[0][4];
-					Y = dm_odm->RFCalibrateInfo.IQKMatrixRegSetting[Indexforchannel].Value[0][5];
+					X = dm_odm->RFCalibrateInfo.IQKMatrixRegSetting[0].Value[0][4];
+					Y = dm_odm->RFCalibrateInfo.IQKMatrixRegSetting[0].Value[0][5];
 
 					if ((X != 0) && (*dm_odm->pBandType == ODM_BAND_2_4G)) {
 						if ((X & 0x00000200) != 0)	/* consider minus */
-- 
2.33.0

