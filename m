Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B81305E08
	for <linux-staging@lists.linux.dev>; Fri, 22 Aug 2025 13:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755870919; cv=none; b=sC4vnKSlq5THLE9CMshNlHZCIXH/d+CMZUSZsmEEuDnJVe6fOEE1NBQe1IBhVd5kBmOGzCQRINEJjmT34N/Np2AeiFptphvO+S2QLgLd7JmU1qHvk+AD9l96g8gROUp+i8ZpLW5QoKu4Hk8s0/9VhBBD+65fGRzFs5WscAj+hCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755870919; c=relaxed/simple;
	bh=Nr3xhHihjC0qMrhqZcnzSmaV5aQGyXYcc350MW8rvbM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gya9qPQre95G+ELBzdIgxPd/5JwhwmSxmQHPmv/TyczXdAODajtCVdswQmaoyLUfKvA/iJ7pzCdHM5vkvOgioY9jmQ77bn87Ub0w4FNstFE9LIDHkG130ko0qxU5mFtzKoVIDNXMzqJOHTUdtdjPkmiF4/N5kEKGK729fjU6KCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GahVU72U; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GahVU72U"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-afcb73621fcso291050666b.0
        for <linux-staging@lists.linux.dev>; Fri, 22 Aug 2025 06:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755870915; x=1756475715; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TudkP+MdAfUYxvKb4s3Kf+ZXOaz3bPOWVY9e1wwKFCY=;
        b=GahVU72UpeVh8ACqkXMpnsLT8CUiqEPCEtF2Pa0wXSoDiymGIZoNumtWB9nTt/89eD
         RU4Sohk92TdswoLWhQc17GNSDH8B4cWBr2bXDFOJD4YkKNDl1YXVH8VVV7thmjCqlG+d
         nPhhcKtNXxG3DHCNgzJK9ClwyDqFTxlPxCU4Eh/m4hqIZMGc5axo3F9Lv1SYQWSJ7Oi+
         0CEKr5kTDOgGvI7knHK8zr8a2lRP2bvE5lWXhxpauNWHjnGWDd+Ak9JSqa92j1fXD5VB
         wLoVdbrN2eDMjxcE6kGwzTCktUAGoKWYzrHniA1asyaqfetpPQOtnbP3fDzYXGkL3Bkm
         S6Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755870915; x=1756475715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TudkP+MdAfUYxvKb4s3Kf+ZXOaz3bPOWVY9e1wwKFCY=;
        b=sPnZdoZR1IJRNFMPjI6FqDBtWZWsRbXD+WXeLG0y2xucbggHkqrVh6V+LjGlAcamou
         N5VxGXn5JadrKhDVye0NJdZd/hC8rn1GS/EH9VqI5tiPiSTSIR9SflsrIuk3bqmyFByD
         LqSJWHFmHhUBvWwdYpfc/9dGROdF2KT7hmw3K3VE49hytktXcQKw5zT1Uyfkum8N1Jed
         NOPjE/sFf8zX1bppaod7acK2+MiTBl3yoVOJ+XtArZi6bf0go/rjes+kNXatiL4lppn7
         DvfnlQHp348NtAItC/gcOupjfV+K7qjmbB085fd+c9K1sj3Kq2jG3HNvhnRMPyh7QAUN
         SoAw==
X-Forwarded-Encrypted: i=1; AJvYcCVJE0L3fBQBJ/7Pg8fQ5rxwtGhnOgtlNSVvX2VkAcpXxg/iwvJAh2K9+JOGUhKfCUzsKuA5qEqHln+mlfsF@lists.linux.dev
X-Gm-Message-State: AOJu0Yy7QX21B26YzsyWsBEQoeGJhydJVXtXmA7+Tj4zyEna+QXiZmN9
	pivSUsckANdGJXQbADaLnab//ShqFac2NezU0g0j/BhHHuA6GhE7eMoN
X-Gm-Gg: ASbGncv4SV2QCcth/KQ87b85qZXPMWV3icaZKoDJsrfVAgPLoj3psFF9xnJfjEtr0F3
	IGFff9Uf+Ci1KTwCKXUFIJENNC09Vw6bLSSLBnXN+XRAcCZewbu5PGFbeuyjALl8TiSZfksuMYx
	l9f2VgUYe3xUcWuCCP7ilHDQ0JVTChapJ8pQxP+10uEV7QY/PaFRjlMKBJkxKNtmteMVzH9vX/Y
	aS31nchQ/VWhtmvK6OLKG/FrT1HZZ3bNozUqoe8AiisgU15g8S1zaGQVTo7DAoyYLk2aWDyWaHA
	vxdiPLuB7fnpk5qheh2oQZWmKmjAAuQXJsCs+VkN9wENz+aQkkqWmjmRTBL740vKqXORPsZdQbh
	lVpJctEdbQtHwK94UA/1HtCRDDg==
