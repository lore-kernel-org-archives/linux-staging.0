Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE6123750CC
	for <linux-staging@lists.linux.dev>; Fri, 20 Mar 2026 12:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774009404; cv=none; b=IGXJSqL2TPn8JLm+WOpCfsJnRsa00CRyndFmBklxoR+oOg1AHBh9bVVi9KBQjJeOhXKwb3VQrDrmDb3QFw39Y8iYC2VE1uVycJS4fvKI0Wi9+fDiTSGehcuUzgsvOi2hsS/IDxB6J2WCMUMtMD1SI5C8ltXtH6cPLSC9BBoGSIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774009404; c=relaxed/simple;
	bh=SOIk2HBGEq1GfI5EQMCOGFLt8dCuWtRC3fiexvvtHCA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lXjqnxslJDT2NRyFZE5UYSTQ2wmSttB7/eA5mN4Uf6+0zCjSvOVwkDth/IxcxAAPTEiHWNW496rpFIN7vNLiLKHcUISbZhlXSinLqOv7n0RzfMlG9iVAgtHUya5v6t72/ZhihJXEQC+KJjfougAlx5c+4EiYqeQLlzlK4WLLbtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DnuYX09v; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DnuYX09v"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-79a5a37113aso21026497b3.2
        for <linux-staging@lists.linux.dev>; Fri, 20 Mar 2026 05:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774009402; x=1774614202; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kVootN429d7GR1/wx7h4OY3SrgnjGKnOEreQ4AYC+tE=;
        b=DnuYX09v9MyHbA6hCZk3cjBCZt1yUokWjgvZik03pF8OCiRddNnSEM+zaMqvtvQtVl
         SsHY1Kr1lhkbEF+6n9bzCGetWismbZdNsW7VeqPpzLn5U0HS5Jz0WEjC5KZPfA6fhyTt
         +kR0jwlizkjuoA9KfcRx4LUBcg1QKST7E4TRGq9WqHusfHdDczhmMDniI96jLaZWcHua
         IzcAHMJOQyopKxgItjGr61siuw977u0XweZw2gC15r9zeNTOt0ll2LWyMhfopMu2YUBP
         aGtIvJjWkuE1w0otMNKiP49YUVb3WSZLCUETsnd02vQjtUlW2ogFOJqjuVzzsTEcNygK
         Wk6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774009402; x=1774614202;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kVootN429d7GR1/wx7h4OY3SrgnjGKnOEreQ4AYC+tE=;
        b=IJFbZuugvzJJ0NKL6BJhcZ3dEEyHJTwj/TEZGUC6vp5X6H8dy3td4JReaAh0B24xB6
         c9Qf8f5Bol+8sANVEjGUJIyPdbg3IVwmGBspQceM2XlRCz8Nw3N9uV3Zi7jEiuriXLV2
         ZE0I51LWcuRpANBEWWdWRsmPccHWMFHzxvxIFiwse9KjBOXOqMWtR1ueg0WdLskwftqT
         SiTsRbLlOL3ibqycptG3Cy2FU6i1Eak6o8HLD27M8MWwc6Aaer9vop0T7TFhVJPdyJPb
         xR0e2H/VWvZ503Un7jFhs8cqFzaH2H1w8MOxZoBNMNLbsVirk47/vA5zD7P7mRpb54hl
         MubA==
X-Gm-Message-State: AOJu0Yx9UMGQ1HFeig0M6tyV6huN/KVI8Zcx2Gxmjs6oST2bXYh10L8X
	oDnzutVfa1Rgm3V4GMzEhwtr6JadI3z6/iO1oQNX4LgRqJCST4W5KAIFGf/Ucw==
