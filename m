Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62981CA52
	for <linux-staging@lists.linux.dev>; Thu,  1 Jan 2026 18:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767292297; cv=none; b=n2RWyfjpXtusNq5WbldAZ6TGeCHhXP9BWQUux9knUZoMg16OAsvXlSLdSUX1Bvlms8sS4YZeYJ2kCPsyK/YR5xVyULM9bfdfwajxFHDI1lzSBhH20VQ7Q1NNsVnMHhPBb/SxFdmVDYGcV3eUk2fhN3ih9bsL/FDGT4fYDXKLkS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767292297; c=relaxed/simple;
	bh=oFaGLhGNj1bnIHJxy5hflV3MYQwQ7qpGQCHDjrB62FM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WbEZfCHZ8Nyou7OrCMzYuD9EdbDWhYqGeB0PKsn7lE4T/rbCffS77HrlifeZ+o76FCqoKm5jYNo3IivmPw1WsvJH7XhaHAphIq+0ie2Behs+ItvPX6JG3Yu+a7eUsYsdyzrQoA5paudTt1+HLBiurdfUcARhpRUXf1x7rPK1r5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iePGuIoI; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iePGuIoI"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-81345800791so42569b3a.0
        for <linux-staging@lists.linux.dev>; Thu, 01 Jan 2026 10:31:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767292296; x=1767897096; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G8eYxH+forI3+7Mpchd7RAfe+9ibvYrZjRyLKKzcJUQ=;
        b=iePGuIoIkgxt+ax19jL3g8BoqGDQNtThlHf3wHASaLbVnlggovOuU5dImopllpDfKI
         YytWy4ZZvVL5UOxvILBlVqlwsGuQPrP8T+4dHsXk7RjO9qw4EVD+9jtGEKuKTC9sQSSH
         0t5JgWGZAgx4yhFqO4mVkoMiew48qlinyPFZsg8ho1rZb/CSnAJTIW9r+Lo1OFNjfmFt
         E4ane0SgqMC3eKjx640h0oauVQOl5UVLcd2ttc1OeMeQNj++AUrMToj8ko+ysurGnnkm
         wh8IN6e+KPaIEhc1ri3yOfEIdmHko8lB+kMueBZMxhCZH66WOlaaKGh2zCr0dTJ2Ekvf
         69ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767292296; x=1767897096;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G8eYxH+forI3+7Mpchd7RAfe+9ibvYrZjRyLKKzcJUQ=;
        b=aMzVeyqkR4gKVqvtqFa764Ovk2apdCB8YsklNu4aRWWwAZ6X+49k1ayk6BX/BsejO9
         3/Y/wvFgsn5TlCpm4h3cyEJEqSEFfF8geUJxxASd7c/ptE3tFDCdE5uZAsfeLKBO9Gz1
         BZ4VV2STju0bqeVT/HdSp9QdRVCydD4gD13FlujRSDeC3knhlnxnQshAnmb0ECHQBZmV
         23AP7u1llWWIuFHiLM6agm+HQfnmgsKZRpuiif50dItem/e68y2Hjd/DYv0S6JkvObPY
         qKT1u9XsOi90ApqOcCVS60q9NjrZoVDIFuFxutDigSTz8jRyudxUOXxpT/e/c+PQgRVU
         FC6w==
X-Forwarded-Encrypted: i=1; AJvYcCUa6lnRtggVnDvStXPyVPWmeu7YFl5ugTAog6uulgWWHKaMQaT1gn920usW5my9NiP1ffxKnHLPyb3sTCdo@lists.linux.dev
X-Gm-Message-State: AOJu0YxUSdaZrKVc1zBm3lxtCRzLCkGw0Kf4dAGCe2M94ZaL1YtJVuDB
	bSHRGENG5GM2UEB7c7WFn2JR/vyEuWFZxaGHm7jh+m1XX89VEt9PT/RA
X-Gm-Gg: AY/fxX55IKAndsgZZRO5vetq+mpZYDwv2DJMAqBa5dwmPC2ERmqTjhL4LbobzN8jH01
	099ml7rRnSoNvOI9ISduTfkLMngKMuyNc6PmL7Pef8D22rsovRqDpimx9q/rQd1Q+kMwX+9gWDu
	RKlLTXTToaAoEeUHxgvtGI6TQiqO4XWQouh/Scdrljp5DrY0UybQBKFm9qNy6IsOGhoro1zZfOY
	MAkg/RpDmF7vJSWAk46Ix9pVXEYe9y3nUysaCEQikKi8QLz/sUViQ/0qka/AiXt+S2bOs8EF9yN
	GSGTpulutpzibAsqnkmdhH4Ac9sTmAQC+5UwS6Lz2cPUIjsHxhnsLzdgfHtXmQw70Cxgal4XawW
	JOfGpWrfzUXzKVKijD6nzbYoF0v+mPG+ve21RnszTBTV2yuoszNywpmgT1HhrCdnmLQoj87iA59
	LubRpQHxDIlBFBOhg=
