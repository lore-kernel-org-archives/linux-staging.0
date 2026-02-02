Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9219D30F7EF
	for <linux-staging@lists.linux.dev>; Mon,  2 Feb 2026 07:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770016100; cv=none; b=jZybGWxmC8YYVaN5qihFoediDR0DGEXk8AXoxDS8OYfAstVRY3SV/IYCZASM8FWlxiQzg99vQufrLofaZSKOI/IC1Srn0GzBYUztpyj6Ybc/ptFUZH6p8QkkUL2KeAqs1MJQ6ltfMIhO0LDBCiBFSyJAyIcHGS4CxVBWk5q2QVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770016100; c=relaxed/simple;
	bh=Y2TihLrOXjfbjF9u/PEFAJ1IZQVaQ8uExnYSn5AvcKo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BP7WtMtJX99KhW3fWkZz+pgC7QkW4D47ZJSOk7R6oxGI4nt1H6D6RJFUGIheNVDuLM8qW7FPvsCw8NR5jQyuaIBPU9vNqHJd5ndKU4FyWJLw3yHA3x9JIz9LwuvxQT4AnZb/RZPrx9niYa3KNABChHMFHWjLTraj2PL4bUJXoSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FObIWHUN; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FObIWHUN"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4801d7c72a5so31485655e9.0
        for <linux-staging@lists.linux.dev>; Sun, 01 Feb 2026 23:08:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770016097; x=1770620897; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4WkmcG7TJgIhlqZphFb6n3UZ0JclZwmZQJHhSQXufXg=;
        b=FObIWHUNDOcwNjTeeLaXAy6mtJbNymDYtulvQ7RpPC7xAeeyggNzQRPQwltBnXEEoE
         msZMuCBLRCC5Hx+ASyEPkdeAHGBANQ4tF0yzZsGxiR/8Bbm4/ybaTY5kM8X5q0SjthH5
         4YP9ReHwIMFUyCFU421+i2UAl5fjs9djP7kTK/o7Ap/0EXywSUskS5YBba70t0MBGMYL
         WVODptH9wATlm/iDR1Ne0aTStvg9dZ5uW4hkVMyOqPdNSy+kgzUbOF7Z+iGjO8reSNo1
         OQ1FkAyCFCymxi1aiARsVnfxUVOxWXryiXDelO82nKgYFZm2+AcC07T9JC+9vSWu+3Mk
         zHOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770016097; x=1770620897;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4WkmcG7TJgIhlqZphFb6n3UZ0JclZwmZQJHhSQXufXg=;
        b=K/tAKa/6gaxtEnjfjrxrYlgCRCAUxB/W3bxqkZjbU9stQJf1iXyCJYx/KD4tkhqUEc
         AwOtYL/6rg9kvD0EXTeLvDKspJkRX71trp8NIPfufJexl0DwnsdQm/+1zVzZTvuR20Ux
         yxLmhOhTsK498yK081/uG2ZVmiTKVRiPjefohGR4/CyuDdjkGsczH9oDa9XqI7vtdDQe
         c67Uw9ndflmg5GP2ExqwqZkUnSj6y3eew16NYOFZKQ5bvDoaDHI04l8A7Ru7r6M4kxUV
         WAt7ewB1s+6UFWowWBAKLxE7m9yW0/KZWsbTmi5W6XnMGeWHXjndOOjc7PVyBAbzkjT7
         w8bw==
X-Forwarded-Encrypted: i=1; AJvYcCXKhQGroXkXeBiFEOzoP9F6PeYlIQNcTEnGR7xmfLcUnYRIEABIongH5PgmKfDRdkRO7mEzqDFzOXwGufcS@lists.linux.dev
X-Gm-Message-State: AOJu0Yz6iSHDZSi5pFxbh3cwFZrLw/5vbDMWvP76frmxLLOGGWSBwD3P
	aue4n9W2HNbSfjbR6O23eS/Hf7hPMrVr1vU+seQruDKY4wFEQPQsFWs=
