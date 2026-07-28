Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB013B5843
	for <linux-staging@lists.linux.dev>; Tue, 28 Jul 2026 12:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785242211; cv=none; b=CZbTq3Dp7d0tv2ipgmes89RK/Q+mG48BNqK6IIEzYbpwUci94WDFL9v7iUbPIbpMqgqIK8kETObaOzDI96ay3TkfKRKgt0Cp9r+TLT8JC2ituM5lhoLPgr5Ax+fpnfdyt1+U//mlcx9+wgcrnJk1c1mGNvEtPNKPqWuofy7ZloE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785242211; c=relaxed/simple;
	bh=53GV909lHTQVdBtsimBKPyfWCtyDdWnszabAiyel7Pg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=j63S05lRWH0L+Wdog0aBPXb40HV09pMSNEU57Boih54GavcYE8ubIo9ji/iKi9f6+QBg9sEfLoLFBEsxqsshPx4np9HadCEL9eSl78CGG3xIBBWLqdm6enb2fPMQL6pQdC8w7S8yD5+6Sc0a9hkJwvlCmIHbbHCKvvbKbg48jpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DnUSO02J; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DnUSO02J"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-47f92e3c14bso3418332f8f.0
        for <linux-staging@lists.linux.dev>; Tue, 28 Jul 2026 05:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785242206; x=1785847006; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5sdTJlc14s9X93JFxjOt23eWoVw4KASn+ZmMVdFs+Pk=;
        b=DnUSO02JsQaaQrQyHJ8f9OSg4+J6tRycYfsbzEy1fuqmYDlKs3OqRsyrgf0olFS1R6
         M/FB+Uf8UptgJ1l8jwFXz6FmcFi6dgyuN/sG0/sqylh3VMnTq5kSfAH4nTl2cCYmx0zW
         HryL14dmQkO50gQnfi09vbZCH4XAGoEm0tipnI3FGNY5KtuNmTALGA6Ns1AuNUSz5CTf
         nu2GABd3ZWy3+C1SD327XutAZXuQbX5wBebcbvUHL4A0BG+fCp6afCsiAgH4vQ+rVKVo
         Zef1S9NweSGPGjTkOMD6Z0nQ1sHKeemq1/9oZtnKmHBHWMxZwL5rjpQyDS7/VkXci+iX
         MaXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785242206; x=1785847006;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5sdTJlc14s9X93JFxjOt23eWoVw4KASn+ZmMVdFs+Pk=;
        b=lJGgWRZ3Fn5AyHSzLItHGT3nO+oh9X/CbW1qU+UscagMwtaOUaFkoA/pF1iNB9n3/h
         KxykJoDc1sbCW7ktmtuOw3OvCMLCSue+PObv6hW01yxTZrWyzYe/mtKpHL6/1jimz9tr
         R2+EqwvjRzzIcAogXDIk4wDSgSgcTYICWK1LmGUlHh3M5PFSTQdAqC39/64m1maSUOcD
         vnPu/NWCmFRdp1zH6XA76r6qsZAXkQMiGA8j1S7pTrQtHJ07tftsJHa90wRVPypg/cSL
         cRCrAPlatDmPvVkL70+Arx485Ja2KGgCnFjYO2YB/if8AhkJfwdaiOnY2pirYdohAEEP
         ox4w==
X-Gm-Message-State: AOJu0YwD0h+jgZzRRbyWH4Qs84Ysfjybb5YuZHoqY0waji3PIuZqkwi1
	NXss+A3goRVX4J6H7r8tI+KgWE4yxFqCR7xA+RpN2j4hnPW6a09BYQLt
X-Gm-Gg: AR+sD10aJExgeMuPudxXT5G8zSFeiCVf4F7qxNX4/VH6zPp7kvJQsdrZefH2t5hOcch
	j4fJS60cERoYVe/ZyP5SXF552p417HJ+ilNZPv64dQe/4KJNw3aJlz2mAe0ySAMUir4v8j6CgZ9
	ZfXCj0gh2+HlsQJks5sgW/InE+D0guitPwOQvvL33p6ucHBNt8dIMCGtTuSrQ5HKerPPnbC/3ur
	xYrQnoIANRe1ABXvyMYWlW44Ny12RPVLbAnon+CeEyT+7cQ+Y0ZyLvqff1RwpebqWkxM8trFIz7
	ErSGn0dxqPERycatwQavx5CiW1XqhYNtLNf44FFf0I5HYCZUahp2d7PkuE9H3QkK6ev6C/jb194
	dWtRBEcmQ7RtzDWQv4P3tDPpAYrYdSCFxfHqZLJMppncqnYWxOOEyCnxFTqCtwaONdcapMIkU8X
	11c2oWYoP2pfE+1vh1Pcus3xxbT97L44FhGiYHT8SHejTR8kYmgL+SK4eSNAgzHw9PYuqYKrVD2
	fh7vjIa
