Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53FB8274B28
	for <linux-staging@lists.linux.dev>; Tue,  7 Apr 2026 14:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775572677; cv=none; b=VbZMXARiiFITukznf6YDAd14gWiokoLYGX29cpvWGt0VB0lpywmUOFlBFHd8IpqCEf21X4+L/8Hv5thjt5mJDpiz1wV9/QH6BREzZEcGUynCxhTmCxSMsWhwxSW+KXjaLiNcKftoZzvjwEYh8f5lDIB7R0sLBN1FN4H3bfOvrjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775572677; c=relaxed/simple;
	bh=gPd9vPATOfZPlBZ+yFtYYAIAEvOOqRR39TvKax9YjwQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vp4huKWq86aohdhO+DuIotlOST+jmbc/GOPjMuCk6JG62+pxu6Yo+ocdzpy9qlzABKA+Q6Y9xdnaYS7L/5ZiW3uXhV86vn2G4ttQVu7p+zcAK/AHOS9z2+aZ5lZ0fd3Mk/RgWZ/WnaojTXhn6V79oudVjv2bWYTa8BU3cGyL5tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UklilXoY; arc=none smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UklilXoY"
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-6501547d7edso5237996d50.0
        for <linux-staging@lists.linux.dev>; Tue, 07 Apr 2026 07:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775572675; x=1776177475; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=npHtoeTReM+WQcQtaL9+FmPr0U9qvdmXcR76qrpWa5g=;
        b=UklilXoYK50RlDXcgfZB23+Mx1YWRVzyLG7/cfw9mFcH/mZsoO3s+iKJ25AJEf7rs6
         t66iVFl0wxJEXPkToNT73qpVAUfr618n1TdF6Z1cbimDe40CJBD66zjje6QHafs9aBTX
         lAVXOFTHrWFvIV3omqp4GVQgPXjUaeKb3I98imVFWC0OzwDyGw49KrSb139EasAzkvd7
         jN9SzAlzY8ro8dERXmUpUmN0g4a6igbvcxfHTwfPG5L/Wp2WXj1Nz1Bb8q2ix5npbosO
         8maZbl8VCfFD1HBbyjJAdmiu0tqD1QNyu9lng1nse3EiObVsTx2n4Is3Z/blrXtMYFZQ
         OnNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775572675; x=1776177475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=npHtoeTReM+WQcQtaL9+FmPr0U9qvdmXcR76qrpWa5g=;
        b=oa10/K5ZJ4IOl/PoZm6yU96j9yJh4+QxDfgdjORAaU1Y5LEOYv+cH0kzQDT8wbAh6w
         cFrz0BAZHe7OOJFB35XNUSaM/U3GIIBn/tuMht76g2Ge9vu/2nPfUWXxiBo5T+siEdfX
         HVy6uMqBusqvDMOnMkXo1f9VKfmVBKGTv1hRZdwoxykH7QRwNMAm/AfvZaoFHsmtKESe
         j3N1qG+CpXg1WozGwlOKNiVn+HcPFlMpy7QnoM7NKey4U477ltnw5kSpPFRm102ctchI
         u/8gj7bzcwRvWDz4brWPpTOiTOHH2vy97Pfubr63im1THj0SMswaKWePVUOtf9zhL/Ka
         RXDw==
X-Gm-Message-State: AOJu0YxwQcRxqSK/y+S4m6a8UwLbC6dAYmmBdmjXMUIYGSLJPnIYcVN2
	MiLw42h9TDdjppdZJnsKzURnUeoEKTEalBhiWP//CrWOttJDNIWwlrFd
