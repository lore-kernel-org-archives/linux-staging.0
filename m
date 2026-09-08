Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2604A59E34B
	for <linux-staging@lists.linux.dev>; Tue,  8 Sep 2026 18:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788892494; cv=none; b=NkWiKifmJBD3SyrZDlbIGGD6+z4c/4SLJNH7bGJoi9hGucwS2Rfo6CrB32i4UMZd+DG2RLq6I7WPwGM4nahMNpQ9fZbgC8dFC5X8/+PZxVxl3M7jCoW3T3Bns2T0ngQzIzlWbbOz6Aqny1FxQ+mJu+p7IMDYDx8f167O4x52w/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788892494; c=relaxed/simple;
	bh=Oyo8WBTTLUQjhitP/90OaOv6Ze1PA6bO+/LqGeo1RkI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fW2qtLU27elOx1ne7pSbQODkt4SKgLXHXou9sbiQfdrUqyejUbH0EnqLuRzW3gzZunFzZcwLpyYwEWp7qPUlrmhjYtANQaHktec1UXd+8Pmcx1HG+EN624P2bav/w4vQS4SrB3/D5xVZD5E1uY5lxduumAKP7lAqM6DZgTtvs2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xw8s0Rqn; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xw8s0Rqn"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49a97714f5dso49232625e9.0
        for <linux-staging@lists.linux.dev>; Tue, 08 Sep 2026 11:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788892487; x=1789497287; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IOUFsO+FTCcGNgsiYlTr5Qmkr30pPd5dfE9ht+CoW2U=;
        b=Xw8s0RqnmDqGpo6DPQV849ymWMdF+EEsCEa91wOU1R1TttIz8WXFIPcH5wdsmT55Dg
         GQBFZ8QEWqgrWPOQBhLIEB6JwjrnAdXn3qdsrxie/oWubt3SfKx6y19/cOSJ/yyvjmI4
         7ukgzUqzCkwRS9ud+WFN/r/J8QcZC76x7nEpNFwKx7AKKAmpVSY6SANGiJLSgIW75Cj2
         Y7ypJMvV4Zq1cI4IG1q34NSkaVRZSkPQPdAeyAw9/1KhdQdJzXUAzUbC+AgsRklinD+o
         8aXbyROiHQlXSmAQoUuTnXxsqnCQ3qBaoYJE8IgMpBgJo0pz2abAuvl+PcvPgvv88TBu
         WAWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788892487; x=1789497287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IOUFsO+FTCcGNgsiYlTr5Qmkr30pPd5dfE9ht+CoW2U=;
        b=szWd3gLTP1sstkv/3YGKZmT5Xx8TzbXDpQOd7D8zWMH7L7b2m0hmOXhd5ZIkAOPY1d
         NrUUX4CwAKcWvdID+0GJL2Zj/heKJ6fgP2tRIuR0FfvCwJZQnM42BEdo+egIK8iqKiaI
         RrsXoYLDwCeD942/NTzz3O66iFsZkBDZv+9Ixn3ClcILlFvlqq/8Ijep0IGdQKRR3mFd
         U763ulzfG3Jpj194GA7QcHemjDGalnCRzUmgYwWJEw97F6wz4He7eTMez0Ft0mCm1cSo
         azf81kQW8W/aWYRvsQVn4Et8Plh1rFEuCzhmh7wGzW+OU9ffMUYr7AavN2P5bO8FcwXZ
         tGTA==
X-Gm-Message-State: AFuF++kHt9uGXppy9a1hp9ZZpKhtAeo9DVv8nMqq5hZHdZeTOw2Z3n1j
	DXkyLjtKuDJ9IX57Wq7mGjoY8DXDR158wnN0BhffbdE0MCVQSJbZfLFqzI8YLACL
