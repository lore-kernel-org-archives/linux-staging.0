Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C526B47B42C
	for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 12:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784119848; cv=none; b=EIGymhttE2vHNuW1rygOiUxvy0/C9HMoGQKd0xKY9kCOhMl03YR0Z14IyebbbulkKmCwq3IxjTbRvV2PY3uajy8aYEnTzykOt/FQ4bFSJjIgb2NoiMYmBzENERRecboVBzR6kokOCpk2c21fNQ2I1je5X8xK1sNBzqYL2SQanio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784119848; c=relaxed/simple;
	bh=hwgrA2AsXgals+JVfVdyV9WiAbtcA87ZujfW2BPVomM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FiC5+oM8167HAeCyNHdOAkQNs6sWqPct4vDPwPF2IZ8An94aVUduVKk/zpz5DF7RVcw9iy66t67RM8lN6SRQJck+hybg56ewQOuv6HDtsheEs8QpgtC6icffWVUXaJDITSDC0330wnTX1T+NSv8NjKQJwoerjz4ECGOyk4v1BYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=igvVj3Ow; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="igvVj3Ow"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5b0115b9e17so2102337e87.0
        for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 05:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784119839; x=1784724639; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KC4r10Nh+xEolU1TENafjOqAEh3dTzK3TpQE6nAo7gQ=;
        b=igvVj3OwAAFsL/lIouAkNPiOY+cMfHNOyiwAwFvS4HjECu4fn3Mu2qGsYrKRBGEPXn
         w5EiYzl3oUw3I4x7WsOCTSzF5QZ55++/TVDa9pCPqeDRZ649Zw14DR/FBy2X9Btd+azz
         PlvCYDsYQgz2D50v3s/QuEEtrDVHJzYQsIGbPsadQ8DTE2ZsE0kLiekMfWd0udT7Nh2H
         YVc6hq/OUfF77+jGeGO1FQGUFZl19eya/31PPE1DBDAkVLtzzyt1zyfBFi5yI7bQ9VfV
         9v+XGn1BGGXT6PKckdtDu2lKuV9ifM/h6Y0SsnkCax5JIbw7EcOGv8odeBa0QP1QgWjF
         yqqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784119839; x=1784724639;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KC4r10Nh+xEolU1TENafjOqAEh3dTzK3TpQE6nAo7gQ=;
        b=CrQyGvTEDYMGZKWYcz9/A/wgS4cNA4NL1L6t0o7m/MJZtTlvGpvhCJv+2yKtom+Gca
         o4dntTOu0ffz5k+qwBVi4SCFEccjdq0XBdH+6IXVCAqVuGAg/9E6h6pnLSevQXlU91eM
         uzPwDlkgdVKM7daS6boITuE8VWaXpo8FyrAa4njxFC8r8TU+Aa0AdLFmkfUJM+e/UnZv
         8600FaLS7bF67Dj1oQCeNV7nUiUO9NRxEPldl1aZnv2mR/qUlCYDELH33+3i7sbN8htP
         XZ5Y3Tec3qqPx36qY4JdbGIf/btjw2TmHOCzQ/9IFgs3blVhIExLqDCpD7Gye7v7XRWR
         G+Fw==
X-Gm-Message-State: AOJu0YxWjyBHXwUBvV7p4hI1bv/DPzmsqRNSoUZnk1uyEbrWO7Y2R4r4
	jy5+SbTf+F9nfoR3PoghPfyfn2q3PxnRSVTfbFwXa/CN+HQMh6bc1A/YUvBIH4kEVmk=
X-Gm-Gg: AfdE7cnBXJmioRfHeYpRaRqAFGqRP1TMj0mZCCkeehiE/vJyemc/YXwDh1wIeKWhXMD
	8WefB3JQBqilcG5XNCrDWg1Hxa997ver6yB6jM+lYh2bZVqPf2VKhJl7mC5RKslAggyV0ue2KSg
	Zmux814Bl1IIKic8KsblQx2OSkuaoXg1e5vzJ3NX7tvB/3b7doMxSBm2AERLD9HHlVbzUqF0rXr
	QTCBp3SbDOiEfnuVO2mRbWpVBC9SiVBw1Bk9agdOgCJNhrNbKftY2+GxT9ps4w4zA+o9j6wF2aK
	GCftt0FqQ4a/16tQj4vJxIgBNdfEFSPWGK8h+yD32Z8DirPwgLBz2tZa424R5x8EstJMZO4Tost
	f9shJNx8SNyiTxCJwzBmI7mEPH87jajUkqrQZvR3HdHJF8R/HA5voNJP4BWIDZtdkWVheuDWvtz
	mhQsqBn5ywKoHS/zAYjYIQ/a7uplma/tGKazPfWRrODq8rIZu0PMNVivCt4MC9pl4qPhjfzVjp1
	pCVI3lfC97Rog==
X-Received: by 2002:ac2:51d5:0:b0:5b0:f9cb:2979 with SMTP id 2adb3069b0e04-5b0f9cb2d0dmr3585727e87.15.1784119838470;
        Wed, 15 Jul 2026 05:50:38 -0700 (PDT)
