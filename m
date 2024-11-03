Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 326DF16EB5D
	for <linux-staging@lists.linux.dev>; Sun,  3 Nov 2024 08:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730621703; cv=none; b=Zaj6rOVHijv+UC/AKtkf+XiPMSPYCDIzqwUlFI6PpfFmysHfLdkO3o0Ao6m7u7kb+cdeg5ANjMwQmF+PCc4rjzKFbVZkmG7TWYS2OP0UyR/6EASNDArnM8lS+WP1nCb1jNrxAVFE7SfLwaDQzdFanxHuy+G53Q05Ov5xDc75Y9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730621703; c=relaxed/simple;
	bh=u3S584myOAyZhc+GjEJWB++ki18Rk5KFE7Km+HtHP5s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qyj3RtxVQcM6/O9H1DLn+xMtf1hGNSVJcshnStJmdlerjuUYV7hClSetj6vqLFhSLNiQzMxWN/miURvMPpJc6lGrjMgH1N6pr4VyNvZFdwuI3SeGRdw2odW/C9zu+pJ3YvLTzkhdSzjNrtxFVVyn+Cbw8Irq+QNmPVNf3CW7bJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UmuTdQaF; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UmuTdQaF"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5c9454f3bfaso4005786a12.2
        for <linux-staging@lists.linux.dev>; Sun, 03 Nov 2024 01:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730621699; x=1731226499; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PO6/NrbVeY70kEhJHr00qbdaCGFc5cjzkA6rnNaB7TI=;
        b=UmuTdQaF4ntEdUq4V1tEMI2FS1VDhxk/Vu8FPSzskpseocWLlH5bHOVKQ4Wswdv8Jw
         kmv/YA/k0W3WNqzAzgIFENniEZMjUg2DPA7viFKKlQo7vGxZX3poTNzOA5RrbiotZcRr
         6UYr/SdeRsVJ90H0zxufZUICBDdjxub+KO2TgghRm6JZdFkN7qBOS8yiEDOw938OUyRp
         RQImwID6i0+xwLI5ONP8v3IZsZgCaP0DiKutyI5i3JB7q8Jz/H2aI8QgQOoRuZ77Vbay
         lIv92kHK95xiGk3E9C2sKPrMAQqT0BjFbG9yjCKcnsgPiK+EA9T/Jd7d+kIdR2DSpTKz
         xEug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730621699; x=1731226499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PO6/NrbVeY70kEhJHr00qbdaCGFc5cjzkA6rnNaB7TI=;
        b=aLhgtXPzvg9+PDFwlX5yq+pmu68PoiTlYnBisDvwDKHNRYLN88SnoRD7W1Bk9/PXhK
         k9CHPqIJIdJzwUS3gkWba+qxEl4zQ0zSQsbBa6P+/0jfCC8fsPA631U9VGKflsu5TK6h
         2GqHYwyuus9XCBgTHBEfSSIWIL4vtIDFurdlcTjB+jZ0/7GfX+YDKFtPz3BfyIdWjcdP
         +qR2W40Db6Lf0F+5qb8kgxQHbeIMJ7hyzbIl847TyhOtaI9Q57omUdBqx+fO9CcsOW8d
         YjjNHAvFI6CSt7UNZwSfVaVL3JxFLVXeZuhIOW0NzHfhgGy9WwtpEylhP1/LcJFSQftl
         sZ0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUG0uqhY5rBEq45jtV9kLUE5jHDlMbUrjnVxCfj0hUnJHGSJColBYBf5royLNwd7/nwXfCY149ntsLjDjlK@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+aB5WyzltE1x4eBiC8ssq8y5GV5F+gI/vBRcHuef+T55PWCJO
	NSzFO3NwfqqX78v4gzE2VVjxwbjJASn7Vi+lzEHv5dCR8S2g5z/k
X-Google-Smtp-Source: AGHT+IHQKaD9j1aO4FHVRnQgsf6wIR7yxAUzxJrwvhoJYvojcAlIiW546/x5OofagafKml4hlZyUkQ==
X-Received: by 2002:a05:6402:1e92:b0:5ce:d03f:68ad with SMTP id 4fb4d7f45d1cf-5ced03f6926mr1520321a12.9.1730621699020;
        Sun, 03 Nov 2024 01:14:59 -0700 (PDT)
