Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC7613B2FE4
	for <linux-staging@lists.linux.dev>; Mon, 23 Mar 2026 15:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774278542; cv=none; b=h7AtvMe9ynzkqpNj+FfpBXE/BKb89V+RXWf8Pr4SFEfHJ/bf9zL0aqtyMGCTNG+98uen4pasgZjvaoYcot7n2lNu/KRliMZTj49vwKD2TtVNxbX7Sa31BmfMmKT3yb9sUzE7q+qSflOSQ0rd8rydvD/RWFuNgGTh+RHLWeNFIa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774278542; c=relaxed/simple;
	bh=RbwaeSwvWTa0BKEV0eLdZ9+NolRNM2GLoTmMi6Mv5Gw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NM0U91MnE3nT6r1NGlReimfpExPRlxJE7Upz1GwLx9yo9hcmn9IqIUOOKrjlUf/+FP1R7RUEqmu37aFvGHB6PK1UsGecq0r6tL12PTiI7kXtHYKzdaQGaY9tIHfAl2ppXkEsvMgbCjpM5JtiCfGNgy7ont2nndvBlu1NWe5LaG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EeZJ9f6D; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EeZJ9f6D"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-79ab50ee951so3115337b3.2
        for <linux-staging@lists.linux.dev>; Mon, 23 Mar 2026 08:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774278540; x=1774883340; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gjh5dqMM4RMJ5VvvPLJsOrbOzXjQ/+i3+4MGUiUhyIQ=;
        b=EeZJ9f6DCIF00rS4VfI8AX/8Ol0JXS9Of0Rwih6eAEimVp5rBzSqpqv+WqXRkU0zZK
         YZcU3IuDpix0JZUpRoFCaafRSiJmlWq2sfotKlQoUWOaLmMz1k5JxiuJNdetdzjQrQZu
         YZZ10IMy2ioehxXDqrvt92A18PMYi7qvcqcXbDLNL3t3x9bNJwaWoHybgQHNsPBUK16I
         d7SjDpgwK/QFeFdq2FhjnGoN9TtsV3E5Sahl2gz1C2p25N6GNxVpbd2REUHCFLYP+J8N
         uz3fHgRiAlCICVxqOuA52SshurhcQWqQxEqN8Vf5eoU5J9mGiKCPk88cI281trPfJh/7
         FG+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774278540; x=1774883340;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gjh5dqMM4RMJ5VvvPLJsOrbOzXjQ/+i3+4MGUiUhyIQ=;
        b=g1FqkqaColhZ6X/ZmjC47gsbaUyh/7m7DP6HgfxVizidn+SjuxHfbYt8fmpBO74834
         W1Prl5icEGewMz2+DwIk9KdeHYoTa4RPMsFmphFsq6CjMwBmlrh/JZU9rp93tCzu0yWF
         ryX1fSaZw1zUSX5BuHaE+01l4GzqS+sKoBfrVryXvYTNART1m1rEUUcn1BpuIQxgmn4I
         L0AYucLyCvH5rSaAWiCycY6RPzzSnoHzPbdNn3wLliL6iVTw2CUa/Fs7yFcAHttklXp+
         e12LKoPlMU6MK1cThafKH3P8s1QsbG2buoeRlljpUxzBPoDwaIi0ZXHbsB8KQ1d8hLmi
         sPFA==
X-Gm-Message-State: AOJu0YyxpLFUFaBLSRL0+ODN5mf+p3rIbBD/OKTgbZVqze8PmuE054PA
	HEdoOtSQ78g02MkzJJOJZ+/LZviixTxSr6kyUp+L7xqk96su+BMug7XNK+77tQ==
X-Gm-Gg: ATEYQzyGMzIXm5Q/LEhfs4HnyzSIohxu6Vu4ZnFaVq/36MSUWdaSiVgXwelti9zLH63
	NWKWGEvkIfEhXq9onp1do3+HMGudGT3RGnCvSYkF1KzgMMbxeIU28GiZF7+fDsapuNoVVJrnL8f
	Qd36cNipxfZke/WUU8+0Qrly9n9DI158/KFdoaMz7V3t51rRQ8x1gSDL7U4ieh+NSTprdtPfPGU
	7pmyH1KsVzNrFiAb+rtr8dE1ZgM/lytswI0VWVWubI34ASso8Q2TZFo4AD6g42cpNqlG5rzPMfW
	alhR7DPW8jcu2o3xPck2HJomjsxRUcdNUIr/UrCpC24wWDC+FP8Fh9eIF4DfqyVb1aRLMlE7jhR
	oz2iX0NKDiWAtG1nD1hkHIlCG5DVEIBaJdJ4MiqR/MJmB2OhrFD9qsvCqNwy7NDiUfx2VYnA1gf
	DzxprWnTojSV7+uxcevMjHFg==