Received: from archlinux ([94.180.44.28])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b022fac999sm3404042e87.55.2026.07.15.05.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 05:50:38 -0700 (PDT)
From: Arsenii Pashchenko <ulijg308@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	ulijg308@gmail.com
Subject: [PATCH 29/61] staging: rtl8723bs: collapse set_sta_rate and Update_RA_Entry wrappers
Date: Wed, 15 Jul 2026 19:47:57 +0700
Message-ID: <20260715124829.90290-30-ulijg308@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260715124829.90290-1-ulijg308@gmail.com>
References: <20260715124829.90290-1-ulijg308@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the multi-layered redundant wrappers set_sta_rate() and
Update_RA_Entry() from rtw_wlan_util.c.

These helpers provided no extra logic or validation, serving merely
as unnecessary abstraction layers that ultimately passed execution down
to rtw_hal_update_ra_mask(psta, 0). Eliminating this nested wrapper
chain simplifies the driver's rate adaptation interface and reduces
call overhead.

Clean up both function definitions, remove their prototypes from the
header file, and update all external call sites to invoke the
underlying rtw_hal_update_ra_mask() function directly.

Signed-off-by: Arsenii Pashchenko <ulijg308@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ap.c          | 2 +-
 drivers/staging/rtl8723bs/core/rtw_cmd.c         | 2 +-
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c    | 4 ++--
 drivers/staging/rtl8723bs/core/rtw_wlan_util.c   | 9 ---------
 drivers/staging/rtl8723bs/include/rtw_mlme_ext.h | 2 --
 5 files changed, 4 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index c8f0beec0..9ecf75ef4 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -1926,7 +1926,7 @@ void rtw_ap_restore_network(struct adapter *padapter)
 
 		if (psta->state & _FW_LINKED) {
 			rtw_sta_media_status_rpt(padapter, psta, 1);
-			Update_RA_Entry(padapter, psta);
+			rtw_hal_update_ra_mask(psta, 0);
 			/* pairwise key */
 			/* per sta pairwise key and settings */
 			if ((psecuritypriv->dot11PrivacyAlgrthm == _TKIP_) ||
diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index bc2536c1b..c8bdd0f3c 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -1413,7 +1413,7 @@ static void rtw_lps_change_dtim_hdl(struct adapter *padapter, u8 dtim)
 static void rtw_dm_ra_mask_hdl(struct adapter *padapter, struct sta_info *psta)
 {
 	if (psta)
-		set_sta_rate(padapter, psta);
+		rtw_hal_update_ra_mask(psta, 0);
 }
 
 u8 rtw_dm_ra_mask_wk_cmd(struct adapter *padapter, u8 *psta)
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 0c5770f09..d472570db 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -4674,7 +4674,7 @@ void mlmeext_joinbss_event_callback(struct adapter *padapter, int join_res)
 		psta->wireless_mode = pmlmeext->cur_wireless_mode;
 
 		/* set per sta rate after updating HT cap. */
-		set_sta_rate(padapter, psta);
+		rtw_hal_update_ra_mask(psta, 0);
 
 		rtw_sta_media_status_rpt(padapter, psta, 1);
 
@@ -4747,7 +4747,7 @@ void mlmeext_sta_add_event_callback(struct adapter *padapter, struct sta_info *p
 	psta->raid = networktype_to_raid_ex(padapter, psta);
 
 	/* rate radaptive */
-	Update_RA_Entry(padapter, psta);
+	rtw_hal_update_ra_mask(psta, 0);
 }
 
 void mlmeext_sta_del_event_callback(struct adapter *padapter)
diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
index c85055687..dc2e341aa 100644
--- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
+++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
@@ -1342,16 +1342,7 @@ unsigned char get_highest_rate_idx(u32 mask)
 	return rate_idx;
 }
 
-void Update_RA_Entry(struct adapter *padapter, struct sta_info *psta)
-{
-	rtw_hal_update_ra_mask(psta, 0);
-}
 
-void set_sta_rate(struct adapter *padapter, struct sta_info *psta)
-{
-	/* rate adaptive */
-	Update_RA_Entry(padapter, psta);
-}
 
 static u32 get_realtek_assoc_AP_vender(struct ndis_80211_var_ie *pIE)
 {
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
index 2b8df2bdb..6b1ac26b3 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
@@ -498,8 +498,6 @@ int update_sta_support_rate(struct adapter *padapter, u8 *pvar_ie, uint var_ie_l
 
 /* for sta/adhoc mode */
 void update_sta_info(struct adapter *padapter, struct sta_info *psta);
-void Update_RA_Entry(struct adapter *padapter, struct sta_info *psta);
-void set_sta_rate(struct adapter *padapter, struct sta_info *psta);
 
 unsigned int receive_disconnect(struct adapter *padapter, unsigned char *MacAddr, unsigned short reason);
 
-- 
2.55.0