X-Google-Smtp-Source: AGHT+IEmuusfxvTARnNvOnl6wuN2a/2Px9ZMkIByWNb40eomkRUtBPa6cBWW+G2UF8v3MpvnH5wwCg==
X-Received: by 2002:a05:6a00:4c8c:b0:7f7:1d4c:a067 with SMTP id d2e1a72fcca58-7ff64cd432dmr39601811b3a.27.1767292295559;
        Thu, 01 Jan 2026 10:31:35 -0800 (PST)
Received: from diksha-pc.. ([106.51.167.149])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e0a19d8sm38281239b3a.42.2026.01.01.10.31.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jan 2026 10:31:34 -0800 (PST)
From: Diksha Kumari <dikshakdevgan@gmail.com>
To: gregkh@linuxfoundation.org,
	straube.linux@gmail.com,
	hansg@kernel.org,
	arthur.stupa@gmail.com,
	tglx@linutronix.de,
	linux-staging@lists.linux.dev
Cc: Diksha Kumari <dikshakdevgan@gmail.com>
Subject: [PATCH v1] rtl8723bs:fix spacing around operators
Date: Fri,  2 Jan 2026 00:01:24 +0530
Message-Id: <20260101183124.10322-1-dikshakdevgan@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix missing spaces around arithmetic operators to address coding 
style issues reported by checkpatch.pl.

Signed-off-by: Diksha Kumari <dikshakdevgan@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_sta_mgt.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c b/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
index 3e80d03c4ec9..af31763ff628 100644
--- a/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
+++ b/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
@@ -54,7 +54,7 @@ u32 _rtw_init_sta_priv(struct	sta_priv *pstapriv)
 	struct sta_info *psta;
 	s32 i;
 
-	pstapriv->pallocated_stainfo_buf = vzalloc(sizeof(struct sta_info) * NUM_STA+4);
+	pstapriv->pallocated_stainfo_buf = vzalloc(sizeof(struct sta_info) * NUM_STA + 4);
 
 	if (!pstapriv->pallocated_stainfo_buf)
 		return _FAIL;
@@ -105,7 +105,7 @@ u32 _rtw_init_sta_priv(struct	sta_priv *pstapriv)
 
 inline int rtw_stainfo_offset(struct sta_priv *stapriv, struct sta_info *sta)
 {
-	int offset = (((u8 *)sta) - stapriv->pstainfo_buf)/sizeof(struct sta_info);
+	int offset = (((u8 *)sta) - stapriv->pstainfo_buf) / sizeof(struct sta_info);
 
 	return offset;
 }
@@ -311,7 +311,7 @@ u32 rtw_free_stainfo(struct adapter *padapter, struct sta_info *psta)
 	/* spin_lock_bh(&(pxmitpriv->vi_pending.lock)); */
 	rtw_free_xmitframe_queue(pxmitpriv, &pstaxmitpriv->vi_q.sta_pending);
 	list_del_init(&(pstaxmitpriv->vi_q.tx_pending));
-	phwxmit = pxmitpriv->hwxmits+1;
+	phwxmit = pxmitpriv->hwxmits + 1;
 	phwxmit->accnt -= pstaxmitpriv->vi_q.qcnt;
 	pstaxmitpriv->vi_q.qcnt = 0;
 	/* spin_unlock_bh(&(pxmitpriv->vi_pending.lock)); */
@@ -320,7 +320,7 @@ u32 rtw_free_stainfo(struct adapter *padapter, struct sta_info *psta)
 	/* spin_lock_bh(&(pxmitpriv->be_pending.lock)); */
 	rtw_free_xmitframe_queue(pxmitpriv, &pstaxmitpriv->be_q.sta_pending);
 	list_del_init(&(pstaxmitpriv->be_q.tx_pending));
-	phwxmit = pxmitpriv->hwxmits+2;
+	phwxmit = pxmitpriv->hwxmits + 2;
 	phwxmit->accnt -= pstaxmitpriv->be_q.qcnt;
 	pstaxmitpriv->be_q.qcnt = 0;
 	/* spin_unlock_bh(&(pxmitpriv->be_pending.lock)); */
@@ -329,7 +329,7 @@ u32 rtw_free_stainfo(struct adapter *padapter, struct sta_info *psta)
 	/* spin_lock_bh(&(pxmitpriv->bk_pending.lock)); */
 	rtw_free_xmitframe_queue(pxmitpriv, &pstaxmitpriv->bk_q.sta_pending);
 	list_del_init(&(pstaxmitpriv->bk_q.tx_pending));
-	phwxmit = pxmitpriv->hwxmits+3;
+	phwxmit = pxmitpriv->hwxmits + 3;
 	phwxmit->accnt -= pstaxmitpriv->bk_q.qcnt;
 	pstaxmitpriv->bk_q.qcnt = 0;
 	/* spin_unlock_bh(&(pxmitpriv->bk_pending.lock)); */
-- 
2.34.1

