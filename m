Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 247161FE107
	for <linux-staging@lists.linux.dev>; Tue,  5 Nov 2024 05:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730786134; cv=none; b=fX3DvRTeJkma3KqSs+HttK/dYDRKPaw4I94Txhtge78ZG0hdnOa9SGxwW2afyK6vkinNwHqXrFIAAhOoyOSwopgOluo8tSu6KYLGz+hwKvt6FjsjBo/kFKm1LeBeFAF9XC0kA2EDfVEN4tE4mP0m3XgxSP8pIUzwA/S6sLCwWqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730786134; c=relaxed/simple;
	bh=6XQX9Sx9O8QzEK8Jv5n+XhTDT5cZkdFl3LWcOJ7R3do=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YovkzpsBOpHtfX7W0QfM8IjhUoiejsOu5snyUzfuMBTWYPmUGnbWyXTvnEV4sIcSAI5oKPEtK+wRPL7NlKWgF85cIvv+2RurXzPjkXGN1malEk2UEbd5NZ6nHE5BDo4JwENQKe+uF2uC0yA4jB+iX6j2j5yPIDqtCSglePSumo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bsatokw+; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bsatokw+"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5c984352742so5958312a12.1
        for <linux-staging@lists.linux.dev>; Mon, 04 Nov 2024 21:55:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730786130; x=1731390930; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g0RiCycJ8lXHIHnZIr/OA9nJnBnXFkGlTbDFIlYLTM8=;
        b=bsatokw+IyGR5zFVZx1VNsLB9suXcv25n+RXL3mfXuYsYdKPzMGQimznbjxzJiTqhj
         zHEAREpEKPV5IiP+iT/3hwiUCv6xdAE349ACSFfqYhyfiz3mNPv2hf1GYOoYnORQ9dCb
         3vbh2WcbqoaDc4YAbORpR/sDpIzfRifAiBMzytTWEYI2jNUkgnw4kDIvV8fm91wBlDZR
         SJXOVK8D3U4Lmb3RFjPyHRnMeoyWho6UnEt8qq5yKsIrz/0k+M2dl1pZPmGV29fYiIqI
         X/wqn+JRwL9q/rpVm1XYQDMETWqKZcKYfFF43XBcuWul4MAuI53w0Yf4j1lVQdxdvpS7
         0IYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730786130; x=1731390930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g0RiCycJ8lXHIHnZIr/OA9nJnBnXFkGlTbDFIlYLTM8=;
        b=sU0bHHjipLUaMINkyFozBGG33nSNefaT5AsjmT9xrY40+hQ2xlGjENKDeTEes4LwPh
         ZoW2qGQzeRwesx05agMDdzzx2PkrvQCiuBFXCCrdZW1DmBFRQPjN/VnKLXpBOeITOhPE
         wQbX7/kyslgaCu+03txp1S3J6Dt5f95LLknRCPEwOPwlxhY8EQz7NYSvjVwfM6Bl5R9N
         fu1h92PYMH6s5FU8BWVufWibgyG3rZUcfmd6shx6kLSjcBf/SZHbliZMtZowCuM0+++R
         ATsyi7mUu68J+ziAKG/62Hq2IrMSVr3YEikjfhrvO9sI8goGggQnwSopKT/QcNS8AbS3
         nrAg==
X-Forwarded-Encrypted: i=1; AJvYcCVOdx+d1M8cqGY6FQLV1iMeZdAPd+c84DW0CKdp71vo0IIQ3fKQVH1iMdgBD2D4yhBTV6KHsLIQngi073KG@lists.linux.dev
X-Gm-Message-State: AOJu0YxsrGVtME5Uq/c8FotmdkVOUMVubcQNuUrn4jpLIfQv7Tqec/3F
	FlCEZxuFcBrNeFZuIGFtDpzTI5VJogoVtRarx84lc/33Yk3tfwZR
X-Google-Smtp-Source: AGHT+IF+WdaU4acMcLDkkvrn0a+HllwkOyKrrBr64zT41an7zVt18JWmHU3XpQmoxtYI6RY6OSzjOA==
X-Received: by 2002:a17:907:7da3:b0:a8d:6648:813f with SMTP id a640c23a62f3a-a9de5d6ed87mr3251989966b.3.1730786128533;
        Mon, 04 Nov 2024 21:55:28 -0800 (PST)
Received: from kernel-710.speedport.ip (p54a0712c.dip0.t-ipconnect.de. [84.160.113.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb181451bsm78775466b.201.2024.11.04.21.55.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 21:55:28 -0800 (PST)
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Subject: [PATCH 02/16] staging: rtl8723bs: Remove function pointer set_channel_handler
Date: Tue,  5 Nov 2024 06:54:49 +0100
Message-ID: <dbaabf4706ab222b5e43d37b405e9d374ed5f49a.1730749680.git.philipp.g.hortmann@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1730749680.git.philipp.g.hortmann@gmail.com>
References: <cover.1730749680.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove function pointer set_channel_handler and use PHY_SwChnl8723B
directly to increase readability.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_intf.c          | 3 +--
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 1 -
 drivers/staging/rtl8723bs/include/hal_intf.h      | 1 -
 3 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_intf.c b/drivers/staging/rtl8723bs/hal/hal_intf.c
index 397fd8fb3cb0..aaadd56b7d8a 100644
--- a/drivers/staging/rtl8723bs/hal/hal_intf.c
+++ b/drivers/staging/rtl8723bs/hal/hal_intf.c
@@ -274,8 +274,7 @@ void rtw_hal_write_rfreg(struct adapter *padapter, u32 eRFPath, u32 RegAddr, u32
 
 void rtw_hal_set_chan(struct adapter *padapter, u8 channel)
 {
-	if (padapter->HalFunc.set_channel_handler)
-		padapter->HalFunc.set_channel_handler(padapter, channel);
+	PHY_SwChnl8723B(padapter, channel);
 }
 
 void rtw_hal_set_chnl_bw(struct adapter *padapter, u8 channel,
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 20c8459cd6d2..615a33cad84a 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -1744,7 +1744,6 @@ void UpdateHalRAMask8723B(struct adapter *padapter, u32 mac_id, u8 rssi_level)
 
 void rtl8723b_set_hal_ops(struct hal_ops *pHalFunc)
 {
-	pHalFunc->set_channel_handler = &PHY_SwChnl8723B;
 	pHalFunc->set_chnl_bw_handler = &PHY_SetSwChnlBWMode8723B;
 
 	pHalFunc->set_tx_power_level_handler = &PHY_SetTxPowerLevel8723B;
diff --git a/drivers/staging/rtl8723bs/include/hal_intf.h b/drivers/staging/rtl8723bs/include/hal_intf.h
index e882877436c4..9e6414319608 100644
--- a/drivers/staging/rtl8723bs/include/hal_intf.h
+++ b/drivers/staging/rtl8723bs/include/hal_intf.h
@@ -162,7 +162,6 @@ enum hal_intf_ps_func {
 typedef s32 (*c2h_id_filter)(u8 *c2h_evt);
 
 struct hal_ops {
-	void (*set_channel_handler)(struct adapter *padapter, u8 channel);
 	void (*set_chnl_bw_handler)(struct adapter *padapter, u8 channel, enum channel_width Bandwidth, u8 Offset40, u8 Offset80);
 
 	void (*set_tx_power_level_handler)(struct adapter *padapter, u8 channel);
-- 
2.43.0

