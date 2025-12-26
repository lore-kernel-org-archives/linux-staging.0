Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66095A59
	for <linux-staging@lists.linux.dev>; Fri, 26 Dec 2025 01:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766712652; cv=none; b=QUuUOHoSUoOou5+X+Q0rrDH2kpLcb467EOiqRIrzSDztzDpTVkrI06s+gMh6vMqOOx9h4ZoYtjtXgtVn+C+pRGIe5+JheTijiQwDEyO0KMyVL+mDEVf9gjWH/kVSenepjSP2qS2H4txC12Dpb2+RzTRchk3ch6R8XBhswot8f2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766712652; c=relaxed/simple;
	bh=NZXUrOGm+XbAm+CEN1ZkeFMXr+AedgQzxZ1qRdAN1gk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=T6Lva0Ew/UYlp8kmlrT7Sz2hvOuifLNwUVpMzX7XEiPb8Qnnf9yEGDod2NtwbIJmFmM4cy/ZlxnLwIgX3tjfZ07e8oOarTAUZ6DkkZ65C6klsSyeIhPccIrtybxmNssuWSRxhyimCEYmXUsvZaVlppa/3Vg72rvODqkCw7jhMsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eRBZYQ9G; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eRBZYQ9G"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2a0d67f1877so86803135ad.2
        for <linux-staging@lists.linux.dev>; Thu, 25 Dec 2025 17:30:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766712651; x=1767317451; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VmqnODCO9tgmA3yptXg1Glt8WLfLf00e8TjTnZcCYYI=;
        b=eRBZYQ9GcUqpPrFfrGJLEYQLeKw12+HB/pO03W6KEeqQSCDPeWgQyBxnZOw5ph29s/
         kXnIHLNFJUO4+DVzXmTUGSSY+t4Qn/GYF7Zrr137SgcAc6udE/qGftz7Fmo5u2vKoTJN
         qPLWmQraKYTVMXg7x80uIIH5EHfqvoz6XKzRYCSJbXSXWNE62igjtUX0EgCTPrXfMgBG
         CDjkE5c8cxcVh5db7PQ4WD8K01pR6PlFt1y68112QHNgcV05BptzlUCtscCeeS+k8YKC
         ohhzXeiJWjsSL/YNOUyd3ipdHlitZ0CpNle3IaOYhbMrfsCRv+QL1Oo6P5BmXGrwDnf2
         OciA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766712651; x=1767317451;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VmqnODCO9tgmA3yptXg1Glt8WLfLf00e8TjTnZcCYYI=;
        b=J7+QYgLKdL7qEr/sqEKO9SLc+s7tPC+y27hoSm5G7jTQCuUYpxsSwDsGvn5CEDY1Eb
         FdhI1XyY1JvC1ipe7dlF7DaYbZTHGabBAyLdCgHuX7xpRNb+aQ8g6uPGpgziYL+2c8jF
         ks88y2Gd6FgmTXD3lnZgZy5c1YIqQFkeqyRwB6LKxSOFcYFwBTzL7KJmG+RLOn+vqPCt
         hCL632KtTOVNP5AxwzDveWfF92edM81LCrYNc2u6y8EQiAAWC0dqFR5DzMHGC5f/I/6s
         IdbsGX46THT0Wl2t74n6XpeaUZD08gAJaxu1spznDjOKSkX+Kzi6HJ3wmt/+qlBDJi0o
         PgdA==
X-Forwarded-Encrypted: i=1; AJvYcCV9BShwXs/258LBjC1gMoWTqxGOFk7bHwRp+Rj0EujDGHPjNi41fb4f58CvxEMp3L/1HNhwwDPyZMqlYdmp@lists.linux.dev
X-Gm-Message-State: AOJu0Yyd+TYMwU4/WlMq3EEeLIDOi3gzyJFCjRFRQW8Sxu+nnledFINZ
	xbkrLOna9eeq+LuQJYLRG+/pwi97fX/pNQtKaJT04kLPcgRKGT9paTVn
