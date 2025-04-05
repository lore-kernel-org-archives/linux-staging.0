Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9121DEFD7;
	Sat,  5 Apr 2025 11:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743852410; cv=none; b=i9GmxvErhpK4jRuopMBso4Lm0g4FZHoz6kilHLAYRwxk7aiskwFidnn9BJfl6Ol05cH+7rj4cZMZRkyYvW/Ks5STcRCWKMwvKPg4pTN5lVaFbMF2zX8vcyn3p1t0E7vywOyV8RJgjSQaJWIGt0JQgUknJm2qVKHMRtLw32gyZgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743852410; c=relaxed/simple;
	bh=aOOWiCI3ZK6+dzDuMUQZ7ZuRMibgi+DohpZfmHWxiow=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gJZL0jfkeb538htYbAMuzO16tA98+i3D7etCwMytOqlvJtVqfiTWKLkRbPOQjZelQmtF+nCC57+b7tTvlEiHBcy6utknTk1DEefXqZ+iYfgFdEIQnOiODBQPQNiOPUJGEdY5EyLXoUjwmGhz9e/DrOumHPcPa6O8rOthQeYURIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WtITcdDg; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WtITcdDg"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43cfb6e9031so26202195e9.0;
        Sat, 05 Apr 2025 04:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743852406; x=1744457206; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pK/O4pDg7hGitdXCJDavzci3Ws7cE2OFjqh+I33m5qk=;
        b=WtITcdDgIjeHBsQ139V22ZKTbQrlnnms30w7xP1rNQ2hCjcdvwBIYV70M24FozW2Kb
         IpPP5+CwJ5/tgbTP13vRg57PRUQkeHAchLcqrzOusO9Pn5dN5whnwMTtHPEO8HSWMnMh
         lzjNinf1Qx/QePvzCTsvC0+EQ9yMTLoy3sWfslx0FuX0bxj5hCd3NlQiSt0lZZs/rWWv
         lzOWjYylm3q5smx6DktA8M1sVLFrl/78fMOvpqSGLyLEbFiVIIDo2OPVXBh9RH9RLfWh
         /r46Bu1Zu6LY1zCEjtm++SH0+KD+rRADTL853UXnm8otOFPvOa6puAcPfWcQs6/Wh0En
         Ganw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743852406; x=1744457206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pK/O4pDg7hGitdXCJDavzci3Ws7cE2OFjqh+I33m5qk=;
        b=K+R6QpEc+Ojeln1gQgpPhfvOW59Fbs0/cTvh2skpX7wHsGLj8deSRPAs4FEqgG5WTg
         tps+JgS/e+YRLt945d9Lbr3ODwgiUvF7zi8sphpdXG1O/+i9BLxW0Ojii73SnfBbEadj
         9Qivcxr43fy2jM7zgDN8m6wmxszucjWWBI0YzDnp4agagm/KWN6d4hh3n6Cu6QwW9eI2
         Qh1zWn1xkMFNK/Wiqf5kXTGEMJQYRKJChitlT8E9DMt98wXVUkmQ74yiQl4G0yOZmPzB
         hJfrRd4RNbvQbVnwE7S/9tyMlahDL71Y254Fez3brasCiNMceyYhdWYsa8ASz8KeZpOY
         2Ztg==
X-Forwarded-Encrypted: i=1; AJvYcCUzKjX5hTHYc32XVivaxp+5vv9SF8VIaaL8oI6rhG8gOQlydQfDLavkvEj1j2kn0UhGUK8kgWOLMdLE5j6F@lists.linux.dev, AJvYcCW31VrJ3Kzbjy02RCzcdkYusBPnizJ3tQI8YkQWl7ozbMXdJEQmbSpJ4afmt/vNHz05yZl7jfv1SCHd@lists.linux.dev
X-Gm-Message-State: AOJu0YwXkO4z0OxoCJrHjZNrmaYzkrSqY/z2Ip+DAyGQZJHZ1rIyhZ/O
	eZxHRUUNO/dJyLkIGBITg4T4TsZDAMFofGXjzM+mGDj6PBGn5YU3
X-Gm-Gg: ASbGncu1eqKc1GUOn2crsfKXE8D+HVBIJbuEdejnjIPZ48pbQxTiRkrMgnTF/mv6qJ+
	Hzuj+R2jUCzqQX4POLwe786uT1UxXjUwH1AQ1snzbpupR188bwCl3w4nZGDBrYvcY3Amc0ifEg9
	yHcb043SZdVztN717YMLt5NjsWpcMNVqcVrDLPv9X4MKNwPtlTHkyMBVz3vp9zip9MKn4jBLAyc
	CmZHS8eKgmocIYDaW1o7AkuIgB7Rk5L88l+6JT1T7D3LSuMFVUuUZllV9LAfCvwTOuimfL5QaX2
	7r/4Pi0lr2hsxGYAWVK/uNS0V0TknPBr3Sjtwwj17w==
X-Google-Smtp-Source: AGHT+IHLA/32ujDJpWp156gtDsNMkozYCoV5fYDtmUGAjRgxJe6FJCwxQGZ2W2BX9K+wIzPE7dOyXA==
X-Received: by 2002:a05:600c:3ba4:b0:43d:1b74:e89a with SMTP id 5b1f17b1804b1-43ecf89d5b9mr46271625e9.9.1743852406289;
        Sat, 05 Apr 2025 04:26:46 -0700 (PDT)
