Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 116F579CD
	for <linux-staging@lists.linux.dev>; Fri,  6 Feb 2026 12:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770381061; cv=none; b=obF4Ta8U1oUK1DeKjvbtCQSpGCAn6Y0D3B/Vi+/EQJ6qPCYoEuNQ2XvAF40siO4uEKF5nW4mw0vQedwEaaUMu8+anUdTQLqXLAK4fhUmeISMHncA7R/g7yOv35OoOE5kIElYPDZYqZLGd6DQ1tx9X/YULUEPHfQ+7xDBvWMMgj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770381061; c=relaxed/simple;
	bh=dCqzGS35F1nUqA+XOtNOoi2oN2aJAgKxR/zUbAJXSTw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ny2e2J4pXglwSSBgU2gTDeOkq/c92YeKhIoN3ZY7ZQIbMkzJ3gGm8jguyqYIrvLCsiEpMXr01bweT0PEZWzQNFiip0Z5N9eoKON2V5Vcd8ivO4yGpNQvbf250lKCH+dVL9zbeDMLXjsjNJ85GgjKhMgU4sCKsSBgAwxTzSfoSnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FpjYgpLy; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FpjYgpLy"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-59dd490be5fso2560178e87.2
        for <linux-staging@lists.linux.dev>; Fri, 06 Feb 2026 04:31:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770381059; x=1770985859; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=n7dQpXoWBfZRAL3EkTwGAz1RUixIkumCSyEmZ3Dzsno=;
        b=FpjYgpLyj1bAc4rBrDK3kYgWgegmqshcIguEvLdbf+5LgcmFkeRWpSVOnZI3Rin3IY
         H3LmJoAHklAHJxi5zBr22Tn0c6R0Ev/FA4/bWTuuYY3TBGukgL2OBRIOIgrTZP1JwZK8
         Z1UjiB2KJX8SaLibYRPAj8OyfYltZpSzbKv/MywI33cSurQlH2jOlX4aIbC6g14TGnkA
         x14s8slRIse5UEoWEmhrj0C3C2GjSoA85naOhGzc67gf/c2boNrx5wj4NvRFLk4GJcXf
         ziB6+2POthFxXLP64zE08y2BYLtayxz1J6BvDkOdhtoj6vmnA2TgxvLK0RcEQ3alusOE
         wLTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770381059; x=1770985859;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n7dQpXoWBfZRAL3EkTwGAz1RUixIkumCSyEmZ3Dzsno=;
        b=of60/JspmYtYJPlEUtNaJc7RjzxadzFgQjE4CAJAHx2VcZUvmNjAjheQS4vMa6texz
         i7EFaz4xOvJWOzuJa/ToWiC5vcLOeL5wHloB+3UYvjcc9ws9Wb7eJp/apWgD+78xyEpU
         7eRCYDFy+zIFoR5UGsDIAQSvT0xLGT/Yavkgenanl2HL3wfrm+hF8j6ZK0LeDMWdTyoM
         dNVgeTHpIW29WkcSurUxKE4EEgbneV148FICjdV7C5AkpSszrIZcgmgM4gMTTqvJFdQX
         ZFiq5CxfGjfHpAC2XuGSh9paO8vDOG+0h/Eow+7Kh1ho/dLEhY7LxngI3yWxp0DHZwAq
         KvTw==
X-Gm-Message-State: AOJu0YyCTc/ofdTNOt0bpHP5e8uVgQR6yTicod8m4oRz8eQG9K4u5ydc
	zSDI0SgJQSRH3Dm2UmcEZb6J17iJyIY7woPZ3oI7u4LGHB/R2x+8kGPT
X-Gm-Gg: AZuq6aIZn/thmn6T2btezrUt8g3EWou0qbl4r3Cf0tqZPV25tA7qsTZkDXfkHI0cTma
	9Y4+Il04cNVl9KSnvKb/1+bkZA96Mnui5KFfe4AxVhjE1MWhZSlj7faqeshijZEQFXGZaLYiZQN
	ASSUUt41sK7tuqiOySmxc4jQx41mup/o/zSN3Sjh+SUavX9wPu39/0Gn9QXf7VwFzEjwQrqg+X7
	OiAA+42QMemvF9Nozo/jCRHKUqKcrsR7UpfkXAmHA+NCF7H3k8itNJ21fm57K1OjXrax/3u4T9j
	1h7k5FRQqhM5CVNSkzVTK8pSNHzRqLfYkKQpMwXt9BpMkxmPnPamDf93v/TY7QxZRxZY84sssO7
	l+SII1KqT6zR9LZXSyKNULYh7iHaw5XJr/tXb7hKLgd/F0aqyNNUsGL7LpkTAenFYUJPutdiDSv
	Lzn2sW5jouf3qL
X-Received: by 2002:a05:6512:2251:b0:59e:44b5:e921 with SMTP id 2adb3069b0e04-59e45161832mr825935e87.43.1770381058894;
        Fri, 06 Feb 2026 04:30:58 -0800 (PST)
Received: from archlinux ([185.140.160.223])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e44d299desm563487e87.57.2026.02.06.04.30.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 04:30:58 -0800 (PST)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH] staging: rtl8723bs: rename camelCase variables
Date: Fri,  6 Feb 2026 15:25:53 +0300
Message-ID: <20260206123013.15533-2-nikolayof23@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename "pHT_caps_ie" to "pht_caps_ie" and "pHT_info_ie" to "pht_info_ie"
local variables to comply with Linux coding style.

This fixes the following checkpatch.pl warnings:
	CHECK: Avoid CamelCase: <pHT_caps_ie>
	CHECK: Avoid CamelCase: <pHT_info_ie>

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ap.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index 477fe238add4..918fcc378fe2 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -801,8 +801,8 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 {
 	int ret = _SUCCESS;
 	u8 *p;
-	u8 *pHT_caps_ie = NULL;
-	u8 *pHT_info_ie = NULL;
+	u8 *pht_caps_ie = NULL;
+	u8 *pht_info_ie = NULL;
 	struct sta_info *psta = NULL;
 	u16 cap, ht_cap = false;
 	uint ie_len = 0;
@@ -1007,7 +1007,7 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 		u8 max_rx_ampdu_factor = 0;
 		struct ieee80211_ht_cap *pht_cap = (struct ieee80211_ht_cap *)(p + 2);
 
-		pHT_caps_ie = p;
+		pht_caps_ie = p;
 
 		ht_cap = true;
 		network_type |= WIRELESS_11_24N;
@@ -1060,7 +1060,7 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 		       &ie_len,
 		       (pbss_network->ie_length - _BEACON_IE_OFFSET_));
 	if (p && ie_len > 0)
-		pHT_info_ie = p;
+		pht_info_ie = p;
 
 	switch (network_type) {
 	case WIRELESS_11B:
@@ -1095,9 +1095,9 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 		if (pregistrypriv->ampdu_enable == 1)
 			pmlmepriv->htpriv.ampdu_enable = true;
 
-		HT_caps_handler(padapter, (struct ndis_80211_var_ie *)pHT_caps_ie);
+		HT_caps_handler(padapter, (struct ndis_80211_var_ie *)pht_caps_ie);
 
-		HT_info_handler(padapter, (struct ndis_80211_var_ie *)pHT_info_ie);
+		HT_info_handler(padapter, (struct ndis_80211_var_ie *)pht_info_ie);
 	}
 
 	pbss_network->length =
-- 
2.52.0