X-Gm-Gg: AY/fxX42rHvtYeIXk5Smbe6qUS8FPWdow/OOGN69dIIDiTpjb9/nW5VhV1NSUtuXHnZ
	iaD4Inf9zkCVvb2XQ5XLz9ty+ybd4f8m6ZeYaU6XEqeaTFfGLIYLKA175WtwUrf4gDfCrtrKnJQ
	Wtkz0qfBUkpvqNrrAXzs8wKyq+tjNrAliWroE1/lZxSau7wKCoVQnuBwhW6ZAK6bVRsyIlzrYG/
	JRSIT5c0CIOPCp8CF0AelWk4Clt+yD8K7pUVRWIGf1j6X8an3p8CiCQ+hXPxjg3WUU9kRFDLBR7
	brhX/f7Glt0An/ZYowcCedRemt5s5zZTwMy+jMk1NGOGQP9NKOQf46n3cd92rlPXVUFDCyn8iSd
	jnJ4BjGKGIEmngcEwnXUOdnDM1HPmYkUIWoVgD+MSCYsB7bx5j1lpiJmghsuYifpzsMpssokuHJ
	49d+TDAYFG/PcLka5FbV7rOfqoOi0oh0mdXJPeC/l8Jhvv5FwtL60vkVSsD3AqBLdEzH97k6aBZ
	iFkkOVDskVwrCUNVX66mucs
X-Google-Smtp-Source: AGHT+IGlMhtiUcIaroVjtb7vBTrVSN93VzEzDLfpwdNIgpGfSWjvHclHAKCc7q166vX8tiy/+KW65Q==
X-Received: by 2002:a17:902:d58f:b0:295:4936:d1e9 with SMTP id d9443c01a7336-2a2f272bdc3mr225473405ad.36.1766712650601;
        Thu, 25 Dec 2025 17:30:50 -0800 (PST)
Received: from cent.. ([2409:40c1:5c:f279:1ad5:6596:d5b7:c076])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a322d76a19sm141780215ad.101.2025.12.25.17.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Dec 2025 17:30:50 -0800 (PST)
From: Yuvraj Singh Chauhan <ysinghcin@gmail.com>
To: gregkh@linuxfoundation.org
Cc: straube.linux@gmail.com,
	hansg@kernel.org,
	dan.carpenter@linaro.org,
	knavaneeth786@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yuvraj Singh Chauhan <ysinghcin@gmail.com>
Subject: [PATCH] staging: rtl8723bs: Remove redundant MAC_ARG macro
Date: Fri, 26 Dec 2025 07:00:35 +0530
Message-Id: <20251226013035.206284-1-ysinghcin@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MAC_ARG(x) macro is a useless identity macro that just returns its
argument unchanged. It was used alongside the %pM format specifier for
printing MAC addresses, but %pM already handles MAC address formatting
directly without needing any wrapper macro.

This commit removes the macro definition from both:

include/osdep_service.h
include/ieee80211.h

And removes all 6 usages throughout the driver

Signed-off-by: Yuvraj Singh Chauhan <ysinghcin@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c          | 2 +-
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c     | 8 ++++----
 drivers/staging/rtl8723bs/core/rtw_wlan_util.c    | 2 +-
 drivers/staging/rtl8723bs/include/ieee80211.h     | 1 -
 drivers/staging/rtl8723bs/include/osdep_service.h | 4 ----
 5 files changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index ef2d92b5588a..27eddd22e064 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -930,7 +930,7 @@ u8 rtw_clearstakey_cmd(struct adapter *padapter, struct sta_info *sta, u8 enqueu
 		while ((cam_id = rtw_camid_search(padapter, sta->hwaddr, -1)) >= 0) {
 			netdev_dbg(padapter->pnetdev,
 				   "clear key for addr:%pM, camid:%d\n",
-				   MAC_ARG(sta->hwaddr), cam_id);
+				   sta->hwaddr, cam_id);
 			clear_cam_entry(padapter, cam_id);
 			rtw_camid_free(padapter, cam_id);
 		}
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index ac49bfbaa5bb..2c5668923374 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -5604,7 +5604,7 @@ u8 setkey_hdl(struct adapter *padapter, u8 *pbuf)
 		write_cam(padapter, cam_id, ctrl, addr, pparm->key);
 		netdev_dbg(padapter->pnetdev,
 			   "set group key camid:%d, addr:%pM, kid:%d, type:%s\n",
-			   cam_id, MAC_ARG(addr), pparm->keyid,
+			   cam_id, addr, pparm->keyid,
 			   security_type_str(pparm->algorithm));
 	}
 
