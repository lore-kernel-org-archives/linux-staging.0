Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0229D20DD4B;
	Tue,  1 Apr 2025 17:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743526823; cv=none; b=l+7KvXKLBy1hcM5JpaxRPu6yo0BIC7fs3aD2dGCO4XtCZ/FTotVwtE4gFIaNESd+eLxYyjDAunYP20SmFkVkm1wYmotaBadvdzAfQsuoLqjysd5WKCV9eINJPOdZdkh8f9p0sJn6PVhpXMfqV0bJOnl4UtECN7XlZbW5kX424mY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743526823; c=relaxed/simple;
	bh=70T7ff+cvTgy9HmQcmQ+w6+CJzqiILA3azoHraLtg/4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tdx28fYkHgjkvITzfb0MZwZ5rNKRTVnAK6jDmVCwD6NTiMGY8oarYpOCqfypafbVdBkVIQ4bv52Y0y9dE6A38233EtB4F+KHU0Z8n7sjdujvpkPVxzaLml3JNVZ0erZckiFfxbnkRjtFNmXMKjUgAV9k3KREBaoyl9TY7uKrv40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PjcrAGVp; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PjcrAGVp"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-39bf44be22fso3020010f8f.0;
        Tue, 01 Apr 2025 10:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743526819; x=1744131619; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SvVOyjDeuKJzEI0Ln+MX+oZNgFkv015EO/qfO7rmFtM=;
        b=PjcrAGVpbJgrb7UTQycCxnQ7NRyIsfzhoYPmwnoAsvKhXRpqkQH5yoe2xhrDm9fpLQ
         qHpPG8CkX77o5U5T4X6whH3W8VNgumkWRcIRuJ4PIACz8HF6xngaUFrYnyR5pcttle+Z
         vFVIZIiUEO6rkoE1Klw3dD9KnAk6cYFnPTdGBKo1rbPoAjcmohSnkJQ/aK5LWaHroqnO
         ZI4KmjpZK2QV7Z8m6XbwzUMjmtsiGuSoniKT1e9Xp3gP6kVKjShaiSM2uuaYGjA5t0ks
         98UXrXSHjhPXAmNcbFrZxmAT4SFTG21VbXcbsT6faHzcdL06NDDhxen7KyqbZFCoHp6D
         gtHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743526819; x=1744131619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SvVOyjDeuKJzEI0Ln+MX+oZNgFkv015EO/qfO7rmFtM=;
        b=f0xbcP5kLu+eCRFakjMRfY5KflddafgMB5t2ZmnqyFvWqxH5EFRIYxXkWUsSZNeAug
         GF0/fPhYGllOvKXWV/GUvmMdQ6H1zH6femnMXCkmEQf7xw/sJK3H6CbsnNI+IzHTlOsc
         HchF/G/tzgHz8KmZvxzPzUIDvPTGECfvTwm3d/E/oQUtr0DzWgWQgvh/XSymoZJuuDFq
         cMkNBnBqSmBgEls8jhD8jVQYm/J35OdVmELpigjalBlsIIDPL72mKKm1MpI2vkH57TEe
         bEA0rQq3wMDaP1lj47lpMmG+W3xjXZOVWR9aA8izhHl7kqJXW8RDETnK53CJs0185Z+A
         KMAg==
X-Forwarded-Encrypted: i=1; AJvYcCV7tHdjbIgk5mIbXu/S5UQQzHHMPyny8CaV70rEVpiJdtLqAFNxBbbAZ8IoxUFFnQwMd2SYZbUnzNQCPBkl@lists.linux.dev, AJvYcCVxSRWavVtwGosn4+21PXHGlmghCc2yt+1qghqU92WC1SH4nX0kKnPnxk9wiTZm+T2CVcnvvg3z3N7j@lists.linux.dev
X-Gm-Message-State: AOJu0YwcLGs1zyhz0iULvkGP1Wq6ssPXQB2/ft4ZXtJZXynYP+vOvhga
	y4ZsuNSrAqucCkn6LRC1kABqUG/q+Wyi9zPfyRlHobji8WwCeKFT