X-Gm-Gg: AYBFou1opYrF53tZ8ISEr+jiKJeYvmmpwm6MVsDHtcfhRhh8OP8kDzn7SojJeeTQXv9
	7zROlDZ/wwJXRcpllBzHs3UMYlevrjE2o6u+43rxk9vWJFsHZZSQzPtgb3CxBZPlVW8GecUIlr/
	iD4ADn11y69JKnEbQRIutqdzfaTjk1MD9khzx43Pju5w3SI1knHa8rjzkQ6/WrT9YP1ea4OPRm/
	EbuOvfQp0AUg3d4Q0Q5jLoSBZ4hTlWMF+OXy1dnSB8M0bRwfMrGXLxdWpeEm9aJr9Q1nQ6Dc1HN
	pAJRc2nMD9dGUISlqnTWiJrsTND6NhMN2kDSesHXVQ//ygbO9qGQ1DTPrKVn03yv2CnFsUtYpa1
	G8XUehXHcE+I8wBzGqOKwZHKLBcNpCyvLVJ/VeRB0QeNipehyn1X13XUGoJk1Tol5VTwd7ZiUTS
	24/SmeX2uHzmjOmcZrMeTrVhcG76wLQhoFhA39Q8RBwTU4CM6qYBpqtrDRY2Ma5MIDbSiQwJLmn
	0MGHg==
X-Received: by 2002:a05:600c:64c6:b0:49c:fa20:cc02 with SMTP id 5b1f17b1804b1-49cfa20ccaemr274371025e9.25.1788892486822;
        Tue, 08 Sep 2026 11:34:46 -0700 (PDT)
Received: from predeASUS ([86.124.216.24])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5f912esm510511745e9.4.2026.09.08.11.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 11:34:46 -0700 (PDT)
From: AJ39210 <predescuciprian99@gmail.com>
To: linux-staging@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	gregkh@linuxfoundation.org,
	AJ39210 <predescuciprian99@gmail.com>
Subject: [PATCH 3/4] staging: rtl8723bs: core: clean up rtw_wlan_util.c style issues
Date: Tue,  8 Sep 2026 21:34:29 +0300
Message-ID: <20260908183430.3256-3-predescuciprian99@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260908183430.3256-1-predescuciprian99@gmail.com>
References: <20260908183430.3256-1-predescuciprian99@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: AJ39210 <predescuciprian99@gmail.com>
---
 .../staging/rtl8723bs/core/rtw_wlan_util.c    | 54 +++++++++----------
 1 file changed, 27 insertions(+), 27 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
index 8c1f46706..c6d39a74a 100644
--- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
+++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
@@ -8,20 +8,20 @@
 #include <drv_types.h>
 #include <hal_com_h2c.h>
 
-static unsigned char ARTHEROS_OUI1[] = {0x00, 0x03, 0x7f};
-static unsigned char ARTHEROS_OUI2[] = {0x00, 0x13, 0x74};
+static u8 ARTHEROS_OUI1[] = {0x00, 0x03, 0x7f};
+static u8 ARTHEROS_OUI2[] = {0x00, 0x13, 0x74};
 
-static unsigned char BROADCOM_OUI1[] = {0x00, 0x10, 0x18};
-static unsigned char BROADCOM_OUI2[] = {0x00, 0x0a, 0xf7};
-static unsigned char BROADCOM_OUI3[] = {0x00, 0x05, 0xb5};
+static u8 BROADCOM_OUI1[] = {0x00, 0x10, 0x18};
+static u8 BROADCOM_OUI2[] = {0x00, 0x0a, 0xf7};
+static u8 BROADCOM_OUI3[] = {0x00, 0x05, 0xb5};
 
-static unsigned char CISCO_OUI[] = {0x00, 0x40, 0x96};
-static unsigned char MARVELL_OUI[] = {0x00, 0x50, 0x43};
-static unsigned char RALINK_OUI[] = {0x00, 0x0c, 0x43};
-static unsigned char REALTEK_OUI[] = {0x00, 0xe0, 0x4c};
-static unsigned char AIRGOCAP_OUI[] = {0x00, 0x0a, 0xf5};
-static unsigned char RSN_TKIP_CIPHER[4] = {0x00, 0x0f, 0xac, 0x02};
-static unsigned char WPA_TKIP_CIPHER[4] = {0x00, 0x50, 0xf2, 0x02};
+static u8 CISCO_OUI[] = {0x00, 0x40, 0x96};
+static u8 MARVELL_OUI[] = {0x00, 0x50, 0x43};
+static u8 RALINK_OUI[] = {0x00, 0x0c, 0x43};
+static u8 REALTEK_OUI[] = {0x00, 0xe0, 0x4c};
+static u8 AIRGOCAP_OUI[] = {0x00, 0x0a, 0xf5};
+static u8 RSN_TKIP_CIPHER[4] = {0x00, 0x0f, 0xac, 0x02};
+static u8 WPA_TKIP_CIPHER[4] = {0x00, 0x50, 0xf2, 0x02};
 
 /* define WAIT_FOR_BCN_TO_MIN	(3000) */
 #define WAIT_FOR_BCN_TO_MIN	(6000)
