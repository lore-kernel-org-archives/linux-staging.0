Received: from mail-dl1-f68.google.com (mail-dl1-f68.google.com [74.125.82.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0D533F5BC
	for <linux-staging@lists.linux.dev>; Sun,  5 Apr 2026 23:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775431571; cv=none; b=mBJq1i7D9tZGX2TLJVEldhffBARqblSO70AmcwO/NPpqbb4kfpDLmS3dKGd7NDtING4sVormzSpChIjiSyJOghJyIFVSfvC5fKTibq5jGbi/uIfo4SepYTx9Wa0dPC0ew5s8qEfYwGV6makktvNY0QDS5j0JkMEpKaGsS6FnN9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775431571; c=relaxed/simple;
	bh=jC5xfEvHSRHM2d5qpAyJz5Kmbr47k/f9lON6gXE1En8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bDguKkP3xunJqnSmZuDE4SPIdSKFE/fAlGQYQnuV5/XjVrBOvgX0C020+FlWJY5Ast5OSF2Qm/iPwpSRZ4Lk9zQ6WABZdCUitA488rU7jU5lh3Auv0b/vKbR2SjgGeBeAi0laK022kYxXgdF6fYbCV99q6xcwbeqzuQlUkSCH6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pvoLjje6; arc=none smtp.client-ip=74.125.82.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pvoLjje6"
Received: by mail-dl1-f68.google.com with SMTP id a92af1059eb24-127380532eeso393728c88.1
        for <linux-staging@lists.linux.dev>; Sun, 05 Apr 2026 16:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775431569; x=1776036369; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CMV2dZVUW7DQMu0++s6lroI8YI0/U18GtCkj4isEdVg=;
        b=pvoLjje6pDb5WJoJucG2QKsb45Rc0XOMTncINL9GsxUzo+S7PAZQQXlTAzFDLO4JQs
         Z8G+0kzahr8Kbo0tByvs2jvkX9TVVOe8nvjnJVTaI61rNLttW4nj1W5lSZEkVqx/BKsI
         Ql+KNYhLHgYuWPURs1ffhI2Ld465tDxkTRcFb393Hl+k+f9SJaj0R3bnUnQdaqf//bAJ
         l9QTsPYnISL/vKYMbqAL6T8jgtrw0LfLvbp96wBo2bAgoa0SfTFZn2n6woomjNAyTwnM
         fOLS4arTAFrqkfUmxOvC/UvMCrQVnC2bVpZhDfiErvZfdhghYeZj5CB5MjBGciw82Odu
         WipA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775431569; x=1776036369;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CMV2dZVUW7DQMu0++s6lroI8YI0/U18GtCkj4isEdVg=;
        b=Zl6q/IiiQrvMrAbaARdBWDzDqbTB3veGMHDddE/iHDKo5iTAfTLB4t5t9Cht9neqPg
         SDWzyzaOsRR0Em1Wea2KSLINleADaSg3HeSGbjJbysYxEMy/jUtz3H/7Mxm6M6XZZoo+
         YBD2lWoNuolFsXZaz4vPbbepnU0OSTlMDkTDtVZfBf/M1MDTHcHchj2xe9fIP+GhlDwO
         bZVQTyQL/Zg39bS2HD+EIXWq9Qd54XybhRH/0gZGqmOXJ+twb8MQGM5B6T3Ty3ExtW5H
         YC5dJJUARcwwLdRudPlUV0UnT8aenW8Bc/cxsB5hJ9E/xwYcW03bwH8FaBCspuFLgQcv
         jUQA==
X-Forwarded-Encrypted: i=1; AJvYcCUT3BalH9+g6M0Veo+ZwV6SAPpOaHSP3foVXhDx0kEoBGZU93esIVOtbAQLrio9CDAoI9ALi7R/CneYulb1@lists.linux.dev
X-Gm-Message-State: AOJu0YwG6K33igF/AU7Gyss9yrG5Ysy4ihwfKXu2KmDuj6ADbtd72HB6
	FoK1ErLkWjMhfMDDLnQJ5nt8RqrN4DLMj5slB6FpM7/214Jk+Pwxqlwa819sqJBy
X-Gm-Gg: AeBDiet83/cpgckOMJt+WZLIsOigCYnCg6Be7XIbA20xuSB+szTlJ2qqT0XgxcKwL40
	/UQxlzu6ekKLO6cYGKDE7xNBVGEyj6BmpKS8pnXpjt/pkU0fafa2a2na7Oj3LOKHTsXi2DrGt2A
	kzvSlGh7ug/LZNWBT0U7PrzYPbh991dhfzfGJbWgrGJZEEURcrZ/7IjngkX16FFYkPS4FTmbx9X
	lncnSxaxDlU2BG9dPSdlKDyYxeDXlp45wF7EOJ90NwCZ6nVU/++ybqBd9mawSEp2z0G1JrpkD52
	h7Qvf0DNlktbiVT6d0hzN6wUmOzDee9kVz9AWyQmKmk1ls9XZfCjYPy4CEFoSZ1PeJ6yfuApK4+
	8GEkHCrFt/aDnWDqvNkZRGLO1ONj9NANfSBxAAiCfhMU/JhTBLSF6+9yAjN1PJG+d1hpAwLYY3p
	SLbUzwW7jkXH2RF16FwDQ0Lmuo8MGhgpcNtDUVCAK5Vu+IL1029Ukf4/w=
X-Received: by 2002:a05:7022:90e:b0:123:34e8:aec2 with SMTP id a92af1059eb24-12bfb6e8e9dmr5006469c88.1.1775431568808;
        Sun, 05 Apr 2026 16:26:08 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca7cae9e9esm11211040eec.23.2026.04.05.16.26.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 16:26:08 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: gregkh@linuxfoundation.org
Cc: b9788213@gmail.com,
	ethantidmore@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH v3] staging: rtl8723bs: convert xmit init path to standard error codes
Date: Sun,  5 Apr 2026 23:25:34 +0000
Message-Id: <20260405232534.14122-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the use of _SUCCESS/_FAIL return values with standard
kernel return conventions (0 on success, negative errno on failure)
in the xmit initialization path.

Specifically:
- rtw_os_xmit_resource_alloc() now returns 0 or -ENOMEM
- rtw_alloc_hwxmits() now returns 0 or -ENOMEM
- _rtw_init_xmit_priv() updated to propagate error codes and use
  direct truth checks instead of comparing with _FAIL
- caller in os_intfs.c updated accordingly

This improves error propagation and aligns the driver with
kernel coding style.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
v3:
- Rebase onto latest staging-next to resolve conflicts.
v2:
- Rework xmit init path to remove _SUCCESS/_FAIL usage
- Convert allocation helpers to return standard error codes
- Update caller to use direct failure checks
- Address review feedback from Ethan Tidmore
---
 drivers/staging/rtl8723bs/core/rtw_xmit.c     | 32 +++++++++----------
 drivers/staging/rtl8723bs/os_dep/os_intfs.c   |  2 +-
 drivers/staging/rtl8723bs/os_dep/xmit_linux.c |  4 +--
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 7bce0343d59f..166861f42953 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -38,7 +38,7 @@ s32 _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 	int i;
 	struct xmit_buf *pxmitbuf;
 	struct xmit_frame *pxframe;
-	signed int	res = _SUCCESS;
+	signed int	res = 0;
 
 	spin_lock_init(&pxmitpriv->lock);
 	spin_lock_init(&pxmitpriv->lock_sctx);
@@ -75,7 +75,7 @@ s32 _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 
 	if (!pxmitpriv->pallocated_frame_buf) {
 		pxmitpriv->pxmit_frame_buf = NULL;
-		res = _FAIL;
+		res = -ENOMEM;
 		goto exit;
 	}
 	pxmitpriv->pxmit_frame_buf = (u8 *)N_BYTE_ALIGMENT((SIZE_PTR)(pxmitpriv->pallocated_frame_buf), 4);
@@ -112,7 +112,7 @@ s32 _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 	pxmitpriv->pallocated_xmitbuf = vzalloc(NR_XMITBUFF * sizeof(struct xmit_buf) + 4);
 
 	if (!pxmitpriv->pallocated_xmitbuf) {
-		res = _FAIL;
+		res = -ENOMEM;
 		goto exit;
 	}
 
@@ -129,10 +129,12 @@ s32 _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 
 		/* Tx buf allocation may fail sometimes, so sleep and retry. */
 		res = rtw_os_xmit_resource_alloc(padapter, pxmitbuf, (MAX_XMITBUF_SZ + XMITBUF_ALIGN_SZ), true);
-		if (res == _FAIL) {
+
+		if (res) {
 			fsleep(10 * USEC_PER_MSEC);
+
 			res = rtw_os_xmit_resource_alloc(padapter, pxmitbuf, (MAX_XMITBUF_SZ + XMITBUF_ALIGN_SZ), true);
-			if (res == _FAIL)
+			if (res)
 				goto exit;
 		}
 
@@ -162,7 +164,7 @@ s32 _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 
 	if (!pxmitpriv->xframe_ext_alloc_addr) {
 		pxmitpriv->xframe_ext = NULL;
-		res = _FAIL;
+		res = -ENOMEM;
 		goto exit;
 	}
 	pxmitpriv->xframe_ext = (u8 *)N_BYTE_ALIGMENT((SIZE_PTR)(pxmitpriv->xframe_ext_alloc_addr), 4);
@@ -195,7 +197,7 @@ s32 _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 	pxmitpriv->pallocated_xmit_extbuf = vzalloc(NR_XMIT_EXTBUFF * sizeof(struct xmit_buf) + 4);
 
 	if (!pxmitpriv->pallocated_xmit_extbuf) {
-		res = _FAIL;
+		res = -ENOMEM;
 		goto exit;
 	}
 
@@ -211,10 +213,9 @@ s32 _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 		pxmitbuf->buf_tag = XMITBUF_MGNT;
 
 		res = rtw_os_xmit_resource_alloc(padapter, pxmitbuf, MAX_XMIT_EXTBUF_SZ + XMITBUF_ALIGN_SZ, true);
-		if (res == _FAIL) {
-			res = _FAIL;
+
+		if (res)
 			goto exit;
-		}
 
 		pxmitbuf->phead = pxmitbuf->pbuf;
 		pxmitbuf->pend = pxmitbuf->pbuf + MAX_XMIT_EXTBUF_SZ;
@@ -243,10 +244,9 @@ s32 _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 			res = rtw_os_xmit_resource_alloc(padapter, pxmitbuf,
 							 MAX_CMDBUF_SZ + XMITBUF_ALIGN_SZ,
 							 true);
-			if (res == _FAIL) {
-				res = _FAIL;
+
+			if (res)
 				goto exit;
-			}
 
 			pxmitbuf->phead = pxmitbuf->pbuf;
 			pxmitbuf->pend = pxmitbuf->pbuf + MAX_CMDBUF_SZ;
@@ -257,7 +257,7 @@ s32 _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 	}
 
 	res = rtw_alloc_hwxmits(padapter);
-	if (res == _FAIL)
+	if (res)
 		goto exit;
 	rtw_init_hwxmits(pxmitpriv->hwxmits, pxmitpriv->hwxmit_entry);
 
@@ -1875,7 +1875,7 @@ s32 rtw_alloc_hwxmits(struct adapter *padapter)
 	pxmitpriv->hwxmits = kzalloc_objs(*hwxmits, pxmitpriv->hwxmit_entry,
 					  GFP_ATOMIC);
 	if (!pxmitpriv->hwxmits)
-		return _FAIL;
+		return -ENOMEM;
 
 	hwxmits = pxmitpriv->hwxmits;
 
@@ -1900,7 +1900,7 @@ s32 rtw_alloc_hwxmits(struct adapter *padapter)
 	} else {
 	}
 
