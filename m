Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF9E293C67
	for <linux-staging@lists.linux.dev>; Wed, 30 Jul 2025 10:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753872315; cv=none; b=j+BRt5aQkvd8SLQpoWqZZNsBEPdFsXhZTTHTEZ4P9lMCn2GJvpa9VkW0KSMteOoWPFysEK7srQIK5mw3pemryhLtJHub84fxHX8E2Snu7GjxFDXbl885JHoKY7GL6H5E9H/enY+1AcXsSXrJRZkIbE0XNeZUoYfIuUA5rv1fNTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753872315; c=relaxed/simple;
	bh=fwh6BBb1oPpBjnAuFQhlbe/p9oFK7aX4uP4YTtMMkRc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J4u/5EieD0v2zgHZeh2C9nkqGtWdAxnMfIormqthXIIw0c1COUFog9sCUwDrI2wiyQPL3fFrhUCI0x48N655gKsOvJnZ3AIxap5GQTAq4MwNGsmLxS5resmI6HfdTOVSPc98q5svVva5PabrozNJvYUwVjrEsbFV5pgAtNGMyCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QhC5fCzO; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QhC5fCzO"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-61571192c3aso2278253a12.2
        for <linux-staging@lists.linux.dev>; Wed, 30 Jul 2025 03:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753872312; x=1754477112; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gD7P+A/dPPOpT95JlWf4RUNkIaG+iReLqz+c8wdRhiw=;
        b=QhC5fCzOY48gX1ACx2LoeAZUHezkrAMIcm92geqtIJaKItSQzUMv8gEjb2eBdZLk9Y
         bclRkRLGmUALABnG+We7OI3JInoP9KJAbnMhb08LcmtVh5gwTLBMjubA2Wd0P0hlplwL
         /yvR+s0iGb4ezsXYlkbY2yHstzElYOEl8e/dFtAFwaiguhcW/3QXRvqXI5o81QZxocBq
         h89JV1jER9ccwjvOBwsf3P2/7jk254+MZkKJkGhEUrjyzVsKY7bF5bXzPLCv7vlufgDb
         vztuOrnMBNXBjktNNsuazysG5QJ71sbv+X0nc861HACVMsQDXFVnq1vZarCFzTCbYPqg
         ZamA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753872312; x=1754477112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gD7P+A/dPPOpT95JlWf4RUNkIaG+iReLqz+c8wdRhiw=;
        b=mhgxf8ARZxzlHoKUFb9NMYeZgtSnqkaEHQvUn0PCwB48VTSOityadFZHSujhWbYYOD
         RYVe6nQlZvIchR6sKGe2YF/XmxVN9JjzLfXdaPVTTbYT0RSrIHKm9nq2Ln2wFVjgqfYM
         yXPSt258xcXhcktf6xhlElR2NxlZJTVciqkCFeTSCltmZBR4D3km2GHT9vB5x9QO/9sj
         /j06W7cTq13hC0VdDCXtdKFfYP9PlF+O4HE8F/eTIujiA4Hrieg99YBnCGWACkmwA0ba
         CZDpNfv6IGc6JN2fojnT3KGg2v7H/eGRB5ohn8gNjKK5A7wsKqDm2DLC0VDXhegU2wLx
         jCQA==
X-Forwarded-Encrypted: i=1; AJvYcCVAqBacY44QWzeL6ClGe+ZDi66SV2pMLJf+Y4Zw5rguEIibNPZS01ftLZ/xtpv8OldWKCw2j1IUjjrE+AKR@lists.linux.dev
X-Gm-Message-State: AOJu0Yxcz0P0RFpCAVocoeTBfPLGJDVpV3Cc6ym4LncNUgybJgruQLWk
	uaHEja4gMJRBsUhUbxA2hfcnUr7O9DltwiWGqsIg9RtLBIb5en4eWpau
X-Gm-Gg: ASbGncsDAExi0WTAdHaLlNmPSSZp4CIv59wZOq8YUv3s7CYOmNaOtD/HmTq8Bm0oQ0i
	O8IZ+ns646tP8Xb4wPDC63QMUJaNdJ95LYgb9tQ1Hs4tXXAW4lj+46nja7N8AgxJaRUDD6iovir
	pv8tbBtMwFpjcij0gUojU8/xLEEHTp6EvdIrsyGroW8T6IxXM+abn8Fj4n3PkpmcIqn7GY6y3Gj
	G9PNxKZ8YCUHwIqD1BKodkPb4sWPZidyy+owJFAUXSiYnj6/P7yVe/tnGM0+57PIzdcVHWA9XNm
	H+MzhdytbCyY1vziDR0bbUZ62Hilacdxs1Paj//acORm1FXk+sFZ0mLtuugk8aSS4THbiX2hTBU
	eZiCvDYOSP1LzhmB0wxWwyg1iFvbHCiLZJd2mlJcQJtt1w+TI88p8gmZy
