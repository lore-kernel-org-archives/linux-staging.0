Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD500481A9E
	for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 12:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784119849; cv=none; b=ZCttL3jH0p6IrU1KayBFP1rBKk2zGdcsSjfp2VqsX9T7veDfZ4TR38U5mUHMwiiE1Lm0X31ZX5Z8Stw7MR394I+HuiH+FgQ608xALnFM0jcXZFM1a0ZQKhZpvSgsFzudqCbl21H4qkE9FlabJ02XFEyDSb38oeYUd3JtIpdTarQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784119849; c=relaxed/simple;
	bh=suOcD4GnIG9Q0dfuzXo3cVA5IEVfC1ihCZKLRHWMTSE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IbvFjVusG02p3T8FvitVLhgeAg8U/r5qVG+6tgFY3EPpsW/rqBYdortKZMnC5uUsEp1nHDgXCBW8t8V7IzUuF4O/ALunwRisFte3yc70RYCymgNhf4NeELZP0hhDX6lVMmA7T4/+kqqf2NYPAqXH57EZAYedPKZRZpZUdnt8GSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HbuPQUHx; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HbuPQUHx"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-39669bcaadfso21143371fa.0
        for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 05:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784119842; x=1784724642; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BEJdGz0celAuM4TSZcnzhC7Z/1ogmlDViKhkaxHG3VM=;
        b=HbuPQUHxB/PQyXi/FxU79+BCWc5pYSK4UtKbgnnFEvJjYaL+RSlMehJVDXi0dyoh+l
         0yjVsfsxOi0+HWKAaZ1Aq3+n217mzK8VSixsn0uUEUIOGu9KeV7CCSHN6HAXeYoE4kS7
         TFveELKEWkKxp2zwyYV0lQnpC/zNEttpQcylYN3ppAyEErqdM54uBig3WnnqNWWWUnID
         LuR2ad9wQxNiy500BCI77kw1RpggXDfTBtlTTdaCXbGEzI5n8DZUyx21msy/JsDefqLY
         dI210FhPgbfwJcs+9cSy9Me0kDcbfFpGs/Nk9JgGICTwFcpGO9mTgx1FRQoVb0ISn0lC
         /tiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784119842; x=1784724642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BEJdGz0celAuM4TSZcnzhC7Z/1ogmlDViKhkaxHG3VM=;
        b=eKq0gRyCKBuzhwH0X72f8KhguRzQKqxVtHLSUpEAnZZCe6tvDyB7ixS3t2gYgGrfH7
         Qu0aviLTNUDnfIfxHfOHU1CPHuJyS+422Y92zmJ/DgE6G7gXzfK3iG64bPf1dVwEWPJf
         p6u6SmYXJbyDBSNEK6anESWnPpQRr5AZuDiVJuPWhVrJcCBjC2ml/LfUp9oknPFBu03m
         EQzf3DAPqhh8Bs8gN8aT4I/ts0wYKoWC2/zf0lgRf/dznl0McwEMGHf73RZc1MTJYnUY
         LlLzHo4rNDeAL9XeHaGIqa90ekcpKvB5lig9QjBn9XIGibNoa7wlBgxNPnvUkug/Hq5A
         8w0g==
X-Gm-Message-State: AOJu0YzIA+oqTKo/zU08AJvz8hE7IJ8nip969Sw11E7XgAvu6qi6YCaw
	FlV6oOqdb0d72cNXlJfrb+5m4EBd41Zx9dPc//Ijq6Z00lYlEAbtQEFL
X-Gm-Gg: AfdE7ckR159dJoWxnsXW7nb5KFa26aBts57ztCQVpb87UTdufbjSWhCtDtsiIL2ufX8
	gH6dRZKrPup2LOQZH6JIbRtbt0guUfQsJQ29xKJYSlg1Jh4Jhodui9YuqpxuyPwLwYefC1CdPGX
	J9Mp1izjAsBS0/qQ4GZujId3TQKrl75MKDqAEkFF6oMz1vDA/oEFY0dkYDP03jDIMqnbAYxScIK
	DQ5tu9JP7FXvQFQDGVFwq4g/jzJothI7zVs3UiVDKwOS1a8HNgn6LByzUnEPzNABf9/cHXI3TsM
	svmyCO3OSp3k6q2AUeOy0MqOkJngAdOUxvnJvY5YHtt5a/QhWg+eb2ivGtqkwacEk9rG5q6U7AI
	Wfvo0SGoZy5iQJKZc/+NgolErcKEfoOYFemjkISgypGy/cdTR6s8hSWb4Ay1SUYcGpjuFG9fUHI
	/wMUxgzfrd7tZcUEbnBIZDFiW+xXHg9PXvYeOvO+vzdhTlMRuvCmVpiRqVB5IrF2t7KFeZksmlG
	Z9LNwawUYhyuQ==
X-Received: by 2002:a05:6512:2509:b0:5b0:1ace:3bd8 with SMTP id 2adb3069b0e04-5b023668e92mr4105578e87.22.1784119842362;
        Wed, 15 Jul 2026 05:50:42 -0700 (PDT)
Received: from archlinux ([94.180.44.28])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b022fac999sm3404042e87.55.2026.07.15.05.50.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 05:50:42 -0700 (PDT)
From: Arsenii Pashchenko <ulijg308@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	ulijg308@gmail.com
Subject: [PATCH 34/61] staging: rtl8723bs: replace rtw_get_beacon_interval_from_ie with define
Date: Wed, 15 Jul 2026 19:48:02 +0700
Message-ID: <20260715124829.90290-35-ulijg308@gmail.com>
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

Remove the redundant rtw_get_beacon_interval_from_ie() helper function
and introduce a macro definition for the beacon interval offset.

