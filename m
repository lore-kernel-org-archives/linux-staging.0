Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CCB941F5CB
	for <linux-staging@lists.linux.dev>; Fri, 17 Jul 2026 14:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784296847; cv=none; b=LZI4G4DENFSl95vU3tejjY+Q0ukljxnC3xi4K2EVkz9/rMGfMo6/Dc/+/8cM0wsAQsnN6g7Ri3jg6x7XyKcc8SUFlOqeVmnPYTDUMixdSdU1xtqaW13gKic+ro6GnWp88n2Y0CC6zEW7UNEhtFQW2Wnn1mqQ4EeFtf3MugZQc8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784296847; c=relaxed/simple;
	bh=7/Rk+vM5Qs7exWIRyvaiiv6TBmZWHCJJyz7HZuRVCz4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UxjxXOixEujCIPODd/vFArz77+743QW7DqTayluGMAgYHGdHN6J6cLBrLvVWTYWwyDX/CZ7EgMw7r6SDWO8DeNAa8itrKuT3xUX6toAUvAaWvkrf8TCDHyCnUn/Gh+d+dhc+xoglzlReYJjONZMP6KVN8KgK9ytk5CHJUGm+qwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N2O7lTiQ; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N2O7lTiQ"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-38dc4553f62so6289724a91.0
        for <linux-staging@lists.linux.dev>; Fri, 17 Jul 2026 07:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784296843; x=1784901643; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sERW7m0hXF74fq7WqPw8YIV8y1X1DG4C9sUANrXDA0Q=;
        b=N2O7lTiQoCAVMeCT9JqXZJvYZpFV8vi+lWmnsZtN4t1GIANcYszDZsVZZF7FPJjc4e
         Sqku/1pAOWmh30HX5e+SSjc/3jVzvwOZNu04mucw3A8vrA21Dz8d1x5m2x2HuwrtZ7WM
         mYesZk6eWsi3Eyid8xuAFbRNE1Ce/DjG2OPGseR8l78FCrwfU66TQAGLx2XbOaPbDwro
         0TTIfqvVhTm3r4HgaOTyOrH6wzOedLs/RBOGo0p/XXADDt46JCw33DQiuvXxqVK7mAqe
         lqrvT+ZMNo1lG1COxpz50fhw+FropvI1RextN0Yod4/zlIUfuSZ13b9ucuNIhoS+FmFG
         NvYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784296843; x=1784901643;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sERW7m0hXF74fq7WqPw8YIV8y1X1DG4C9sUANrXDA0Q=;
        b=LIl/SksSC5rEm9ne+4ktcwvZnqdN0U/mkYOMxNq7/leq4yPQiPdvocelFfzdpd05Ns
         vghol6YadJE3y0g/KzniwirxE+n+4MeKXirjBujftl0YGb1WTCjsk6/4ugRqtLplANOs
         41HmxGYglKT6LFXENxp2tj9ULZ59zQQBeXkYkWtVxd2MGgVo94NLvaNqNpwTTiZ71aQa
         f7yKPkAHAiugqgdh+IVCPLvr51zCPh2D4maaXpCrMZxB2ydSfUcpsA1T12dNTbWVbA3S
         jBZHFQpx7s6VndAtuW27vZoVG0yshE2yPq/FIzoj+vLeQIWi13bn7bceV9FTSwPUfpsC
         Mp/A==
X-Gm-Message-State: AOJu0YxGnlAuTOARtOIm+LfTKJ9qbn/vP+DFsyvBmgidAwBclMb3zwWf
	/O28BAE7FgdxLNpUatUrCLe0SS1LYt4cJ9xCx4nrg/Gab7fzyjVYlb03CtfgY4UmPQBd0Q==
X-Gm-Gg: AfdE7cmTSHGEjPeRHE5XfCjofxhgE1R/Aew8gU2DdCL5DfjNv+dXAQGEdjm1Kh/AH5W
	vC1YiMiEa6Barb0hz9wQgGY6t8p5RO9XTlYXjotK4KxRRZk6RaLUguNaSwEUCm+GZupmubFIG3c
	lwjbAM2raeE58lTRsNFL/Z/ZeFrNZxqI/r1SWrwH/raC0yzZA8ZJ/+Y6/lmLqCW25bUtaNc3psK
	OuwOdesGpr/hcbIADU2hOu0JVRjwvctgkNCicdQqfuUbMBnG5LfrXnVOMxUEUhz+D8mvI1iT4Qu
	IDDW4GhDtWh/2ofzFAhJQLpFzFRySCHnTxaADX5hTWnsZeMlD8lrtS01nev9ohnweeuudL0ZfOI
	V8iIIQDDs3aMuy1ryx/cVEfN3zCpNGjsYwsPr1a/nVazHpjRwT1BjGtyroDvkNg3YTsIoLq7IFx
	PpRw==
