Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A99AE2FB3
	for <linux-staging@lists.linux.dev>; Tue, 21 Sep 2021 19:47:23 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id w29so46281wra.8
        for <linux-staging@lists.linux.dev>; Tue, 21 Sep 2021 12:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Vh05SKxl7lxX8F8/fcAY/OkP0eJgGhNwDaPrfeFnqi8=;
        b=UvC4RB+bIDEv6a53MUJ7f9o9bANl1pdMe4TwFep+cLCPUANVn6TC3fNukSk0iGprFM
         OqbY6aZS16RCBJzmrmmkK1YGrHTmIqMUkBLwd4SdfezbD+HJYoVv+lVRcovkn8R2psql
         XQMNK/03sCCZxZueuW6M6sInn7Ii0aKf19F6QTzjXem54Vqyn5Qp8cvK8t4eCeag1OlO
         tTh2TOKwBrjsd0ecCetbNx/nBXF90OruxwiY2HvrYkpvL3BKid4J7ppP32Cdot+c2x76
         5liqIAizQ+stJwc79sQa55owVy942c6WLIc4S59G2kJ2327vaXNqNBgvnaplFKZMN5gf
         jMWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Vh05SKxl7lxX8F8/fcAY/OkP0eJgGhNwDaPrfeFnqi8=;
        b=M8z7AfitNSDts0DcXpCjVrMqiei6RL5lmCaWwugytGzfU1D9c7iGeXzFr/nhb6A/3Z
         rMwBhAhBv5tVvnjYA0R3wV9elOPuRlHqif1M9O0AGKo70knEaLa5hcZiZSk6a3qKmzjp
         wqpbnOE24blPv/xoXjInal9D7Yxs5umcyaScSgP54mFBxUYmybcqAVgvTQGo+oAhLL0Y
         7gvoHUdHksk3iCz7otkoFrw5tZhbKDNszZ9cN3InOfD/rX4GJByTDgdxV7GA4Hqw+Ync
         hBv1ykssEyo6DQS525ZY6LmX+SdzFqxNqejOcf2OBkeb01K7ZYcGT8qQM1nNANGCP2ef
         BLqg==
X-Gm-Message-State: AOAM531KVFK4Ll7MBzwjwcNGtLkPelLLMspTnHVjJJbgNB/Qu0ctvdBc
	Ja/2wcOG03AKN+a69uyaW/U=
X-Google-Smtp-Source: ABdhPJytrho0jHGr+ofEuQ60o7zpZ6TSCvrV36I/xjNsZPuko5VNXHoMK+1kL/02LETMAn9tiuYD1A==
X-Received: by 2002:a05:6000:1b90:: with SMTP id r16mr12119525wru.250.1632253642062;
        Tue, 21 Sep 2021 12:47:22 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::cde])
        by smtp.gmail.com with ESMTPSA id s13sm3891243wmc.47.2021.09.21.12.47.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 12:47:21 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 1/8] staging: r8188eu: remove odm_DynamicTxPowerNIC()
Date: Tue, 21 Sep 2021 21:46:51 +0200
Message-Id: <20210921194658.10654-2-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210921194658.10654-1-straube.linux@gmail.com>
References: <20210921194658.10654-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function odm_DynamicTxPowerNIC() does nothing, remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/odm.c             | 12 ------------
 drivers/staging/r8188eu/include/odm_precomp.h |  1 -
 2 files changed, 13 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/odm.c b/drivers/staging/r8188eu/hal/odm.c
index 40eb1a938f8c..9fc36ec2f56c 100644
--- a/drivers/staging/r8188eu/hal/odm.c
+++ b/drivers/staging/r8188eu/hal/odm.c
@@ -1207,7 +1207,6 @@ void odm_DynamicTxPower(struct odm_dm_struct *pDM_Odm)
 	switch	(pDM_Odm->SupportPlatform) {
 	case	ODM_MP:
 	case	ODM_CE:
-		odm_DynamicTxPowerNIC(pDM_Odm);
 		break;
 	case	ODM_AP:
 		odm_DynamicTxPowerAP(pDM_Odm);
@@ -1217,17 +1216,6 @@ void odm_DynamicTxPower(struct odm_dm_struct *pDM_Odm)
 	}
 }
 
-void odm_DynamicTxPowerNIC(struct odm_dm_struct *pDM_Odm)
-{
-	if (!(pDM_Odm->SupportAbility & ODM_BB_DYNAMIC_TXPWR))
-		return;
-
-	if (pDM_Odm->SupportICType == ODM_RTL8188E) {
-		/*  ??? */
-		/*  This part need to be redefined. */
-	}
-}
-
 void odm_DynamicTxPowerAP(struct odm_dm_struct *pDM_Odm)
 {
 }
diff --git a/drivers/staging/r8188eu/include/odm_precomp.h b/drivers/staging/r8188eu/include/odm_precomp.h
index cd8e3d2db212..91f74d694770 100644
--- a/drivers/staging/r8188eu/include/odm_precomp.h
+++ b/drivers/staging/r8188eu/include/odm_precomp.h
@@ -57,7 +57,6 @@ void odm_RefreshRateAdaptiveMask(struct odm_dm_struct *pDM_Odm);
 void odm_1R_CCA(struct odm_dm_struct *pDM_Odm);
 void odm_RefreshRateAdaptiveMaskCE(struct odm_dm_struct *pDM_Odm);
 void odm_RefreshRateAdaptiveMaskAPADSL(struct odm_dm_struct *pDM_Odm);
-void odm_DynamicTxPowerNIC(struct odm_dm_struct *pDM_Odm);
 void odm_DynamicTxPowerAP(struct odm_dm_struct *pDM_Odm);
 void odm_RSSIMonitorCheckMP(struct odm_dm_struct *pDM_Odm);
 void odm_RSSIMonitorCheckCE(struct odm_dm_struct *pDM_Odm);
-- 
2.33.0