X-Gm-Gg: AZuq6aIzjnwO9Sq1ctLdUos02uxDgfLCbBk+gtFUtgudNyulrBlDH5R8W1CFBlOJSDr
	xBPUTmH0Zq6UQ+PrTrWB8XganuBXqA0geBd7h9bFZaq4vuvErC8tHnzcMEA34JRuBNX0D++XEqn
	+/YJbrtIkisigE9hwIsP2rrMjHT6xd47roNamhiimLbd35cJ68praAaLqB2JSW9TJ6nglsbU0Gm
	x/PVYBZbqM3ApCHZnmZ2MVUbhu1SsquA566OzLNxmMvQK7a3ThefKMm1Ae3uFDarxuLVmQLNcxI
	M049MSLEg5ZbtIoy0lvv8kBvxZbLkYpc39wIQHjP7bsnH1fuQ8FsP2aq8udir817qBeu2j+vOQd
	XiyJLIIFuw6Rk5xzEVaZEsQlU61UaYWPcpqs1osnKMkJB8rjFKO6obw+R/NV9mXEWeYlHJYYCqr
	vuUiTDqV2KozY20LfB9nhpd0+A+I5xlRluwAyT7V6765GYIYjIgu7nAVeH0BwNZw==
X-Received: by 2002:a05:600c:4e0b:b0:480:6dff:e786 with SMTP id 5b1f17b1804b1-482db4f6f67mr120444815e9.37.1770016096807;
        Sun, 01 Feb 2026 23:08:16 -0800 (PST)
Received: from LGPC ([31.223.131.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806cde00e8sm371369315e9.6.2026.02.01.23.08.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Feb 2026 23:08:16 -0800 (PST)
From: Luka Gejak <lukagejak5@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Luka Gejak <lukagejak5@gmail.com>
Subject: [PATCH v1 4/5] staging: rtl8723bs: remove redundant MAC_ARG macro
Date: Mon,  2 Feb 2026 08:07:51 +0100
Message-ID: <20260202070752.3391-5-lukagejak5@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260202070752.3391-1-lukagejak5@gmail.com>
References: <20260202070752.3391-1-lukagejak5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver already uses the kernel's %pM format specifier for printing
MAC addresses. The MAC_ARG() macro was a no-op that simply returned its
argument, making it redundant when used with %pM.

Remove the MAC_ARG() macro definitions from ieee80211.h and
osdep_service.h, and update all call sites to pass the MAC address
pointer directly to %pM.

Also remove the unused IP_ARG() macro.

This addresses TODO item: find codes that can use %pM formatting.

Signed-off-by: Luka Gejak <lukagejak5@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c          | 2 +-
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c     | 8 ++++----
 drivers/staging/rtl8723bs/core/rtw_wlan_util.c    | 2 +-
 drivers/staging/rtl8723bs/include/ieee80211.h     | 2 --
 drivers/staging/rtl8723bs/include/osdep_service.h | 4 ----
 5 files changed, 6 insertions(+), 12 deletions(-)

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
index b61841bf16a5..8297cf85eb7b 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -5595,7 +5595,7 @@ u8 setkey_hdl(struct adapter *padapter, u8 *pbuf)
 		write_cam(padapter, cam_id, ctrl, addr, pparm->key);
 		netdev_dbg(padapter->pnetdev,
 			   "set group key camid:%d, addr:%pM, kid:%d, type:%s\n",
-			   cam_id, MAC_ARG(addr), pparm->keyid,
+			   cam_id, addr, pparm->keyid,
 			   security_type_str(pparm->algorithm));
 	}
 
@@ -5625,7 +5625,7 @@ u8 set_stakey_hdl(struct adapter *padapter, u8 *pbuf)
 	psta = rtw_get_stainfo(pstapriv, pparm->addr);
 	if (!psta) {
 		netdev_dbg(padapter->pnetdev, "%s sta:%pM not found\n",
-			   __func__, MAC_ARG(pparm->addr));
+			   __func__, pparm->addr);
 		ret = H2C_REJECTED;
 		goto exit;
 	}
@@ -5640,14 +5640,14 @@ u8 set_stakey_hdl(struct adapter *padapter, u8 *pbuf)
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
index 1098b0209200..8ae6fa6dd63e 100644
--- a/drivers/staging/rtl8723bs/include/ieee80211.h
+++ b/drivers/staging/rtl8723bs/include/ieee80211.h
@@ -506,8 +506,6 @@ Total: 28-2340 bytes
 
 #define DEFAULT_MAX_SCAN_AGE (15 * HZ)
 #define DEFAULT_FTS 2346
-#define MAC_ARG(x) (x)
-#define IP_ARG(x) (x)
 
 static inline int is_multicast_mac_addr(const u8 *addr)
 {
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
2.52.0

