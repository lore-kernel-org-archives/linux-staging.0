Received: from mail-dy1-f193.google.com (mail-dy1-f193.google.com [74.125.82.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AAB937E2E8
	for <linux-staging@lists.linux.dev>; Wed,  8 Apr 2026 11:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775646857; cv=none; b=ZiXouHXKn0xhAchbGokuA6EXckxNYU5cTMVkDVUP2844XGECske4Bw9IhCNu3obiIGrW+0r1TCWXPiWFBSrGDOHMBMy3HvqMao37C8N0x29YQhVQTxADVq1wMLwrmyd4EvQXAGxwd/AOWEue8nXLIi4+QywHSgjjIG2heqC3XB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775646857; c=relaxed/simple;
	bh=5VA39pk5pr3Tb1SspAw3AEa9oD/Vw2bnGrhCZwCJt1U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AXAvcxDu8uirPAeM8A/G5V3CwV5oPaZT0jCuHMwxdwVHHQiE0nmswSf9NT9QXdfSpGHRleioM6RiYKsrZJLOEHgz21k0yA1LJq8TbCxkpuQ9oTd7YNnT16A5e1BPVkUksgvfleldkwI7VI6jrtUY2kLfrnm1cijNpuboetJQkeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ivy2b0e+; arc=none smtp.client-ip=74.125.82.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ivy2b0e+"
Received: by mail-dy1-f193.google.com with SMTP id 5a478bee46e88-2ba895adfeaso6523985eec.0
        for <linux-staging@lists.linux.dev>; Wed, 08 Apr 2026 04:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775646856; x=1776251656; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZCSI+m4q94UTjIe2aTkAkzmMjm1M0fLyMUaJI6Pir6Q=;
        b=Ivy2b0e+Dl4oT0gwgikS8RolPfwhKNpChHnCxI+RDjrq5PZRyEDokSOKL37tdINeVe
         IBphaxtHQe7LQ91V+HOA9ofqWOgNnGcLPa2YKeKC6sCWZr9q9lg7ZCS4SJbrQ4Vyoux0
         VoY5uUi34cCwBd/fyyqLMKhD3pLTdjJi3FCa7aXpjEzKsNLiOYHwoc/4yyC0bwbr1YIb
         NbU3A5XFEwZT9zZBKacCjLVs/D+w7fjDTAvKLNg0LRRcs+HzNmHfoxSrIhyWxs0bCo2f
         /1tLwo2eMzQAC0v/zOOayBH8pJa44OHFjy9nRGaA1/Yl43a2IpH0QiXBtrDXUlx2yyz4
         xl+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775646856; x=1776251656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZCSI+m4q94UTjIe2aTkAkzmMjm1M0fLyMUaJI6Pir6Q=;
        b=XOwiosaYLkYqHj4EzHFo7kHzip3IMjdPB02Lci3cF5ZCMVPI8kXszVyvHTZVUh66HP
         rheDcF5JC4lUTtRm2wBjV6LTyEv46A6weZSXhfG0ETJkbNP7BBEnhH/WXdTzztIFZ3La
         y7crVuLJSYIE5cHkr6T5ITfdUiHceyto+S04s8b2QPcxtA8dkdRIEqPfUVxbUAWcnM9z
         t+ZeYVIVS1uAO0aJZMI1kkQik7KCkw+2Ehpp2ZoZAwBMt9H2mFKtXP1GfArjQ1XxfRZT
         1j0F1oH84saDr9GNmmVHWErZJQc6MMl4RdK7371sFxLo7aMJBSaD5mwDcS+KeJHl7LZh
         O2wA==
X-Forwarded-Encrypted: i=1; AJvYcCWC2yFPTcsZYVv/Y3qS6zgAA8H+wvi9gxpRoxhxcwcDpunn8oyhg8cSW6Z4ol3WO+kyXt62d3mU1ls2EPTc@lists.linux.dev
X-Gm-Message-State: AOJu0YxxMi9pjBIA0RCV3mUJpoFooYoSI08HPeSI2Ngac6SSn2BaE42i
	RHyEu/aEer/OT08b9OHmNCgARqHyjMzBtrQD4dHUIDBtycv4X2nHTF3c
X-Gm-Gg: AeBDies5ga4sd9wSh3JJN3tYwgJ4tUfJ4ESQALMoZYzbHI/2PZnz7mama6O52eEg11C
	sSRb/ehUB7riPbaiwvHsn+zzU8Xu6sCC2p/7K3aB+yqpNwk/bjueeTHCfKf5F00P56QwH2l8dMT
	cKcB4UHgggXbICDCQQ1nF18wGCUS8s+NlYdwBi8z2NUvdduqt6bXWubrZ8sxoJ6Fhh7HnaP3ldM
	0tuYSgb1WgVl069nFvpbjG4Ds4Pfu6kGCXqzkRpbMR92BU6NWiydW/yQglc2Znf87msMWAC0s5b
	hKzRJF2Keh02dQ2+AZ1sw/s+EC8N4NVD9RqOBPTEXNSpZaVD8XLtlJZK/csTI9x5rX7/PQ0S3w8
	yIBFCtuMM2NXyyBYOqneBJotA9SQliP01qnx6s5L/oBpGYAgVpYT7rANW5WrB6LpbQLictx4/vq
	dzVIVMXuT39AyK6424ZTPbGXlHbwB9bCmEBj8KW2g8VsVydIs4kHg+oNw=
X-Received: by 2002:a05:7300:bc86:b0:2cb:53f5:553e with SMTP id 5a478bee46e88-2cbf64ab2c5mr10359075eec.0.1775646855501;
        Wed, 08 Apr 2026 04:14:15 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca7c20c0c2sm21228019eec.17.2026.04.08.04.14.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 04:14:14 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	ethantidmore@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH v5 6/6] staging: rtl8723bs: convert _rtw_init_xmit_priv to return errno
Date: Wed,  8 Apr 2026 11:13:14 +0000
Message-Id: <20260408111314.19329-7-dennylin0707@gmail.com>
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
index e943dcea1a21..f4214608c4fa 100644
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