X-Gm-Gg: ASbGncukf+59/eibC8Ijv9+dPJEjVU0CMm7uKnqMXc3+U42Tc3VLLra1ABTIyHULqSy
	Aq352ZyQm8zfavIoNmhoUsFd28cVbvKiAmwaoc1ucvZIioAmqc+f5fwLNIHz1e0ak7HgkOh6tTQ
	ojY+U+Hd81jo9hzSJxpjgOCy2JChmN2Yw2J04NbYFQTlpG4ribxQ2504KbWuyZ7brqiTFr1huyD
	vvHWGNoIj5+NckoDS/INLXlTwbNnDG+cjAXj+qbzan9lvGJd5LuykeB4YO3jFkO43qd7Jcbjshk
	wl9SFjDZPJMMDLRlN3ffYsbzu6A3uDZ07ShmPX4=
X-Google-Smtp-Source: AGHT+IGk+Bp+mzmPj2lLL07JX/Nje7UXGMoiYywoqCB+dnmAXU2NQBOf6gLoy73xAVKKjLFPffdhZw==
X-Received: by 2002:a05:6000:4282:b0:391:3bba:7f18 with SMTP id ffacd0b85a97d-39c120de348mr11435921f8f.12.1743526819194;
        Tue, 01 Apr 2025 10:00:19 -0700 (PDT)