-	return _SUCCESS;
+	return 0;
 }
 
 void rtw_free_hwxmits(struct adapter *padapter)
diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index e943dcea1a21..15edf97ee9e2 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -653,7 +653,7 @@ u8 rtw_init_drv_sw(struct adapter *padapter)
 
 	init_mlme_ext_priv(padapter);
 
-	if (_rtw_init_xmit_priv(&padapter->xmitpriv, padapter) == _FAIL)
+	if (_rtw_init_xmit_priv(&padapter->xmitpriv, padapter))
 		goto free_mlme_ext;
 
 	if (_rtw_init_recv_priv(&padapter->recvpriv, padapter) == _FAIL)
diff --git a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
index dc0b77f38b1a..b7cb50ad14fd 100644
--- a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
@@ -51,12 +51,12 @@ int rtw_os_xmit_resource_alloc(struct adapter *padapter, struct xmit_buf *pxmitb
 	if (alloc_sz > 0) {
 		pxmitbuf->pallocated_buf = kzalloc(alloc_sz, GFP_KERNEL);
 		if (!pxmitbuf->pallocated_buf)
-			return _FAIL;
+			return -ENOMEM;
 
 		pxmitbuf->pbuf = (u8 *)N_BYTE_ALIGMENT((SIZE_PTR)(pxmitbuf->pallocated_buf), XMITBUF_ALIGN_SZ);
 	}
 
-	return _SUCCESS;
+	return 0;
 }
 
 void rtw_os_xmit_resource_free(struct adapter *padapter, struct xmit_buf *pxmitbuf, u32 free_sz, u8 flag)
-- 
2.34.1