X-Google-Smtp-Source: AGHT+IGpHLLmmk9Td6T7DijXaBzDDXhnBjG/5PT9Z+sbGUV25oV0DkzwZaprzzQBGuKKiMQcuzrwvw==
X-Received: by 2002:a05:6402:5108:b0:615:6481:d1c with SMTP id 4fb4d7f45d1cf-61586ec9a54mr2432690a12.1.1753872312170;
        Wed, 30 Jul 2025 03:45:12 -0700 (PDT)
Received: from tumbleweed (ip-77-25-32-208.web.vodafone.de. [77.25.32.208])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6157974fde0sm1582734a12.7.2025.07.30.03.45.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 03:45:11 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 6/8] staging: rtl8723bs: merge rtw_os_indicate_disconnect into rtw_indicate_disconnect
Date: Wed, 30 Jul 2025 12:44:59 +0200
Message-ID: <20250730104501.150270-7-straube.linux@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250730104501.150270-1-straube.linux@gmail.com>
References: <20250730104501.150270-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Merge the functionality of the function rtw_os_indicate_disconnect into the
function rtw_indicate_disconnect to reduce code in the os_dep directory.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c      | 12 ++++++++----
 drivers/staging/rtl8723bs/include/mlme_osdep.h |  1 -
 drivers/staging/rtl8723bs/os_dep/mlme_linux.c  | 12 ------------
 3 files changed, 8 insertions(+), 17 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 38238ea5ec99..27f775d8f9a8 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -930,10 +930,14 @@ void rtw_indicate_disconnect(struct adapter *padapter)
 	if (rtw_to_roam(padapter) > 0)
 		_clr_fwstate_(pmlmepriv, _FW_LINKED);
 
-	if (check_fwstate(&padapter->mlmepriv, _FW_LINKED)
-		|| (rtw_to_roam(padapter) <= 0)
-	) {
-		rtw_os_indicate_disconnect(padapter);
+	if (check_fwstate(&padapter->mlmepriv, _FW_LINKED) || rtw_to_roam(padapter) <= 0) {
+		/*  Do it first for tx broadcast pkt after disconnection issue! */
+		netif_carrier_off(padapter->pnetdev);
+
+		rtw_cfg80211_indicate_disconnect(padapter);
+
+		/* modify for CONFIG_IEEE80211W, none 11w also can use the same command */
+		rtw_reset_securitypriv_cmd(padapter);
 
 		/* set ips_deny_time to avoid enter IPS before LPS leave */
 		rtw_set_ips_deny(padapter, 3000);
diff --git a/drivers/staging/rtl8723bs/include/mlme_osdep.h b/drivers/staging/rtl8723bs/include/mlme_osdep.h
index 00c0a44c125a..8e8b5de285dc 100644
--- a/drivers/staging/rtl8723bs/include/mlme_osdep.h
+++ b/drivers/staging/rtl8723bs/include/mlme_osdep.h
@@ -8,7 +8,6 @@
 #define __MLME_OSDEP_H_
 
 
-extern void rtw_os_indicate_disconnect(struct adapter *adapter);
 extern void rtw_report_sec_ie(struct adapter *adapter, u8 authmode, u8 *sec_ie);
 
 void rtw_reset_securitypriv(struct adapter *adapter);
diff --git a/drivers/staging/rtl8723bs/os_dep/mlme_linux.c b/drivers/staging/rtl8723bs/os_dep/mlme_linux.c
index 326acbd8dc84..d2f4855e9d9d 100644
--- a/drivers/staging/rtl8723bs/os_dep/mlme_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/mlme_linux.c
@@ -66,18 +66,6 @@ void rtw_reset_securitypriv(struct adapter *adapter)
 	spin_unlock_bh(&adapter->security_key_mutex);
 }
 
-void rtw_os_indicate_disconnect(struct adapter *adapter)
-{
-	/* struct rt_pmkid_list   backupPMKIDList[ NUM_PMKID_CACHE ]; */
-
-	netif_carrier_off(adapter->pnetdev); /*  Do it first for tx broadcast pkt after disconnection issue! */
-
-	rtw_cfg80211_indicate_disconnect(adapter);
-
-	/* modify for CONFIG_IEEE80211W, none 11w also can use the same command */
-	rtw_reset_securitypriv_cmd(adapter);
-}
-
 void rtw_report_sec_ie(struct adapter *adapter, u8 authmode, u8 *sec_ie)
 {
 	uint	len;
-- 
2.50.1