X-Gm-Gg: AeBDietK3YY1OxIAHPn2V/cuII5b5fYG38EUs9H5Gxf+IeY2b3/UHGUPgoW3M9mkaXS
	OKcEKRr4xUgwkMPX48BRpsi6iff1XdmMD4ExuSKVUrDr1tyJS0mKDUVqzLoD3sX+l1mtPIVmPVr
	8rSpCh1o2UEkEud2UczK2RrkfQzFDuiJ4OiNZvnx9KSwP32YiyNZHk/Zh+VMcw9c6chFcDg3Zzt
	rBYmrr8LBmgcBSuu0cIfjp7ukg8vFIHBO28GGKLuSXivqU1FMRAHTRuJVnVKfCdCv33Dm4CtUve
	Fo46wxvXkQDu4KhkV4ZpmYQUVy0e0Te57SxPyOnECSVPmsjyz2HrED9r91NR4IlP/uTcXa5BpHu
	5KlAY9VNeExSmau/ctLz4y9IvSAm7YuhJMFuyj+hsXk77f+uK0WG0qP9kmFfpOYGoJt/87m8dox
	+u6hIFbNzEnTFCu76dsgUZ7jex
X-Received: by 2002:a53:b009:0:b0:63e:2715:5ac6 with SMTP id 956f58d0204a3-65048828b7fmr12670925d50.35.1775572675324;
        Tue, 07 Apr 2026 07:37:55 -0700 (PDT)
Received: from archlinux ([185.140.161.214])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6503a828f3csm7868159d50.3.2026.04.07.07.37.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 07:37:54 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH 2/6] staging: rtl8723bs: remove unused _rtw_init_queue() function header
Date: Tue,  7 Apr 2026 17:33:27 +0300
Message-ID: <20260407143622.9767-3-nikolayof23@gmail.com>
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

The _rtw_init_queue() function header is declared in osdep_service.h,
but it is not defined anywhere and all the code using it is commented
out, so we can remove the header and the commented out code.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_recv.c         | 3 ---
 drivers/staging/rtl8723bs/core/rtw_sta_mgt.c      | 1 -
 drivers/staging/rtl8723bs/core/rtw_xmit.c         | 4 ----
 drivers/staging/rtl8723bs/include/osdep_service.h | 2 --
 4 files changed, 10 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index f78194d508df..df9c59449de5 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -21,9 +21,6 @@ void _rtw_init_sta_recv_priv(struct sta_recv_priv *psta_recvpriv)
 
 	spin_lock_init(&psta_recvpriv->lock);
 
-	/* for (i = 0; i<MAX_RX_NUMBLKS; i++) */
-	/* _rtw_init_queue(&psta_recvpriv->blk_strms[i]); */
-
 	INIT_LIST_HEAD(&psta_recvpriv->defrag_q.queue);
 	spin_lock_init(&psta_recvpriv->defrag_q.lock);
 }
diff --git a/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c b/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
index 07a6db1d2317..1e5bc9f4cd4b 100644
--- a/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
+++ b/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
@@ -67,7 +67,6 @@ u32 _rtw_init_sta_priv(struct	sta_priv *pstapriv)
 
 	spin_lock_init(&pstapriv->sta_hash_lock);
 
-	/* _rtw_init_queue(&pstapriv->asoc_q); */
 	pstapriv->asoc_sta_count = 0;
 	INIT_LIST_HEAD(&pstapriv->sleep_q.queue);
 	spin_lock_init(&pstapriv->sleep_q.lock);
diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 7bce0343d59f..10a778619466 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -45,10 +45,6 @@ s32 _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 	init_completion(&pxmitpriv->xmit_comp);
 	init_completion(&pxmitpriv->terminate_xmitthread_comp);
 
-	/*
-	 * Please insert all the queue initialization using _rtw_init_queue below
-	 */
-
 	pxmitpriv->adapter = padapter;
 
 	INIT_LIST_HEAD(&pxmitpriv->be_pending.queue);
diff --git a/drivers/staging/rtl8723bs/include/osdep_service.h b/drivers/staging/rtl8723bs/include/osdep_service.h
index 9392af858995..664c67e48f06 100644
--- a/drivers/staging/rtl8723bs/include/osdep_service.h
+++ b/drivers/staging/rtl8723bs/include/osdep_service.h
@@ -60,8 +60,6 @@ int _rtw_netif_rx(struct net_device *ndev, struct sk_buff *skb);
 
 #define rtw_netif_rx(ndev, skb) _rtw_netif_rx(ndev, skb)
 
-extern void _rtw_init_queue(struct __queue	*pqueue);
-
 static inline void flush_signals_thread(void)
 {
 	if (signal_pending(current))
-- 
2.53.0

