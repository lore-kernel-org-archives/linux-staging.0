Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA87B2FB2
	for <linux-staging@lists.linux.dev>; Fri, 11 Jun 2021 00:25:10 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id u5-20020a7bc0450000b02901480e40338bso5497444wmc.1
        for <linux-staging@lists.linux.dev>; Thu, 10 Jun 2021 17:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=85p0QoTHi440kSdCs1wq1UL+IvYi9r3WYoNSBnvjIok=;
        b=mextb3dlHGY2DSRrDC+oXt/q9X2ftisdyFnya2mtEFJMtBMIiYMdNzggTK1xm6nAo+
         bt9BL4pqNgwWBaskjrnG/N31lVrrKaw8KTOBc/dnQNdWJLSkqIKqLMEj0VpJh+Kn/oUE
         qo8lg0KmUaj5kUXXDeT0ywGqCX5OtYP3NkRDbFZTwZXOOgHvD+kJArMIrTKO93/rWS/E
         OxcAPzVgNRN9PLysJOiyyEnrfqNwVSyFfqEo1E1OwUKwGyZwg8i8f9V9x613nP32PEEt
         d/J0y5t8SQ66crzL14lnLUbXqn3IZLVdo8oRKlfYJRItY6Gh41g6giJLXrNC5MbniY5g
         K5sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=85p0QoTHi440kSdCs1wq1UL+IvYi9r3WYoNSBnvjIok=;
        b=t684g+l1HoS94zoNOMvJdtv4zVXJRyKkJSnFtZf0OXMpxuxq67+nQAeXldafTx6b1I
         nvWHFbgQoalRLFlDQ1UrTG/RwHZRyge+HpoyuFGUeO440y3PD+w24z7LqRgoWzVBQgo5
         GM1Ml/0NDz+l6/7mEOOT088tnTjOv/kcwEykGPeWqtrlwKJcQ+QmyLKzzBiapo/iH8ri
         P1oYPRViy1S4aRr3If6TZS51Fw3sITesO76eIGQkZKbc8ykc0UxoN9Lth2E0T9kB9Foe
         5zT8fhzYcW6uC1O0A4BzN6glhafQ9HOX9bJatNGSy5rhVCVTB27tQ4zoM+BlIYwINSmo
         Hf1w==
X-Gm-Message-State: AOAM533XtMHpKSgsMiaYRA30JTminerYF7jRDCxkGfIH9yY70pYyu0sR
	qhW8j9KCWlfCpqG5+hVmf6MnYQ==
X-Google-Smtp-Source: ABdhPJzMucRJp6WhZa+Mbmi9JfmtYkdDgxBQweR3ADxbFo07cXLfitBm89Q/uC2/8MJVt9JqLfXPMw==
X-Received: by 2002:a1c:1b93:: with SMTP id b141mr1281128wmb.8.1623371109251;
        Thu, 10 Jun 2021 17:25:09 -0700 (PDT)
Received: from localhost.localdomain (2.0.5.1.1.6.3.8.5.c.c.3.f.b.d.3.0.0.0.0.6.1.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:df16:0:3dbf:3cc5:8361:1502])
        by smtp.gmail.com with ESMTPSA id c2sm11386189wmf.24.2021.06.10.17.25.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jun 2021 17:25:08 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	straube.linux@gmail.com,
	kaixuxia@tencent.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	liushixin2@huawei.com,
	unixbhaskar@gmail.com,
	gustavoars@kernel.org,
	martin@kaiser.cx,
	bkkarthik@pesu.pes.edu,
	dan.carpenter@oracle.com
Subject: [PATCH 1/6] staging: rtl8188eu: remove ODM_RT_TRACE calls from hal/phy.c
Date: Fri, 11 Jun 2021 01:24:59 +0100
Message-Id: <20210611002504.166405-2-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210611002504.166405-1-phil@philpotter.co.uk>
References: <20210611002504.166405-1-phil@philpotter.co.uk>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove all ODM_RT_TRACE calls from hal/phy.c, as this debug code
is not optimal and doesn't follow best practices. This in concert
with other removals allows for the removal of include/odm_debug.h
in its entirety.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/rtl8188eu/hal/phy.c | 36 +----------------------------
 1 file changed, 1 insertion(+), 35 deletions(-)

