Received: from mail-dl1-f68.google.com (mail-dl1-f68.google.com [74.125.82.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54E223BA246
	for <linux-staging@lists.linux.dev>; Wed,  8 Apr 2026 10:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775645133; cv=none; b=Tkkjl8m0AYUqUpkm75+OsvbU0GvCRrmBAcB/Kz11STlbvQz9eYWHQQETb5XC+wxIf1Un9KyfoKcPUcS9dOXDORDPJjaY3EfxKhtpInj4i190zFP/eRomYT5vp9qEBAiTr69VwD18eaHJly6P9Tm5lJU2ivlSxqw0RZxNrS+P8mM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775645133; c=relaxed/simple;
	bh=hGg02QATHkkke1bjuTer3z11aD9JCZJAEagAsXT3E2A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BqpxgGb3hm6tGEUqR8gTAvYz8JuWQcFM72BuFaueqTi4fINixsxtnnWaj5UZnFQJTqaA77hElKm0drbuiKZxepcLjW+3ica1ARcMTncjAbvjnT9v4NBXZCJjv9Zy0OdRncvQmfWZpvZUzhjmTadJVUwCryPhjWNADMf2MF7Bi9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y3OEtBa4; arc=none smtp.client-ip=74.125.82.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y3OEtBa4"
Received: by mail-dl1-f68.google.com with SMTP id a92af1059eb24-126ea4b77adso7181302c88.1
        for <linux-staging@lists.linux.dev>; Wed, 08 Apr 2026 03:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775645129; x=1776249929; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Etrgohg7PjyPKSflB7uJ/+hYjM3wfm6/HkFN+c+SMaU=;
        b=Y3OEtBa4yPVNFHOaTZOVkvynY6RCIU7Ek3aj1qWzMh4PqWZr2GbYKqxaUgnxO0KyFk
         84EGf8R9C15xdknWt8T8itEkmjYzI4LDh/DqqIAbCpJHVePc1xGtyMbRXCwFsnGFlpNy
         8m95bpD4sKlP159qtUlwWntD8HkC9XIOnehyK+a+0pbMbwnB6R/cVOjTisF+1VX6lWes
         ebQfuaL3TaKzVeB+GO8C8U3tBxWJPTqQhWsPQwVNJXk/WvHhzcy6WzmH1SIkZ8k90ldw
         sOWXgNczLWvrbXUrCDEygWGhDBcbamln/fNevD4v+uCIqwLSHDhWuxz4wY5ZVVNGKNvs
         ic8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775645129; x=1776249929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Etrgohg7PjyPKSflB7uJ/+hYjM3wfm6/HkFN+c+SMaU=;
        b=GwBEQSQ7iYYBVVoIKJ1M5jpkaTZn3YCOBCnVdI0k8onRi4HzRa2hVYvDq9LS3NsH9R
         e5ckbi5KGy41W+WkQttjIrSxq2W525TADF3ayTs6Rvl8p0hVq/JhugD/5U8rm/c2mCVT
         1Duswze0v8NorqmsPXv0bHAlQcRJtJrGuZGt6/+pFlXNUyNup3lzgW4Tcw2oGFb2pHKU
         hlOdLZARUacjfD3mVuBoO5Ui76tlQ1JiUVFwLB+WP3xqE6Klv1ayS+neS/anCBkdP/8T
         EJiS42CzAPGlCTQbX+tCqSR0g4r++7aPb/1l6vK4LZNjBkhatcUchAOHlQX2ysOphXEf
         Go3A==
X-Forwarded-Encrypted: i=1; AJvYcCW33UCRQsGcAnVwYVOwbUIOyoSwhDst895HP9+E6Lq6MFpq10v/qSkPVjsH2yeEpP+LaJmbrMbghin5dLRH@lists.linux.dev
X-Gm-Message-State: AOJu0YxND56LzvcaimpSLhKiFsqrcqqFkyq4QDzVd/r6CHfrSMFX1gP1
	ep/WSVN+US41Cl+/fTr4ToJhdwlUG48dqMcM03ezvPy+qfefT9P/UqTf
X-Gm-Gg: AeBDiet1pjha3BEj5H3BXyXdgVwX6d8mhg5c3T/zwts/2jzODi+b/fOp2Gaf7v7ss4B
	yf3ougeFeQGQurAaRyF+nqWa+vnCOZP94O1yyYLeOA1SSUyqFUncE74Jc75BLB3VBlF0FuxrqKw
	XNB2E3ih/IIMUTqNjovwWsznjTJrBafvBqDatiadth2SU2VrPSTP2sPAd2FZrGzeluQhUTv8DGf
	6+3CwdaZprTcdl65hQsiy3rv8iEv85llOiN4ia1pYuhAUkOM+FoefytEJDivGhDiTy4rfKmM855
	/WnUn40j5kYom9X0l5rYWDxtth49q6yiQ1P4vdrTdtkVL5PQ5F2EGLwJnVVD+BQCHODQAoqxmpq
	YYZp9Y92nPHfL+USyS1h2XTG7fOKO5LYOR2MBoE9tKzseKFmWBPeEbe+ix4f3oWaQLwFaI9hiEH
	RYYwE3snm6eXgrJ7gBef6YKMrmYBjDvJlNm+GP9Tdz5Z3cgN2oKyQSUuw=
X-Received: by 2002:a05:7022:212:b0:128:d24a:a5ba with SMTP id a92af1059eb24-12bfb760956mr9431635c88.20.1775645128604;
        Wed, 08 Apr 2026 03:45:28 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12bed93f861sm24417783c88.0.2026.04.08.03.45.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 03:45:27 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	ethantidmore@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH v4 6/6] staging: rtl8723bs: convert _rtw_init_xmit_priv to return errno
Date: Wed,  8 Apr 2026 10:44:24 +0000
Message-Id: <20260408104424.18952-7-dennylin0707@gmail.com>
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

Convert _rtw_init_xmit_priv() to return 0 on success and
negative error codes on failure. Update the caller to
check for non-zero return values.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_xmit.c   | 18 +++++++++---------
 drivers/staging/rtl8723bs/os_dep/os_intfs.c |  5 ++++-
 2 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index fedfc968057b..c6cf23b9c98a 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -128,7 +128,7 @@ s32 _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 
 	if (!pxmitpriv->pallocated_frame_buf) {
 		pxmitpriv->pxmit_frame_buf = NULL;
-		return _FAIL;
+		return -ENOMEM;
 	}
 	pxmitpriv->pxmit_frame_buf = (u8 *)N_BYTE_ALIGMENT((SIZE_PTR)(pxmitpriv->pallocated_frame_buf), 4);
 
@@ -164,7 +164,7 @@ s32 _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 	pxmitpriv->pallocated_xmitbuf = vzalloc(NR_XMITBUFF * sizeof(struct xmit_buf) + 4);
 
 	if (!pxmitpriv->pallocated_xmitbuf)
-		return _FAIL;
+		return -ENOMEM;
 
 	pxmitpriv->pxmitbuf = (u8 *)N_BYTE_ALIGMENT((SIZE_PTR)(pxmitpriv->pallocated_xmitbuf), 4);
 
@@ -183,7 +183,7 @@ s32 _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 			fsleep(10 * USEC_PER_MSEC);
 			res = rtw_os_xmit_resource_alloc(padapter, pxmitbuf, (MAX_XMITBUF_SZ + XMITBUF_ALIGN_SZ), true);
 			if (res)
-				return _FAIL;
+				return res;
 		}
 
 		pxmitbuf->phead = pxmitbuf->pbuf;
