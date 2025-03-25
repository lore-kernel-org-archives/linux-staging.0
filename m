Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BBF21E522;
	Tue, 25 Mar 2025 11:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742903168; cv=none; b=QUTtQoMdRlz8TCamVcY4gvn1F6YPU7i2jPHeCDxwisEkNT463KJ602WkbL82zw+xGweiKmt+0bskIpF6RtpkRgEumyiRGPbTkakKfcI8f8Zk+n76qmH2tHDa4k3fUKLcNU7qLgE3+b2zg10VzHdMiGiYLcMXEzGU5uOvap286pM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742903168; c=relaxed/simple;
	bh=3I6YOEEevm7Iddu9Wu3uhmlaf4D1s7KW/SvZf1lAK98=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GNPEZOrdOHW6YTX3jQ6fX9BNYNnP/2Uue86Coz5DrhkkzR9DMUvRKNjavKUTXmEplLnVNsLo7ex5wkWlxLDVS6znU0auJZzWaY1eZYCOmP14QtyB/jX7OfpoKcMYEjK8BjHv0yfAVswW4xpiGtqGpkuEt0jOpm8yYtg4pfiNfSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mBlfsZQB; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mBlfsZQB"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43cf034d4abso58912825e9.3;
        Tue, 25 Mar 2025 04:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742903165; x=1743507965; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QM6yckbMzLuQtYcD19Hf+kaqNYJs8oHRxuA6VUZJjFY=;
        b=mBlfsZQBx4jVQSW/R4H/nK6Z3m0qIAN1n2kcx9ZIsLdi9gItjLC8dC+Kxgb9woHMQa
         d+DDkhAcar/SXvqu3AtArz7/ndQEUEMvGa6D4TPNwN4Fy432yAFDGAaHikr5ogFdO27e
         yovYVkkhtFeiBRG8FNiRovCpYhzlfZ5pfmmmrA1vkFmMAjwngPYKCv8Naozpmvfy0+fH
         k67zB+J+DDbJVJ1e7k2+56XaRX7UKSrt8bS5bXxGFC+gMo5WjysbIJmY+i/qYwrKRaih
         fYorcGkafHI1v9j0+BuOjMMID1FdAmY5axZ36JHFJjkBjWtf7y+rTuzGDOwT9l8clgUA
         QBow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742903165; x=1743507965;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QM6yckbMzLuQtYcD19Hf+kaqNYJs8oHRxuA6VUZJjFY=;
        b=hSN6Jcg2Pt+WxsFlO97bxc4MjK7QEd3tA6lqUAiYOAqbkwNlLzyklpajXJCDifHEEK
         6wheJy1/+QuhSmb2XRKZ9nc1GlNXxyvEJQhWlTlfg3adovH7XzefMWmds++9iWZ/wPTb
         bYElQM0NCFs0xcNJoySKfy0T+pGG7C6l7Mv1hxCmqMVPypnMQn1hdlleLuB/M2N5q4T4
         rZ+i+Wxhb3KCYc0/3AIZdlXv4z8WdIu1e2ypGXC5Pk7hShlmrPrY0dlWIGPNfvjzRFlf
         U/X6aDlHUxpTgU8H5iFldDRnxO9IlGx+wNVSUcNt7xPHj5j7ceeAg0pFzYQ6ipZPpKsQ
         rLTQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCvGRcmDtg+axUgcntWvvfeaWHDrTfuLzbQljvG14dUmZHKyYgBz83OXG5SA7bWCsqeFuX8HAqz6I7I7ds@lists.linux.dev, AJvYcCVYh1hbZPWP+UdLkwy1Qq5Hba2dfwQsVVfDMPEK6+MI0QmQLC94r6uFDXUV/BvC4efEXUma2CYWa2Oe@lists.linux.dev
X-Gm-Message-State: AOJu0Yx7BP18CDb1fkvKvsWq5TbnHEA0eMloainD+TUYO9ILvV4ShqWe
	XYeULVAK5bqaTp83Ib2rHR5LZhhEvvD1o8sfiyBcF2aNs+wkz9ff
X-Gm-Gg: ASbGncuf/a66U2gq/3/rjcdgtSBjAKir5ASvwNe1WkTqMMzFviIgvBkUPz9lw3I97tK
	H8ocZWadHbXxod9pfKX36FEhX6r/704koYJGVSu8FxN64TppFZ4tkb6L8Ctd8BJhhxayyUuP49A
	MrZvBgRWrrntLtbV1Vftpx0DvzMA1l95ROPLWEDfutSQ/5STkMu6PXwUnsWPFVr+Uf45giyHRBi
	7u0ReA7c/RhxHwL0nrQhkou74OBpQoait0JTDVdUBbeieKqZjcwfKk4NVfafq/I4IzDiWzeCxPq
	AH53kaYQeI5Aj5fL4i+tT4fztA5J6a4mp5Xs0FdqkA==