diff --git a/drivers/staging/rtl8188eu/hal/phy.c b/drivers/staging/rtl8188eu/hal/phy.c
index a664bff370bb..34079275e57c 100644
--- a/drivers/staging/rtl8188eu/hal/phy.c
+++ b/drivers/staging/rtl8188eu/hal/phy.c
@@ -303,10 +303,6 @@ void rtl88eu_dm_txpower_track_adjust(struct odm_dm_struct *dm_odm, u8 type,
 	u8 pwr_value = 0;
 	/*  Tx power tracking BB swing table. */
 	if (type == 0) { /* For OFDM adjust */
-		ODM_RT_TRACE(dm_odm, ODM_COMP_TX_PWR_TRACK, ODM_DBG_LOUD,
-			     ("BbSwingIdxOfdm = %d BbSwingFlagOfdm=%d\n",
-			     dm_odm->BbSwingIdxOfdm, dm_odm->BbSwingFlagOfdm));
-
 		if (dm_odm->BbSwingIdxOfdm <= dm_odm->BbSwingIdxOfdmBase) {
 			*direction = 1;
 			pwr_value = dm_odm->BbSwingIdxOfdmBase -
@@ -316,12 +312,7 @@ void rtl88eu_dm_txpower_track_adjust(struct odm_dm_struct *dm_odm, u8 type,
 			pwr_value = dm_odm->BbSwingIdxOfdm -
 				     dm_odm->BbSwingIdxOfdmBase;
 		}
-
 	} else if (type == 1) { /* For CCK adjust. */
-		ODM_RT_TRACE(dm_odm, ODM_COMP_TX_PWR_TRACK, ODM_DBG_LOUD,
-			     ("dm_odm->BbSwingIdxCck = %d dm_odm->BbSwingIdxCckBase = %d\n",
-			     dm_odm->BbSwingIdxCck, dm_odm->BbSwingIdxCckBase));
-
 		if (dm_odm->BbSwingIdxCck <= dm_odm->BbSwingIdxCckBase) {
 			*direction = 1;
 			pwr_value = dm_odm->BbSwingIdxCckBase -
@@ -343,8 +334,6 @@ void rtl88eu_dm_txpower_track_adjust(struct odm_dm_struct *dm_odm, u8 type,
 static void dm_txpwr_track_setpwr(struct odm_dm_struct *dm_odm)
 {
 	if (dm_odm->BbSwingFlagOfdm || dm_odm->BbSwingFlagCck) {
-		ODM_RT_TRACE(dm_odm, ODM_COMP_TX_PWR_TRACK, ODM_DBG_LOUD,
-			     ("%s CH=%d\n", __func__, *dm_odm->pChannel));
 		phy_set_tx_power_level(dm_odm->Adapter, *dm_odm->pChannel);
 		dm_odm->BbSwingFlagOfdm = false;
 		dm_odm->BbSwingFlagCck = false;
@@ -610,8 +599,6 @@ static u8 phy_path_a_rx_iqk(struct adapter *adapt, bool configPathB)
 
 	/* 1 RX IQK */
 	/* modify RXIQK mode table */
-	ODM_RT_TRACE(dm_odm, ODM_COMP_CALIBRATION, ODM_DBG_LOUD,
-		     ("Path-A Rx IQK modify RXIQK mode table 2!\n"));
 	phy_set_bb_reg(adapt, rFPGA0_IQK, bMaskDWord, 0x00000000);
 	phy_set_rf_reg(adapt, RF_PATH_A, RF_WE_LUT, bRFRegOffsetMask, 0x800a0);
 	phy_set_rf_reg(adapt, RF_PATH_A, RF_RCK_OS, bRFRegOffsetMask, 0x30000);
@@ -650,9 +637,6 @@ static u8 phy_path_a_rx_iqk(struct adapter *adapt, bool configPathB)
 	    (((reg_ea4 & 0x03FF0000) >> 16) != 0x132) &&
 	    (((reg_eac & 0x03FF0000) >> 16) != 0x36))
 		result |= 0x02;
-	else
-		ODM_RT_TRACE(dm_odm, ODM_COMP_CALIBRATION, ODM_DBG_LOUD,
-			     ("Path A Rx IQK fail!!\n"));
 
 	return result;
 }
@@ -686,9 +670,7 @@ static u8 phy_path_b_iqk(struct adapter *adapt)
 	    (((regec4 & 0x03FF0000) >> 16) != 0x132) &&
 	    (((regecc & 0x03FF0000) >> 16) != 0x36))
 		result |= 0x02;
-	else
-		ODM_RT_TRACE(dm_odm, ODM_COMP_CALIBRATION,
-			     ODM_DBG_LOUD,  ("Path B Rx IQK fail!!\n"));
+
 	return result;
 }
 
@@ -1055,13 +1037,6 @@ static void phy_iq_calibrate(struct adapter *adapt, s32 result[][8],
 							 bMaskDWord) & 0x3FF0000) >> 16;
 			break;
 		}
-		ODM_RT_TRACE(dm_odm, ODM_COMP_CALIBRATION, ODM_DBG_LOUD,
-			     ("Path A Rx IQK Fail!!\n"));
-	}
-
-	if (path_a_ok == 0x00) {
-		ODM_RT_TRACE(dm_odm, ODM_COMP_CALIBRATION, ODM_DBG_LOUD,
-			     ("Path A IQK failed!!\n"));
 	}
 
 	if (is2t) {
@@ -1089,11 +1064,6 @@ static void phy_iq_calibrate(struct adapter *adapt, s32 result[][8],
 								 bMaskDWord) & 0x3FF0000) >> 16;
 			}
 		}
-
-		if (path_b_ok == 0x00) {
-			ODM_RT_TRACE(dm_odm, ODM_COMP_CALIBRATION, ODM_DBG_LOUD,
-				     ("Path B IQK failed!!\n"));
-		}
 	}
 
 	/* Back to BB mode, load original value */
@@ -1214,8 +1184,6 @@ void rtl88eu_phy_iq_calibrate(struct adapter *adapt, bool recovery)
 		return;
 
 	if (recovery) {
-		ODM_RT_TRACE(dm_odm, ODM_COMP_INIT, ODM_DBG_LOUD,
-			     ("phy_iq_calibrate: Return due to recovery!\n"));
 		reload_adda_reg(adapt, iqk_bb_reg_92c,
 				dm_odm->RFCalibrateInfo.IQK_BB_backup_recover, 9);
 		return;
@@ -1280,8 +1248,6 @@ void rtl88eu_phy_iq_calibrate(struct adapter *adapt, bool recovery)
 		pathaok = true;
 		pathbok = true;
 	} else {
-		ODM_RT_TRACE(dm_odm, ODM_COMP_CALIBRATION, ODM_DBG_LOUD,
-			     ("IQK: FAIL use default value\n"));
 		dm_odm->RFCalibrateInfo.RegE94 = 0x100;
 		dm_odm->RFCalibrateInfo.RegEB4 = 0x100;
 		dm_odm->RFCalibrateInfo.RegE9C = 0x0;
-- 
2.30.2