Received: from kernel-710.speedport.ip (p54a0712c.dip0.t-ipconnect.de. [84.160.113.44])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ceac789152sm3097882a12.43.2024.11.03.01.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Nov 2024 01:14:58 -0700 (PDT)
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Subject: [PATCH 12/13] staging: rtl8723bs: Remove function pointer mgnt_xmit
Date: Sun,  3 Nov 2024 09:14:33 +0100
Message-ID: <59988d60701a6f83a6a83b6c813e58c4484c7d3e.1730619982.git.philipp.g.hortmann@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1730619982.git.philipp.g.hortmann@gmail.com>
References: <cover.1730619982.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove function pointer mgnt_xmit and use rtl8723bs_mgnt_xmit directly to
increase readability.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_intf.c     | 6 +-----
 drivers/staging/rtl8723bs/hal/sdio_halinit.c | 1 -
 drivers/staging/rtl8723bs/include/hal_intf.h | 4 ----
 3 files changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_intf.c b/drivers/staging/rtl8723bs/hal/hal_intf.c
index 914d4b24d49d..7462b10fdc94 100644
--- a/drivers/staging/rtl8723bs/hal/hal_intf.c
+++ b/drivers/staging/rtl8723bs/hal/hal_intf.c
@@ -170,8 +170,6 @@ s32	rtw_hal_xmit(struct adapter *padapter, struct xmit_frame *pxmitframe)
  */
 s32	rtw_hal_mgnt_xmit(struct adapter *padapter, struct xmit_frame *pmgntframe)
 {
-	s32 ret = _FAIL;
-
 	update_mgntframe_attrib_addr(padapter, pmgntframe);
 	/* pframe = (u8 *)(pmgntframe->buf_addr) + TXDESC_OFFSET; */
 	/* pwlanhdr = (struct rtw_ieee80211_hdr *)pframe; */
@@ -188,9 +186,7 @@ s32	rtw_hal_mgnt_xmit(struct adapter *padapter, struct xmit_frame *pmgntframe)
 		rtw_mgmt_xmitframe_coalesce(padapter, pmgntframe->pkt, pmgntframe);
 	}
 
-	if (padapter->HalFunc.mgnt_xmit)
-		ret = padapter->HalFunc.mgnt_xmit(padapter, pmgntframe);
-	return ret;
+	return rtl8723bs_mgnt_xmit(padapter, pmgntframe);
 }
 
 s32	rtw_hal_init_xmit_priv(struct adapter *padapter)
diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
index 563ebf8e7fdb..20dbaa995498 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
@@ -1258,6 +1258,5 @@ void rtl8723bs_set_hal_ops(struct adapter *padapter)
 
 	rtl8723b_set_hal_ops(pHalFunc);
 
-	pHalFunc->mgnt_xmit = &rtl8723bs_mgnt_xmit;
 	pHalFunc->hal_xmitframe_enqueue = &rtl8723bs_hal_xmitframe_enqueue;
 }
diff --git a/drivers/staging/rtl8723bs/include/hal_intf.h b/drivers/staging/rtl8723bs/include/hal_intf.h
index dfb973018e4e..697e22d1e535 100644
--- a/drivers/staging/rtl8723bs/include/hal_intf.h
+++ b/drivers/staging/rtl8723bs/include/hal_intf.h
@@ -180,10 +180,6 @@ struct hal_ops {
 	void (*run_thread)(struct adapter *padapter);
 	void (*cancel_thread)(struct adapter *padapter);
 
-	/*
-	 * mgnt_xmit should be implemented to run in interrupt context
-	 */
-	s32 (*mgnt_xmit)(struct adapter *padapter, struct xmit_frame *pmgntframe);
 	s32	(*hal_xmitframe_enqueue)(struct adapter *padapter, struct xmit_frame *pxmitframe);
 
 	u32 (*read_bbreg)(struct adapter *padapter, u32 RegAddr, u32 BitMask);
-- 
2.43.0