X-Received: by 2002:a17:90b:3bcd:b0:387:e0cb:c8e1 with SMTP id 98e67ed59e1d1-38e4b594dadmr2694700a91.42.1784296843278;
        Fri, 17 Jul 2026 07:00:43 -0700 (PDT)
Received: from kerneldev ([152.59.151.166])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a20cfe3sm8177746eec.30.2026.07.17.07.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 07:00:42 -0700 (PDT)
From: Anirban Bose <boses156@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Anirban Bose <boses156@gmail.com>
Subject: [PATCH] staging: rtl8723bs: rename Update_RA_Entry to update_ra_entry
Date: Fri, 17 Jul 2026 19:30:06 +0530
Message-ID: <20260717140006.2443-1-boses156@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I changed the Update_RA_Entry() function to update_ra_entry()
to fix the camelcase warning by checkpatch, I updated every
instance it was present and I have checked it successfully
building the driver with the changes I have done.

Signed-off-by: Anirban Bose <boses156@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ap.c          | 2 +-
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c    | 2 +-
 drivers/staging/rtl8723bs/core/rtw_wlan_util.c   | 4 ++--
 drivers/staging/rtl8723bs/include/rtw_mlme_ext.h | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index 5731a245c0d9..470be57e651f 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -1833,7 +1833,7 @@ void rtw_ap_restore_network(struct adapter *padapter)
 
 		if (psta->state & _FW_LINKED) {
 			rtw_sta_media_status_rpt(padapter, psta, 1);
-			Update_RA_Entry(padapter, psta);
+			update_ra_entry(padapter, psta);
 			/* pairwise key */
 			/* per sta pairwise key and settings */
 			if ((psecuritypriv->dot11_privacy_algrthm == _TKIP_) ||
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index f5ab94a2d0a0..1e6d995a9ff5 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -4812,7 +4812,7 @@ void mlmeext_sta_add_event_callback(struct adapter *padapter, struct sta_info *p
 	psta->raid = networktype_to_raid_ex(padapter, psta);
 
 	/* rate radaptive */
-	Update_RA_Entry(padapter, psta);
+	update_ra_entry(padapter, psta);
 }
 
 void mlmeext_sta_del_event_callback(struct adapter *padapter)
diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
index 8b0502a1881b..e28602d45936 100644
--- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
+++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
@@ -1372,7 +1372,7 @@ unsigned char get_highest_rate_idx(u32 mask)
 	return rate_idx;
 }
 
-void Update_RA_Entry(struct adapter *padapter, struct sta_info *psta)
+void update_ra_entry(struct adapter *padapter, struct sta_info *psta)
 {
 	rtw_hal_update_ra_mask(psta, 0);
 }
@@ -1380,7 +1380,7 @@ void Update_RA_Entry(struct adapter *padapter, struct sta_info *psta)
 void set_sta_rate(struct adapter *padapter, struct sta_info *psta)
 {
 	/* rate adaptive */
-	Update_RA_Entry(padapter, psta);
+	update_ra_entry(padapter, psta);
 }
 
 static u32 get_realtek_assoc_AP_vender(struct ndis_80211_var_ie *pIE)
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
index 0c2bd51b6bc2..19565f119575 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
@@ -503,7 +503,7 @@ int update_sta_support_rate(struct adapter *padapter, u8 *pvar_ie, uint var_ie_l
 
 /* for sta/adhoc mode */
 void update_sta_info(struct adapter *padapter, struct sta_info *psta);
-void Update_RA_Entry(struct adapter *padapter, struct sta_info *psta);
+void update_ra_entry(struct adapter *padapter, struct sta_info *psta);
 void set_sta_rate(struct adapter *padapter, struct sta_info *psta);
 
 unsigned int receive_disconnect(struct adapter *padapter, unsigned char *MacAddr, unsigned short reason);
-- 
2.55.0

