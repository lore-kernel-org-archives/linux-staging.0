Received: from mail-dy1-f196.google.com (mail-dy1-f196.google.com [74.125.82.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDFC03B960B
	for <linux-staging@lists.linux.dev>; Wed,  8 Apr 2026 10:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775645121; cv=none; b=M7cM9wdUG+4mVXSBHg9cMCqaPTnygUG5r0lO8QFb5XSJM/8VdOu2ESKYloV/oV75b0yJ0sxjvwfl3OiJzDwn9pHfF8QpZh8YiMT+raydlaHd1AGckUFABZDfLXsf1TWmHpenWuZDLbgRudZv2LUT4t/nL+ftNQEfPiqi25dPC3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775645121; c=relaxed/simple;
	bh=LrjH0db+H4xacV1aL7fi3b+fr4AGYHV065KdoaKvxn0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RN1iU4fSs9hcsyY8yVEKS2HxxfHcbLnv+iHnm4PCNo5e12P+TUb62Zn4L3RICPuzmyTsP71ts1T/V+IENc2L3785Srn0Ia6xvc1b4sh6vbUpzecxV45SOvPcDWvI8QumSsHHRkiLKNwHLsQILQ0MupIvI9yQu/ihzFl1i1ZJ80o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QVW7ST15; arc=none smtp.client-ip=74.125.82.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QVW7ST15"
Received: by mail-dy1-f196.google.com with SMTP id 5a478bee46e88-2d18dfa2713so1656716eec.0
        for <linux-staging@lists.linux.dev>; Wed, 08 Apr 2026 03:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775645119; x=1776249919; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tbFvSdZmXXxlkU1H8d8iS7m968Y+TZGCR1gQMqOjC9k=;
        b=QVW7ST15r4+0DnywJdyT4T/r/MsyLwQGIELrhfbfKAXZ17LsslhfyIx2HO+L/S0bY0
         gwoRU1XAwp1D7/pMOfMsJNvvoXZxD9IWm7hx1aFj7mQmnalZLedtFDzqs1l8sYdjZKO3
         9qZYftp9BIyDk3DQTMso59dcrTH+A7CEsMOf1CBSYHPobCdhB8hiDClqlRjjUQuaoqyk
         26b0D4Nfc4XwgxQfFEnxHGX2QbEGojdUfAuclLzzDuN1ZiDVM9iRrpfy0WN/aRw/W7MI
         ao7Ow0yPjAZ9V3ZguK0Gs+36QUaxDuo+F1lIlsGZE4GQxzBApDhtBNVYup7Cjw8YRgxm
         YjXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775645119; x=1776249919;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tbFvSdZmXXxlkU1H8d8iS7m968Y+TZGCR1gQMqOjC9k=;
        b=r1DS3Mfrlb1fQDSrsvjztZOJ/d4TlygVzk96iLE2O0FbDnkiAY01Jln/+7RQ/Z7VtB
         fm9sEY6kiZlrhBB8XqLTcF6wR5e5oZlfVeRUE8KOsa5TTjOkWmDgv7+gCPA9SzTh/Jni
         siERIXrcCwMa7fY8bBQ8plhEbfu5QcGFQjLE8Yme6p+zEktE7SDiqskA//ZP5wgSo5oq
         KbaKJ32A/nk2rK7oQTo4exYok71oMErZDhw3rjiMuQqB37hXZbFjV+4I4g+50zPtO5u1
         5EVa4wMHZ5Bis827VnwAsZ+bvAAXpL8sRl4jhYO99NsFwvnDEsfh9MeK+xMebeIsRQpb
         AS6A==
X-Forwarded-Encrypted: i=1; AJvYcCVDJZhBXGsvvJ+sbNMF6osAGm5q2RiYcuSrGZ7NRkqJPkk30TCk5JjWFQVvcyukhUbycFwQNVkndpDoeW09@lists.linux.dev
X-Gm-Message-State: AOJu0YwkGSoIF+H7QdoAPVu/hoW7F08igWsla5A1/IryVYaXhLCaXS6q
	F9zDyUrqM22dIvaRAvsfg2rbagGX55MR30dk3jsqsi4g5XZ5+zLt03vy
X-Gm-Gg: AeBDiev9DYseHn4RUzuzYiFkXLilNxCZFVpZhuDigepCRVdbIXmqMp0LRcfZWaQiPpT
	oA+HHDSxvBr8rVFGJYf3U2P1GeosHM4WcRjEMPUUk+jlKWcZf4L7GfZmH8qCFGCZD+TxxCo6+JY
	hfc9jgbespiE5ISw7Y4XphtCf5Etj9nznXzMnUqUuOORP1JuDCoyaNWhyBT5/IlZcg3RoXC40Z1
	v0aX0pe83C5gT8WfxVoLQsuS+AiNiqJciGDQR9wY9bRT5FPOOLbwbdVZx51otlzKzjRqOQGuVWv
	IlfgUBdLN5nPKwIgQtTgnAgKEd27nbOPoWO/ZHqp81/FxGKU0uxYF54ptDDLoPer9KDNQC9yaFv
	EM0NaFwjBeQUwPyabqrx5sEArlMUfhTBMblT8sqXxE6/K3r2s5Ng3agHwQyPvuXh9fqC/ka1IpZ
	RcYYCWOd2AIKmxKRM+Tx2tP6WlhSvpgLjncHXcKkLm1IqqsvL2JsAc13I=
X-Received: by 2002:a05:7022:6889:b0:128:d786:8ac8 with SMTP id a92af1059eb24-12bfb639214mr9528176c88.0.1775645119021;
        Wed, 08 Apr 2026 03:45:19 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12bed93f861sm24417783c88.0.2026.04.08.03.45.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 03:45:18 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	ethantidmore@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH v4 1/6] staging: rtl8723bs: simplify _rtw_init_xmit_priv control flow
Date: Wed,  8 Apr 2026 10:44:19 +0000
Message-Id: <20260408104424.18952-2-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260408104424.18952-1-dennylin0707@gmail.com>
References: <20260408104424.18952-1-dennylin0707@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace goto-based error handling in _rtw_init_xmit_priv()
with direct returns to simplify the control flow.

No functional changes intended.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_xmit.c | 39 ++++++++---------------
 1 file changed, 14 insertions(+), 25 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 7bce0343d59f..f64ec8e271ed 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -38,7 +38,7 @@ s32 _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 	int i;
 	struct xmit_buf *pxmitbuf;
 	struct xmit_frame *pxframe;
-	signed int	res = _SUCCESS;
+	int res;
 
 	spin_lock_init(&pxmitpriv->lock);
 	spin_lock_init(&pxmitpriv->lock_sctx);
@@ -75,8 +75,7 @@ s32 _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 
 	if (!pxmitpriv->pallocated_frame_buf) {
 		pxmitpriv->pxmit_frame_buf = NULL;
-		res = _FAIL;
-		goto exit;
+		return _FAIL;
 	}
 	pxmitpriv->pxmit_frame_buf = (u8 *)N_BYTE_ALIGMENT((SIZE_PTR)(pxmitpriv->pallocated_frame_buf), 4);
 
@@ -111,10 +110,8 @@ s32 _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 
 	pxmitpriv->pallocated_xmitbuf = vzalloc(NR_XMITBUFF * sizeof(struct xmit_buf) + 4);
 
-	if (!pxmitpriv->pallocated_xmitbuf) {
-		res = _FAIL;
-		goto exit;
-	}
+	if (!pxmitpriv->pallocated_xmitbuf)
+		return _FAIL;
 
 	pxmitpriv->pxmitbuf = (u8 *)N_BYTE_ALIGMENT((SIZE_PTR)(pxmitpriv->pallocated_xmitbuf), 4);
 
@@ -133,7 +130,7 @@ s32 _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 			fsleep(10 * USEC_PER_MSEC);
 			res = rtw_os_xmit_resource_alloc(padapter, pxmitbuf, (MAX_XMITBUF_SZ + XMITBUF_ALIGN_SZ), true);
 			if (res == _FAIL)
-				goto exit;
+				return _FAIL;
 		}
 
 		pxmitbuf->phead = pxmitbuf->pbuf;
