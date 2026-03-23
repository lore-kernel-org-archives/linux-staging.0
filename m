Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC8426ED28
	for <linux-staging@lists.linux.dev>; Mon, 23 Mar 2026 15:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774278552; cv=none; b=lOfcxh7OC/LK8VLBD4PJnJMLmz4sIDkXhk8d3Gi1nG6TZmt48Sy4hwD3x96iNlKdU/SOcUaCub3pLteDYJ4gSzt4M9EbQraBxQ7nqfGn7F6vkRAGfwSR/sJnLk8Hh9KmmEhXJtR9SfHvymsJCU6NNKojnLmKhWNG2yOIoPmhxok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774278552; c=relaxed/simple;
	bh=sqT3YFWjHT+X10X976BBHLZAY/VS967C7xuXkiuQvJI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dcf2WJlkZFlflDHfdlW2ZVSRIsbJBHpmbS8rBtHJnInliXEkRQhjHbA5Qo5GftR83mFvuaHqi4aboc9D5TRHdKDlA1SZE3DCIiOdAAlIEEm+FGgnMo+VGCqW4c/KNHlf7SzaZ/czxPLKyvAQhM/gG6IMxTpQ0WJFlJyisYv9Z0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zc/3O+KJ; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zc/3O+KJ"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-7986e538decso17624067b3.1
        for <linux-staging@lists.linux.dev>; Mon, 23 Mar 2026 08:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774278550; x=1774883350; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5TXXkU5vf04T7/zBEwpx9/oEcxKTW7iIIRIaUMTbajA=;
        b=Zc/3O+KJGBBoiwjRHZ7FRmkNJtowadN+CCbXA5DpIlLChJjhlbIjxM4zfaNM5Tioj4
         p7tDTHxhRKqwnPnxTIxn10om8FLjTRIi8COSPpdszZlJnXDBW+HwSKu6+B2bWGjaIi9+
         a04hyVJ6hvg9xv0fWdWVUaluKYyddzAljF95/4YQnB8QPHH+eS5ASNzGWmd6jTYgGOsQ
         V1LbakyHBRNa9pxa5HPgdrt889U59FSodOCK+we+h7Og2+oogzh3+raacgYaGEMOG0s9
         Fkzafnvn/XpDTW6DrTCCDa0Uoz2ppV0sJXrgSSuUIbamNTw83Uvrgct2ZoonhYLSUMEC
         ncDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774278550; x=1774883350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5TXXkU5vf04T7/zBEwpx9/oEcxKTW7iIIRIaUMTbajA=;
        b=eNU1jUBloAnMUw9vJlBqtJ4IiDuBjUmte3c/3UIZomTAn5pqwFYnXSFmzgxSGvaskr
         uIfJg9qziA/hHR/tA7w56jYrg1NUvmUWOmN97P5ncrHkPF892JgOZbtPh9/G7poGwDFA
         FSYnUfQQozHpAvu1aK9MRYRlkrrq5trwqlDJ3cfBcomz3sZlTqZQQ2CoPQVWw51eeRwc
         /fSqDP6pSIZGcjh2CQaNkPq02imhsGkiF2NGdOnozr8L5ZSyYIjIXVOuo6XTzrc1WOvr
         4SG8813xEKgofLdBjbu5kX7GdeTc11RezYyk3QVj71j28/OGNNtHnjVWgZnxP78VnVND
         w/ig==
X-Gm-Message-State: AOJu0YwqtT5rtpDioByH1uMyDRz0v5czOVMUylN5HcrfdFsMYKxd2pNb
	mqIpJ0XjslLXIYny5IyegvmHV6rJNtvrexJye4SQeavFwVj5vLDqqGBk
X-Gm-Gg: ATEYQzy9h25XQUQRE5ZMMrD5NInRWs042F/wKZPh0DxPtL+KMJePZQU87Ehjke4PP7o
	NSOHuF/7dLpcqmUXvPfmgLkrThuz0YR0wTIq3VK7NgJAnadOwT18NF8VxJdAVJ+qXpFIDIFTPOj
	F2CSQkIMZeL5bNgkH4PRpBm77QGO62IF3OIV/8T79LIGC500BwslPsDzJCG/+0sm/zGURm9sUhb
	6D9MiC/VELbNotvnL6QmMqn3zjT3aK7gZmgRg+HweVq1KsjvvxoKqk9w32Qdghxe9VoYQgwt3cW
	0ymSInhS0EqrddBKP75AVrZBKmMSTBHdZlw7xdVmpzGdPiQN3Yl18G9K43AmddOVFw/O2U5Jh4V
	oVYJjjb7gGD7HTIx2Y1LKjUfRvJGgqvO8QTTWe9bMOlB23GPsYaHzm2lGwETLiyQf4nEN8r1KJs
	f8yEWFPl7tuXgBZ8ayNJvqvg==
X-Received: by 2002:a05:690c:e3c2:b0:79a:440c:fbc7 with SMTP id 00721157ae682-79a90aa2fc3mr132059067b3.1.1774278549835;
        Mon, 23 Mar 2026 08:09:09 -0700 (PDT)
Received: from archlinux ([93.186.98.153])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79a90425d76sm58662227b3.22.2026.03.23.08.09.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 08:09:07 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	ethantidmore06@gmail.com,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH v2 6/6] staging: rtl8723bs: remove custom is_multicast_mac_addr() function
Date: Mon, 23 Mar 2026 18:06:08 +0300
Message-ID: <20260323150650.7168-7-nikolayof23@gmail.com>
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
index 09cff9499a59..f78194d508df 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -1275,7 +1275,7 @@ static signed int validate_recv_mgnt_frame(struct adapter *padapter, union recv_
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