@@ -5634,7 +5634,7 @@ u8 set_stakey_hdl(struct adapter *padapter, u8 *pbuf)
 	psta = rtw_get_stainfo(pstapriv, pparm->addr);
 	if (!psta) {
 		netdev_dbg(padapter->pnetdev, "%s sta:%pM not found\n",
-			   __func__, MAC_ARG(pparm->addr));
+			   __func__, pparm->addr);
 		ret = H2C_REJECTED;
 		goto exit;
 	}
@@ -5649,14 +5649,14 @@ u8 set_stakey_hdl(struct adapter *padapter, u8 *pbuf)
 		while ((cam_id = rtw_camid_search(padapter, pparm->addr, -1)) >= 0) {
 			netdev_dbg(padapter->pnetdev,
 				   "clear key for addr:%pM, camid:%d\n",
-				   MAC_ARG(pparm->addr), cam_id);
+				   pparm->addr, cam_id);
 			clear_cam_entry(padapter, cam_id);
 			rtw_camid_free(padapter, cam_id);
 		}
 	} else {
 		netdev_dbg(padapter->pnetdev,
 			   "set pairwise key camid:%d, addr:%pM, kid:%d, type:%s\n",
-			   cam_id, MAC_ARG(pparm->addr), pparm->keyid,
+			   cam_id, pparm->addr, pparm->keyid,
 			   security_type_str(pparm->algorithm));
 		ctrl = BIT(15) | ((pparm->algorithm) << 2) | pparm->keyid;
 		write_cam(padapter, cam_id, ctrl, pparm->addr, pparm->key);
diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
index 5ffefa50699e..3f71e62d0198 100644
--- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
+++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
@@ -617,7 +617,7 @@ s16 rtw_camid_alloc(struct adapter *adapter, struct sta_info *sta, u8 kid)
 				netdev_dbg(adapter->pnetdev,
 					   FUNC_ADPT_FMT " pairwise key with %pM id:%u no room\n",
 					   FUNC_ADPT_ARG(adapter),
-					   MAC_ARG(sta->hwaddr), kid);
+					   sta->hwaddr, kid);
 			else
 				netdev_dbg(adapter->pnetdev,
 					   FUNC_ADPT_FMT " group key id:%u no room\n",
diff --git a/drivers/staging/rtl8723bs/include/ieee80211.h b/drivers/staging/rtl8723bs/include/ieee80211.h
index 1098b0209200..0f28c904a714 100644
--- a/drivers/staging/rtl8723bs/include/ieee80211.h
+++ b/drivers/staging/rtl8723bs/include/ieee80211.h
@@ -506,7 +506,6 @@ Total: 28-2340 bytes
 
 #define DEFAULT_MAX_SCAN_AGE (15 * HZ)
 #define DEFAULT_FTS 2346
-#define MAC_ARG(x) (x)
 #define IP_ARG(x) (x)
 
 static inline int is_multicast_mac_addr(const u8 *addr)
diff --git a/drivers/staging/rtl8723bs/include/osdep_service.h b/drivers/staging/rtl8723bs/include/osdep_service.h
index 8b1634f4091e..6458ff95ff9d 100644
--- a/drivers/staging/rtl8723bs/include/osdep_service.h
+++ b/drivers/staging/rtl8723bs/include/osdep_service.h
@@ -91,10 +91,6 @@ static inline int rtw_bug_check(void *parg1, void *parg2, void *parg3, void *par
 
 #define _RND(sz, r) ((((sz)+((r)-1))/(r))*(r))
 
-#ifndef MAC_ARG
-#define MAC_ARG(x) (x)
-#endif
-
 extern void rtw_free_netdev(struct net_device *netdev);
 
 /* Macros for handling unaligned memory accesses */
-- 
2.34.1

