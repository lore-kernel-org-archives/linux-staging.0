Received: from mail-dl1-f67.google.com (mail-dl1-f67.google.com [74.125.82.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D004D3BAD83
	for <linux-staging@lists.linux.dev>; Wed,  8 Apr 2026 10:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775645129; cv=none; b=jZwI5+qvFWUc++x3RqIaqAv0mjP/aERy7NI3nPU/Mi3LvaWtNkdyha+usiEonLxcfsAL9MsbMAIBEqTcpY9Qshyfgg+JU60zRlC00sIMYdjYfvBQLmxp/ucwnuuuYBeEl+RqoTLZ8QzLjg7ybmduKHHdibbv9/if2rh5VJXzPnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775645129; c=relaxed/simple;
	bh=iMMCHuUNk205M/t3RiDzeqmOCZFDI8xxxCaYom5FDDA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=C2Id2BlHxSxAH4+hO/zeoiqNe7snaJtVowcHKZ1FesyjkDRpOG+5vZHVnuEvEwKM92rxiya7F67m9FpdlKNK8h1HkajH477vvW/NICh+4/OOWd9V3en7DM8oZ7qoQCTXSjfM4zQdbADOv9XDiJBzze+WYohF7zhVA3SH1yADDL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lR9JO2RV; arc=none smtp.client-ip=74.125.82.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lR9JO2RV"
Received: by mail-dl1-f67.google.com with SMTP id a92af1059eb24-128e4d0cc48so6638048c88.1
        for <linux-staging@lists.linux.dev>; Wed, 08 Apr 2026 03:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775645127; x=1776249927; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J2zzxZ7T3OrjLQrZ05KQAgPaC26tt2IBs9Eiz7SOG68=;
        b=lR9JO2RVJa1+rFm/6ejjwZGIBSHKAStq6ZdPlBGaLUl3EgLdDXjyq4oqiCv6TeZRTJ
         IOsUumO4ZUBPdkxtf71y5jqqUacx2PyNJ2e5G5QmMZ5elldRV6vgYmn99KCPfSVHg5Wq
         NGzYdUmZynCsbs/ethdftaTNCji0PMmzlUDaGiiD9XM2jd69p/1YvpJq6r5Fj/WPZrpr
         qcD98AZyNYcvS0VR0jDzsdmhdoqWXbVvUh7CwuOTOnxi0DeU9HrI1ow1ziPpmwwX8xp0
         To4cuhzxwNCe/9NmPbEzipcgab7PefADnqhXjFeyz/Bn7vSAka+1krMXGAeK6La58hYz
         urZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775645127; x=1776249927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=J2zzxZ7T3OrjLQrZ05KQAgPaC26tt2IBs9Eiz7SOG68=;
        b=KgmvQ4x+N0/9jeuttSVHb4my9ZknDV4EZn36YKFfc9rTK7rENsToj8oGCxv8jeSGsn
         KkM3rdIZnEfk/ra/7xe5y1BMFrU7RDZhnjOHVS7Hs8I3WlhfKp3ndz1beawoj7HDa6NB
         pl1yoySi2QVpz9V8cE39LxcFsdMQH+vO6Zl47KFwIwcERWl30b+RdubwH5jFGV+6U4KF
         GqUaoQjIpwUtbG8IeJCTLEzkGaRyNfO1D8pYH/q6q/rg81rRzM3iuxQnFZLrITs6ON7C
         hOVB2VjyVzo/9QO1dWLppspIh4p0BRdr+UZU/ru7noPKAdgKYg/FmOHUFUMER0UILAkI
         QZjg==
X-Forwarded-Encrypted: i=1; AJvYcCU3hyV5rGecXA7JSH7OpN8khBlLttjXc7lyjBQpP1l/OHzG+b7hmbPViWmYa0cIV+FcFZqOxdaYTxCePLjp@lists.linux.dev
X-Gm-Message-State: AOJu0YwuQMaztBNJpxcWApDAxrLRXr+zy+G1IpDCGPgxZWhkbtMyjtyJ
	yjXt8/GPOnREgPb7sDlZjLojVgugbxAveLX44N7OUSJiVdUe3lIx7jud
X-Gm-Gg: AeBDietrB5EhU7fwXNKepSJkx5lvFJv8HGcJqUdji38ucMJ7jaZ5S5zTedZ/sT4XiWV
	WoByGPUyM+Ju4k7nd3Wrb/ocx382fK9PooX80EP1DJ7PcNFykQcW/T2rG8BhlTrgnLDPAT2XFFY
	R/rMcJFd3OumOWE1Ilz3uZNUtBzYJxvKh0UqKmDiCXN52ut4fIsZSLBYsCZxi0HfrN+Y29bn6hS
	2Kbd/tK5xp1KmA1PVHxct/U7qt/veuzg6Ccdd6XhFmhuowV/H7B5SeC+BuvyACx/FsR4i3E6CZd
	tx7YwxyROnZ1Sis0Muqh0RKF8Vs4NG3fQv7LHxLuOXSlJQg+LZFWfk3rYCiNHThjCfLkI1PpQi+
	V5whoj31Cz4l3I0ourm7LQ6G5cFgpjEZ8iX8WkwgbOU0U0oT401N3uB8cQSp7+DI9SS6CJHbVt7
	yHsFBs5rEkQKvV4hKYcwAh2QGbKKbgl//peWxCyWdfym3436nm7A6EpWY=
X-Received: by 2002:a05:7022:43a8:b0:12a:6f8b:36a3 with SMTP id a92af1059eb24-12bfb6e7d0emr10243186c88.6.1775645127044;
        Wed, 08 Apr 2026 03:45:27 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12bed93f861sm24417783c88.0.2026.04.08.03.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 03:45:25 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	ethantidmore@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH v4 5/6] staging: rtl8723bs: convert rtw_os_xmit_resource_alloc to return errno
Date: Wed,  8 Apr 2026 10:44:23 +0000
Message-Id: <20260408104424.18952-6-dennylin0707@gmail.com>
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

Convert rtw_os_xmit_resource_alloc() to return 0 on success
and -ENOMEM on failure. Update the callers to check for
non-zero return values.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_xmit.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 249947a7d910..fedfc968057b 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -78,12 +78,12 @@ static int rtw_os_xmit_resource_alloc(struct adapter *padapter, struct xmit_buf
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
 
 s32 _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
@@ -179,10 +179,10 @@ s32 _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 
 		/* Tx buf allocation may fail sometimes, so sleep and retry. */
 		res = rtw_os_xmit_resource_alloc(padapter, pxmitbuf, (MAX_XMITBUF_SZ + XMITBUF_ALIGN_SZ), true);
-		if (res == _FAIL) {
+		if (res) {
 			fsleep(10 * USEC_PER_MSEC);
 			res = rtw_os_xmit_resource_alloc(padapter, pxmitbuf, (MAX_XMITBUF_SZ + XMITBUF_ALIGN_SZ), true);
-			if (res == _FAIL)
+			if (res)
 				return _FAIL;
 		}
 
@@ -258,7 +258,7 @@ s32 _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 		pxmitbuf->buf_tag = XMITBUF_MGNT;
 
 		res = rtw_os_xmit_resource_alloc(padapter, pxmitbuf, MAX_XMIT_EXTBUF_SZ + XMITBUF_ALIGN_SZ, true);
-		if (res == _FAIL)
+		if (res)
 			return _FAIL;
 
 		pxmitbuf->phead = pxmitbuf->pbuf;
@@ -288,7 +288,7 @@ s32 _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 			res = rtw_os_xmit_resource_alloc(padapter, pxmitbuf,
 							 MAX_CMDBUF_SZ + XMITBUF_ALIGN_SZ,
 							 true);
-			if (res == _FAIL)
+			if (res)
 				return _FAIL;
 
 			pxmitbuf->phead = pxmitbuf->pbuf;
-- 
2.34.1

