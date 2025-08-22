Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3781307AE1
	for <linux-staging@lists.linux.dev>; Fri, 22 Aug 2025 13:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755870921; cv=none; b=YXDIF1EySngP+zJxvD1pX28LnWeYjdi0MrzgMS5fZPxtjHwc8LSL6Tk4wrHwhLfHVutKN/BSlReQ8Fb+XV4rygvm+eh95P85IImc05cYq8zgFVr8yp4IT/s2YEhr+G0AWw0yCBn3GEeosPFq5uMp8jirED5UMluYvu+y8UVsu78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755870921; c=relaxed/simple;
	bh=jbGeJDfBrQsrI6K552vuZyIVAy3M3w0dBEW/sZSdp+4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QpbJU+aA0p7CSnQTgOTBjlk3I8vxcdhyKy6ps+1cnsCU9g1gDX/jSUGqeUhTztld/pJpqdFykD7wfi1S3idklinyt55iS+kbxScKVvEYKifI1oDgKvccuJB6D34YWs0xalrD0OKy/j3KCM56V9hXNM8nLL2TzTmkL+dGclsuHvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FGsvqkyj; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FGsvqkyj"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-afcb731caaaso315245966b.0
        for <linux-staging@lists.linux.dev>; Fri, 22 Aug 2025 06:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755870917; x=1756475717; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=io7wDwBQXXAz1NvC/Ow1c011ouqTM7JuaW9NsL/t1R4=;
        b=FGsvqkyj74u2PqMGtX96TOqN+LMsWuHmnTpiFJ4R7/oOdwgwEcTVCodbsWvx/dzjXj
         t60KXCqLKG50jklaomq7KqLX9A/99XGmbb6UPEc4qibXQpJxIXvxwM9QHfDymxiHb8Bl
         qVQOekgVegNc+E8KXj3RFGIZJ08l1ph29w4H7TxHh45cN17ZpQgAcnIYvF6ORoXhxxpt
         wHzYuL/fdpj7/UtbRkrIlnMp0FkI37vuL9mhBtc9TQ8JS3l6h5JIdDdoYN4p3sLR+nOK
         LHnKUNQLWxLjiNCMQ3z85ItNqIXoPPKtOvz8Aq2YtbmwVRp+a8QmA61tGxKTxILeLNrx
         K3hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755870917; x=1756475717;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=io7wDwBQXXAz1NvC/Ow1c011ouqTM7JuaW9NsL/t1R4=;
        b=CDabXyTT8R5ygmt2BAfUEFNCF7toFgbLZV+tIWEJQWDtNuO4g3gAGq9xE3U8KSEbUE
         gJWS/bdQDvOwWErKiEgMtf2DgkpcT7tnEujY6ZpjLQfDAHFU2mn2m5jtjxBA+P2iDc17
         AqtBHaeEwOe1ymEKr2LtKfegcAG+Qyq4+6XY+9+q3HSGV6xoXv0Qp8T4gaD7FGywinVi
         cihM9br4j/R/RMS4DUbL44UtOl7E20uy7uE7mmZJDa05D/7+rPVHEI9bEijdmff8vlfK
         vjX8ZYs+zs1dQXuKzZw0RDnZk5yvFKljIwfDQdgt58L9eLWem5Ca5bcjQiafaDJaaRTf
         FUSg==
X-Forwarded-Encrypted: i=1; AJvYcCWwqRnOYc5BcxmzMZmAmYCB0Oovr2XDaUDe0dUMsKVfoXbqrn+BqmQ3TuONRdqidsW67ieEH18jFfVXPr4z@lists.linux.dev
X-Gm-Message-State: AOJu0YxTBWwEsKBK0+XsDbdNM1SqhmZbgMpHYSFoBSVdP6qkoKt+6gUf
	VjGNaY1ZezgZS4iOtGlIuo021S7hoy6SBYEr/ketNZqeP6SD2pJZALWZ
X-Gm-Gg: ASbGncs7xqKd3Xk0vwG6wpvk9cOBH/sykszsx7NPDgnWGx/PRchf73x47WBvxC+enZG
	H+xRurz4YHgsIBSJ+A+yKz0NhTBT+hYaGFlugnwyIOtI3M+ca+2nCZinvmq5xnyCCzVmKAp8GA1
	RGvSMuE5BXHTJg+10Twvn3/SF3YjhOq7luGBigamVONN5I65Mm/t4OTPKrMRtEedkMlpowvb2O0
	lfvAbgQHMA7MPsniT3IX6MhnXeaVpokrCBgedHq/uEhfEO7MP7hcoH8hLgxJiwifEiIpzAjjYeW
	uMqxI5hn9ZceciV5vlRvX/V9dkpI1MG3ldpE4NVZdSD2MgJ0jBQJOeu9qd2ASn+4FuPKNLT3lvE
	qngk0lFr9G3LahWY6SRddFCeKVQ==
X-Google-Smtp-Source: AGHT+IE/FeGYUCVLqZ8N8wPz7Bukf3xdRWQw9cOc2U+3j+L9NlTp/lL6x6ME19mu4AvsOfWSEcnPuA==
X-Received: by 2002:a17:907:7204:b0:afa:2775:58b6 with SMTP id a640c23a62f3a-afe28fc1a87mr296664866b.17.1755870917050;
        Fri, 22 Aug 2025 06:55:17 -0700 (PDT)
Received: from tumbleweed ([95.90.184.246])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afded307138sm612353866b.45.2025.08.22.06.55.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 06:55:16 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 10/13] staging: rtl8723bs: move rtw_os_recv_indicate_pkt to rtw_recv.c
Date: Fri, 22 Aug 2025 15:54:15 +0200
Message-ID: <20250822135418.118115-11-straube.linux@gmail.com>
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