@@ -75,8 +75,8 @@ u8 networktype_to_raid_ex(struct adapter *adapter, struct sta_info *psta)
 	return raid;
 }
 
-unsigned char ratetbl_val_2wifirate(unsigned char rate);
-unsigned char ratetbl_val_2wifirate(unsigned char rate)
+u8 ratetbl_val_2wifirate(u8 rate);
+u8 ratetbl_val_2wifirate(u8 rate)
 {
 	switch (rate & 0x7f) {
 	case 0:
@@ -108,11 +108,11 @@ unsigned char ratetbl_val_2wifirate(unsigned char rate)
 	}
 }
 
-int is_basicrate(struct adapter *padapter, unsigned char rate);
-int is_basicrate(struct adapter *padapter, unsigned char rate)
+int is_basicrate(struct adapter *padapter, u8 rate);
+int is_basicrate(struct adapter *padapter, u8 rate)
 {
 	int i;
-	unsigned char val;
+	u8 val;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 
 	for (i = 0; i < NumRates; i++) {
@@ -126,12 +126,12 @@ int is_basicrate(struct adapter *padapter, unsigned char rate)
 	return false;
 }
 
-unsigned int ratetbl2rateset(struct adapter *padapter, unsigned char *rateset);
-unsigned int ratetbl2rateset(struct adapter *padapter, unsigned char *rateset)
+u32 ratetbl2rateset(struct adapter *padapter, u8 *rateset);
+u32 ratetbl2rateset(struct adapter *padapter, u8 *rateset)
 {
 	int i;
-	unsigned char rate;
-	unsigned int	len = 0;
+	u8 rate;
+	u32 len = 0;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 
 	for (i = 0; i < NumRates; i++) {
@@ -158,9 +158,9 @@ unsigned int ratetbl2rateset(struct adapter *padapter, unsigned char *rateset)
 	return len;
 }
 
-void get_rate_set(struct adapter *padapter, unsigned char *pbssrate, int *bssrate_len)
+void get_rate_set(struct adapter *padapter, u8 *pbssrate, int *bssrate_len)
 {
-	unsigned char supportedrates[NumRates];
+	u8 supportedrates[NumRates];
 
 	memset(supportedrates, 0, NumRates);
 	*bssrate_len = ratetbl2rateset(padapter, supportedrates);
@@ -294,7 +294,7 @@ inline unsigned long rtw_get_on_cur_ch_time(struct adapter *adapter)
 		return 0;
 }
 
-void r8723bs_select_channel(struct adapter *padapter, unsigned char channel)
+void r8723bs_select_channel(struct adapter *padapter, u8 channel)
 {
 	if (mutex_lock_interruptible(&(adapter_to_dvobj(padapter)->setch_mutex)))
 		return;
@@ -307,7 +307,7 @@ void r8723bs_select_channel(struct adapter *padapter, unsigned char channel)
 	mutex_unlock(&(adapter_to_dvobj(padapter)->setch_mutex));
 }
 
-void set_channel_bwmode(struct adapter *padapter, unsigned char channel, unsigned char channel_offset, unsigned short bwmode)
+void set_channel_bwmode(struct adapter *padapter, u8 channel, u8 channel_offset, u16 bwmode)
 {
 	u8 center_ch, chnl_offset80 = HAL_PRIME_CHNL_OFFSET_DONT_CARE;
 
@@ -1360,10 +1360,10 @@ int support_short_GI(struct adapter *padapter, struct HT_caps_element *pHT_caps,
 		return _FAIL;
 }
 
-unsigned char get_highest_rate_idx(u32 mask)
+u8 get_highest_rate_idx(u32 mask)
 {
 	int i;
-	unsigned char rate_idx = 0;
+	u8 rate_idx = 0;
 
 	for (i = 31; i >= 0; i--) {
 		if (mask & BIT(i)) {
-- 
2.55.0