X-Google-Smtp-Source: AGHT+IH2J8EFlu7yKogGmtXwx99Gdp4kwTSuKSx7zkh/EHIdnOCRoomd52edYMKS13WQvMZoZg4Ozg==
X-Received: by 2002:a17:907:1b08:b0:af9:6e4a:3b31 with SMTP id a640c23a62f3a-afe2963818fmr292264866b.46.1755870914622;
        Fri, 22 Aug 2025 06:55:14 -0700 (PDT)
Received: from tumbleweed ([95.90.184.246])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afded307138sm612353866b.45.2025.08.22.06.55.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 06:55:14 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 07/13] staging: rtl8723bs: merge rtw_os_recvbuf_resource_free into rtl8723bs_recv.c
Date: Fri, 22 Aug 2025 15:54:12 +0200
Message-ID: <20250822135418.118115-8-straube.linux@gmail.com>
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

Merge rtw_os_recvbuf_resource_free into rtl8723bs_init_recv_priv and into
rtl8723bs_free_recv_priv to reduce code in the os_dep directory.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c | 6 ++++--
 drivers/staging/rtl8723bs/include/recv_osdep.h | 2 --
 drivers/staging/rtl8723bs/os_dep/recv_linux.c  | 7 -------
 3 files changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c
index 28c914ec2604..399edfbf8ec6 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c
@@ -431,7 +431,8 @@ s32 rtl8723bs_init_recv_priv(struct adapter *padapter)
 		precvpriv->free_recv_buf_queue_cnt = 0;
 		for (i = 0; i < n ; i++) {
 			list_del_init(&precvbuf->list);
-			rtw_os_recvbuf_resource_free(padapter, precvbuf);
+			if (precvbuf->pskb)
+				dev_kfree_skb_any(precvbuf->pskb);
 			precvbuf++;
 		}
 		precvpriv->precv_buf = NULL;
@@ -467,7 +468,8 @@ void rtl8723bs_free_recv_priv(struct adapter *padapter)
 		precvpriv->free_recv_buf_queue_cnt = 0;
 		for (i = 0; i < NR_RECVBUFF; i++) {
 			list_del_init(&precvbuf->list);
-			rtw_os_recvbuf_resource_free(padapter, precvbuf);
+			if (precvbuf->pskb)
+				dev_kfree_skb_any(precvbuf->pskb);
 			precvbuf++;
 		}
 		precvpriv->precv_buf = NULL;
diff --git a/drivers/staging/rtl8723bs/include/recv_osdep.h b/drivers/staging/rtl8723bs/include/recv_osdep.h
index 9b3f4e8293ee..227e172bf1c3 100644
--- a/drivers/staging/rtl8723bs/include/recv_osdep.h
+++ b/drivers/staging/rtl8723bs/include/recv_osdep.h
@@ -18,8 +18,6 @@ extern void rtw_recv_returnpacket(struct net_device *cnxt, struct sk_buff *pretu
 int	rtw_init_recv_priv(struct recv_priv *precvpriv, struct adapter *padapter);
 void rtw_free_recv_priv(struct recv_priv *precvpriv);
 
-void rtw_os_recvbuf_resource_free(struct adapter *padapter, struct recv_buf *precvbuf);
-
 struct sk_buff *rtw_os_alloc_msdu_pkt(union recv_frame *prframe, u16 nSubframe_Length, u8 *pdata);
 void rtw_os_recv_indicate_pkt(struct adapter *padapter, struct sk_buff *pkt, struct rx_pkt_attrib *pattrib);
 
diff --git a/drivers/staging/rtl8723bs/os_dep/recv_linux.c b/drivers/staging/rtl8723bs/os_dep/recv_linux.c
index c71e0c762f4f..ebe169507dc8 100644
--- a/drivers/staging/rtl8723bs/os_dep/recv_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/recv_linux.c
@@ -9,13 +9,6 @@
 #include <net/cfg80211.h>
 #include <linux/unaligned.h>
 
-/* free os related resource in struct recv_buf */
-void rtw_os_recvbuf_resource_free(struct adapter *padapter, struct recv_buf *precvbuf)
-{
-	if (precvbuf->pskb)
-		dev_kfree_skb_any(precvbuf->pskb);
-}
-
 struct sk_buff *rtw_os_alloc_msdu_pkt(union recv_frame *prframe, u16 nSubframe_Length, u8 *pdata)
 {
 	u16 eth_type;
-- 
2.51.0

