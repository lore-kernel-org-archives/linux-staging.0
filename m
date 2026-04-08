Received: from mail-dl1-f68.google.com (mail-dl1-f68.google.com [74.125.82.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1995F382371
	for <linux-staging@lists.linux.dev>; Wed,  8 Apr 2026 11:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775646847; cv=none; b=nQs8qq/rCWri5ZEaZzjaHfltxAwaXLNu/iWB5EhzLoXe5sHBFDfg3Ot/WdM5YRo2WzgxyugIjcUNDD3ADNCj5SjqYsCmEUj2qzUQfX17vmM4/sj5j7UQhxg9IusuOp6EHvbM2GG7NZYzdjyhRq8Htyha2kyIvBQC/pFlhbKDw34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775646847; c=relaxed/simple;
	bh=LrjH0db+H4xacV1aL7fi3b+fr4AGYHV065KdoaKvxn0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JHZd8cZ8L6tr26C/IjkVzY+fJB4e676Llq5c/XpLc1pGMo7gFHtIbtuRlyR37MOT9FdhzlPviRhqlHBbMVobeMuJLtLKC5MhkK9uyocloYrWw21CYXAC/PK+cLWlPXXi4Sn3ozlCbAktLpmTUrMfVKdZd5N8DGPHNjp3zRZkVJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FgV2K/uA; arc=none smtp.client-ip=74.125.82.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FgV2K/uA"
Received: by mail-dl1-f68.google.com with SMTP id a92af1059eb24-12c2575ff49so650900c88.1
        for <linux-staging@lists.linux.dev>; Wed, 08 Apr 2026 04:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775646845; x=1776251645; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tbFvSdZmXXxlkU1H8d8iS7m968Y+TZGCR1gQMqOjC9k=;
        b=FgV2K/uA6MFN4bSdTaDB+z9eSWMUXsqutY7SvuA8OEM0yK48oZTVzsOmkBC4mlBqv7
         KoKIyUDLn1XfgYFMcmk15Aa4Kdr5C3ELLIv25RDx8dypdvF6AXrlMmSdAnAk61PGQljX
         ODy3QnTCO4Rjbz9Kt7PJtVwYLYIgk5WVoCEyOfI5xCWKxXMmNZDBEVKdAcVYa1gqU6wf
         7b0Vh4RUkxzffloUQj2UvsqPN5ztET1Iz5CZLLyejqz7TuPsbmLm9SlFJvKoLdf+tIE8
         7aYvIe8WZOftsRKlTX9TTyTiVu01JjNgBjj3ef+cld3XlOTY2CUZJPkEozAfvKnSIiQ/
         sBDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775646845; x=1776251645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tbFvSdZmXXxlkU1H8d8iS7m968Y+TZGCR1gQMqOjC9k=;
        b=VU03COQXKwJQcGwFgqHbo4UsqCQyhvpIXWD+H4bcC0cZ7Gf6PmlaEdo250vmBOsxjt
         //Qv9PfriOXL+Y/qqY0EaZ6h6k3+rro4bMcncVurzBu59774OIpwWtxOnjjSJj/2Rt4e
         0grQkR6tCWS+XXXGVjlXMVsI8YNJw1lhLwbKMaeq/U6tFgYr9XyJifpGyg9bs29El6Cv
         pxmHiDlbt6TnaqRAIX5H2vDI73hbGvMplVZ3M28ekfDMJKTmnGsdB2je3Pn8Gl5JTbAR
         4STLUYcxz4gtbjOElB1SDLwMKiVPkMx8CfGQexpkp70hCAoDGLy97Fzvs9497xul9sb4
         /ZNg==
X-Forwarded-Encrypted: i=1; AJvYcCUxAQjV77xsuesnlXq0aNUmDHlfOZwPO5G+o980QHhV2vV6N/bnPvHsO+fdVutA8azLY0qhPbsOZlSpGDMH@lists.linux.dev
X-Gm-Message-State: AOJu0YyQFRXRaWlpIiQVWbk2jMp1XVnp5LiMF1hLtGg6LWd0yfUX3jnf
	rqzlMgWc6c1ZLcA6fAh3/lrN9J906xdKmvZHlW7LUQjr3jHJywxelT7Z
X-Gm-Gg: AeBDieu5U1b5DsxQnSmuVYHQ382wDJeda3CzCXR7uVcI2WLcLP9WwsdMMRLWyvqBdNk
	8pX0yn/u0DX0bnHbXf//UYNgaDUoZIcZu6c2eFBZbzN5790Rq25QIxHC2DYwf9oQprNr1u3r/2k
	kg67ZDz7d7FUufhMbIwIZdBfULRlW+kvFXTKQxOrZtbiWpr+FSgtJM9QS2et4kZyVS2gbmTuElD
	rHDC3PNgqMUy3/NcyJLwi88yv5uXwmY+gCIRB0Ik5botnZS2Cjq3/b+lviokrtGqf/W636bL9BR
	/94NR7dfuYmvY9HOmdzztmB40I9uvBFadS++CbiTUGo3ZPSD1rG/VUMRybR+y/TXv3QxjP7fLUk
	SSZJJW+nS30MhIj2ir+Abce6Vem4hbFQvv0068G9+ORcNS2SI8vujAdBLOlrbT2+J0JHF1CmaBp
	5akE+MnQQlaKsw7GTTLmj6mXpkfI5284GZ/vRjF5vjjlYhuFZJts/TxsE=
X-Received: by 2002:a05:7300:b906:b0:2c1:59ea:10f7 with SMTP id 5a478bee46e88-2cbfbf79640mr11322645eec.18.1775646845010;
        Wed, 08 Apr 2026 04:14:05 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca7c20c0c2sm21228019eec.17.2026.04.08.04.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 04:14:03 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	ethantidmore@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH v5 1/6] staging: rtl8723bs: simplify _rtw_init_xmit_priv control flow
Date: Wed,  8 Apr 2026 11:13:09 +0000
Message-Id: <20260408111314.19329-2-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260408111314.19329-1-dennylin0707@gmail.com>
References: <20260408111314.19329-1-dennylin0707@gmail.com>
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