X-Received: by 2002:a05:690c:1d:b0:79a:b49a:cb22 with SMTP id 00721157ae682-79ab49adabamr37037007b3.49.1774278539611;
        Mon, 23 Mar 2026 08:08:59 -0700 (PDT)
Received: from archlinux ([93.186.98.153])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79a90425d76sm58662227b3.22.2026.03.23.08.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 08:08:58 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	ethantidmore06@gmail.com,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH v2 5/6] staging: rtl8723bs: remove custom is_broadcast_mac_addr() function
Date: Mon, 23 Mar 2026 18:06:07 +0300
Message-ID: <20260323150650.7168-6-nikolayof23@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260323150650.7168-1-nikolayof23@gmail.com>
References: <20260320122119.19563-1-nikolayof23@gmail.com>
 <20260323150650.7168-1-nikolayof23@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the custom broadcast address checking function with standard
kernel is_broadcast_ether_addr() func for this.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ioctl_set.c | 2 +-
 drivers/staging/rtl8723bs/core/rtw_recv.c      | 2 +-
 drivers/staging/rtl8723bs/core/rtw_security.c  | 4 ++--
 drivers/staging/rtl8723bs/include/ieee80211.h  | 6 ------
 4 files changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
index c20a143ace4b..904ff0e14ec5 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
@@ -12,7 +12,7 @@ u8 rtw_validate_bssid(u8 *bssid)
 	u8 ret = true;
 
 	if (is_zero_ether_addr(bssid) ||
-	    is_broadcast_mac_addr(bssid) ||
+	    is_broadcast_ether_addr(bssid) ||
 	    is_multicast_mac_addr(bssid))
 		ret = false;
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index c5182438fd05..09cff9499a59 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -1274,7 +1274,7 @@ static signed int validate_recv_mgnt_frame(struct adapter *padapter, union recv_
 			    GetAddr1Ptr(precv_frame->u.hdr.rx_data),
 			    ETH_ALEN))
 			psta->sta_stats.rx_probersp_pkts++;
-		else if (is_broadcast_mac_addr(GetAddr1Ptr(precv_frame->u.hdr.rx_data)) ||
+		else if (is_broadcast_ether_addr(GetAddr1Ptr(precv_frame->u.hdr.rx_data)) ||
 			 is_multicast_mac_addr(GetAddr1Ptr(precv_frame->u.hdr.rx_data)))
 			psta->sta_stats.rx_probersp_bm_pkts++;
 		else
diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index b98bc1aa9cbe..c7017c8afddb 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -531,7 +531,7 @@ u32 rtw_tkip_decrypt(struct adapter *padapter, u8 *precvframe)
 					if (start == 0)
 						start = jiffies;
 
-					if (is_broadcast_mac_addr(prxattrib->ra))
+					if (is_broadcast_ether_addr(prxattrib->ra))
 						no_gkey_bc_cnt++;
 					else
 						no_gkey_mc_cnt++;
@@ -1223,7 +1223,7 @@ u32 rtw_aes_decrypt(struct adapter *padapter, u8 *precvframe)
 					if (start == 0)
 						start = jiffies;
 
-					if (is_broadcast_mac_addr(prxattrib->ra))
+					if (is_broadcast_ether_addr(prxattrib->ra))
 						no_gkey_bc_cnt++;
 					else
 						no_gkey_mc_cnt++;
diff --git a/drivers/staging/rtl8723bs/include/ieee80211.h b/drivers/staging/rtl8723bs/include/ieee80211.h
index 37b9b363c073..c3e06e693495 100644
--- a/drivers/staging/rtl8723bs/include/ieee80211.h
+++ b/drivers/staging/rtl8723bs/include/ieee80211.h
@@ -512,12 +512,6 @@ static inline int is_multicast_mac_addr(const u8 *addr)
 	return ((addr[0] != 0xff) && (0x01 & addr[0]));
 }
 
-static inline int is_broadcast_mac_addr(const u8 *addr)
-{
-	return ((addr[0] == 0xff) && (addr[1] == 0xff) && (addr[2] == 0xff) &&   \
-		(addr[3] == 0xff) && (addr[4] == 0xff) && (addr[5] == 0xff));
-}
-
 #define CFG_IEEE80211_RESERVE_FCS (1<<0)
 #define CFG_IEEE80211_COMPUTE_FCS (1<<1)
 
-- 
2.53.0

