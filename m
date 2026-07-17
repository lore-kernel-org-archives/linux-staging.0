Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D93123536B
	for <linux-staging@lists.linux.dev>; Fri, 17 Jul 2026 15:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784302002; cv=none; b=hBogbagJcaWXEGXHy1u781I22YywOBjNz2Ye6ToVKZsCxpjej7otG6RvdBxVweAeRKc1wS9uuhAzK8JNqpkvtt92KihSycFYyItIRNuZJSFOVAu9LrH0kkfBk++2UX7vUeVJjMZEpQImZ8TI17aEMZSy1WCLop9ZGTEfCvQR14w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784302002; c=relaxed/simple;
	bh=FqEEOKUWevUgF6OOUe1W9ow7FmHaADHATV7xmT2/goI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jnUO5kNZFDyM11jNFmzFg/L5BhnntkTjZ7TeMWznInTYawoFQyHNUBsCe28CM0YgR6vK4UIiCR4esWFmSMSqB3cyuJn3cSWjti7Z6BdAgIgILjiOuzqeYWov7zUP32ppY3jTTcLZDK65nePDwKwE+SWfS4gIUwiW5QgvEYdtrpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q9VFUxn2; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q9VFUxn2"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38e42560ebcso1419460a91.1
        for <linux-staging@lists.linux.dev>; Fri, 17 Jul 2026 08:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784302001; x=1784906801; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=m5FgSTIvx1yg54o8ZJfU4jGCqOFBujRs5/WlT0/Oay4=;
        b=q9VFUxn2zu83s2Hy7NB4ZlGTKXA0H3rL8SSXPhLH7RvF16u0AGbA9dRRy328rwCbuf
         jn5Jivvn6rNpys6CJZFsCcsbcqEdx1dxk81Cje1ppiOe8iWAgtGO5ZpUIEuQqo4T+/n5
         VWkmdCd5IUGsgwhtyAFp01yDd5G4WIj7fFTMlKiMKEIIjqxM9YxvowNA8kazOVTtsqRs
         oYlAga3hLr14FQ1Xw3S88q0sBxcm/xbk6ksFeIc+u6lUxgzsMA378UVaqSkLer5aCD5a
         Rbv+6/kg01cqIE/sIZ/nadoCk6vRyS+NDc+SP8+Qzv1mVKJ4NnxwxA7ny6hVx59CoXTw
         NHDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784302001; x=1784906801;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m5FgSTIvx1yg54o8ZJfU4jGCqOFBujRs5/WlT0/Oay4=;
        b=f9wYQ3TMcTuGCG2RyTlX1YPHv7JMgiTw2byOQzoCYMMaOuL2aIZjk9OaTz0xzwOnzW
         dFV3gJzYXEVI5idZwrIjRZU6v6XxtgaFbACoEfF9pIa7dM1VbrEJFMswfI3S5WeV4q28
         er2VGQwBkskzcSR3vXt/WkBpTH7Yn5HIcpndBho95v7IATIEGECeF9/Djsah6tdTrh6f
         uni65BYAphcRghU3aIT7W1ImfXv3X4Xz6M2M69ymy4LEXNfh8wRcao3OP8L0ITNZvmmU
         akscyc9OTUSomr11SNSyDCo7hlnODuD72nw0cJCDsrDu0CBekl2erkDtoBJat+8ZrOgu
         Y/9w==
X-Gm-Message-State: AOJu0Yw1pU5U+VWvUdbqRK8D+Cm1xh4KqUXccqE7WqRmerhfFrVya9dW
	Rbzu1+V1Yfs4VFfAeZki3WrX0k3wzMbCTNDNoQMt1uG8TFfniELCFMN5
