Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47F4D1A9FB0
	for <linux-staging@lists.linux.dev>; Tue,  7 Apr 2026 14:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775572731; cv=none; b=GJLoT5D0vlv1Q73yRJS4Er4fFLS06EUgxq7tev3KBC9rj41s+Hay7Ngi9y5Yv13K1mUSZwtgwKrXFPKNB5pU66wbMlNbU2AX+YZZolA0WSSmw2fEkbq569eBEVVGTne5zZE1K+fQKIwjYu1vTcAoHOEnXLBmYdh6amSyVAzU4Vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775572731; c=relaxed/simple;
	bh=+GD9vwr24iL4GjHbgqREOCVbq4fX2Mpx5zf5etFgUns=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dYqiI9+5HpaSG51iW+87Whnam2GY750TjfwavIdVpQh6VX+8T+ap7PZ65iCrbEazdvRPp5i0V41d1HD9mH3IVrnCnNWLhIX2dBkcPdY+e04ytiq8hX5fBbLdQ8rzMpe824Cjlk018CnRfKvNUHJ+Pte11CVshoVAyD5CgGQ0cgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kkLlsUko; arc=none smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kkLlsUko"
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-64ef161129bso4154448d50.1
        for <linux-staging@lists.linux.dev>; Tue, 07 Apr 2026 07:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775572729; x=1776177529; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YRvx1mAj1AC90ZA0Nr5IjKZLILKFUlWTYHY3GrvB3H4=;
        b=kkLlsUkor+77ilUuLGsrz8D1nmd3D5fMUK6Q2N4mJfio8cNBJnvEqiNQsboyW8rg/H
         tjasIJ0XDTgjLh36lLJcASJnq3oViu4Ls8zBxXRjWGPzCBpDKI/M0hW1lf7pRaiYURJi
         5USGo9bJtaeqY+lk4hW/Qkw4NSFml14N9852cfIiDAsMIF1TJNX3IQlgBauj7SOU71Qg
         zFY7tbKpYcH0Y09LgIjOeFz1rwhEsXbYi6bVYLd94eW8H7agjc10U08QKQJ3RHg5W1Ct
         mqGKCALGnXbCVZumEH9lONtvKQjTNs7y9G2DuKfG5eujsFZ+/s3HzNv6DIH0cSsFyXGo
         Dqmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775572729; x=1776177529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YRvx1mAj1AC90ZA0Nr5IjKZLILKFUlWTYHY3GrvB3H4=;
        b=M45VDO+1re9H/JdPOS9/GgaSX9A+7BHi1xCZCfMzH8Iix97oz4iPouTovM0I/YFz1c
         XhyUh1cWc6WzLutsiH6B8pWxHBq/aDxzHC5E4Fi56lNmOdVmA8APtwXmiXgBLEneUr/h
         S/szhLIW5ng4eFbsRuS7Wut2OSHmj1CtGir33q+7DiIPb4IKiJIUw/ZbWtIzrlOrwxAf
         kCjuRzf2QxdJplNaTy2La6umMLPKP8PNjw65/SfOoYg/znA4BrUdvEsETqNbkL9if1Fw
         RFwqz4y4TuNQlOoVhpcPCEHBlvKHw0abvNt1PT+8pyZe43RgChdxmqjJKanZf2cNA7Ig
         jEXQ==
X-Gm-Message-State: AOJu0YyES3cE0xMoOeMS7oFpWKJYwfnWHCe6NmVU9ADzugaGYKwP4XHV
	0szLZFKWnyGWsQk32IjWj+ZbOAHmYJW6vONDl3yUuCKAydJqvzj3Wi1l