Received: from pc.. ([41.206.42.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8fccfe2fsm161520215e9.22.2025.04.01.10.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 10:00:18 -0700 (PDT)
From: Erick Karanja <karanja99erick@gmail.com>
To: gregkh@linuxfoundation.org,
	outreachy@lists.linux.dev
Cc: karanja99erick@gmail.com,
	philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/5] staging: rtl8723bs: no space before tabs
Date: Tue,  1 Apr 2025 19:59:37 +0300
Message-ID: <4e39b1295d68aea947aa5757e3148a2e401b72bc.1743524096.git.karanja99erick@gmail.com>
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

Remove spaces before tabs to comply with the Linux kernel coding style
guidelines. Proper indentation using tabs improves code consistency
and readability.

Reported by checkpatch:

    WARNING: please, no space before tabs

Signed-off-by: Erick Karanja <karanja99erick@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_btcoex.c | 33 ++++------------------
 1 file changed, 6 insertions(+), 27 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_btcoex.c b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
index 9105594d2dde..44f73baf1cb4 100644
--- a/drivers/staging/rtl8723bs/hal/hal_btcoex.c
+++ b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
@@ -9,14 +9,14 @@
 #include <hal_btcoex.h>
 #include <Mp_Precomp.h>
 
-/* 		Global variables */
+/*Global variables */
 
 struct btc_coexist GLBtCoexist;
 static u8 GLBtcWiFiInScanState;
 static u8 GLBtcWiFiInIQKState;
 
 /*  */
-/* 		Debug related function */
+/*Debug related function */
 /*  */
 static u8 halbtcoutsrc_IsBtCoexistAvailable(struct btc_coexist *pBtCoexist)
 {
@@ -84,9 +84,9 @@ static void halbtcoutsrc_LeaveLowPower(struct btc_coexist *pBtCoexist)
 	ready = _FAIL;
 #ifdef LPS_RPWM_WAIT_MS
 	timeout = LPS_RPWM_WAIT_MS;
-#else /*  !LPS_RPWM_WAIT_MS */
+#else
 	timeout = 30;
-#endif /*  !LPS_RPWM_WAIT_MS */
+#endif
 
 	stime = jiffies;
 	do {
@@ -401,9 +401,6 @@ static u8 halbtcoutsrc_Get(void *pBtcContext, u8 getType, void *pOutBuf)
 
 	case BTC_GET_U1_MAC_PHY_MODE:
 		*pu8 = BTC_SMSP;
-/* 			*pU1Tmp = BTC_DMSP; */
-/* 			*pU1Tmp = BTC_DMDP; */
-/* 			*pU1Tmp = BTC_MP_UNKNOWN; */
 		break;
 
 	case BTC_GET_U1_AP_NUM:
@@ -561,7 +558,7 @@ static u8 halbtcoutsrc_Set(void *pBtcContext, u8 setType, void *pInBuf)
 }
 
 /*  */
-/* 		IO related function */
+/* IO related function */
 /*  */
 static u8 halbtcoutsrc_Read1Byte(void *pBtcContext, u32 RegAddr)
 {
@@ -772,7 +769,7 @@ static void halbtcoutsrc_FillH2cCmd(void *pBtcContext, u8 elementId, u32 cmdLen,
 }
 
 /*  */
-/* 		Extern functions called by other module */
+/* Extern functions called by other module */
 /*  */
 static u8 EXhalbtcoutsrc_BindBtCoexWithAdapter(void *padapter)
 {
@@ -808,8 +805,6 @@ void hal_btcoex_Initialize(void *padapter)
 
 	pBtCoexist = &GLBtCoexist;
 
-	/* pBtCoexist->statistics.cntBind++; */
-
 	pBtCoexist->chipInterface = BTC_INTF_SDIO;
 
 	EXhalbtcoutsrc_BindBtCoexWithAdapter(padapter);
@@ -900,14 +895,12 @@ void EXhalbtcoutsrc_IpsNotify(struct btc_coexist *pBtCoexist, u8 type)
 		ipsType = BTC_IPS_ENTER;
 
 	/*  All notify is called in cmd thread, don't need to leave low power again */
-/* 	halbtcoutsrc_LeaveLowPower(pBtCoexist); */
 
 	if (pBtCoexist->boardInfo.btdmAntNum == 2)
 		EXhalbtc8723b2ant_IpsNotify(pBtCoexist, ipsType);
 	else if (pBtCoexist->boardInfo.btdmAntNum == 1)
 		EXhalbtc8723b1ant_IpsNotify(pBtCoexist, ipsType);
 
-/* 	halbtcoutsrc_NormalLowPower(pBtCoexist); */
 }
 
 void EXhalbtcoutsrc_LpsNotify(struct btc_coexist *pBtCoexist, u8 type)
@@ -952,14 +945,12 @@ void EXhalbtcoutsrc_ScanNotify(struct btc_coexist *pBtCoexist, u8 type)
 	}
 
 	/*  All notify is called in cmd thread, don't need to leave low power again */
-/* 	halbtcoutsrc_LeaveLowPower(pBtCoexist); */
 
 	if (pBtCoexist->boardInfo.btdmAntNum == 2)
 		EXhalbtc8723b2ant_ScanNotify(pBtCoexist, scanType);
 	else if (pBtCoexist->boardInfo.btdmAntNum == 1)
 		EXhalbtc8723b1ant_ScanNotify(pBtCoexist, scanType);
 
-/* 	halbtcoutsrc_NormalLowPower(pBtCoexist); */
 }
 
 void EXhalbtcoutsrc_ConnectNotify(struct btc_coexist *pBtCoexist, u8 action)
@@ -978,14 +969,12 @@ void EXhalbtcoutsrc_ConnectNotify(struct btc_coexist *pBtCoexist, u8 action)
 		assoType = BTC_ASSOCIATE_FINISH;
 
 	/*  All notify is called in cmd thread, don't need to leave low power again */
-/* 	halbtcoutsrc_LeaveLowPower(pBtCoexist); */
 
 	if (pBtCoexist->boardInfo.btdmAntNum == 2)
 		EXhalbtc8723b2ant_ConnectNotify(pBtCoexist, assoType);
 	else if (pBtCoexist->boardInfo.btdmAntNum == 1)
 		EXhalbtc8723b1ant_ConnectNotify(pBtCoexist, assoType);
 
-/* 	halbtcoutsrc_NormalLowPower(pBtCoexist); */
 }
 
 void EXhalbtcoutsrc_MediaStatusNotify(struct btc_coexist *pBtCoexist, enum
@@ -1006,14 +995,12 @@ void EXhalbtcoutsrc_MediaStatusNotify(struct btc_coexist *pBtCoexist, enum
 		mStatus = BTC_MEDIA_DISCONNECT;
 
 	/*  All notify is called in cmd thread, don't need to leave low power again */
-/* 	halbtcoutsrc_LeaveLowPower(pBtCoexist); */
 
 	if (pBtCoexist->boardInfo.btdmAntNum == 2)
 		EXhalbtc8723b2ant_MediaStatusNotify(pBtCoexist, mStatus);
 	else if (pBtCoexist->boardInfo.btdmAntNum == 1)
 		EXhalbtc8723b1ant_MediaStatusNotify(pBtCoexist, mStatus);
 
-/* 	halbtcoutsrc_NormalLowPower(pBtCoexist); */
 }
 
 void EXhalbtcoutsrc_SpecialPacketNotify(struct btc_coexist *pBtCoexist, u8 pktType)
@@ -1037,14 +1024,12 @@ void EXhalbtcoutsrc_SpecialPacketNotify(struct btc_coexist *pBtCoexist, u8 pktTy
 	}
 
 	/*  All notify is called in cmd thread, don't need to leave low power again */
-/* 	halbtcoutsrc_LeaveLowPower(pBtCoexist); */
 
 	if (pBtCoexist->boardInfo.btdmAntNum == 2)
 		EXhalbtc8723b2ant_SpecialPacketNotify(pBtCoexist, packetType);
 	else if (pBtCoexist->boardInfo.btdmAntNum == 1)
 		EXhalbtc8723b1ant_SpecialPacketNotify(pBtCoexist, packetType);
 
-/* 	halbtcoutsrc_NormalLowPower(pBtCoexist); */
 }
 
 void EXhalbtcoutsrc_BtInfoNotify(struct btc_coexist *pBtCoexist, u8 *tmpBuf, u8 length)
