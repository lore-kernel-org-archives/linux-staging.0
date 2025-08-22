Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F0453043C1
	for <linux-staging@lists.linux.dev>; Fri, 22 Aug 2025 13:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755870919; cv=none; b=HgWyokPB/5xb2xi8plQbOtgl/uad/Vdk4maxXotiLU1io0V9y02ifDbC9tBZxKJktdyPbX2ODvM+kbfCRwrQZWs/Pqbxu/wikBrjChLdfQUuIQx+1iQm2I1qA8/5yB6K952jISHNfHnGXKJXn9La6LPaeUDIysbI+B/Yje8B4Hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755870919; c=relaxed/simple;
	bh=utP1enymQOWYdzzMJg+XO+S1ofOs3Yc/33ydjTF2pI0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qJSjArJjKS/d//qFsHGjWYc4uUCuNpzoOFIj/c+8KFy5UThgnzFdVFuwFZXlsC2cZyQV1Xnj/rpzqIldUlNoRFtHZ4Rk60v18G37HhLRk3tqUiaw4sjEkQvOTUlowtkydw88ov9NjfLmbvObaOvkGSh8b3bhJZR2jH2P2sxqTRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y/mt5TI8; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y/mt5TI8"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-afcb78da8a7so320970566b.1
        for <linux-staging@lists.linux.dev>; Fri, 22 Aug 2025 06:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755870915; x=1756475715; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n6A7evPtMaphzVeoghc8+RfaVdSDwr1jUwsy0Dt/40M=;
        b=Y/mt5TI8EFbo3TYEV4mOnqql4MGYz3KAUgHcATyywQ9aBaoxjD+OLveTj/Tb2SUmsb
         GFpWYKAKuTY+L2KSO/ZmIYPEicXiYWUc3S5w10dF7SYn36jtpJURjkDuPlMtG0IJHJT0
         A+LR63bLjf7Rhk9LM7CF8qxcOMX1kk7hKDD5qHvLK2unx78ayRd+SQ0BockLksFs14eS
         b4cHeNbSH3k90IPDQSI80/RCmtOYibgJ0IwH1UnqtMKFGf7Blii9Bwh9xxf0oV3it+/O
         kW3LCTUyXXQEuRK2qb/9L9TR4OHowzGoHEhGSkQ+tV1kJXwRcvJhumXsn3pKl93yL/Qp
         PiBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755870915; x=1756475715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n6A7evPtMaphzVeoghc8+RfaVdSDwr1jUwsy0Dt/40M=;
        b=B3W4Z8cWkS9+VG6v4b6OhXwKKLViYg0MMo06QBEZgWZbofqaNmrTLuBjv23PjlSxTQ
         rnfygPb6CWZZI2TTy7d7yhi9AABMaLMUcrU7NnDrTgRST+Q1VYkCvp8hEwNvmBGPvKZ3
         fIsyR3wKObcJ4bVjbZ2ZrSb5q8KQPG6UDgI+WZsjwj4eXdEjKSWklbY1XzF/hx8OJHBN
         fS8UTAL3W3BqZCVzcP1qaezTYUve0ADiYn1DjcAKsMnoprKUcuV72uEjXmJfCFvGSYVY
         mkdBZJoq6KzYjcLLa34IIO7NDz/o5pCoIThg4MkeVNIFRhCFQLBkf9DIU/3seOo2B5mL
         +8ew==
X-Forwarded-Encrypted: i=1; AJvYcCXZdqiPNmmjEZKbBCUkcvpRjnrlccaYMzaJ+cNWsGN06bkjzZfBLE7zPDTkv+Bzb5OnRKbDrjkm6hxD0wgR@lists.linux.dev
X-Gm-Message-State: AOJu0YwOXNmxq53vqJi8Qz7xOq8y/i2U5i74jRpmmNQmKl7J6Yiplfgf
	AO3E9ibzcJPUZN3lVrqzEnWTKFbshLftTg9SJE/leF2UCuRbnMwDmCJR
