Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F7715EFA0
	for <linux-staging@lists.linux.dev>; Sat,  5 Oct 2024 20:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728160492; cv=none; b=TRE/SIY/dBA/XiAcOoft+cSYGU4EeJG1tKobRYqDQPOCUSxCoMuLaOL74h1dKcUSgimL1isCsU6P0vBRAuURWS5lVBECdIq9enGwbT6RnFvnXOq9lXlBbfVop9mtSWdo7jGqRB0L2PgkaJKpeQ816nZKoPqLbLyL6n0lKuVHoBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728160492; c=relaxed/simple;
	bh=6w4gp3GmSJn+oIpsBAPIJ/LWbaB+xt3M0uQbnYqnCog=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WM4/6gxkZnd1C/c8AAgqBxPfMA/W9/qE4hFOlIM75nYlTtUNjOoW6GRg2cVYysE8J7S5L1ognimCKD2EE1QUXm543Cq7zOAs0+ikhSHKN1IHbvpNk3DbGjuYUqmdgintuEmgIdeSeRXu8gaX5AUutpTsgwfvS72fC1azAWXyKC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KOK0t3Sq; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KOK0t3Sq"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-42cbb08a1a5so31600935e9.3
        for <linux-staging@lists.linux.dev>; Sat, 05 Oct 2024 13:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728160490; x=1728765290; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MFpoihA3emnfB9/dxfqMbKVK7yB71LAzW+Wo8COlZSU=;
        b=KOK0t3SqAccKAmmZgF9tY6bUksxErROfK+DekXJNqEFc8Imbwmf1soX61B11490SVG
         gYDo2q1RPurDrKYbVsUkhHtIbFZOBUPfIqFIhal8V9dSx6rHkV+xjsSRKGmIfCPt1vLt
         0jAYsN2opvca1fwEEeRfyg64XO3XZzL73D0ItuNstYfcrnIV9XbPC/5K9uUzDvdOrHvK
         5GzMFrwZOOnO8lsv04Lwameli5vpHrJbKww79LjKgJ9DVXPyaAZAHItLlzSWFP5rJKlw
         2RefqaehsgC8UWfXkpmgF+M89hwvTIP3qrVwHTS2ca7t6MavRUOdvGNsRFOwDY2iv+NO
         ME7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728160490; x=1728765290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MFpoihA3emnfB9/dxfqMbKVK7yB71LAzW+Wo8COlZSU=;
        b=rhZZ7TwbFDQkHoJR+efKbE2Q+yjiNh9wM4YPXEpgSD4dV4uqWB0h9iJyBno/Wn1MLy
         8EJPWEk3zCvpEE3Zm9DTOMaxTvEx4TJl8cEcYyw916JeKj3mybAdIsvFhHBmnT70bN0l
         A8ijgPBkdgA2q3oC2aiud3I4cy3c3kFp7nWtoMB84SV13LHb7SafxxLjAdoGwt+B4mco
         KSFZh0GzIAm1RgexkpVWocQ4CJtahYOkjZ6A67/GZKAm7VPzso8OD7zgr6EWDgB5fBPd
         we/1j2OYK+I4e/0yYYYwxlGwlBoTKGWOjXqY+zTD06mC3gTFTAjFycSaD7HtIAlNGiLD
         gZ8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWEebnu4Hz4zqqxC2HFb70uHuXCasgjmoGoB5i9qTa2LuLjlisM83DsN0wRENr17Ijn9wgicw03JSHA+Loy@lists.linux.dev
X-Gm-Message-State: AOJu0YxSCx5KwJGrzJKimoyXfVixaEGrVAdjLSXY3bcSH2vHxE2U5cT1
	ILMkVnmL35KcL8nkPbfRzu7Tkqc4kCjW23DUUgaauJKsZBXlli+F
X-Google-Smtp-Source: AGHT+IG4jMAD2sUZ39zcTYHff6YUDHkQKynv+ec9fDPelc35Tsp+bFM137K1XrbLYH5xU54VPFzvfQ==
X-Received: by 2002:a05:600c:4fcc:b0:42c:ac9f:b528 with SMTP id 5b1f17b1804b1-42f85aefd2cmr42207465e9.35.1728160489622;
        Sat, 05 Oct 2024 13:34:49 -0700 (PDT)
Received: from kernel-710.speedport.ip (p54a0712c.dip0.t-ipconnect.de. [84.160.113.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f85995932sm41824805e9.0.2024.10.05.13.34.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 13:34:49 -0700 (PDT)
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Subject: [PATCH 04/15] staging: rtl8723bs: Remove function pointer init_xmit_priv
Date: Sat,  5 Oct 2024 22:33:47 +0200
Message-ID: <322d2412d89ae384365ec1d000bb0fc62128a261.1727966761.git.philipp.g.hortmann@gmail.com>
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

Remove function pointer init_xmit_priv and use rtl8723bs_init_xmit_priv
directly to increase readability.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_intf.c     | 4 +---
 drivers/staging/rtl8723bs/hal/sdio_halinit.c | 1 -
 drivers/staging/rtl8723bs/include/hal_intf.h | 1 -
 3 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_intf.c b/drivers/staging/rtl8723bs/hal/hal_intf.c
index 983218cdbfec..1d1e4f438e7b 100644
--- a/drivers/staging/rtl8723bs/hal/hal_intf.c
+++ b/drivers/staging/rtl8723bs/hal/hal_intf.c
@@ -220,9 +220,7 @@ s32	rtw_hal_mgnt_xmit(struct adapter *padapter, struct xmit_frame *pmgntframe)
 
 s32	rtw_hal_init_xmit_priv(struct adapter *padapter)
 {
-	if (padapter->HalFunc.init_xmit_priv)
-		return padapter->HalFunc.init_xmit_priv(padapter);
-	return _FAIL;
+	return rtl8723bs_init_xmit_priv(padapter);
 }
 
 void rtw_hal_free_xmit_priv(struct adapter *padapter)
diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
index d7941fdf42e1..55cf827fc255 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
@@ -1259,7 +1259,6 @@ void rtl8723bs_set_hal_ops(struct adapter *padapter)
 
 	rtl8723b_set_hal_ops(pHalFunc);
 
-	pHalFunc->init_xmit_priv = &rtl8723bs_init_xmit_priv;
 	pHalFunc->free_xmit_priv = &rtl8723bs_free_xmit_priv;
 
 	pHalFunc->init_recv_priv = &rtl8723bs_init_recv_priv;
diff --git a/drivers/staging/rtl8723bs/include/hal_intf.h b/drivers/staging/rtl8723bs/include/hal_intf.h
index bc2696f23085..696a71c01bf9 100644
--- a/drivers/staging/rtl8723bs/include/hal_intf.h
+++ b/drivers/staging/rtl8723bs/include/hal_intf.h
@@ -162,7 +162,6 @@ enum hal_intf_ps_func {
 typedef s32 (*c2h_id_filter)(u8 *c2h_evt);
 
 struct hal_ops {
-	s32	(*init_xmit_priv)(struct adapter *padapter);
 	void (*free_xmit_priv)(struct adapter *padapter);
 
 	s32	(*init_recv_priv)(struct adapter *padapter);
-- 
2.43.0