X-Gm-Gg: AfdE7cmOl2/gVYYTf36mun882sR7Jl1C6cPhKafTsjvI349S4yWyF/KKzCmZnt9TYGI
	utt4rN9Wf1hYcEFMIIhCsNNjl9QDdzIbQ87sMfRvWZLHfXGG+4w9M0AKO9Znm6wse5oGxvA4KJf
	GiLtnJ9LXZ+QWAPb9GXmbv/orSkIl8NmxkdV/ZQwp1S5x8kxS9iX3yc8GeFy9/cgYP0UUuEYqOu
	Ez9mPrkQUJJngftPDVbTvOzs38Vc/z2xhbMzM0Lph95rrnuOeMi/o9xDAN9ZRLQbjlLXrl5FhPl
	vQLC30yfJyRCqvt5to+vzLntjl3D5I3uTxUGUOo31VPgePwhLY2/fOg3mrtEQ+fyGG2Zb8BKqj2
	4xjDySoMkV0uZoPskQn42DWQtpgvFORaHCTw9P+LrdS30jK5H4g5xSC7ePLiaIJ3G2SDEsRNpCc
	dsAGra/vgWY21IPP5FuIBGJZrq7fQgB3DuxdZo+RBnYBqn1JiP
X-Received: by 2002:a17:90b:3851:b0:38e:4011:465d with SMTP id 98e67ed59e1d1-38e4b51682bmr2932289a91.24.1784302000594;
        Fri, 17 Jul 2026 08:26:40 -0700 (PDT)
Received: from XPS-15-9560 (80-15-70-17.ftth.fr.orangecustomers.net. [80.15.70.17])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e4ae14a32sm1312885a91.0.2026.07.17.08.26.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 08:26:39 -0700 (PDT)
From: Olivier Tanoh <olivier.tanoh19@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Olivier Tanoh <olivier.tanoh19@gmail.com>
Subject: [PATCH] staging: rtl8723bs: rename Switch_DM_Func to avoid CamelCase
Date: Fri, 17 Jul 2026 17:26:23 +0200
Message-Id: <20260717152623.57255-1-olivier.tanoh19@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch.pl warning regarding the use of CamelCase:
CHECK: Avoid CamelCase: <Switch_DM_Func>

Rename the internal function Switch_DM_Func to switch_dm_func across
the entire driver to comply with the Linux kernel coding style.

Signed-off-by: Olivier Tanoh <olivier.tanoh19@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ap.c          |  2 +-
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c    | 10 +++++-----
 drivers/staging/rtl8723bs/core/rtw_wlan_util.c   |  6 +++---
 drivers/staging/rtl8723bs/include/rtw_mlme_ext.h |  2 +-
 4 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index 065850a9e894..335bfe0df085 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -684,7 +684,7 @@ void start_bss_network(struct adapter *padapter)
 
 	if (!pmlmepriv->cur_network.join_res) { /* setting only at  first time */
 		/* turn on all dynamic functions */
-		Switch_DM_Func(padapter, DYNAMIC_ALL_FUNC_ENABLE, true);
+		switch_dm_func(padapter, DYNAMIC_ALL_FUNC_ENABLE, true);
 	}
 
 	/* set channel, bwmode */
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index a86d6f97cf02..b5951602561f 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -3762,7 +3762,7 @@ void site_survey(struct adapter *padapter)
 			rtw_hal_set_hwreg(padapter, HW_VAR_INITIAL_GAIN, (u8 *)(&initialgain));
 			/* turn on dynamic functions */
 			Restore_DM_Func_Flag(padapter);
-			/* Switch_DM_Func(padapter, DYNAMIC_ALL_FUNC_ENABLE, true); */
+			/* switch_dm_func(padapter, DYNAMIC_ALL_FUNC_ENABLE, true); */
 
 			if (is_client_associated_to_ap(padapter))
 				issue_nulldata(padapter, NULL, 0, 3, 500);
@@ -4658,7 +4658,7 @@ void mlmeext_joinbss_event_callback(struct adapter *padapter, int join_res)
 		update_bmc_sta(padapter);
 
 	/* turn on dynamic functions */
-	Switch_DM_Func(padapter, DYNAMIC_ALL_FUNC_ENABLE, true);
+	switch_dm_func(padapter, DYNAMIC_ALL_FUNC_ENABLE, true);
 
 	/*  update IOT-related issue */
 	update_IOT_info(padapter);