Received: from pc.. ([197.232.62.173])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec17b0d06sm74361705e9.35.2025.04.05.04.26.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 04:26:45 -0700 (PDT)
From: Erick Karanja <karanja99erick@gmail.com>
To: gregkh@linuxfoundation.org,
	outreachy@lists.linux.dev
Cc: karanja99erick@gmail.com,
	philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] staging: rtl8723bs: use preferred comparison order
Date: Sat,  5 Apr 2025 14:26:05 +0300
Message-ID: <3534b660142c78e800e369c31df091625e61f844.1743851473.git.karanja99erick@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1743851473.git.karanja99erick@gmail.com>
References: <cover.1743851473.git.karanja99erick@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor  conditions check to follow the Linux kernel
coding style, which prefers placing the variable on the left side
of the comparison.

Reported by checkpatch:

	WARNING: Comparisons should place the constant on the right side
    of the test

Signed-off-by: Erick Karanja <karanja99erick@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_btcoex.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_btcoex.c b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
index b72cf520d576..9105594d2dde 100644
--- a/drivers/staging/rtl8723bs/hal/hal_btcoex.c
+++ b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
@@ -91,7 +91,7 @@ static void halbtcoutsrc_LeaveLowPower(struct btc_coexist *pBtCoexist)
 	stime = jiffies;
 	do {
 		ready = rtw_register_task_alive(padapter, BTCOEX_ALIVE);
-		if (_SUCCESS == ready)
+		if (ready == _SUCCESS)
 			break;
 
 		utime = jiffies_to_msecs(jiffies - stime);
@@ -668,7 +668,7 @@ static void halbtcoutsrc_WriteLocalReg1Byte(void *pBtcContext, u32 RegAddr, u8 D
 	struct btc_coexist *pBtCoexist = (struct btc_coexist *)pBtcContext;
 	struct adapter *Adapter = pBtCoexist->Adapter;
 
-	if (BTC_INTF_SDIO == pBtCoexist->chipInterface)
+	if (pBtCoexist->chipInterface == BTC_INTF_SDIO)
 		rtw_write8(Adapter, SDIO_LOCAL_BASE | RegAddr, Data);
 	else
 		rtw_write8(Adapter, RegAddr, Data);
@@ -894,7 +894,7 @@ void EXhalbtcoutsrc_IpsNotify(struct btc_coexist *pBtCoexist, u8 type)
 	if (pBtCoexist->bManualControl)
 		return;
 
-	if (IPS_NONE == type)
+	if (type == IPS_NONE)
 		ipsType = BTC_IPS_LEAVE;
 	else
 		ipsType = BTC_IPS_ENTER;
@@ -922,7 +922,7 @@ void EXhalbtcoutsrc_LpsNotify(struct btc_coexist *pBtCoexist, u8 type)
 	if (pBtCoexist->bManualControl)
 		return;
 
-	if (PS_MODE_ACTIVE == type)
+	if (type == PS_MODE_ACTIVE)
 		lpsType = BTC_LPS_DISABLE;
 	else
 		lpsType = BTC_LPS_ENABLE;
@@ -1000,7 +1000,7 @@ void EXhalbtcoutsrc_MediaStatusNotify(struct btc_coexist *pBtCoexist, enum
 	if (pBtCoexist->bManualControl)
 		return;
 
-	if (RT_MEDIA_CONNECT == mediaStatus)
+	if (mediaStatus == RT_MEDIA_CONNECT)
 		mStatus = BTC_MEDIA_CONNECT;
 	else
 		mStatus = BTC_MEDIA_DISCONNECT;
@@ -1026,11 +1026,11 @@ void EXhalbtcoutsrc_SpecialPacketNotify(struct btc_coexist *pBtCoexist, u8 pktTy
 	if (pBtCoexist->bManualControl)
 		return;
 
-	if (PACKET_DHCP == pktType) {
+	if (pktType == PACKET_DHCP) {
 		packetType = BTC_PACKET_DHCP;
-	} else if (PACKET_EAPOL == pktType) {
+	} else if (pktType == PACKET_EAPOL) {
 		packetType = BTC_PACKET_EAPOL;
-	} else if (PACKET_ARP == pktType) {
+	} else if (pktType == PACKET_ARP) {
 		packetType = BTC_PACKET_ARP;
 	} else {
 		return;
@@ -1114,13 +1114,13 @@ void EXhalbtcoutsrc_Periodical(struct btc_coexist *pBtCoexist)
 
 void EXhalbtcoutsrc_SetAntNum(u8 type, u8 antNum)
 {
-	if (BT_COEX_ANT_TYPE_PG == type) {
+	if (type == BT_COEX_ANT_TYPE_PG) {
 		GLBtCoexist.boardInfo.pgAntNum = antNum;
 		GLBtCoexist.boardInfo.btdmAntNum = antNum;
-	} else if (BT_COEX_ANT_TYPE_ANTDIV == type) {
+	} else if (type == BT_COEX_ANT_TYPE_ANTDIV) {
 		GLBtCoexist.boardInfo.btdmAntNum = antNum;
 		/* GLBtCoexist.boardInfo.btdmAntPos = BTC_ANTENNA_AT_MAIN_PORT; */
-	} else if (BT_COEX_ANT_TYPE_DETECTED == type) {
+	} else if (type == BT_COEX_ANT_TYPE_DETECTED) {
 		GLBtCoexist.boardInfo.btdmAntNum = antNum;
 		/* GLBtCoexist.boardInfo.btdmAntPos = BTC_ANTENNA_AT_MAIN_PORT; */
 	}
-- 
2.43.0