The original function performed a trivial pointer addition (ie + 8).
Replacing it with a descriptive macro eliminates a useless function call
layer while keeping the code self-documenting and free of magic numbers.

Define RTW_BEACON_INTERVAL_IE_OFFSET in the header, clean up the function
definition, and update all call sites to use direct pointer arithmetic.

Signed-off-by: Arsenii Pashchenko <ulijg308@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ap.c        | 2 +-
 drivers/staging/rtl8723bs/core/rtw_mlme.c      | 4 ----
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c  | 8 ++++----
 drivers/staging/rtl8723bs/core/rtw_wlan_util.c | 2 +-
 drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c   | 2 +-
 drivers/staging/rtl8723bs/include/rtw_mlme.h   | 5 ++++-
 6 files changed, 11 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index 9ecf75ef4..ba45dd49c 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -791,7 +791,7 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 
 	/* beacon interval */
 	/* ie + 8;	8: TimeStamp, 2: Beacon Interval 2:Capability */
-	p = rtw_get_beacon_interval_from_ie(ie);
+	p = ie+RTW_BEACON_INTERVAL_IE_OFFSET;
 	pbss_network->configuration.beacon_period = get_unaligned_le16(p);
 
 	/* capability */
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 73b20a78d..0ec599383 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -297,10 +297,6 @@ u16 rtw_get_capability(struct wlan_bssid_ex *bss)
 	return le16_to_cpu(val);
 }
 
-u8 *rtw_get_beacon_interval_from_ie(u8 *ie)
-{
-	return ie + 8;
-}
 
 void rtw_free_network_nolock(struct adapter *padapter, struct wlan_network *pnetwork)
 {
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 9dfa31171..25dfb20f3 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -2113,7 +2113,7 @@ void issue_beacon(struct adapter *padapter, int timeout_ms)
 
 	/*  beacon interval: 2 bytes */
 
-	memcpy(pframe, (unsigned char *)(rtw_get_beacon_interval_from_ie(cur_network->ies)), 2);
+	memcpy(pframe, (unsigned char *)(cur_network->ies+RTW_BEACON_INTERVAL_IE_OFFSET), 2);
 
 	pframe += 2;
 	pattrib->pktlen += 2;
@@ -2309,14 +2309,14 @@ void issue_probersp(struct adapter *padapter, unsigned char *da, u8 is_valid_p2p
 
 		/*  beacon interval: 2 bytes */
 
-		memcpy(pframe, (unsigned char *)(rtw_get_beacon_interval_from_ie(cur_network->ies)), 2);
+		memcpy(pframe, (u8 *)(cur_network->ies+RTW_BEACON_INTERVAL_IE_OFFSET), 2);
 
 		pframe += 2;
 		pattrib->pktlen += 2;
 
 		/*  capability info: 2 bytes */
 
-		memcpy(pframe, (unsigned char *)(rtw_get_capability_from_ie(cur_network->ies)), 2);
+		memcpy(pframe, (u8 *)(rtw_get_capability_from_ie(cur_network->ies)), 2);
 
 		pframe += 2;
 		pattrib->pktlen += 2;
@@ -3881,7 +3881,7 @@ u8 collect_bss_info(struct adapter *padapter, union recv_frame *precv_frame, str
 		}
 	}
 
-	memcpy(&le32_tmp, rtw_get_beacon_interval_from_ie(bssid->ies), 2);
+	memcpy(&le32_tmp, bssid->ies+RTW_BEACON_INTERVAL_IE_OFFSET, 2);
 	bssid->configuration.beacon_period = le32_to_cpu(le32_tmp);
 
 	val16 = rtw_get_capability((struct wlan_bssid_ex *)bssid);
diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
index 03e047397..1597fc33a 100644
--- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
+++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
@@ -324,7 +324,7 @@ u16 get_beacon_interval(struct wlan_bssid_ex *bss)
 {
 	__le16 val;
 
-	memcpy((unsigned char *)&val, rtw_get_beacon_interval_from_ie(bss->ies), 2);
+	memcpy((unsigned char *)&val, bss->ies+RTW_BEACON_INTERVAL_IE_OFFSET, 2);
 
 	return le16_to_cpu(val);
 }
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
index c35c7f1c3..826a20529 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
@@ -128,7 +128,7 @@ static void ConstructBeacon(struct adapter *padapter, u8 *pframe, u32 *pLength)
 	pktlen += 8;
 
 	/*  beacon interval: 2 bytes */
-	memcpy(pframe, (unsigned char *)(rtw_get_beacon_interval_from_ie(cur_network->ies)), 2);
+	memcpy(pframe, (unsigned char *)(cur_network->ies+RTW_BEACON_INTERVAL_IE_OFFSET), 2);
 
 	pframe += 2;
 	pktlen += 2;
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme.h b/drivers/staging/rtl8723bs/include/rtw_mlme.h
index 8c924e35a..23c46df90 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme.h
@@ -43,6 +43,10 @@
 #define _FW_UNDER_SURVEY	WIFI_SITE_MONITOR
 
 
+#define RTW_BEACON_INTERVAL_IE_OFFSET 8
+
+
+
 enum {
  dot11AuthAlgrthm_Open = 0,
  dot11AuthAlgrthm_Shared,
@@ -366,7 +370,6 @@ bool rtw_if_up(struct adapter *padapter);
 bool rtw_linked_check(struct adapter *padapter);
 
 u8 *rtw_get_capability_from_ie(u8 *ie);
-u8 *rtw_get_beacon_interval_from_ie(u8 *ie);
 
 
 void rtw_joinbss_reset(struct adapter *padapter);
-- 
2.55.0