@@ -162,8 +159,7 @@ s32 _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 
 	if (!pxmitpriv->xframe_ext_alloc_addr) {
 		pxmitpriv->xframe_ext = NULL;
-		res = _FAIL;
-		goto exit;
+		return _FAIL;
 	}
 	pxmitpriv->xframe_ext = (u8 *)N_BYTE_ALIGMENT((SIZE_PTR)(pxmitpriv->xframe_ext_alloc_addr), 4);
 	pxframe = (struct xmit_frame *)pxmitpriv->xframe_ext;
@@ -194,10 +190,8 @@ s32 _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 
 	pxmitpriv->pallocated_xmit_extbuf = vzalloc(NR_XMIT_EXTBUFF * sizeof(struct xmit_buf) + 4);
 
-	if (!pxmitpriv->pallocated_xmit_extbuf) {
-		res = _FAIL;
-		goto exit;
-	}
+	if (!pxmitpriv->pallocated_xmit_extbuf)
+		return _FAIL;
 
 	pxmitpriv->pxmit_extbuf = (u8 *)N_BYTE_ALIGMENT((SIZE_PTR)(pxmitpriv->pallocated_xmit_extbuf), 4);
 
@@ -211,10 +205,8 @@ s32 _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 		pxmitbuf->buf_tag = XMITBUF_MGNT;
 
 		res = rtw_os_xmit_resource_alloc(padapter, pxmitbuf, MAX_XMIT_EXTBUF_SZ + XMITBUF_ALIGN_SZ, true);
-		if (res == _FAIL) {
-			res = _FAIL;
-			goto exit;
-		}
+		if (res == _FAIL)
+			return _FAIL;
 
 		pxmitbuf->phead = pxmitbuf->pbuf;
 		pxmitbuf->pend = pxmitbuf->pbuf + MAX_XMIT_EXTBUF_SZ;
@@ -243,10 +235,8 @@ s32 _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 			res = rtw_os_xmit_resource_alloc(padapter, pxmitbuf,
 							 MAX_CMDBUF_SZ + XMITBUF_ALIGN_SZ,
 							 true);
-			if (res == _FAIL) {
-				res = _FAIL;
-				goto exit;
-			}
+			if (res == _FAIL)
+				return _FAIL;
 
 			pxmitbuf->phead = pxmitbuf->pbuf;
 			pxmitbuf->pend = pxmitbuf->pbuf + MAX_CMDBUF_SZ;
@@ -258,7 +248,7 @@ s32 _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 
 	res = rtw_alloc_hwxmits(padapter);
 	if (res == _FAIL)
-		goto exit;
+		return _FAIL;
 	rtw_init_hwxmits(pxmitpriv->hwxmits, pxmitpriv->hwxmit_entry);
 
 	for (i = 0; i < 4; i++)
@@ -270,8 +260,7 @@ s32 _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 
 	rtw_hal_init_xmit_priv(padapter);
 
-exit:
-	return res;
+	return _SUCCESS;
 }
 
 void _rtw_free_xmit_priv(struct xmit_priv *pxmitpriv)
-- 
2.34.1