X-Google-Smtp-Source: AGHT+IG1gg+2VMW6S40TL5SGmizmMHwcdq3j/bUWa544XwDYu50O4TXneCJnlGDTs3FUGeIlvjDRfQ==
X-Received: by 2002:a05:600c:4e41:b0:43d:1824:aadc with SMTP id 5b1f17b1804b1-43d50a3632emr167118635e9.29.1742903164542;
        Tue, 25 Mar 2025 04:46:04 -0700 (PDT)
Received: from pc.. ([197.155.71.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d6ddf2974sm12782885e9.0.2025.03.25.04.46.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 04:46:04 -0700 (PDT)
From: Erick Karanja <karanja99erick@gmail.com>
To: gregkh@linuxfoundation.org,
	outreachy@lists.linux.dev
Cc: philipp.g.hortmann@gmail.com,
	davidzalman.101@gmail.com,
	vivek6429.ts@gmail.com,
	viro@zeniv.linux.org.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Erick Karanja <karanja99erick@gmail.com>
Subject: [PATCH v2] staging: rtl8723bs: Rename variables v2
Date: Tue, 25 Mar 2025 14:45:52 +0300
Message-ID: <20250325114552.45393-1-karanja99erick@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename the variable `supportRateNum` to `support_rate_num` and variable
`supportRate` to `support_rate` to adhere to Linux kernel coding
standards by using snake_case instead of CamelCase.

Fixes checkpatch.pl warning:
    CHECK: Avoid CamelCase: <supportRateNum>

v2:
Fixes checkpatch.pl warning:
    CHECK: Avoid CamelCase: <supportRate>

Signed-off-by: Erick Karanja <karanja99erick@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ap.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index 50022bb5911e..d46a04b9a05e 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -370,7 +370,7 @@ void add_RATid(struct adapter *padapter, struct sta_info *psta, u8 rssi_level)
 void update_bmc_sta(struct adapter *padapter)
 {
 	unsigned char network_type;
-	int supportRateNum = 0;
+	int support_rate_num = 0;
 	unsigned int tx_ra_bitmap = 0;
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
@@ -396,9 +396,9 @@ void update_bmc_sta(struct adapter *padapter)
 		/* psta->dot118021XPrivacy = _NO_PRIVACY_;//!!! remove it, because it has been set before this. */
 
 		/* prepare for add_RATid */
-		supportRateNum = rtw_get_rateset_len((u8 *)&pcur_network->supported_rates);
+		support_rate_num = rtw_get_rateset_len((u8 *)&pcur_network->supported_rates);
 		network_type = rtw_check_network_type((u8 *)&pcur_network->supported_rates,
-						      supportRateNum,
+						      support_rate_num,
 						      pcur_network->configuration.ds_config
 		);
 		if (is_supported_tx_cck(network_type)) {
@@ -817,8 +817,8 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 	u16 cap, ht_cap = false;
 	uint ie_len = 0;
 	int group_cipher, pairwise_cipher;
-	u8 channel, network_type, supportRate[NDIS_802_11_LENGTH_RATES_EX];
-	int supportRateNum = 0;
+	u8 channel, network_type, support_rate[NDIS_802_11_LENGTH_RATES_EX];
+	int support_rate_num = 0;
 	u8 OUI1[] = {0x00, 0x50, 0xf2, 0x01};
 	u8 WMM_PARA_IE[] = {0x00, 0x50, 0xf2, 0x02, 0x01, 0x01};
 	struct registry_priv *pregistrypriv = &padapter->registrypriv;
@@ -883,7 +883,7 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 
 	pbss_network->configuration.ds_config = channel;
 
-	memset(supportRate, 0, NDIS_802_11_LENGTH_RATES_EX);
+	memset(support_rate, 0, NDIS_802_11_LENGTH_RATES_EX);
 	/*  get supported rates */
 	p = rtw_get_ie(
 		ie + _BEACON_IE_OFFSET_,
@@ -892,8 +892,8 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 		(pbss_network->ie_length - _BEACON_IE_OFFSET_)
 	);
 	if (p) {
-		memcpy(supportRate, p + 2, ie_len);
-		supportRateNum = ie_len;
+		memcpy(support_rate, p + 2, ie_len);
+		support_rate_num = ie_len;
 	}
 
 	/* get ext_supported rates */
@@ -904,11 +904,12 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 		pbss_network->ie_length - _BEACON_IE_OFFSET_
 	);
 	if (p) {
-		memcpy(supportRate + supportRateNum, p + 2, ie_len);
-		supportRateNum += ie_len;
+		memcpy(support_rate + support_rate_num, p + 2, ie_len);
+		support_rate_num += ie_len;
 	}
 
-	network_type = rtw_check_network_type(supportRate, supportRateNum, channel);
+	network_type = rtw_check_network_type(support_rate, support_rate_num,
+					      channel);
 
 	rtw_set_supported_rate(pbss_network->supported_rates, network_type);
 
-- 
2.43.0