X-Gm-Gg: ATEYQzwB9YulCZK8myMEQXUW6QyCH5p2tjQZFQMQDLPvJckfQ3YWKMJVfH4i/mV4gux
	r1RAoqD76S0uwfRQBhNMVkXMQ+/F9Bzmr+18+EOuRFK94UFacrBUHhRdbbcIo/GNV1r1ok8+KXS
	krBX8rOnpO90EGbCSawtUAMSqq3rSQiOEQamtH7dGiQmlis1Yh6NbTy9X+5OhuUlpNUiiI3gFur
	o5EKD0JICeuIZ0zeu+i5xiQ7+RTguo87Fmx9sKMC2CXoBVdDZFQBsIsAwvAFBkpvXRHD+bwq4m8
	guhl0RemlXM7GlvzFpajwkuTcM5jRFz6h4pXOpi4Ogid/kxtFoiF5SoeobTKPvfogW+9KaTrN2n
	ynz+mZgyDklS2958H0g3rrwuvVftMbbtvSONT2xIWdQWZtCdebw44CK3tGc3jilrndh21pTKiH6
	KXPkXaO8Btt9y2soBYG/tXIg==
X-Received: by 2002:a05:690c:450e:b0:79a:649e:2666 with SMTP id 00721157ae682-79a90aa032dmr27743357b3.10.1774009401847;
        Fri, 20 Mar 2026 05:23:21 -0700 (PDT)
Received: from archlinux ([93.186.98.153])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79a9057f820sm14075977b3.40.2026.03.20.05.23.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 05:23:21 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH 5/5] staging: rtl8723bs: remove custom is_multicast_mac_addr() function
Date: Fri, 20 Mar 2026 15:15:03 +0300
Message-ID: <20260320122119.19563-6-nikolayof23@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260320122119.19563-1-nikolayof23@gmail.com>
References: <20260320122119.19563-1-nikolayof23@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

is_multicast_mac_addr() is redundant reimplementation of standard
is_multicast_ether_addr() func.
Remove it and switch to use is_multicast_ether_addr().

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ioctl_set.c | 2 +-
 drivers/staging/rtl8723bs/core/rtw_recv.c      | 2 +-
 drivers/staging/rtl8723bs/include/ieee80211.h  | 5 -----
 3 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
index 904ff0e14ec5..c70541f95a73 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
@@ -13,7 +13,7 @@ u8 rtw_validate_bssid(u8 *bssid)
 
 	if (is_zero_ether_addr(bssid) ||
 	    is_broadcast_ether_addr(bssid) ||
-	    is_multicast_mac_addr(bssid))
+	    is_multicast_ether_addr(bssid))
 		ret = false;
 
 	return ret;
diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index 5fa9060f8fcc..78abe3929816 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -1276,7 +1276,7 @@ static signed int validate_recv_mgnt_frame(struct adapter *padapter, union recv_
 			    ETH_ALEN))
 			psta->sta_stats.rx_probersp_pkts++;
 		else if (is_broadcast_ether_addr(GetAddr1Ptr(precv_frame->u.hdr.rx_data)) ||
-			 is_multicast_mac_addr(GetAddr1Ptr(precv_frame->u.hdr.rx_data)))
+			 is_multicast_ether_addr(GetAddr1Ptr(precv_frame->u.hdr.rx_data)))
 			psta->sta_stats.rx_probersp_bm_pkts++;
 		else
 			psta->sta_stats.rx_probersp_uo_pkts++;
diff --git a/drivers/staging/rtl8723bs/include/ieee80211.h b/drivers/staging/rtl8723bs/include/ieee80211.h
index c3e06e693495..fbb12fe31a6c 100644
--- a/drivers/staging/rtl8723bs/include/ieee80211.h
+++ b/drivers/staging/rtl8723bs/include/ieee80211.h
@@ -507,11 +507,6 @@ Total: 28-2340 bytes
 #define DEFAULT_FTS 2346
 #define IP_ARG(x) (x)
 
-static inline int is_multicast_mac_addr(const u8 *addr)
-{
-	return ((addr[0] != 0xff) && (0x01 & addr[0]));
-}
-
 #define CFG_IEEE80211_RESERVE_FCS (1<<0)
 #define CFG_IEEE80211_COMPUTE_FCS (1<<1)
 
-- 
2.53.0