X-Gm-Gg: ASbGncs6vkJ7qKvQpnqNI4xQ/lVfBZrZi1swcR0Lj0TOj64FDWLuRfFB351H5zBxOYj
	OcYB/eHhry8H91clUEs+/LEEOtmN0k2A1Wm6Ib3vMLp4XzcW6tIJHOUjmyvs04vScsABuOCQ+Qb
	HtOnXZhf7VfiuOi5RB5WGc87XdAN1uP/HMHXbGQRsDAFR0FT/PmLWspzmrqpbrNt4GGlCbppbKj
	M/L5lDQUy07YZUpac33QRFXA+ufS13iqgtVWTHWksBVx2NEHsaEGwkL4RE4TIUChKnNw5YmsM0C
	ZRD+k9iyUWz/8fmIKmAU1yGXpu5l5Lp95Dm8VvObakw+Yw2ZUZk6epOtgL/z4M4FRKPDI/a/kxf
	AIUMjU7WLCyTsx0ab7kmid4TwEw==
X-Google-Smtp-Source: AGHT+IGU7sy/pKzJ00e6fQ5Px6JIl9af9XWJZ5whF3tCatP/hSD/bH6jHYxOj7b6rMBX1whEym4WGg==
X-Received: by 2002:a17:907:d2a:b0:ae0:e065:ddfb with SMTP id a640c23a62f3a-afe29048018mr290926466b.18.1755870915375;
        Fri, 22 Aug 2025 06:55:15 -0700 (PDT)
Received: from tumbleweed ([95.90.184.246])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afded307138sm612353866b.45.2025.08.22.06.55.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 06:55:15 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 08/13] staging: rtl8723bs: move rtw_os_alloc_msdu_pkt to rtw_recv.c
Date: Fri, 22 Aug 2025 15:54:13 +0200
Message-ID: <20250822135418.118115-9-straube.linux@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250822135418.118115-1-straube.linux@gmail.com>
References: <20250822135418.118115-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the function rtw_os_alloc_msdu_pkt from os_dep/recv_linux.c to
core/rtw_recv.c to reduce code in the os_dep directory.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_recv.c     | 40 +++++++++++++++++++
 .../staging/rtl8723bs/include/recv_osdep.h    |  1 -
 drivers/staging/rtl8723bs/os_dep/recv_linux.c | 40 -------------------
 3 files changed, 40 insertions(+), 41 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index cda51aab752d..4947099d8595 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -1622,6 +1622,46 @@ static signed int wlanhdr_to_ethhdr(union recv_frame *precvframe)
 	return _SUCCESS;
 }
 
