Received: from mail-dy1-f195.google.com (mail-dy1-f195.google.com [74.125.82.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E7031C567
	for <linux-staging@lists.linux.dev>; Sun,  5 Apr 2026 11:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775390284; cv=none; b=cMoPXdiOdIywd71wyZQXPdX8ZZffg1tjIXoSbPyqClUUpgF6ikr4BE6r89odsTpWvGPy/05+Tb9HMjB+y1GqyiPRkC3GV+DGWY5iiM15nPcsCwjmi+Psw/n7zb+v7R/TdUSTXrcuEK2NRXHlCa1gkfWYYYVb8SIALg8U+gFNdfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775390284; c=relaxed/simple;
	bh=7kVM56TjFg0aYZuB/WKeKloKE3MycP9NtAXUtbSizuM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bG/Sp7it7Hx6DToSxxzA10P3f0lfIS8GFF0CkKx22BqHbj7gTHPQ2csYeiGxYnYjaOfNhPeT6CVyZ66th40RY/dzNiUV/xBL+4fSCn0OvGcJM3VOB4W77a5htN3jE8IduyqsZc7uKPra5eR8nyXJOvtC/xQCERbGdx5EHK6KWxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mpOYCQd4; arc=none smtp.client-ip=74.125.82.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mpOYCQd4"
Received: by mail-dy1-f195.google.com with SMTP id 5a478bee46e88-2ce102afb0aso846338eec.1
        for <linux-staging@lists.linux.dev>; Sun, 05 Apr 2026 04:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775390282; x=1775995082; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LVDnRqTrhczesg8kXnrWc/v5lTq3AGh9d2Q5MTVA1A0=;
        b=mpOYCQd439AuhCcjPK8fUVknkr36Nt5yVop5dTzzjMVblgOtdhgpIfmM5f1gy216WE
         58+YPk00K6vOxMCjBpje9S93+Rc1aYBPhb9gPH4szcdOimk3GBxHE91dwiH2iDrVT4Aw
         5KVYY7o4UlD2f61/XtD3rg3CM+gUCY/+FIiJDG9O4UIV3QU+EB9MywL8btEgnlmM5QtE
         WD2AlHZxDKu15eT7b0dZzrP+F5tdfAxgGOGOkCbICTMi9EUHLpaG8gK8zBYts/QywJ0G
         58Pi5ACKTMto7A8s+9TOANNK757wLVCA6+t+Nf/GybAjay3f74hO0O2uo5ndegKYHq3B
         1cVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775390282; x=1775995082;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LVDnRqTrhczesg8kXnrWc/v5lTq3AGh9d2Q5MTVA1A0=;
        b=scJbpUArJSF3V6GPSDOjjRUBJ3pGMh0FwwPOMjRhFdimjlQXd0cnTdL7ZqpgS72aiI
         +70qnV8q2JNqIWxypfQgKWbZxUgDrnc7g+v/gVWcXJFNaNLF9rmCB0iFa2qk9KuFzUBu
         Dth2/9f1jNZTdciKK1p2OAx4O/9eogTdTnpWbDmVG61030P+ew69uRENdrWKk0NNEuV8
         eyCMGB7kt1ZQevGRXkaI1e+IjAkE55hwFksrXt8fgD6znVe5PfC2ACUfUDEFCiXnBT4q
         WW8D1XwymlOIxKGGob+C4Dl6r8tTx9U158v0DpBViTOXPqaUuHCVqpFMloDrd31YB2LU
         WMeA==
X-Forwarded-Encrypted: i=1; AJvYcCUSBE3FKjfINNJO9O917c8DSZWAXPp4tKXK+TUtfUEISJHEe+ATepBbn9Bk+h5EAVlvKizmi/QnJZDgz3jy@lists.linux.dev
X-Gm-Message-State: AOJu0YxKoFGXsOVPgJ7mMTTNn3V0SVRjk5IeSU5J5kRd/QJC7pcYzt4N
	K8LnWEYjGwj5jEmTSl9fzeeUovYbJPDnRZcKV2Lnb8A/YkPHEBstuUvstvbDyeI1
X-Gm-Gg: AeBDieub9A1zsJBF4V/sTEWyYHXOBX+zSwHQZcvGI9Xnyd6LpqOHBbk5SvwNVpJnsHH
	OrSerIU7lCxFLry5lbFfik61nwSuPU2PMrXn0OWdxqqJTYv6AUt5HXgqZ/tI/I5TYXS03/NaLAh
	jkb9ph7aSIMIWvlxv2ZaGYVTuF1YyYpXwXq5c7dsRLZO3q4V2EqeqWZofazedZIs/ZW95PldwI2
	CsvjFEheQubclHeaN/VRMTkOM3iFPtqYT35GcTgt+qcT4Aq6D2jUb+dGMlrdoA6QWVzfoVdu0eB
	TiaR+lpzxkUGd2UxzcjRfAGDP/qvXO00C5DOKs9m6LndBpGNLaIhh7VL4hm3I5w1hkyLxoCfd43
	5G1VnwMdd9e7ePntyV6fGALhqCf2Q7/nadwh5FBmx16LVk8CDLv7UASfTukRtL+NP8dpKwEVvLR
	KMP6GmYU9r7tWk89cvx2tMEsSR9jXfLCcA7C//ci6SPW6VjiE87HozhUw=
X-Received: by 2002:a05:7301:5793:b0:2c5:3b87:2ffc with SMTP id 5a478bee46e88-2cbf950387dmr4245725eec.7.1775390281575;
        Sun, 05 Apr 2026 04:58:01 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2cb92ea0ef1sm8137394eec.21.2026.04.05.04.57.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 04:57:59 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: gregkh@linuxfoundation.org
Cc: ethantidmore@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH v2] staging: rtl8723bs: use standard error codes in xmit init path
Date: Sun,  5 Apr 2026 11:57:28 +0000
Message-Id: <20260405115728.12184-1-dennylin0707@gmail.com>
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
v2:
- Rework xmit init path to remove _SUCCESS/_FAIL usage
- Convert allocation helpers to return standard error codes
- Update caller to use direct failure checks
- Address review feedback from Ethan Tidmore
---
 drivers/staging/rtl8723bs/core/rtw_xmit.c     | 24 +++++++++----------
 drivers/staging/rtl8723bs/os_dep/os_intfs.c   |  2 +-
 drivers/staging/rtl8723bs/os_dep/xmit_linux.c |  4 ++--
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index ea1923023caa..e10592d969e7 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -36,7 +36,7 @@ s32 _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 	int i;
 	struct xmit_buf *pxmitbuf;
 	struct xmit_frame *pxframe;
-	signed int	res = _SUCCESS;
+	signed int	res = 0;
 
 	spin_lock_init(&pxmitpriv->lock);
 	spin_lock_init(&pxmitpriv->lock_sctx);
@@ -73,7 +73,7 @@ s32 _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 
 	if (!pxmitpriv->pallocated_frame_buf) {
 		pxmitpriv->pxmit_frame_buf = NULL;
-		res = _FAIL;
+		res = -ENOMEM;
 		goto exit;
 	}
 	pxmitpriv->pxmit_frame_buf = (u8 *)N_BYTE_ALIGMENT((SIZE_PTR)(pxmitpriv->pallocated_frame_buf), 4);
@@ -110,7 +110,7 @@ s32 _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 	pxmitpriv->pallocated_xmitbuf = vzalloc(NR_XMITBUFF * sizeof(struct xmit_buf) + 4);
 
 	if (!pxmitpriv->pallocated_xmitbuf) {
-		res = _FAIL;
+		res = -ENOMEM;
 		goto exit;
 	}
 
@@ -127,10 +127,10 @@ s32 _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 
 		/* Tx buf allocation may fail sometimes, so sleep and retry. */
 		res = rtw_os_xmit_resource_alloc(padapter, pxmitbuf, (MAX_XMITBUF_SZ + XMITBUF_ALIGN_SZ), true);
-		if (res == _FAIL) {
+		if (res) {
 			msleep(10);
 			res = rtw_os_xmit_resource_alloc(padapter, pxmitbuf, (MAX_XMITBUF_SZ + XMITBUF_ALIGN_SZ), true);
-			if (res == _FAIL)
+			if (res)
 				goto exit;
 		}
 
@@ -160,7 +160,7 @@ s32 _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 
 	if (!pxmitpriv->xframe_ext_alloc_addr) {
 		pxmitpriv->xframe_ext = NULL;
-		res = _FAIL;
+		res = -ENOMEM;
 		goto exit;
 	}
 	pxmitpriv->xframe_ext = (u8 *)N_BYTE_ALIGMENT((SIZE_PTR)(pxmitpriv->xframe_ext_alloc_addr), 4);
@@ -193,7 +193,7 @@ s32 _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 	pxmitpriv->pallocated_xmit_extbuf = vzalloc(NR_XMIT_EXTBUFF * sizeof(struct xmit_buf) + 4);
 
 	if (!pxmitpriv->pallocated_xmit_extbuf) {
-		res = _FAIL;
+		res = -ENOMEM;
 		goto exit;
 	}
 
@@ -209,7 +209,7 @@ s32 _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 		pxmitbuf->buf_tag = XMITBUF_MGNT;
 
 		res = rtw_os_xmit_resource_alloc(padapter, pxmitbuf, MAX_XMIT_EXTBUF_SZ + XMITBUF_ALIGN_SZ, true);
-		if (res == _FAIL)
+		if (res)
 			goto exit;
 
 		pxmitbuf->phead = pxmitbuf->pbuf;
@@ -239,7 +239,7 @@ s32 _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 			res = rtw_os_xmit_resource_alloc(padapter, pxmitbuf,
 							 MAX_CMDBUF_SZ + XMITBUF_ALIGN_SZ,
 							 true);
-			if (res == _FAIL)
+			if (res)
 				goto exit;
 
 			pxmitbuf->phead = pxmitbuf->pbuf;
@@ -251,7 +251,7 @@ s32 _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 	}
 
 	res = rtw_alloc_hwxmits(padapter);
-	if (res == _FAIL)
+	if (res)
 		goto exit;
 	rtw_init_hwxmits(pxmitpriv->hwxmits, pxmitpriv->hwxmit_entry);
 
@@ -1868,7 +1868,7 @@ s32 rtw_alloc_hwxmits(struct adapter *padapter)
 	pxmitpriv->hwxmits = kzalloc_objs(*hwxmits, pxmitpriv->hwxmit_entry,
 					  GFP_ATOMIC);
 	if (!pxmitpriv->hwxmits)
-		return _FAIL;
+		return -ENOMEM;
 
 	hwxmits = pxmitpriv->hwxmits;
 
@@ -1893,7 +1893,7 @@ s32 rtw_alloc_hwxmits(struct adapter *padapter)
 	} else {
 	}
 
-	return _SUCCESS;
+	return 0;
 }
 
 void rtw_free_hwxmits(struct adapter *padapter)
diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index 29939bf5a156..bad2dba73eb6 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -654,7 +654,7 @@ u8 rtw_init_drv_sw(struct adapter *padapter)
 
 	init_mlme_ext_priv(padapter);
 
-	if (_rtw_init_xmit_priv(&padapter->xmitpriv, padapter) == _FAIL)
+	if (_rtw_init_xmit_priv(&padapter->xmitpriv, padapter))
 		goto free_mlme_ext;
 
 	if (_rtw_init_recv_priv(&padapter->recvpriv, padapter) == _FAIL)
diff --git a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
index 0be3143fffe5..a8b8545ed25e 100644
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