@@ -1055,14 +1040,12 @@ void EXhalbtcoutsrc_BtInfoNotify(struct btc_coexist *pBtCoexist, u8 *tmpBuf, u8
 	pBtCoexist->statistics.cntBtInfoNotify++;
 
 	/*  All notify is called in cmd thread, don't need to leave low power again */
-/* 	halbtcoutsrc_LeaveLowPower(pBtCoexist); */
 
 	if (pBtCoexist->boardInfo.btdmAntNum == 2)
 		EXhalbtc8723b2ant_BtInfoNotify(pBtCoexist, tmpBuf, length);
 	else if (pBtCoexist->boardInfo.btdmAntNum == 1)
 		EXhalbtc8723b1ant_BtInfoNotify(pBtCoexist, tmpBuf, length);
 
-/* 	halbtcoutsrc_NormalLowPower(pBtCoexist); */
 }
 
 void EXhalbtcoutsrc_HaltNotify(struct btc_coexist *pBtCoexist)
@@ -1102,14 +1085,12 @@ void EXhalbtcoutsrc_Periodical(struct btc_coexist *pBtCoexist)
 
 	/*  Periodical should be called in cmd thread, */
 	/*  don't need to leave low power again */
-/* 	halbtcoutsrc_LeaveLowPower(pBtCoexist); */
 
 	if (pBtCoexist->boardInfo.btdmAntNum == 2)
 		EXhalbtc8723b2ant_Periodical(pBtCoexist);
 	else if (pBtCoexist->boardInfo.btdmAntNum == 1)
 		EXhalbtc8723b1ant_Periodical(pBtCoexist);
 
-/* 	halbtcoutsrc_NormalLowPower(pBtCoexist); */
 }
 
 void EXhalbtcoutsrc_SetAntNum(u8 type, u8 antNum)
@@ -1119,10 +1100,8 @@ void EXhalbtcoutsrc_SetAntNum(u8 type, u8 antNum)
 		GLBtCoexist.boardInfo.btdmAntNum = antNum;
 	} else if (type == BT_COEX_ANT_TYPE_ANTDIV) {
 		GLBtCoexist.boardInfo.btdmAntNum = antNum;
-		/* GLBtCoexist.boardInfo.btdmAntPos = BTC_ANTENNA_AT_MAIN_PORT; */
 	} else if (type == BT_COEX_ANT_TYPE_DETECTED) {
 		GLBtCoexist.boardInfo.btdmAntNum = antNum;
-		/* GLBtCoexist.boardInfo.btdmAntPos = BTC_ANTENNA_AT_MAIN_PORT; */
 	}
 }
 
-- 
2.43.0