X-Gm-Gg: AeBDieuiCKs1mnQZS6TxpkmbpMww7FiYkxg3En6caLebA3Zy85exanI/5eRK/UOkC20
	oWqpEfxlQdyGK32ILhlQA0u672UrMWbu/DsWAMgvdThdFbv+htArr9BLqFLL3z4OD7mg4RYrak2
	xbIoQ/yu9h+w6bYBN/LILtVVzkcgH1s82mwBK+9oamSpOL8qZzVIbn6g8JgtLFvMOR7LsY5WZ+M
	k3AA9eqftB1CGY5eMiAEEOd2jKE1Ih5q67EcLI99E3ygme15k0rXeqzhflecsI6DCr01oa0xuz9
	S7QSD1zk+WpK18+Ymfqa970t4YkJeCMZfw5VZ3X14CCAf6Z0bcBOUW5esVtTwF3e8mHZQqLofGv
	qqZEuyiLCF2Lf5JZee6EKfk6dfKFl16XDn9vgyvSCDZ3o21uD4pL+b67WnnwI+IDcHu/wb28sky
	gxh44ioPPLfpyXBJypirDaFx1Z
X-Received: by 2002:a05:690e:128c:b0:64f:c830:1e2f with SMTP id 956f58d0204a3-650487ff73bmr16355183d50.40.1775572729171;
        Tue, 07 Apr 2026 07:38:49 -0700 (PDT)
Received: from archlinux ([185.140.161.214])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6503a828f3csm7868159d50.3.2026.04.07.07.38.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 07:38:48 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH 5/6] staging: rtl8723bs: remove the rtw_warn_on() macro
Date: Tue,  7 Apr 2026 17:33:30 +0300
Message-ID: <20260407143622.9767-6-nikolayof23@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260407143622.9767-1-nikolayof23@gmail.com>
References: <20260407143622.9767-1-nikolayof23@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the rtw_warn_on() macro, which simply calls WARN_ON(), and
replace all its uses with the standard WARN_ON().

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c          | 2 +-
 drivers/staging/rtl8723bs/core/rtw_mlme.c         | 2 +-
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c     | 4 ++--
 drivers/staging/rtl8723bs/core/rtw_wlan_util.c    | 4 ++--
 drivers/staging/rtl8723bs/core/rtw_xmit.c         | 2 +-
 drivers/staging/rtl8723bs/hal/hal_com.c           | 2 +-
 drivers/staging/rtl8723bs/include/osdep_service.h | 1 -
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 8 ++++----
 8 files changed, 12 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index c1185c25ed36..72d5905a48e9 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -1603,7 +1603,7 @@ static void rtw_btinfo_hdl(struct adapter *adapter, u8 *buf, u16 buf_len)
 	cmd_idx = info->cid;
 
 	if (info->len > buf_len - 2) {
-		rtw_warn_on(1);
+		WARN_ON(1);
 		len = buf_len - 2;
 	} else {
 		len = info->len;
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 8e9387ad2810..3ecf4f979c03 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -1697,7 +1697,7 @@ int rtw_select_roaming_candidate(struct mlme_priv *mlme)
 	struct	wlan_network	*candidate = NULL;
 
 	if (!mlme->cur_network_scanned) {
-		rtw_warn_on(1);
+		WARN_ON(1);
 		return ret;
 	}
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 5f00fe282d1b..3d7beb83887d 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -3082,7 +3082,7 @@ int issue_nulldata(struct adapter *padapter, unsigned char *da, unsigned int pow
 		else
 			rtw_hal_macid_wakeup(padapter, psta->mac_id);
 	} else {
-		rtw_warn_on(1);
+		WARN_ON(1);
 	}
 
 	do {
@@ -5890,7 +5890,7 @@ int rtw_chk_start_clnt_join(struct adapter *padapter, u8 *ch, u8 *bw, u8 *offset
 	bool connect_allow = true;
 
 	if (!ch || !bw || !offset) {
-		rtw_warn_on(1);
+		WARN_ON(1);
 		connect_allow = false;
 	}
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
index 6a7c09db4cd9..c04419c9c3fc 100644
--- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
+++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
@@ -577,7 +577,7 @@ s16 rtw_camid_alloc(struct adapter *adapter, struct sta_info *sta, u8 kid)
 			netdev_dbg(adapter->pnetdev,
 				   FUNC_ADPT_FMT " group key with invalid key id:%u\n",
 				   FUNC_ADPT_ARG(adapter), kid);
-			rtw_warn_on(1);
+			WARN_ON(1);
 			goto bitmap_handle;
 		}
 
@@ -623,7 +623,7 @@ s16 rtw_camid_alloc(struct adapter *adapter, struct sta_info *sta, u8 kid)
 				netdev_dbg(adapter->pnetdev,
 					   FUNC_ADPT_FMT " group key id:%u no room\n",
 					   FUNC_ADPT_ARG(adapter), kid);
-			rtw_warn_on(1);
+			WARN_ON(1);
 			goto bitmap_handle;
 		}
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 10a778619466..f3a143d41f48 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -2035,7 +2035,7 @@ inline bool xmitframe_hiq_filter(struct xmit_frame *xmitframe)
 		allow = true;
 	else if (registry->hiq_filter == RTW_HIQ_FILTER_DENY_ALL) {
 	} else
-		rtw_warn_on(1);
+		WARN_ON(1);
 
 	return allow;
 }