X-Received: by 2002:a5d:5f48:0:b0:47f:6983:c0fd with SMTP id ffacd0b85a97d-47fb1eabac0mr2593090f8f.48.1785242205597;
        Tue, 28 Jul 2026 05:36:45 -0700 (PDT)
Received: from XPS-15-9560 (80-15-70-17.ftth.fr.orangecustomers.net. [80.15.70.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f939c1465sm43035412f8f.26.2026.07.28.05.36.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 05:36:44 -0700 (PDT)
From: Olivier Tanoh <olivier.tanoh19@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Olivier Tanoh <olivier.tanoh19@gmail.com>
Subject: [PATCH v2 2/3] staging: rtl8723bs: rename Save_DM_Func_Flag  functions to avoid CamelCase
Date: Tue, 28 Jul 2026 14:36:32 +0200
Message-Id: <20260728123633.79735-3-olivier.tanoh19@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260728123633.79735-1-olivier.tanoh19@gmail.com>
References: <2026072851-foil-womanly-4837@gregkh>
 <20260728123633.79735-1-olivier.tanoh19@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename Save_DM_Func_Flag and Restore_DM_Func_Flag to snake_case
format to comply with the Linux kernel coding style.

Signed-off-by: Olivier Tanoh <olivier.tanoh19@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c    | 4 ++--
 drivers/staging/rtl8723bs/core/rtw_wlan_util.c   | 2 +-
 drivers/staging/rtl8723bs/include/rtw_mlme_ext.h | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index f5ab94a2d0a0..ff5e5fae3ef2 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -5144,7 +5144,7 @@ u8 createbss_hdl(struct adapter *padapter, u8 *pbuf)
 		pmlmeinfo->candidate_tid_bitmap = 0;
 
 		/* disable dynamic functions, such as high power, DIG */
-		Save_DM_Func_Flag(padapter);
+		save_dm_func_flag(padapter);
 		switch_dm_func(padapter, DYNAMIC_FUNC_DISABLE, false);
 
 		/* config the initial gain under linking, need to write the BB registers */
@@ -5452,7 +5452,7 @@ u8 sitesurvey_cmd_hdl(struct adapter *padapter, u8 *pbuf)
 	if ((pmlmeext->sitesurvey_res.state == SCAN_START) ||
 	    (pmlmeext->sitesurvey_res.state == SCAN_TXNULL)) {
 		/* disable dynamic functions, such as high power, DIG */
-		Save_DM_Func_Flag(padapter);
+		save_dm_func_flag(padapter);
 		switch_dm_func(padapter, DYNAMIC_FUNC_DISABLE, false);
 
 		/* config the initial gain under scanning, need to write the BB
diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
index 627d778fb093..c5d1bc77bfa0 100644
--- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
+++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
@@ -220,7 +220,7 @@ void update_basic_rate_table_soft_ap(u8 *bssrateset, u32 bssratelen)
 	}
 }
 
-void Save_DM_Func_Flag(struct adapter *padapter)
+void save_dm_func_flag(struct adapter *padapter)
 {
 	u8 bSaveFlag = true;
 
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
index ed6c5001c68a..2cd10810f9e9 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
@@ -433,7 +433,7 @@ void set_mcs_rate_by_mask(u8 *mcs_set, u32 mask);
 void update_basic_rate_table(struct adapter *padapter, u8 *basic_rates);
 void update_basic_rate_table_soft_ap(u8 *bssrateset, u32 bssratelen);
 
-void Save_DM_Func_Flag(struct adapter *padapter);
+void save_dm_func_flag(struct adapter *padapter);
 void Restore_DM_Func_Flag(struct adapter *padapter);
 void switch_dm_func(struct adapter *padapter, u32 mode, u8 enable);
 
-- 
2.34.1

