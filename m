Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D84E916A92D
	for <linux-staging@lists.linux.dev>; Sat,  5 Oct 2024 20:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728160494; cv=none; b=oBDI2LU+/66uvu8gd8a0aGdZrT9xcDHRW1kjv+hFFafdCnbhpgX91ZHB19b5+lR6HFLBduDTxDX7nyD4PdPbvPseUWW6OASUYad5bdXtSw0OAEpsMrt/yY78wpFRM7Z9G7XbbCesUYUwjqHyiyvD/kKg4VjXIswDZ1VspXisGx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728160494; c=relaxed/simple;
	bh=gLrtsrqCpd7Z8WUHzQfpHBMi9NhWsyCtmyG6Pga2PJ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VtgO6Kd5QacoidZjNemN1sge8ugrpj/r1Tgk9tNpGnSISRrwTMF8koTiNgxdOI7d5Np3pEP+8OExO8otefYu613JXouFQsorrhXTfgubHXap7x72uDnZmXtAOezOijh+4yZ9XJg0o5FjwWlFPuWceQ1O9WgUUzSXLYHy4U2l+4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hyGAmMWp; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hyGAmMWp"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-42e5e758093so26743465e9.1
        for <linux-staging@lists.linux.dev>; Sat, 05 Oct 2024 13:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728160491; x=1728765291; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kRjXbGvt01b/G8SRxpi+wLxDhteB86SUXqAlnJOcBUM=;
        b=hyGAmMWp8JYV4L1PFfDC+bkXFZx9qkamk2Nia86HvWqpjhFHi+d3sXs489aEJicPN9
         mPnCBjT5weWwMcYLKnOdhUzIuvmk3roT7oKO2bFtWQFWem04UuckptC6D/HwsrAc16Sn
         4bvt9ONSeq8+UOJUqWy2cM+ZOrr5928MFTr+o95LxbWePO5M3ihrnVG3e/5P9hE9OspK
         HkGpwgBAwiy0VhsFXIIB/s/EIBH9lf5/zsOrZP9Jzz6yarxYgN1G60e83LK57VVucbkS
         PD5cY0VxeKLb/uT+vUoUAMbNn1kheCuSJx2v8w2JQdhtV1naLITegyK7bJbm3OM+4DFr
         uMqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728160491; x=1728765291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kRjXbGvt01b/G8SRxpi+wLxDhteB86SUXqAlnJOcBUM=;
        b=AnbMWBIsQ3uPLJQd8PxxBCZCZL5ZL4yKWC8+KvrIXIPKtPKSdR5klywFCjRIn+m5K0
         A6UrM7Zi2PdNjRhhFhmzgXLOiN9eLjX+Rq9j0mepGmxjbU6rWQEezkEjsdFvJcQ93p00
         MKAcT/XFYMEvqMDjtM7JpfgFq+NBWmV7xTGRl6mhADtMjRuJJXeHlmps9zbexzfqpQAR
         6S9AXTz+9Nk36ACz7+QBAh3KKaV9tVltcFDN0jydYpQiz2/a5GHXW1NUoPZRIrqYBJFZ
         GEnd6GeUsLYUaJNdFxssnDfJS/TRCHZsQsEsAxYVWmDdTatSyM4Lb4YYR0XfTEN3kNDt
         RqTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWjPNrCCSgOfhXp1mVfHfQK23MvtyV1LR6/kRlSk6/R28o+VjUg5PJcOIl5QKJuAhY8fNSQbvgK1FVXIC3+@lists.linux.dev
X-Gm-Message-State: AOJu0YzLyb65pnx4f7dj/Y0wIsktAe7/XZEUybQXel+qzkDpmqvTFV+N
	/Jy/mlx2iEj4nfonlpZf2g1cHaJF+fu4pZVryvcuC/vK+63BHSz/7StfPJlK
X-Google-Smtp-Source: AGHT+IF0GyjFxjdin35AL8y+oEfcO9zmoloAem5RPoQ0Rp8dpbaN/OjTJGjHYf+nj+00PjYscEaD1A==
X-Received: by 2002:a05:600c:3b2a:b0:42f:8267:69e6 with SMTP id 5b1f17b1804b1-42f85aa3344mr46591255e9.3.1728160490942;
        Sat, 05 Oct 2024 13:34:50 -0700 (PDT)
Received: from kernel-710.speedport.ip (p54a0712c.dip0.t-ipconnect.de. [84.160.113.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f85995932sm41824805e9.0.2024.10.05.13.34.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 13:34:50 -0700 (PDT)
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Subject: [PATCH 06/15] staging: rtl8723bs: Remove function pointer init_recv_priv
Date: Sat,  5 Oct 2024 22:33:49 +0200
Message-ID: <d9576e47920b045d702069fd3167e38d889412e7.1727966761.git.philipp.g.hortmann@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1727966761.git.philipp.g.hortmann@gmail.com>
References: <cover.1727966761.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove function pointer init_recv_priv and use rtl8723bs_init_recv_priv
directly to increase readability.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_intf.c     | 5 +----
 drivers/staging/rtl8723bs/hal/sdio_halinit.c | 1 -
 drivers/staging/rtl8723bs/include/hal_intf.h | 1 -
 3 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_intf.c b/drivers/staging/rtl8723bs/hal/hal_intf.c
index bbead941289d..d571bf81ab2b 100644
--- a/drivers/staging/rtl8723bs/hal/hal_intf.c
+++ b/drivers/staging/rtl8723bs/hal/hal_intf.c
@@ -230,10 +230,7 @@ void rtw_hal_free_xmit_priv(struct adapter *padapter)
 
 s32	rtw_hal_init_recv_priv(struct adapter *padapter)
 {
-	if (padapter->HalFunc.init_recv_priv)
-		return padapter->HalFunc.init_recv_priv(padapter);
-
-	return _FAIL;
+	return rtl8723bs_init_recv_priv(padapter);
 }
 
 void rtw_hal_free_recv_priv(struct adapter *padapter)
diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
index ef70ada68f2c..8d2a44726fc7 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
@@ -1259,7 +1259,6 @@ void rtl8723bs_set_hal_ops(struct adapter *padapter)
 
 	rtl8723b_set_hal_ops(pHalFunc);
 
-	pHalFunc->init_recv_priv = &rtl8723bs_init_recv_priv;
 	pHalFunc->free_recv_priv = &rtl8723bs_free_recv_priv;
 
 	pHalFunc->init_default_value = &rtl8723bs_init_default_value;
diff --git a/drivers/staging/rtl8723bs/include/hal_intf.h b/drivers/staging/rtl8723bs/include/hal_intf.h
index 0782a13074d7..cc01b8d56498 100644
--- a/drivers/staging/rtl8723bs/include/hal_intf.h
+++ b/drivers/staging/rtl8723bs/include/hal_intf.h
@@ -162,7 +162,6 @@ enum hal_intf_ps_func {
 typedef s32 (*c2h_id_filter)(u8 *c2h_evt);
 
 struct hal_ops {
-	s32	(*init_recv_priv)(struct adapter *padapter);
 	void (*free_recv_priv)(struct adapter *padapter);
 
 	void (*dm_init)(struct adapter *padapter);
-- 
2.43.0

