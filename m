Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D03C2FDC28
	for <linux-staging@lists.linux.dev>; Fri, 24 Apr 2026 15:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777044077; cv=none; b=b6GDIzTLWFxlQNti0YaJ5IM8JJ9mbuXzC1uBbY6FXPiWatIx06gy1ptf6JWcuMmyp4oY1Aj7xTyLwggsV5oqA2ovFOqf2BI74Imk11x7E63hJUX5aOAndzNVhVooMtjwtzmbJf+UUuoyI64b4yKEKOXvQYxnxkU5QgZa4n53Nyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777044077; c=relaxed/simple;
	bh=E13c5Gzs+cLMiih/3Vqv1YV4mn27O5VVl0dkp0fennE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dk/Z2DplWNWcK2mUsnaX08+4XkizUv0dFKNwmsdbfa/PCMIR7471DrIjky6SES4VI0LMj2sVKrqD8eo0yuLbJfF67PraEHHrPwTGo6PkBbR8JsyyYOHWdStxwzD+ww8Sm14U1aOKpkXOHxLS3IasZglKrOiWL1K4a6EZZOws3+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kJx4b4U/; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kJx4b4U/"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43fe608cb92so5467750f8f.2
        for <linux-staging@lists.linux.dev>; Fri, 24 Apr 2026 08:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777044075; x=1777648875; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5fGV8s2/gDIiEdAwioc6JYt2sZJuS68DNDELDHEg2b4=;
        b=kJx4b4U/JU4FguqhFgnr1a/wVSIsLDPtQGP7ccjdTXLX4Tbb1ad6uXa1RyeBm5RuL/
         UwFUht1BleM20eOmhz0iWElAnWFCBexRqQYnKvFC3rQ3nzBnt++sB+9y6++6WMBaRogF
         ydK8vCHBM2TuaC/ky8Nc/chDLQzLVSKxE6zG8Z4Xv70y2kYRSVGcv3f7aMFK5eTKnDYH
         qFx8XbT5PpV3C6h6yWw3uSOP5YJoBCuTeyRRUltn6VEvcYjqjqxGUYSO0gC8rnwIvv9t
         9Mn03qbp7qwBIJLSsPlPSc/bn+PQHERik8m6KLjkMdxt18B1SuUu9BHgliMPFvp09CXx
         r70Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777044075; x=1777648875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5fGV8s2/gDIiEdAwioc6JYt2sZJuS68DNDELDHEg2b4=;
        b=c0o6Q3FDgcg5Xd5xl+uAnK90msgVkrm/qZGv6XDAb8U0SOp5sXtJ9/9dXy546miyFz
         NhUccPsKKmzjk2vujffICUQhmUVmcqiF27Uvz3IId6H/7PXXUpjRLR6paS6lQ5b/fh+X
         +LGvJoeBOg4xVhlgSVhkhurcO2B0kxXTKzx9J3oJna2AH4Hi/QS0TDHnYjWXNkIEYvKO
         R5Er/T/gyQ+2QQRB8R6QQKDf8SWNLFUGBgFTy+Lu0ujKMaoRSPUF6QWHhREViGj5gscV
         TDklDaqy06cSS3doOF0z1dTRfSfRLHWXdWdbZ4hhs1VUkwPIg7GLCEVIRZZcZmkyyQQV
         etZQ==
X-Gm-Message-State: AOJu0YxR+c2g6cc6of1X4TRn77DdDoQRIxTjpnCQ8VyOb4EeuIgjOa8l
	7IQD/RbK5hYZqJN/cCCDg2n0JUOSWdEnu3SU2t8uvEzgSBxxDL4prj+s
X-Gm-Gg: AeBDietUxFJflPA5TcU47JZImfXyetsIi3ves0LwuOzeqUvee7S2HILkbqZtIqunTNp
	xfB9SVnpPe5TtTq9CZJ6AKKmGioiUoKsViH39Qp5zcpjY5rAqpo0AWNDiGGw2mrKcSJzZStN7DD
	epPxdQhFdMLTmELj4MsQW51F9qwSrro8Qxu6GJLoj72Tn9X6/DwB+HVC/x05cUcI4wnZQ8diDOu
	YEH2riPrOFy/b8FkVGmWq5AapOeiUSUlqbTiMAwufpXJmb4fVNE68IliR5Doi/3FD0ijTabmUkk
	1Bs3nZgfyQf1aOt0LRNO3ZQ5lpTUjTU85TKviLUCrlEvXSi7HvIi7QYlJH9gnemXMUPxNcXPD6k
	nqHGCgStCOuPaSztW0tapcv9Cf3j99tdbOmKq/0o3EWmHn1sdjY1bFBbRnFyzKoh/gSqfe3/URE
	TTlqR2zOx7gNmk9BFsppvgiDQ/wxt5lf02yPyL7Xp8e1EUhB2ZakS7rvyK+1bVQeDff0wXvyLg0
	//c1K6IWNn5Fm0todXAYsH48DQ2Q2LrInEYoa77Db7xkzctO8eiemf8xsb9hhc19/WsEB8=
X-Received: by 2002:a05:6000:40ca:b0:43d:70de:1c62 with SMTP id ffacd0b85a97d-43fe3e120c6mr51501233f8f.45.1777044074416;
        Fri, 24 Apr 2026 08:21:14 -0700 (PDT)
Received: from ahossu.localdomain ([82.78.232.184])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4cb135asm65670960f8f.6.2026.04.24.08.21.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 08:21:14 -0700 (PDT)
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	Alexandru Hossu <hossu.alexandru@gmail.com>
Subject: [PATCH 1/3] staging: rtl8723bs: fix OOB read in update_beacon_info() IE loop
Date: Fri, 24 Apr 2026 17:19:30 +0200
Message-ID: <20260424151932.3734611-2-hossu.alexandru@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260424151932.3734611-1-hossu.alexandru@gmail.com>
References: <20260424151932.3734611-1-hossu.alexandru@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The IE parsing loop in update_beacon_info() advances by (pIE->length + 2)
each iteration but only guards on i < len.  When a malicious AP sends a
beacon whose last IE has only one byte remaining in the frame (the
element_id byte lands at len-1), the loop reads pIE->length from one byte
past the IE area.

Additionally, even when the header bytes are in bounds, pIE->length itself
can extend the data window beyond len, silently passing a truncated IE to
handler functions such as bwmode_update_check() and ERP_IE_handler().

The parallel fix already applied to OnAssocRsp() uses two guards:
  1. Break if fewer than sizeof(*pIE) bytes remain (can't read the header).
  2. Break if the IE's declared data extends past the frame boundary.

Apply the same pattern to update_beacon_info().

Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_wlan_util.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
index b75e7f4f8d27..551d7200d3a9 100644
--- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
+++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
@@ -1292,7 +1292,11 @@ void update_beacon_info(struct adapter *padapter, u8 *pframe, uint pkt_len, stru
 	len = pkt_len - (_BEACON_IE_OFFSET_ + WLAN_HDR_A3_LEN);
 
 	for (i = 0; i < len;) {
+		if (i + sizeof(*pIE) > len)
+			break;
 		pIE = (struct ndis_80211_var_ie *)(pframe + (_BEACON_IE_OFFSET_ + WLAN_HDR_A3_LEN) + i);
+		if (i + sizeof(*pIE) + pIE->length > len)
+			break;
 
 		switch (pIE->element_id) {
 		case WLAN_EID_VENDOR_SPECIFIC:
-- 
2.53.0