diff --git a/drivers/staging/rtl8723bs/hal/hal_com.c b/drivers/staging/rtl8723bs/hal/hal_com.c
index 728a2171fbcb..4e3cd1547e01 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com.c
@@ -576,7 +576,7 @@ void SetHwReg(struct adapter *adapter, u8 variable, u8 *val)
 
 	switch (variable) {
 	case HW_VAR_INIT_RTS_RATE:
-		rtw_warn_on(1);
+		WARN_ON(1);
 		break;
 	case HW_VAR_SEC_CFG:
 	{
diff --git a/drivers/staging/rtl8723bs/include/osdep_service.h b/drivers/staging/rtl8723bs/include/osdep_service.h
index cd73fa294a56..99c26b446f72 100644
--- a/drivers/staging/rtl8723bs/include/osdep_service.h
+++ b/drivers/staging/rtl8723bs/include/osdep_service.h
@@ -64,7 +64,6 @@ static inline void flush_signals_thread(void)
 		flush_signals(current);
 }
 
-#define rtw_warn_on(condition) WARN_ON(condition)
 #define _RND(sz, r) ((((sz)+((r)-1))/(r))*(r))
 
 extern void rtw_free_netdev(struct net_device *netdev);
diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 098456e97c96..4f16803b96a2 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -377,7 +377,7 @@ void rtw_cfg80211_ibss_indicate_connect(struct adapter *padapter)
 			rtw_cfg80211_inform_bss(padapter, cur_network);
 		} else {
 			if (!scanned) {
-				rtw_warn_on(1);
+				WARN_ON(1);
 				return;
 			}
 			if (!memcmp(&scanned->network.ssid, &pnetwork->ssid,
@@ -385,7 +385,7 @@ void rtw_cfg80211_ibss_indicate_connect(struct adapter *padapter)
 			    !memcmp(scanned->network.mac_address, pnetwork->mac_address, ETH_ALEN))
 				rtw_cfg80211_inform_bss(padapter, scanned);
 			else
-				rtw_warn_on(1);
+				WARN_ON(1);
 		}
 
 		if (!rtw_cfg80211_check_bss(padapter))
@@ -418,7 +418,7 @@ void rtw_cfg80211_indicate_connect(struct adapter *padapter)
 		struct wlan_network *scanned = pmlmepriv->cur_network_scanned;
 
 		if (!scanned) {
-			rtw_warn_on(1);
+			WARN_ON(1);
 			goto check_bss;
 		}
 
@@ -427,7 +427,7 @@ void rtw_cfg80211_indicate_connect(struct adapter *padapter)
 			    sizeof(struct ndis_802_11_ssid)))
 			rtw_cfg80211_inform_bss(padapter, scanned);
 		else
-			rtw_warn_on(1);
+			WARN_ON(1);
 	}
 
 check_bss:
-- 
2.53.0