+static struct sk_buff *rtw_os_alloc_msdu_pkt(union recv_frame *prframe, u16 nSubframe_Length, u8 *pdata)
+{
+	u16 eth_type;
+	struct sk_buff *sub_skb;
+	struct rx_pkt_attrib *pattrib;
+
+	pattrib = &prframe->u.hdr.attrib;
+
+	sub_skb = rtw_skb_alloc(nSubframe_Length + 12);
+	if (!sub_skb)
+		return NULL;
+
+	skb_reserve(sub_skb, 12);
+	skb_put_data(sub_skb, (pdata + ETH_HLEN), nSubframe_Length);
+
+	eth_type = get_unaligned_be16(&sub_skb->data[6]);
+
+	if (sub_skb->len >= 8 &&
+		((!memcmp(sub_skb->data, rfc1042_header, SNAP_SIZE) &&
+		eth_type != ETH_P_AARP && eth_type != ETH_P_IPX) ||
+		!memcmp(sub_skb->data, bridge_tunnel_header, SNAP_SIZE))) {
+		/*
+		 * remove RFC1042 or Bridge-Tunnel encapsulation and replace
+		 * EtherType
+		 */
+		skb_pull(sub_skb, SNAP_SIZE);
+		memcpy(skb_push(sub_skb, ETH_ALEN), pattrib->src, ETH_ALEN);
+		memcpy(skb_push(sub_skb, ETH_ALEN), pattrib->dst, ETH_ALEN);
+	} else {
+		__be16 len;
+		/* Leave Ethernet header part of hdr and full payload */
+		len = htons(sub_skb->len);
+		memcpy(skb_push(sub_skb, 2), &len, 2);
+		memcpy(skb_push(sub_skb, ETH_ALEN), pattrib->src, ETH_ALEN);
+		memcpy(skb_push(sub_skb, ETH_ALEN), pattrib->dst, ETH_ALEN);
+	}
+
+	return sub_skb;
+}
+
 static int amsdu_to_msdu(struct adapter *padapter, union recv_frame *prframe)
 {
 	int	a_len, padding_len;
diff --git a/drivers/staging/rtl8723bs/include/recv_osdep.h b/drivers/staging/rtl8723bs/include/recv_osdep.h
index 227e172bf1c3..1e332ea63207 100644
--- a/drivers/staging/rtl8723bs/include/recv_osdep.h
+++ b/drivers/staging/rtl8723bs/include/recv_osdep.h
@@ -18,7 +18,6 @@ extern void rtw_recv_returnpacket(struct net_device *cnxt, struct sk_buff *pretu
 int	rtw_init_recv_priv(struct recv_priv *precvpriv, struct adapter *padapter);
 void rtw_free_recv_priv(struct recv_priv *precvpriv);
 
-struct sk_buff *rtw_os_alloc_msdu_pkt(union recv_frame *prframe, u16 nSubframe_Length, u8 *pdata);
 void rtw_os_recv_indicate_pkt(struct adapter *padapter, struct sk_buff *pkt, struct rx_pkt_attrib *pattrib);
 
 #endif /*  */
diff --git a/drivers/staging/rtl8723bs/os_dep/recv_linux.c b/drivers/staging/rtl8723bs/os_dep/recv_linux.c
index ebe169507dc8..4d3a42f6f9ad 100644
--- a/drivers/staging/rtl8723bs/os_dep/recv_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/recv_linux.c
@@ -9,46 +9,6 @@
 #include <net/cfg80211.h>
 #include <linux/unaligned.h>
 
-struct sk_buff *rtw_os_alloc_msdu_pkt(union recv_frame *prframe, u16 nSubframe_Length, u8 *pdata)
-{
-	u16 eth_type;
-	struct sk_buff *sub_skb;
-	struct rx_pkt_attrib *pattrib;
-
-	pattrib = &prframe->u.hdr.attrib;
-
-	sub_skb = rtw_skb_alloc(nSubframe_Length + 12);
-	if (!sub_skb)
-		return NULL;
-
-	skb_reserve(sub_skb, 12);
-	skb_put_data(sub_skb, (pdata + ETH_HLEN), nSubframe_Length);
-
-	eth_type = get_unaligned_be16(&sub_skb->data[6]);
-
-	if (sub_skb->len >= 8 &&
-		((!memcmp(sub_skb->data, rfc1042_header, SNAP_SIZE) &&
-		  eth_type != ETH_P_AARP && eth_type != ETH_P_IPX) ||
-		 !memcmp(sub_skb->data, bridge_tunnel_header, SNAP_SIZE))) {
-		/*
-		 * remove RFC1042 or Bridge-Tunnel encapsulation and replace
-		 * EtherType
-		 */
-		skb_pull(sub_skb, SNAP_SIZE);
-		memcpy(skb_push(sub_skb, ETH_ALEN), pattrib->src, ETH_ALEN);
-		memcpy(skb_push(sub_skb, ETH_ALEN), pattrib->dst, ETH_ALEN);
-	} else {
-		__be16 len;
-		/* Leave Ethernet header part of hdr and full payload */
-		len = htons(sub_skb->len);
-		memcpy(skb_push(sub_skb, 2), &len, 2);
-		memcpy(skb_push(sub_skb, ETH_ALEN), pattrib->src, ETH_ALEN);
-		memcpy(skb_push(sub_skb, ETH_ALEN), pattrib->dst, ETH_ALEN);
-	}
-
-	return sub_skb;
-}
-
 void rtw_os_recv_indicate_pkt(struct adapter *padapter, struct sk_buff *pkt, struct rx_pkt_attrib *pattrib)
 {
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
-- 
2.51.0

