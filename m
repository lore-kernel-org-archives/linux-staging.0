Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C12E37FF48
	for <linux-staging@lists.linux.dev>; Fri, 20 Mar 2026 12:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774009390; cv=none; b=fbEgDw9QjIkeJZbeLuqf6sEvl6e45DnJukCbLdhTE9vPeLsoWmk2HkfScdkmTv0gNh/WKYdwhZlSbXyUE9Qa37IA0/3LU1t1zkVoMpUlSb/OK2/ggLZQBGOPyB86VcbUnZHYzOvf4yH4z09xra4Q32xUGxJr9+/2Y9EhNyqykRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774009390; c=relaxed/simple;
	bh=icWkLMeZWuWfmZRd1Ljr0YLZUQzIU00t/CN68205X/k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q0QRK+uI4bYfSI/tRk3h1rYHYlIFSyBDZRnicSeBIle7FEl1zEy8T+UIHelJ3DJuFrs4wPa5M19EVHOQsNsq+HuAS5C/J55ULqoT+epJt2JBW8n26qJqBuZVZ5JE9RxI84ejZ1oR/vYYRPOIHGV4zdmcJzykXZug+ABEkozObKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DhQav6A7; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DhQav6A7"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-79a62a2bb8cso20606807b3.3
        for <linux-staging@lists.linux.dev>; Fri, 20 Mar 2026 05:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774009388; x=1774614188; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pySEiyV+aXAO5suHkEL6+Osorsn0L6e75U5d5KlNXxI=;
        b=DhQav6A7duICY5Oa1ihjbrQhMaaR5h/eRr4IbPvpOQya+q9WxTe4kCCHTL8M+fu6b4
         IGhN7if5Ctn3vpLxVHl4FUQ1F69rT8YiiqufC0JpRWIO1m8/UljtLOqeoQbhwkl9l6n8
         MZflfSaVzco/fx6bv5gvC1Rcm8YSTctzXYSPC/JQJnfWLmSEkMxrbkNmvCBJkxTVQ0wR
         i94yhuTDJXybS8y0e7r6pVCAvgEehFVjePXss5y6nQPjRl5nIW16oulGffwmpvytQJ6m
         k9701yukd5wvWnARC/Ci9D69NDMde0Q8Y3n+uzzurXskhBlmWErmT7zB+FJMBhAXjbLq
         6pPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774009388; x=1774614188;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pySEiyV+aXAO5suHkEL6+Osorsn0L6e75U5d5KlNXxI=;
        b=kNgM5aAi3WjEmw+lPxtpAkzKGUoXdAmL1PAmAKnYUeHunx2Yz4MPGjkut8jy2nbR+g
         bnubskTuNg2vjFWkdIpj+IQcTC7f2E2U2C+Gq5jV74ipga4w7CT/SusZWVV0MoS0C3dF
         UpD3ibbQdAMc+Wpe4Xw7iZ2jpGIGMfOVICSs4W0kIAD+YM0CiYoY7a9JxA9k/uW1N/mt
         EMDwzGjDCMlvZ4cQakXAwC5g5qpgUurJ/zQpcqNDSOb7p/4JqzRqaU6cZD7yUYro1Osd
         ppem1Hu3Y3iF7pXaSw/CjWo/etXKIIOe2GO4ZL8VLSn3x5i9Y3TEoGrLCXssn+x2c97R
         qCSQ==
X-Gm-Message-State: AOJu0YycK58AL8JOG/b10UVT/L5H43XwWqzZMt40+3to7kppxLKYScSb
	ncTz/Sn5YJDB7pt6Kl/MxWnWH741YVZL74u3JzS/T6WCck2S5U/m7ORd
X-Gm-Gg: ATEYQzxsuo9nh3QwfUETO/1MdUWW+v5vLJrFRZkC4SsXT6C4rxnB1BhztU5O5U2P5Me
	dnqd/fgsjeElpPQ42Z91t/bOxIk3IElmLLzUNwp4JHJGizcgeNmG3ojLLtFMGXUeTQIe9AhyjUn
	X0NVAmEFWrkKwW38KY3KwlRSKyuD6IjIznFIqAnJ4orC0yJLauOFAJfyISxSeVyDu1lZn2xxvDU
	Hm+62JXQPR4IO/ixoa21P844c/+tHUU5MM6A1kBjOCVTw7bwM7IixIHPhmVQArc26e+dBCqBEIf
	GJBi6eYvYE59D6PyAHRUZXggfKWSBB4LRCbp0Rya1XLSM8anND0bSF+fzyFajnEUDQppV9R03mG
	nJoJKo31Ay4KcOJIRxjmdHI5qf9vJOMQOz6eaOili2hdg39h8bNIfISeOVH9uzk3oHDYEZyC0Pc
	xGl5s1oxqfNfLBnVDmNTPDsw==
X-Received: by 2002:a05:690c:a04d:b0:798:ff2f:267a with SMTP id 00721157ae682-79a90c0a1bamr21256067b3.52.1774009388394;
        Fri, 20 Mar 2026 05:23:08 -0700 (PDT)
Received: from archlinux ([93.186.98.153])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79a9057f820sm14075977b3.40.2026.03.20.05.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 05:23:08 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH 4/5] staging: rtl8723bs: remove custom is_broadcast_mac_addr() function
Date: Fri, 20 Mar 2026 15:15:02 +0300
Message-ID: <20260320122119.19563-5-nikolayof23@gmail.com>
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
index 6ffb7be93350..5fa9060f8fcc 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -1275,7 +1275,7 @@ static signed int validate_recv_mgnt_frame(struct adapter *padapter, union recv_
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