@@ -5094,7 +5094,7 @@ u8 createbss_hdl(struct adapter *padapter, u8 *pbuf)
 
 		/* disable dynamic functions, such as high power, DIG */
 		Save_DM_Func_Flag(padapter);
-		Switch_DM_Func(padapter, DYNAMIC_FUNC_DISABLE, false);
+		switch_dm_func(padapter, DYNAMIC_FUNC_DISABLE, false);
 
 		/* config the initial gain under linking, need to write the BB registers */
 		/* initialgain = 0x1E; */
@@ -5241,7 +5241,7 @@ u8 join_cmd_hdl(struct adapter *padapter, u8 *pbuf)
 	}
 
 	/* disable dynamic functions, such as high power, DIG */
-	/* Switch_DM_Func(padapter, DYNAMIC_FUNC_DISABLE, false); */
+	/* switch_dm_func(padapter, DYNAMIC_FUNC_DISABLE, false); */
 
 	/* config the initial gain under linking, need to write the BB registers */
 	/* initialgain = 0x1E; */
@@ -5396,7 +5396,7 @@ u8 sitesurvey_cmd_hdl(struct adapter *padapter, u8 *pbuf)
 	    (pmlmeext->sitesurvey_res.state == SCAN_TXNULL)) {
 		/* disable dynamic functions, such as high power, DIG */
 		Save_DM_Func_Flag(padapter);
-		Switch_DM_Func(padapter, DYNAMIC_FUNC_DISABLE, false);
+		switch_dm_func(padapter, DYNAMIC_FUNC_DISABLE, false);
 
 		/* config the initial gain under scanning, need to write the BB
 		 * registers
diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
index 1d37c2d5b10d..c4bb590d39e3 100644
--- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
+++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
@@ -234,7 +234,7 @@ void Restore_DM_Func_Flag(struct adapter *padapter)
 	rtw_hal_set_hwreg(padapter, HW_VAR_DM_FUNC_OP, (u8 *)(&bSaveFlag));
 }
 
-void Switch_DM_Func(struct adapter *padapter, u32 mode, u8 enable)
+void switch_dm_func(struct adapter *padapter, u32 mode, u8 enable)
 {
 	if (enable)
 		rtw_hal_set_hwreg(padapter, HW_VAR_DM_FUNC_SET, (u8 *)(&mode));
@@ -1450,13 +1450,13 @@ void update_IOT_info(struct adapter *padapter)
 		pmlmeinfo->turboMode_cts2self = 0;
 		pmlmeinfo->turboMode_rtsen = 1;
 		/* disable high power */
-		Switch_DM_Func(padapter, ((u32)(~DYNAMIC_BB_DYNAMIC_TXPWR)), false);
+		switch_dm_func(padapter, ((u32)(~DYNAMIC_BB_DYNAMIC_TXPWR)), false);
 		break;
 	case HT_IOT_PEER_REALTEK:
 		/* rtw_write16(padapter, 0x4cc, 0xffff); */
 		/* rtw_write16(padapter, 0x546, 0x01c0); */
 		/* disable high power */
-		Switch_DM_Func(padapter, ((u32)(~DYNAMIC_BB_DYNAMIC_TXPWR)), false);
+		switch_dm_func(padapter, ((u32)(~DYNAMIC_BB_DYNAMIC_TXPWR)), false);
 		break;
 	default:
 		pmlmeinfo->turboMode_cts2self = 0;
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
index cb23c6939bfc..2000b01b7d62 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
@@ -435,7 +435,7 @@ void update_basic_rate_table_soft_ap(u8 *bssrateset, u32 bssratelen);
 
 void Save_DM_Func_Flag(struct adapter *padapter);
 void Restore_DM_Func_Flag(struct adapter *padapter);
-void Switch_DM_Func(struct adapter *padapter, u32 mode, u8 enable);
+void switch_dm_func(struct adapter *padapter, u32 mode, u8 enable);
 
 void set_msr(struct adapter *padapter, u8 type);
 
-- 
2.34.1

