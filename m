Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 542C820D516;
	Tue,  1 Apr 2025 16:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743526799; cv=none; b=W5tM8vdtKmh8T5N0jN+RFANM4+WqA4TQa2EUprqJqld27Lrug1Mz43UKTaPXK8+URp4seceQaGcPaLNyeYfOgvb4gKuHdiDVT85HZa53TUxYAiqqPy9xt/cs7OfGex853SntQNYRL/gU807/aSLekvKHqe2TXYG7VQi1DtnurXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743526799; c=relaxed/simple;
	bh=aOOWiCI3ZK6+dzDuMUQZ7ZuRMibgi+DohpZfmHWxiow=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Mlxel2Z/YM/G0ktEQ67jAbK2ddF1g2+kDzeAHYNr5cims6/wol+uqKM/Z4DHWbRIh5ueJ6Ohj0FYD2hvRrYMHHdY6/yMy2b8+5iVSMueLWPQx7uhK80Q9yTfvG0rUZTtylC72WX8z2ClGwXheBbrIT478ubWgZt7ltf6KXvCqOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ibRPeKHA; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ibRPeKHA"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43cf0d787eeso55061115e9.3;
        Tue, 01 Apr 2025 09:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743526795; x=1744131595; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pK/O4pDg7hGitdXCJDavzci3Ws7cE2OFjqh+I33m5qk=;
        b=ibRPeKHAnjP2TjDyRF9BamY5+TYmK77TqXQPj+5zjW9cpOUZ41k+Cv9gYAFlf6Ttis
         cbT50xX6IfE+cL1HpZeP4xGw3tzhIZis41TQwyFHLUnwSUXIUE43clsWLMJSROu+EZin
         Qy6jlAxcVKRBa9aslU5gS0izUahv47z6W1PVBmfEkB/JHtkXrgye38+3iJPBLRHdiENK
         Y9IMq716EBHZU2hRPWdAI4MCn5lrX8CQxAyWM7JsmxrJ775UuWYfFPQanSaTc3L0+wPu
         eScgL7z6nGkVXSFU9j/xcI2crsht+uCWh3UJ6x8obtViKoh7AfXlZaXZpGH6RWu2hpjW
         Iwaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743526795; x=1744131595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pK/O4pDg7hGitdXCJDavzci3Ws7cE2OFjqh+I33m5qk=;
        b=dsD6r8zA0OBqp8jBNIbQ+3T0QqhvGM/UqfLMVPz3LXMFRrIFhmI3GHD3Nnvv5iFnUQ
         S2txHKVnxBy+GCqXALh1gn6t7+nFRiXgcgA7rMKaFslKXl0ztsXL9eSEPhELkHi2s4KN
         DLyk+8yD+kx3eBXMDG1sASzmArJEgbg9WrhAeA47if+teuXKjkUOGJLBaA+PI0I7AXzJ
         M8dWZf6KlRavbDRS5h3+pdV1wdvAuMnfETywAaA8KCu+tysY4BgQhKL9gi3ARDz/xyOI
         z8K2dqQHj3cNx9OnXhsbyVNPOJcmGBssSDM/1/5gnXeH+Cf0ZKjYGPtza6/MO8DTKU+N
         WwIw==
X-Forwarded-Encrypted: i=1; AJvYcCVM/jcZ5mGcJfGDouOmqkQW1mUnreRC5nuLFNkbU0BAT34lYHT9zpsAmn+O2+se08iM2hMSAe9XUGxEd0RJ@lists.linux.dev, AJvYcCVekZdODutNTsCFOYcuO5/7gKKliF2QGabLfqiDTFnzHUKrzkFFOK//9faIxINm7vwpDddyd1Apy0Vq@lists.linux.dev
X-Gm-Message-State: AOJu0YxBjR5KbqMjjBbzrA8SfhRffkG3x+XhtgYmY70Lhcif8alEmgvP
	zck6rBHMwvPt8MFqJ2uquveNl1IItR1H65zQdJSurToqwZCwmMz4
X-Gm-Gg: ASbGncvbJRDwU3uiKR1L40/l5KDwLsfnpItA0NMRx0UYTCZr128UHMWS7+GF5WiTdIu
	9Vq9AO71gwQjJKwGdy1OpyC2jbWKlSzMO+cuOZ49LiAjqdCBPymAXapVfjRnL/ckQBZfyuIdypQ
	oiQztLCTsyhDn6ESek9ai7jxGKxOlNxISB/YXjXwrxXHU+cAuTJkkbFH4pKEf7v7NmsGpIRyrh4
	ePP1LD5rHEBtnpXGyAecM5NJmEuhpINzMXRYTkS/6qusAULaI6XM5zLKWa04uuND726I/y2zSa5
	y/boudqYMyBULyswhis9PKjPWT2bHFsx7RlXQoo=
X-Google-Smtp-Source: AGHT+IETbTzAYb/h3dIJZa9Z4oxluG5CHqg0acXlqJ9p0VnpANQt/7sWH8a0uAGyXN8MoYcjIgFbBw==
X-Received: by 2002:a05:600c:3ca6:b0:43c:fa0e:471a with SMTP id 5b1f17b1804b1-43db61d9cf5mr142340485e9.5.1743526795566;
        Tue, 01 Apr 2025 09:59:55 -0700 (PDT)
Received: from pc.. ([41.206.42.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8fccfe2fsm161520215e9.22.2025.04.01.09.59.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 09:59:55 -0700 (PDT)
From: Erick Karanja <karanja99erick@gmail.com>
To: gregkh@linuxfoundation.org,
	outreachy@lists.linux.dev
Cc: karanja99erick@gmail.com,
	philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/5] staging: rtl8723bs: use preferred comparison order
Date: Tue,  1 Apr 2025 19:59:33 +0300
Message-ID: <128b2c78fe04c358c96bff4a2fae1de8e7a6839d.1743524096.git.karanja99erick@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1743524096.git.karanja99erick@gmail.com>
References: <cover.1743524096.git.karanja99erick@gmail.com>
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

