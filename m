Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA3EA945
	for <linux-staging@lists.linux.dev>; Sat, 24 Jan 2026 01:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769218449; cv=none; b=Clx2m9uEcRHwdehzMBSP0yoLTkpmCdbOkeRkLqV2j6xQh0pILDXQNiWdSirXiswWMmgAI1T2MT7Ydf9UmlXAnGgPXLnOYLp0UgncgcRFgfg7BY42eGWKetaehJDnT0cZk6H5Hi639m8RMSyWYUSDJvPtNe4M4sSKoXIopdtGMm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769218449; c=relaxed/simple;
	bh=bQJ36evgedru6WT/FepBJdDSydOEX+dhnpoO3hNpL+o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VwYw47sDKsEiTPjvDlRLM7T92jlbfiPQVqSJApLDJaVB1kz5IQ32O9VMJ1an2+ceZirSU38TlTJ/MX13sCxlDUI0xqnSHcfpmO0BZX+GKB49+6db42uJ5C93SZdRdyv2GpfgmHnLmDY0bm9NJaVHGqFsUlc6YjSS9tVGuhoN3Pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MwRJF8sV; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MwRJF8sV"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-78fc174ada4so23458407b3.2
        for <linux-staging@lists.linux.dev>; Fri, 23 Jan 2026 17:34:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769218445; x=1769823245; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ggel6NSoa1G8zxjT9eCQUybhk4/+llCEPdbxjaAhIYI=;
        b=MwRJF8sV12LV5hOL7qedmyKgZ54v1bySfzf2d6iFiH1Xy0tj498xwKhy7sTinuTtoj
         rXRJctYfhoshVt4qhTlpvXp60jLsg3InYiigUTTz6/jFrnzkGONERewy7iTRMzX/Nc54
         A9aK9m6YEzLef3OyWxwWVZ0jg63zdLv3eASnu/GNDnJszbHz3W4tnSbzis0JmnKJohzv
         Wz3eBvVa1wUI5/PsaE2IZ667X2le8BqhB0qqXPmsmuWvYrLkLFc+ynrkBKd6/uTjMloK
         6Itg2JX1y9OIDT/kYIkbRJSBpTBmCNjrffBF3fww9N5BRNR3fqceIOFTL+1S9bMCj0QB
         p72A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769218445; x=1769823245;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ggel6NSoa1G8zxjT9eCQUybhk4/+llCEPdbxjaAhIYI=;
        b=V3QWe7VjSnP8zjwwzbsr4cJjA9c7mKtKM8vkyE4hNLyZYIuRJSb0nEmgaZCyrZrXLr
         GBfRKmlvNpsx6bzgBCUHnoGi+Cx9oKkgHzlPtjo5y6gG/n+LaQXD1stZuzagk8DzTfLj
         nUChldPk98rJvsNtVj00yrxDs9Q0sYQz+gTblyjMP5HYnBAYLxPP55towxWM+SkYR4Lk
         RQ10pUBlLmHTLNNA+Ko5KUe7cNpTbGE+Yk9M9eJY+b5jRUda6uXBlaUvLnb++3iOu6k2
         e75LUX0IOohGhKmxzVmkAVCd3KDAVL1bv+pFEHjmyse95BV7ygs/r8bIIO9LjZZoHplx
         Q0vg==
X-Forwarded-Encrypted: i=1; AJvYcCWhO7odpTscc2i6KS9oHyGW5TkbOTkhJt/axJwsVih/5uyHFxcSX6rkwp2XtFhFjqpuTi0JB0Pa4JUflsHG@lists.linux.dev
X-Gm-Message-State: AOJu0YxBkBeeolXfkjSFV9IpyeJoUJ00h6vdYbMaIUrlv6IMwsVE+AEj
	xzppCZqnAA7aNWrpfinrBciaP48RNIOJWqls6IeZNpbzbnfA+qFbK9mfgADQsg==
X-Gm-Gg: AZuq6aL91dtiYJPM8vbCe6hoflhSYMy3IrMVtsz/OXBsuq/hqlPRrbwLj8Z3k+M8Uz5
	FaanYNVpc9jILFY/8R0SfaKEqzQnYMZEeKMNxnMJjST3nr4QZtwtLvqrPznUfRaOhIsERjl6WZJ
	uG7ndWA1WLuOQWDNsKZl7Kr94o0MxmC/q0qUzvc/w3yc5/zscCFc9WBzp+9ucLN7xMQvQLJecpd
	YvtsZYg5euZ+IQk96ZkXA2PJ2o8bdc1T5btGjfMBMR0PDwCCm7KpawR+xcEI6BKoJmmc2+80Dzc
	IdGT18zde+Nge2peTwEuzj0jj1XAxwXFPXMVF9BKgrLuXYKUlHjZtRy2U29GVvVzbcDSA7hVCLf
	IysurHBoXCuK8pM5yL8m2W4PT+UmpPf2NNkjSnaNHcjJ/v9ICiAekx+Vc1C9ZZR1e6Cg27Qtsy1
	Z62w==