@@ -212,7 +212,7 @@ s32 _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 
 	if (!pxmitpriv->xframe_ext_alloc_addr) {
 		pxmitpriv->xframe_ext = NULL;
-		return _FAIL;
+		return -ENOMEM;
 	}
 	pxmitpriv->xframe_ext = (u8 *)N_BYTE_ALIGMENT((SIZE_PTR)(pxmitpriv->xframe_ext_alloc_addr), 4);
 	pxframe = (struct xmit_frame *)pxmitpriv->xframe_ext;
@@ -244,7 +244,7 @@ s32 _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 	pxmitpriv->pallocated_xmit_extbuf = vzalloc(NR_XMIT_EXTBUFF * sizeof(struct xmit_buf) + 4);
 
 	if (!pxmitpriv->pallocated_xmit_extbuf)
-		return _FAIL;
+		return -ENOMEM;
 
 	pxmitpriv->pxmit_extbuf = (u8 *)N_BYTE_ALIGMENT((SIZE_PTR)(pxmitpriv->pallocated_xmit_extbuf), 4);
 
@@ -259,7 +259,7 @@ s32 _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 
 		res = rtw_os_xmit_resource_alloc(padapter, pxmitbuf, MAX_XMIT_EXTBUF_SZ + XMITBUF_ALIGN_SZ, true);
 		if (res)
-			return _FAIL;
+			return res;
 
 		pxmitbuf->phead = pxmitbuf->pbuf;
 		pxmitbuf->pend = pxmitbuf->pbuf + MAX_XMIT_EXTBUF_SZ;
@@ -289,7 +289,7 @@ s32 _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 							 MAX_CMDBUF_SZ + XMITBUF_ALIGN_SZ,
 							 true);
 			if (res)
-				return _FAIL;
+				return res;
 
 			pxmitbuf->phead = pxmitbuf->pbuf;
 			pxmitbuf->pend = pxmitbuf->pbuf + MAX_CMDBUF_SZ;
@@ -301,7 +301,7 @@ s32 _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 
 	res = rtw_alloc_hwxmits(padapter);
 	if (res)
-		return _FAIL;
+		return res;
 	rtw_init_hwxmits(pxmitpriv->hwxmits, pxmitpriv->hwxmit_entry);
 
 	for (i = 0; i < 4; i++)
@@ -313,7 +313,7 @@ s32 _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 
 	rtw_hal_init_xmit_priv(padapter);
 
-	return _SUCCESS;
+	return 0;
 }
 
 void _rtw_free_xmit_priv(struct xmit_priv *pxmitpriv)
diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index e943dcea1a21..930122275a8e 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -636,6 +636,8 @@ void rtw_reset_drv_sw(struct adapter *padapter)
 
 u8 rtw_init_drv_sw(struct adapter *padapter)
 {
+	int res;
+
 	rtw_init_default_value(padapter);
 
 	rtw_init_hal_com_default_value(padapter);
@@ -653,7 +655,8 @@ u8 rtw_init_drv_sw(struct adapter *padapter)
 
 	init_mlme_ext_priv(padapter);
 
-	if (_rtw_init_xmit_priv(&padapter->xmitpriv, padapter) == _FAIL)
+	res = _rtw_init_xmit_priv(&padapter->xmitpriv, padapter);
+	if (res)	
 		goto free_mlme_ext;
 
 	if (_rtw_init_recv_priv(&padapter->recvpriv, padapter) == _FAIL)
-- 
2.34.1