Move the function rtw_os_recv_indicate_pkt from os_dep/recv_linux.c to
core/rtw_recv.c to reduce code in the os_dep directory.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_recv.c     | 47 +++++++++++++++++++
 .../staging/rtl8723bs/include/recv_osdep.h    |  2 -
 drivers/staging/rtl8723bs/os_dep/recv_linux.c | 45 ------------------
 3 files changed, 47 insertions(+), 47 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index a8b388822719..924a0c415a1e 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -1662,6 +1662,53 @@ static struct sk_buff *rtw_alloc_msdu_pkt(union recv_frame *prframe, u16 nSubfra
 	return sub_skb;
 }
 
+static void rtw_os_recv_indicate_pkt(struct adapter *padapter, struct sk_buff *pkt, struct rx_pkt_attrib *pattrib)
+{
+	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
+
+	/* Indicate the packets to upper layer */
+	if (pkt) {
+		if (check_fwstate(pmlmepriv, WIFI_AP_STATE) == true) {
+			struct sk_buff *pskb2 = NULL;
+			struct sta_info *psta = NULL;
+			struct sta_priv *pstapriv = &padapter->stapriv;
+			int bmcast = is_multicast_ether_addr(pattrib->dst);
+
+			if (memcmp(pattrib->dst, myid(&padapter->eeprompriv), ETH_ALEN)) {
+				if (bmcast) {
+					psta = rtw_get_bcmc_stainfo(padapter);
+					pskb2 = skb_clone(pkt, GFP_ATOMIC);
+				} else {
+					psta = rtw_get_stainfo(pstapriv, pattrib->dst);
+				}
+
+				if (psta) {
+					struct net_device *pnetdev = (struct net_device *)padapter->pnetdev;
+					/* skb->ip_summed = CHECKSUM_NONE; */
+					pkt->dev = pnetdev;
+					skb_set_queue_mapping(pkt, rtw_recv_select_queue(pkt));
+
+					_rtw_xmit_entry(pkt, pnetdev);
+
+					if (bmcast && pskb2)
+						pkt = pskb2;
+					else
+						return;
+				}
+			} else {
+				/*  to APself */
+			}
+		}
+
+		pkt->protocol = eth_type_trans(pkt, padapter->pnetdev);
+		pkt->dev = padapter->pnetdev;
+
+		pkt->ip_summed = CHECKSUM_NONE;
+
+		rtw_netif_rx(padapter->pnetdev, pkt);
+	}
+}
+
 static int amsdu_to_msdu(struct adapter *padapter, union recv_frame *prframe)
 {
 	int	a_len, padding_len;
diff --git a/drivers/staging/rtl8723bs/include/recv_osdep.h b/drivers/staging/rtl8723bs/include/recv_osdep.h
index 1e332ea63207..20ce25132700 100644
--- a/drivers/staging/rtl8723bs/include/recv_osdep.h
+++ b/drivers/staging/rtl8723bs/include/recv_osdep.h
@@ -18,6 +18,4 @@ extern void rtw_recv_returnpacket(struct net_device *cnxt, struct sk_buff *pretu
 int	rtw_init_recv_priv(struct recv_priv *precvpriv, struct adapter *padapter);
 void rtw_free_recv_priv(struct recv_priv *precvpriv);
 
-void rtw_os_recv_indicate_pkt(struct adapter *padapter, struct sk_buff *pkt, struct rx_pkt_attrib *pattrib);
-
 #endif /*  */
diff --git a/drivers/staging/rtl8723bs/os_dep/recv_linux.c b/drivers/staging/rtl8723bs/os_dep/recv_linux.c
index 4d3a42f6f9ad..193725cc60bc 100644
--- a/drivers/staging/rtl8723bs/os_dep/recv_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/recv_linux.c
@@ -9,49 +9,4 @@
 #include <net/cfg80211.h>
 #include <linux/unaligned.h>
 
-void rtw_os_recv_indicate_pkt(struct adapter *padapter, struct sk_buff *pkt, struct rx_pkt_attrib *pattrib)
-{
-	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 
-	/* Indicate the packets to upper layer */
-	if (pkt) {
-		if (check_fwstate(pmlmepriv, WIFI_AP_STATE) == true) {
-			struct sk_buff *pskb2 = NULL;
-			struct sta_info *psta = NULL;
-			struct sta_priv *pstapriv = &padapter->stapriv;
-			int bmcast = is_multicast_ether_addr(pattrib->dst);
-
-			if (memcmp(pattrib->dst, myid(&padapter->eeprompriv), ETH_ALEN)) {
-				if (bmcast) {
-					psta = rtw_get_bcmc_stainfo(padapter);
-					pskb2 = skb_clone(pkt, GFP_ATOMIC);
-				} else {
-					psta = rtw_get_stainfo(pstapriv, pattrib->dst);
-				}
-
-				if (psta) {
-					struct net_device *pnetdev = (struct net_device *)padapter->pnetdev;
-					/* skb->ip_summed = CHECKSUM_NONE; */
-					pkt->dev = pnetdev;
-					skb_set_queue_mapping(pkt, rtw_recv_select_queue(pkt));
-
-					_rtw_xmit_entry(pkt, pnetdev);
-
-					if (bmcast && pskb2)
-						pkt = pskb2;
-					else
-						return;
-				}
-			} else {
-				/*  to APself */
-			}
-		}
-
-		pkt->protocol = eth_type_trans(pkt, padapter->pnetdev);
-		pkt->dev = padapter->pnetdev;
-
-		pkt->ip_summed = CHECKSUM_NONE;
-
-		rtw_netif_rx(padapter->pnetdev, pkt);
-	}
-}
-- 
2.51.0