X-Received: by 2002:a05:690c:82:b0:78f:b044:edab with SMTP id 00721157ae682-79439984e6amr39487837b3.32.1769218445496;
        Fri, 23 Jan 2026 17:34:05 -0800 (PST)
Received: from tux ([2601:7c0:c37c:4c00::89f2])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7943b2cddf3sm18791227b3.53.2026.01.23.17.34.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 17:34:05 -0800 (PST)
From: Ethan Tidmore <ethantidmore06@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ethan Tidmore <ethantidmore06@gmail.com>
Subject: [PATCH] staging: rtl8723bs: rename add_RATid to add_ratid
Date: Fri, 23 Jan 2026 19:33:50 -0600
Message-ID: <20260124013350.33769-1-ethantidmore06@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename add_RATid to add_ratid to align with kernel code style.

Signed-off-by: Ethan Tidmore <ethantidmore06@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ap.c    | 8 ++++----
 drivers/staging/rtl8723bs/hal/hal_intf.c   | 2 +-
 drivers/staging/rtl8723bs/include/rtw_ap.h | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index 3ff5daf1e5aa..477fe238add4 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -318,7 +318,7 @@ void expire_timeout_chk(struct adapter *padapter)
 	associated_clients_update(padapter, updated);
 }
 
-void add_RATid(struct adapter *padapter, struct sta_info *psta, u8 rssi_level)
+void add_ratid(struct adapter *padapter, struct sta_info *psta, u8 rssi_level)
 {
 	unsigned char sta_band = 0, short_gi_rate = false;
 	unsigned int tx_ra_bitmap = 0;
@@ -391,7 +391,7 @@ void update_bmc_sta(struct adapter *padapter)
 
 		memset((void *)&psta->sta_stats, 0, sizeof(struct stainfo_stats));
 
-		/* prepare for add_RATid */
+		/* prepare for add_ratid */
 		support_rate_num = rtw_get_rateset_len((u8 *)&pcur_network->supported_rates);
 		network_type = rtw_check_network_type((u8 *)&pcur_network->supported_rates,
 						      support_rate_num,
@@ -549,7 +549,7 @@ void update_sta_info_apmode(struct adapter *padapter, struct sta_info *psta)
 	memset((void *)&psta->sta_stats, 0, sizeof(struct stainfo_stats));
 
 	/* add ratid */
-	/* add_RATid(padapter, psta);//move to ap_sta_info_defer_update() */
+	/* add_ratid(padapter, psta); move to ap_sta_info_defer_update() */
 
 	spin_lock_bh(&psta->lock);
 	psta->state |= _FW_LINKED;
@@ -1947,7 +1947,7 @@ void ap_sta_info_defer_update(struct adapter *padapter, struct sta_info *psta)
 		pmlmeinfo->FW_sta_info[psta->mac_id].psta = psta;
 
 		/* add ratid */
-		add_RATid(padapter, psta, 0);/* DM_RATR_STA_INIT */
+		add_ratid(padapter, psta, 0);/* DM_RATR_STA_INIT */
 	}
 }
 
diff --git a/drivers/staging/rtl8723bs/hal/hal_intf.c b/drivers/staging/rtl8723bs/hal/hal_intf.c
index 462553d296ff..4ca950ff20ad 100644
--- a/drivers/staging/rtl8723bs/hal/hal_intf.c
+++ b/drivers/staging/rtl8723bs/hal/hal_intf.c
@@ -207,7 +207,7 @@ void rtw_hal_update_ra_mask(struct sta_info *psta, u8 rssi_level)
 	pmlmepriv = &(padapter->mlmepriv);
 
 	if (check_fwstate(pmlmepriv, WIFI_AP_STATE) == true)
-		add_RATid(padapter, psta, rssi_level);
+		add_ratid(padapter, psta, rssi_level);
 	else {
 		UpdateHalRAMask8723B(padapter, psta->mac_id, rssi_level);
 	}
diff --git a/drivers/staging/rtl8723bs/include/rtw_ap.h b/drivers/staging/rtl8723bs/include/rtw_ap.h
index 7a735e691399..83e835eb6513 100644
--- a/drivers/staging/rtl8723bs/include/rtw_ap.h
+++ b/drivers/staging/rtl8723bs/include/rtw_ap.h
@@ -11,7 +11,7 @@ void init_mlme_ap_info(struct adapter *padapter);
 void free_mlme_ap_info(struct adapter *padapter);
 /* void update_BCNTIM(struct adapter *padapter); */
 void update_beacon(struct adapter *padapter, u8 ie_id, u8 *oui, u8 tx);
-void add_RATid(struct adapter *padapter, struct sta_info *psta, u8 rssi_level);
+void add_ratid(struct adapter *padapter, struct sta_info *psta, u8 rssi_level);
 void expire_timeout_chk(struct adapter *padapter);
 void update_sta_info_apmode(struct adapter *padapter, struct sta_info *psta);
 void start_bss_network(struct adapter *padapter);
-- 
2.52.0

